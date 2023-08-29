local QBCore = exports['qb-core']:GetCoreObject()

local Active = false
local test = nil
local test1 = nil
local spam = true

local PlayerData = nil
function playeritem(items, amount)
      
        PlayerData = QBCore.Functions.GetPlayerData()
      
        local isTable = type(items) == 'table'
        local isArray = isTable and table.type(items) == 'array' or false
        local totalItems = #items
        local count = 0
        local kvIndex = 2
        if isTable and not isArray then
            totalItems = 0
            for _ in pairs(items) do 
                local totalItems2 = totalItems + 1 
                totalItems = totalItems2
            end
            kvIndex = 1
        end
        for _, itemData in pairs(PlayerData.items) do
            if isTable then
                for k, v in pairs(items) do
                    local itemKV = {k, v}
                    if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                        local count2 = count + 1 
                        count = count2
                    end
                end
                if count == totalItems then
                    return true
                end
            else -- Single item as string
                if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
                    return true
                end
            end
        end
        return false
end

RegisterNetEvent('Polar-Medic:Client:Help', function()
	if (QBCore.Functions.GetPlayerData().metadata["isdead"]) or (QBCore.Functions.GetPlayerData().metadata["inlaststand"]) and spam then
		QBCore.Functions.TriggerCallback('hhfw:docOnline', function(EMSOnline, hasEnoughMoney)
			if EMSOnline < Config.Doctor and hasEnoughMoney and spam then
				if playeritem('phone') then
				SpawnVehicle(GetEntityCoords(PlayerPedId()))
				TriggerServerEvent('hhfw:charge')
					Notify("Local Medic is en route to your location")
				else
					Notify("You cannot call the local medic as you do not have a phone")
				end
			else
				if EMSOnline > Config.Doctor then
					--Notify("There is too many medics online", "error")
					TriggerEvent('Polar-Medic:Client:SendEms')
				elseif not hasEnoughMoney then
					
					Notify("Local Medic Requires $500", "error")
					TriggerEvent('Polar-Medic:Client:SendEms')
				else
					Notify("Wait Paramadic is on its Way", "primary")
				end	
			end
		end)
	else
		Notify("This can only be used when dead", "error")
	end
end)




function SpawnVehicle(x, y, z)  
	spam = false
	local vehhash = GetHashKey("emsnspeedo")                                                     
	local loc = GetEntityCoords(PlayerPedId())
	RequestModel(vehhash)
	while not HasModelLoaded(vehhash) do
		Wait(1)
	end
	RequestModel('s_m_m_doctor_01')
	while not HasModelLoaded('s_m_m_doctor_01') do
		Wait(1)
	end
	local spawnRadius = 400                                                    
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(loc.x + math.random(-spawnRadius, spawnRadius), loc.y + math.random(-spawnRadius, spawnRadius), loc.z, 0, 3, 0)

	if not DoesEntityExist(vehhash) then
        mechVeh = CreateVehicle(vehhash, spawnPos, spawnHeading, true, false)                        
        ClearAreaOfVehicles(GetEntityCoords(mechVeh), 5000, false, false, false, false, false);  
        SetVehicleOnGroundProperly(mechVeh)
		SetVehicleNumberPlateText(mechVeh, "MEDIC")
		SetEntityAsMissionEntity(mechVeh, true, true)
		SetVehicleEngineOn(mechVeh, true, true, false)
        
        mechPed = CreatePedInsideVehicle(mechVeh, 26, GetHashKey('s_m_m_doctor_01'), -1, true, false)              	
        
        mechBlip = AddBlipForEntity(mechVeh)                                                        	
        SetBlipFlashes(mechBlip, true)  
        SetBlipColour(mechBlip, 5)


		PlaySoundFrontend(-1, "Text_Arrive_Tone", "Phone_SoundSet_Default", 1)
		Wait(2000)
		TaskVehicleDriveToCoord(mechPed, mechVeh, loc.x, loc.y, loc.z, 20.0, 0, GetEntityModel(mechVeh), 524863, 2.0)
		test = mechVeh
		test1 = mechPed
		Active = true
    end
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(200)
        if Active then
            local loc = GetEntityCoords(GetPlayerPed(-1))
			local lc = GetEntityCoords(test)
			local ld = GetEntityCoords(test1)
            local dist = Vdist(loc.x, loc.y, loc.z, lc.x, lc.y, lc.z)
			local dist1 = Vdist(loc.x, loc.y, loc.z, ld.x, ld.y, ld.z)
            if dist <= 10 then
				if Active then
					TaskGoToCoordAnyMeans(test1, loc.x, loc.y, loc.z, 1.0, 0, 0, 786603, 0xbf800000)
				end
				if dist1 <= 1 then 
					Active = false
					ClearPedTasksImmediately(test1)
					DoctorNPC()
				end
            end
        end
    end
end)


function DoctorNPC()
	RequestAnimDict("mini@cpr@char_a@cpr_str")
	while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
		Citizen.Wait(1000)
	end

	TaskPlayAnim(test1, "mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
	QBCore.Functions.Progressbar("revive_doc", "The doctor is giving you medical aid", Config.ReviveTime, false, false, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		ClearPedTasks(test1)
		Citizen.Wait(500)
        	TriggerEvent("hospital:client:Revive")
		StopScreenEffect('DeathFailOut')	
		Notify("Your treatment is done, you were charged: "..Config.Price, "success")
		RemovePedElegantly(test1)
		DeleteEntity(test)
		Wait(5000)
		DeleteEntity(test1)
		spam = true
	end)
end


function Notify(msg, state)
    QBCore.Functions.Notify(msg, state)
end

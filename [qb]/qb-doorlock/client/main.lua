local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']
local Config = Config
local canContinue = true
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)
local lastCoords = playerCoords
local nearbyDoors, closestDoor = {}, {}
local paused = false
local usingAdvanced = false

-- Functions

local function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
end

local function displayNUIText(text)
	local color = Config.ChangeColor and (closestDoor.data.locked and Config.LockedColor or Config.UnlockedColor) or Config.DefaultColor
	SendNUIMessage({
		type = "setDoorText",
		enable = true,
		text = text,
		color = color
	})
	Wait(1)
end

local function hideNUI()
	SendNUIMessage({
		type = "setDoorText",
		enable = false
	})
	Wait(1)
end

local function raycastWeapon()
    local offset = GetOffsetFromEntityInWorldCoords(GetCurrentPedWeaponEntityIndex(playerPed), 0, 0, -0.01)
    local direction = GetGameplayCamRot()
    direction = vec2(direction.x * math.pi / 180.0, direction.z * math.pi / 180.0)
    local num = math.abs(math.cos(direction.x))
    direction = vec3((-math.sin(direction.y) * num), (math.cos(direction.y) * num), math.sin(direction.x))
    local destination = vec3(offset.x + direction.x * 30, offset.y + direction.y * 30, offset.z + direction.z * 30)
    local rayHandle, result, hit, _, _, entityHit = StartShapeTestLosProbe(offset, destination, -1, playerPed, 0)
    repeat
        result, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
        Wait(0)
    until result ~= 1
    if GetEntityType(entityHit) == 3 then return hit, entityHit else return false end
end

local function setTextCoords(data)
    local minDimension, maxDimension = GetModelDimensions(data.objHash)
    local dimensions = maxDimension - minDimension
    local dx, dy = tonumber(dimensions.x), tonumber(dimensions.y)
    if dy <= -1 or dy >= 1 then dx = dy end
    if data.fixText then
        return GetOffsetFromEntityInWorldCoords(data.object, dx / 2, 0, 0)
    else
        return GetOffsetFromEntityInWorldCoords(data.object, -dx / 2, 0, 0)
    end
end

local function playSound(door, src, enableSounds)
    if not Config.EnableSounds or not enableSounds then return end
	local origin
	if src and src ~= playerPed then src = NetworkGetEntityFromNetworkId(src) end
	if not src then origin = door.textCoords elseif src == playerPed then origin = playerCoords else origin = NetworkGetPlayerCoords(src) end
	local distance = #(playerCoords - origin)
	if distance < 10 then
		if not door.audioLock then
			if door.audioRemote then
				door.audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.08}
				door.audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.08}
			else
				door.audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.1}
				door.audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.1}
			end
		end
		local sfx_level = GetProfileSetting(300)
		local sound = door.locked and door.audioLock or door.audioUnlock
		SendNUIMessage({
			type = 'audio',
			audio = sound,
			distance = distance,
			sfx = sfx_level
		})
	end
end

local function doorAnim()
	if not Config.EnableAnimation then return end
	CreateThread(function()
		loadAnimDict("anim@heists@keycard@")
        TaskPlayAnim(playerPed, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
        Wait(550)
        ClearPedTasks(playerPed)
    end)
end

local function round(value, numDecimalPlaces)
	if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

local function updateDoors(specificDoor)
    playerCoords = GetEntityCoords(playerPed)
    for doorID, data in pairs(Config.DoorList) do
        if not specificDoor or doorID == specificDoor then
            if data.doors then
				if not data.doorType then data.doorType = 'double' end
                for k, v in pairs(data.doors) do
                    if #(playerCoords - v.objCoords) < 30 then
						if data.doorType == "doublesliding" then
							v.object = GetClosestObjectOfType(v.objCoords.x, v.objCoords.y, v.objCoords.z, 5.0, v.objName or v.objHash, false, false, false)
						else
                        	v.object = GetClosestObjectOfType(v.objCoords.x, v.objCoords.y, v.objCoords.z, 1.0, v.objName or v.objHash, false, false, false)
						end
                        if v.object and v.object ~= 0 then
                            v.doorHash = 'door_'..doorID..'_'..k
                            if not IsDoorRegisteredWithSystem(v.doorHash) then
								local objCoords = GetEntityCoords(v.object)
								local objHeading = GetEntityHeading(v.object)
								local hasHeading = v.objYaw or v.objHeading or false
								if v.objCoords ~= objCoords then v.objCoords = objCoords end -- Backwards compatibility fix
								if not hasHeading then
									v.objYaw = objHeading
								else
									if hasHeading ~= objHeading then -- Backwards compatibility fix
										v.objYaw = v.objYaw and objHeading or nil
										v.objHeading = v.objHeading and objHeading or nil
									end
								end
                                AddDoorToSystem(v.doorHash, v.objName or v.objHash, v.objCoords.x, v.objCoords.y, v.objCoords.z, false, false, false)
                                nearbyDoors[doorID] = true
                                if data.locked then
									DoorSystemSetDoorState(v.doorHash, 4, false, false)
									DoorSystemSetDoorState(v.doorHash, 1, false, false)
                                else
                                    DoorSystemSetDoorState(v.doorHash, 0, false, false)
                                end
                            end
                        end
                    elseif v.object and v.object ~= 0 then
						RemoveDoorFromSystem(v.doorHash)
						nearbyDoors[doorID] = nil
					end
                end
            elseif not data.doors then
				if not data.doorType then data.doorType = 'door' end
                if #(playerCoords - data.objCoords) < 30 then
                    if data.doorType == "sliding" or data.doorType == "garage" then
						data.object = GetClosestObjectOfType(data.objCoords.x, data.objCoords.y, data.objCoords.z, 5.0, data.objName or data.objHash, false, false, false)
					else
                        data.object = GetClosestObjectOfType(data.objCoords.x, data.objCoords.y, data.objCoords.z, 1.0, data.objName or data.objHash, false, false, false)
                    end
                    if data.object and data.object ~= 0 then
                        data.doorHash = 'door_'..doorID
                        if not IsDoorRegisteredWithSystem(data.doorHash) then
							local objCoords = GetEntityCoords(data.object)
							local objHeading = GetEntityHeading(data.object)
							local hasHeading = data.objYaw or data.objHeading or false
							if data.objCoords ~= objCoords then data.objCoords = objCoords end -- Backwards compatibility fix
							if not hasHeading then
								data.objYaw = objHeading
							else
								if hasHeading ~= objHeading then -- Backwards compatibility fix
									data.objYaw = data.objYaw and objHeading or nil
									data.objHeading = data.objHeading and objHeading or nil
								end
							end
							data.objCoords = GetEntityCoords(data.object)
                            AddDoorToSystem(data.doorHash, data.objName or data.objHash, data.objCoords.x, data.objCoords.y, data.objCoords.z, false, false, false)
                            nearbyDoors[doorID] = true
                            if data.locked then
                                DoorSystemSetDoorState(data.doorHash, 4, false, false)
								DoorSystemSetDoorState(data.doorHash, 1, false, false)
                            else
                                DoorSystemSetDoorState(data.doorHash, 0, false, false)
                            end
                        end
                    end
                elseif data.object and data.object ~= 0 then
					RemoveDoorFromSystem(data.doorHash)
					nearbyDoors[doorID] = false
				end
            end
            -- set text coords
            if not data.setText and data.doors then
                for k, v in pairs(data.doors) do
                    if k == 1 and DoesEntityExist(v.object) then
                        data.textCoords = v.objCoords
                    elseif k == 2 and DoesEntityExist(v.object) and data.textCoords then
                        local textDistance = data.textCoords - v.objCoords
                        data.textCoords = data.textCoords - (textDistance / 2)
                        data.setText = true
                    end
                    if k == 2 and data.textCoords and (data.doorType == "sliding" or data.doorType == "garage") then
                        if GetEntityHeightAboveGround(v.object) < 1 then
                            data.textCoords = vec3(data.textCoords.x, data.textCoords.y, data.textCoords.z + 1.2)
                        end
                    end
                end
            elseif not data.setText and not data.doors and DoesEntityExist(data.object) then
                if data.doorType == "garage" then
                    data.textCoords = data.objCoords
                    data.setText = true
                else
                    data.textCoords = setTextCoords(data)
                    data.setText = true
                end
                if data.doorType == "sliding" or data.doorType == "garage" then
                    if GetEntityHeightAboveGround(data.object) < 1 then
                        data.textCoords = vec3(data.textCoords.x, data.textCoords.y, data.textCoords.z + 1.6)
                    end
                end
            end
        end
    end
    lastCoords = playerCoords
end



local function isAuthorized(door)
	if door.allAuthorized then return true end

	if door.authorizedJobs then
		if door.authorizedJobs[PlayerData.job.name] and PlayerData.job.grade.level >= door.authorizedJobs[PlayerData.job.name] then
			return true
		elseif type(door.authorizedJobs[1]) == 'string' then
			for _, job in pairs(door.authorizedJobs) do -- Support for old format
				if job == PlayerData.job.name then return true end
			end
		end
	end

	if door.authorizedGangs then
		if door.authorizedGangs[PlayerData.gang.name] and PlayerData.gang.grade.level >= door.authorizedGangs[PlayerData.gang.name] then
			return true
		elseif type(door.authorizedGangs[1]) == 'string' then
			for _, gang in pairs(door.authorizedGangs) do -- Support for old format
				if gang == PlayerData.gang.name then return true end
			end
		end
	end

	if door.authorizedCitizenIDs then
		if door.authorizedCitizenIDs[PlayerData.citizenid] then
			return true
		elseif type(door.authorizedCitizenIDs[1]) == 'string' then
			for _, id in pairs(door.authorizedCitizenIDs) do -- Support for old format
				if id == PlayerData.citizenid then return true end
			end
		end
	end

	if door.items then
		local p = promise.new()
		QBCore.Functions.TriggerCallback('qb-doorlock:server:checkItems', function(result)
			p:resolve(result)
		end, door.items, door.needsAllItems)
		return Citizen.Await(p)
	end

	return false
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.TriggerCallback('qb-doorlock:server:setupDoors', function(result)
		Config.DoorList = result
		PlayerData = QBCore.Functions.GetPlayerData()
		isLoggedIn = true
	end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
	PlayerData = {}
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
end)

RegisterNetEvent('qb-doorlock:client:setState', function(serverId, doorID, state, src, enableAnimation, enableSounds)
	if not Config.DoorList[doorID] then return end
	if enableAnimation == nil then enableAnimation = true end
	if enableSounds == nil then enableSounds = true end
	if serverId == PlayerData.source and enableAnimation then doorAnim() end
	Config.DoorList[doorID].locked = state
	updateDoors(doorID)
	local current = Config.DoorList[doorID]
	while true do
		if current.doors then
			if not current.doorType then current.doorType = 'double' end
			for k, v in pairs(current.doors) do
				if not IsDoorRegisteredWithSystem(v.doorHash) then return end
				v.currentHeading = GetEntityHeading(v.object)
				v.doorState = DoorSystemGetDoorState(v.doorHash)
				if current.doorType == "doublesliding" then
					DoorSystemSetAutomaticRate(v.doorHash, v.doorRate or 1.0, false, false)
					if current.locked then
						DoorSystemSetDoorState(v.doorHash, 1, false, false)
						DoorSystemSetAutomaticDistance(v.doorHash, 0.0, false, false)
						if k == 2 then
							playSound(current, src, enableSounds)
							return
						end
					else
						DoorSystemSetDoorState(v.doorHash, 0, false, false)
						DoorSystemSetAutomaticDistance(v.doorHash, 30.0, false, false)
						if k == 2 then
							playSound(current, src, enableSounds)
							return
						end
					end
				elseif current.locked and v.doorState == 4 then
					DoorSystemSetDoorState(v.doorHash, 1, false, false)
					if current.doors[1].doorState == current.doors[2].doorState then
						playSound(current, src, enableSounds)
						return
					end
				elseif not current.locked then
					DoorSystemSetDoorState(v.doorHash, 0, false, false)
					if current.doors[1].doorState == current.doors[2].doorState then
						playSound(current, src, enableSounds)
						return
					end
				else
					if round(v.currentHeading, 0) == round(v.objYaw or v.objHeading, 0) then
						DoorSystemSetDoorState(v.doorHash, 4, false, false)
					end
				end
			end
		else
			if not IsDoorRegisteredWithSystem(current.doorHash) then return end
			if not current.doorType then current.doorType = 'door' end
			current.currentHeading = GetEntityHeading(current.object)
			current.doorState = DoorSystemGetDoorState(current.doorHash)
			if current.doorType == "sliding" or current.doorType == "garage" then
				DoorSystemSetAutomaticRate(current.doorHash, current.doorRate or 1.0, false, false)
				if current.locked then
					DoorSystemSetDoorState(current.doorHash, 1, false, false)
					DoorSystemSetAutomaticDistance(current.doorHash, 0.0, false, false)
					playSound(current, src, enableSounds)
					return
				else
					DoorSystemSetDoorState(current.doorHash, 0, false, false)
					DoorSystemSetAutomaticDistance(current.doorHash, 30.0, false, false)
					playSound(current, src, enableSounds)
					return
				end
			elseif current.locked and current.doorState == 4 then
				DoorSystemSetDoorState(current.doorHash, 1, false, false)
				playSound(current, src, enableSounds)
				return
			elseif not current.locked then
				DoorSystemSetDoorState(current.doorHash, 0, false, false)
				playSound(current, src, enableSounds)
				return
			else
				if round(current.currentHeading, 0) == round(current.objYaw or current.objHeading, 0) then
					DoorSystemSetDoorState(current.doorHash, 4, false, false)
				end
			end
		end
		Wait(0)
	end
end)
local po = nil
function ThermitePlantCharge()
	--[[if closestDoor.data.coords then
		TaskTurnPedToFaceCoord(playerPed, closestDoor.data.doors[1].objCoords.x, closestDoor.data.doors[1].objCoords.y, closestDoor.data.doors[1].objCoords.z, 0)
		--SetEntityHeading(playerPed, closestDoor.data.doors[1].objCoords.h)
	else
		TaskTurnPedToFaceCoord(playerPed, closestDoor.data.objCoords.x, closestDoor.data.objCoords.y, closestDoor.data.objCoords.z, 0)
		--SetEntityHeading(playerPed, closestDoor.data.objCoords.h)
	end]]

    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(10) end
    local ped = PlayerPedId()
	local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, -1, 0.5)
    local vehcoords = GetEntityCoords(ped)
    --SetEntityHeading(ped, GetEntityHeading(ped))
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
	
    local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject('hei_p_m_bag_var22_arm_s', pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)

    local x, y, z = table.unpack(GetEntityCoords(ped))
    local charge = CreateObject('hei_prop_heist_thermite', x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(charge, false, true)
    AttachEntityToEntity(charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(5000)
    DetachEntity(charge, 1, 1)
    FreezeEntityPosition(charge, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(bagscene)
	Wait(15000)
	DeleteEntity(charge)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	QBCore.Functions.Notify("Door Burning", 'success', 2500)
	
	RequestNamedPtfxAsset("scr_ornate_heist")
	while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end
	SetPtfxAssetNextCall("scr_ornate_heist")
	local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", pos.x, pos.y, pos.z, 1, false, false, false, false)
	Wait(60000)
	StopParticleFxLooped(effect, 0)

	TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1, false)
	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["thermite"], "remove")

	QBCore.Functions.Notify("Door Broken", 'success', 2500)
	if closestDoor.data.coords then
		TaskTurnPedToFaceCoord(playerPed, closestDoor.data.doors[1].objCoords.x, closestDoor.data.doors[1].objCoords.y, closestDoor.data.doors[1].objCoords.z, 0)
	else
		TaskTurnPedToFaceCoord(playerPed, closestDoor.data.objCoords.x, closestDoor.data.objCoords.y, closestDoor.data.objCoords.z, 0)
	end
	Wait(300)
	local count = 0
	while GetIsTaskActive(playerPed, 225) do
		Wait(10)
		count += 1
		if count == 150 then break end
	end
	Wait(1800)

	
	TriggerServerEvent('qb-doorlock:server:updateState', closestDoor.id, false, false, true, false) -- Broadcast new state of the door to everyone

	
	
end

RegisterNetEvent('Polar-Doorlock:Client:ThermiteDoor', function()
	if not closestDoor.data or not next(closestDoor.data) --[[ or [PlayerData.metadata['isdead'] ]] or PlayerData.metadata['ishandcuffed'] or (not closestDoor.data.pickable and not closestDoor.data.lockpick) or not closestDoor.data.locked then return end
	local distance = vec3(closestDoor.data.objCoords.x, closestDoor.data.objCoords.y, closestDoor.data.objCoords.z)
	local position = GetEntityCoords(PlayerPedId())
	local area = #(position - distance)
   	if area <= 1.0 then
	exports['Polar-UI']:Thermite(function(success)
		if success then
			ThermitePlantCharge()
			
		else
			TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1, false)
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["thermite"], "remove")
		end
	 end, 20, 7, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
	else
		QBCore.Functions.Notify('Get Closer to the Door', 'error', '5000')

	end
end)

RegisterNetEvent('qb-doorlock:client:addNewDoor', function()
	canContinue = false
	hideNUI()
	local doorData = {}
	local dialog = exports['qb-input']:ShowInput({
		header = Lang:t("general.newdoor_menu_title"),
		submitText = Lang:t("general.submit_text"),
		inputs = {
			{
				text = Lang:t("general.configfile_title"),
				name = "configfile",
				type = "text",
				isRequired = false
			},
			{
				text = Lang:t("general.doorname_title"),
				name = "doorname",
				type = "text",
				isRequired = true
			},
			{
				text = Lang:t("general.doortype_title"),
				name = "doortype",
				type = "select",
				options = {
					{ value = "door", text = Lang:t("general.doortype_door") },
					{ value = "double", text = Lang:t("general.doortype_double") },
					{ value = "sliding", text = Lang:t("general.doortype_sliding") },
					{ value = "doublesliding", text = Lang:t("general.doortype_doublesliding") },
					{ value = "garage", text = Lang:t("general.doortype_garage") }
				}
			},
			{
				text = Lang:t("general.job_authorisation_menu"),
				name = "job",
				type = "text",
				isRequired = false
			},
			{
				text = Lang:t("general.gang_authorisation_menu"),
				name = "gang",
				type = "text",
				isRequired = false
			},
			{
				text = Lang:t("general.citizenid_authorisation_menu"),
				name = "cid",
				type = "text",
				isRequired = false
			},
			{
				text = Lang:t("general.item_authorisation_menu"),
				name = "item",
				type = "text",
				isRequired = false
			},
			{
				text = Lang:t("general.distance_menu"),
				name = "distance",
				type = "number",
				isRequired = true,
			},
			{
				text = "",
				name = "checklock",
				type = "checkbox",
				options = {
					{ value = "locked", text = Lang:t("general.locked_menu") },
					{ value = "pickable", text = Lang:t("general.pickable_menu") }
				}
			}
		}
	})
	if not dialog or not next(dialog) then canContinue = true return end
	doorData = dialog
	if doorData.configfile == '' then doorData.configfile = false end
	if doorData.job == '' then doorData.job = false end
	if doorData.gang == '' then doorData.gang = false end
	if doorData.cid == '' then doorData.cid = false end
	if doorData.item == '' then doorData.item = false end
	doorData.distance = tonumber(doorData.distance)
	if doorData.doortype == 'door' or doorData.doortype == 'sliding' or doorData.doortype == 'garage' then
		SendNUIMessage({
			type = "setText",
			aim = "block"
		})
		local entity, coords, heading, model, result, entityHit = 0, 0, 0, 0, false, 0
		while true do
			if IsPlayerFreeAiming(PlayerId()) then
				result, entityHit = raycastWeapon()
				if result and entityHit ~= entity then
					SetEntityDrawOutline(entity, false)
					SetEntityDrawOutline(entityHit, true)
					entity = entityHit
					coords = GetEntityCoords(entity)
					model = GetEntityModel(entity)
					heading = GetEntityHeading(entity)
					SendNUIMessage({
						type = "setText",
						aim = "none",
						details = "block",
						coords = coords,
						heading = heading,
						hash = model
					})
				end
				if entity and IsControlPressed(0, 24) then break end
			end
			Wait(0)
		end
		SetEntityDrawOutline(entity, false)
		SendNUIMessage({
			type = "setText",
			aim = "none",
			details = "none",
			coords = "",
			heading = "",
			hash = ""
		})
		if not model or model == 0 then QBCore.Functions.Notify(Lang:t("error.door_not_found"), 'error') canContinue = true return end
		result = DoorSystemFindExistingDoor(coords.x, coords.y, coords.z, model)
		if result then QBCore.Functions.Notify(Lang:t("error.door_registered"), 'error') canContinue = true return end
		doorData.doorHash = 'door_'..doorData.doorname
		AddDoorToSystem(doorData.doorHash, model, coords, false, false, false)
		DoorSystemSetDoorState(doorData.doorHash, 4, false, false)
		coords = GetEntityCoords(entity)
		heading = GetEntityHeading(entity)
		RemoveDoorFromSystem(doorData.doorHash)
		doorData.entity = entity
		doorData.coords = coords
		doorData.model = model
		doorData.heading = heading
		TriggerServerEvent('qb-doorlock:server:saveNewDoor', doorData, false)
		canContinue = true
	else
		local entity, coords, heading, model, result, entityHit = {0, 0}, {0, 0}, {0, 0}, {0, 0}, false, 0
		for i = 1, 2 do
			SendNUIMessage({
				type = "setText",
				aim = "block",
				details = "none",
				coords = "",
				heading = "",
				hash = ""
			})
			while true do
				if IsPlayerFreeAiming(PlayerId()) then
					result, entityHit = raycastWeapon()
					if result and entityHit ~= entity[i] then
						SetEntityDrawOutline(entity[i], false)
						SetEntityDrawOutline(entityHit, true)
						entity[i] = entityHit
						coords[i] = GetEntityCoords(entity[i])
						model[i] = GetEntityModel(entity[i])
						heading[i] = GetEntityHeading(entity[i])
						SendNUIMessage({
							type = "setText",
							aim = "none",
							details = "block",
							coords = coords[i],
							heading = heading[i],
							hash = model[i]
						})
					end
					if entity[i] and IsControlPressed(0, 24) then break end
				end
				Wait(0)
			end
			Wait(200)
		end
		SetEntityDrawOutline(entity[1], false)
		SetEntityDrawOutline(entity[2], false)
		SendNUIMessage({
			type = "setText",
			aim = "none",
			details = "none",
			coords = "",
			heading = "",
			hash = ""
		})
		if not model[1] or model[1] == 0 or not model[2] or model[2] == 0 then QBCore.Functions.Notify(Lang:t("error.door_not_found"), 'error') return end
		if entity[1] == entity[2] then QBCore.Functions.Notify(Lang:t("error.same_entity"), 'error') canContinue = true return end
		doorData.doorHash = {}
		for i = 1, 2 do
			result = DoorSystemFindExistingDoor(coords[i].x, coords[i].y, coords[i].z, model[i])
			if result then QBCore.Functions.Notify(Lang:t("error.door_registered"), 'error') canContinue = true return end
			doorData.doorHash[i] = 'door_'..doorData.doorname..'_'..i
			AddDoorToSystem(doorData.doorHash[i], model[i], coords[i], false, false, false)
            DoorSystemSetDoorState(doorData.doorHash[i], 4, false, false)
            coords[i] = GetEntityCoords(entity[i])
            heading[i] = GetEntityHeading(entity[i])
            RemoveDoorFromSystem(doorData.doorHash[i])
		end
		doorData.entity = entity
		doorData.coords = coords
		doorData.model = model
		doorData.heading = heading
		TriggerServerEvent('qb-doorlock:server:saveNewDoor', doorData, true)
		canContinue = true
	end
end)

RegisterNetEvent('qb-doorlock:client:newDoorAdded', function(data, id)
	Config.DoorList[id] = data
	TriggerEvent('qb-doorlock:client:setState', PlayerData.source, id, data.locked, false, true, true)
end)

-- Commands

RegisterCommand('toggledoorlock', function()
    if not closestDoor.data or not next(closestDoor.data) or closestDoor.distance > (closestDoor.data.distance or closestDoor.data.maxDistance)  --[[or PlayerData.metadata['isdead'] ]] or PlayerData.metadata['inlaststand'] or PlayerData.metadata['ishandcuffed'] then return end
	playerPed = PlayerPedId()
	local veh = GetVehiclePedIsIn(playerPed)
	if veh then
		CreateThread(function()
			local counter = 0
			local siren = IsVehicleSirenOn(veh)
			repeat
				DisableControlAction(0, 86, true)
				SetHornEnabled(veh, false)
				if not siren then SetVehicleSiren(veh, false) end
				counter += 1
				Wait(0)
			until counter == 100
			SetHornEnabled(veh, true)
		end)
	end
	local locked = not closestDoor.data.locked
	if closestDoor.data.audioRemote then src = NetworkGetNetworkIdFromEntity(playerPed) else src = false end
	TriggerServerEvent('qb-doorlock:server:updateState', closestDoor.id, locked, src, false, false, true, true) -- Broadcast new state of the door to everyone
end)
TriggerEvent("chat:removeSuggestion", "/toggledoorlock")
RegisterKeyMapping('toggledoorlock', Lang:t("general.keymapping_description"), 'keyboard', 'E')

-- Threads

CreateThread(function()
	updateDoors()
	while true do
		local sleep = 100
		if isLoggedIn and canContinue then
			playerPed = PlayerPedId()
			playerCoords = GetEntityCoords(playerPed)
			if not closestDoor.id then
				local distance = #(playerCoords - lastCoords)
				if distance > 15 then
					updateDoors()
					sleep = 1000
				else
					for k in pairs(nearbyDoors) do
						local door = Config.DoorList[k]
						if door.setText and door.textCoords then
							distance = #(playerCoords - door.textCoords)
							if distance < (closestDoor.distance or 15) then
								if distance < (door.distance or door.maxDistance) then
									closestDoor = {distance = distance, id = k, data = door}
									sleep = 0
								end
							end
						end
					end
				end
			end
			if closestDoor.id then
				while isLoggedIn do
					if not paused and IsPauseMenuActive() then
						hideNUI()
						paused = true
					elseif paused then
						if not IsPauseMenuActive() then paused = false end
					else
						playerCoords = GetEntityCoords(playerPed)
						closestDoor.distance = #(closestDoor.data.textCoords - playerCoords)
						if closestDoor.distance < (closestDoor.data.distance or closestDoor.data.maxDistance) then
							local authorized = isAuthorized(closestDoor.data)
							local displayText = ""
							if not closestDoor.data.locked and not authorized then
								displayText = Lang:t("general.unlocked")
							elseif not closestDoor.data.locked and authorized then
								displayText = Lang:t("general.unlocked_button")
							elseif closestDoor.data.locked and not authorized then
								displayText = Lang:t("general.locked")
							elseif closestDoor.data.locked and authorized then
								displayText = Lang:t("general.locked_button")
							end
							if displayText ~= "" then displayNUIText(displayText) end
						else
							hideNUI()
							break
						end
					end
					Wait(100)
				end
				closestDoor = {}
				sleep = 0
			end
		end
		Wait(sleep)
	end
end)
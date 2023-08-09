local car, h
local _wheel, _base, _lights1, _lights2, _arrow1, _arrow2 = nil, nil, nil, nil, nil, nil

local m1a = GetHashKey('vw_prop_vw_luckylight_off')
local m1b = GetHashKey('vw_prop_vw_luckylight_on')
local m2a = GetHashKey('vw_prop_vw_jackpot_off')
local m2b = GetHashKey('vw_prop_vw_jackpot_on')
	
local _wheelPos = Config.WheelPos
local _isRolling = false

Citizen.CreateThread(function()
	RequestScriptAudioBank("DLC_VINEWOOD\\CASINO_GENERAL", false)
	
	QBCore.Functions.TriggerCallback('vns_cs_wheel:getcar', function(_car)
		car = _car
	end)

	local model1 = GetHashKey('vw_prop_vw_luckywheel_02a')
	local model2 = GetHashKey('vw_prop_vw_luckywheel_01a')
	
	
	if Config.SpawnWheel == false then
		local o = GetClosestObjectOfType(Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z, 2.5, GetHashKey('vw_prop_vw_luckywheel_01a'), 0 ,0 , 0)
		local o1 = GetClosestObjectOfType(Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z, 2.5, GetHashKey('vw_prop_vw_jackpot_on'), 0 ,0 , 0)
		local o2 = GetClosestObjectOfType(Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z, 2.5, GetHashKey('vw_prop_vw_luckylight_on'), 0 ,0 , 0)
		if DoesEntityExist(o) then
			Config.WheelPos.x = GetEntityCoords(o).x
			Config.WheelPos.y = GetEntityCoords(o).y-1.0
			Config.WheelPos.z = GetEntityCoords(o).z+0.2593
			Config.WheelPos.h = GetEntityHeading(o)
			SetModelAsNoLongerNeeded(o, true, true)
			SetEntityCollision(o, false, false)
			SetEntityVisible(o, false)
			
			SetModelAsNoLongerNeeded(o1, true, true)
			SetEntityCollision(o1, false, false)
			SetEntityVisible(o1, false)
			
			SetModelAsNoLongerNeeded(o2, true, true)
			SetEntityCollision(o2, false, false)
			SetEntityVisible(o2, false)
		end
	end
	
	
	CreateThread(function()
		RequestModel(model1) while not HasModelLoaded(model1) do Wait(0) end
		RequestModel(model2) while not HasModelLoaded(model2) do Wait(0) end
		
		RequestModel(m1a) while not HasModelLoaded(m1a) do Wait(0) end
		RequestModel(m1b) while not HasModelLoaded(m1b) do Wait(0) end
		RequestModel(m2a) while not HasModelLoaded(m2a) do Wait(0) end
		RequestModel(m2b) while not HasModelLoaded(m2b) do Wait(0) end
		
		ClearArea(Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z, 5.0, true, false, false, false)
		
		_wheel = CreateObject(model1, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z, false, false, true)
		SetEntityHeading(_wheel, Config.WheelPos.h)
		SetModelAsNoLongerNeeded(model1)

		_base = CreateObject(model2, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z-0.26, false, false, true)
		SetEntityHeading(_base, Config.WheelPos.h)
		SetModelAsNoLongerNeeded(_base)

		_lights1 = CreateObject(m1a, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z+0.35, false, false, true)
		SetEntityHeading(_lights1, Config.WheelPos.h)
		SetModelAsNoLongerNeeded(_lights1)

		_lights2 = CreateObject(m1b, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z+0.35, false, false, true)
		SetEntityVisible(_lights2, false, 0)
		SetEntityHeading(_lights2, Config.WheelPos.h)
		SetModelAsNoLongerNeeded(_lights2)

		_arrow1 = CreateObject(m2a, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z+2.5, false, false, true)
		SetEntityHeading(_arrow1, Config.WheelPos.h)
		SetModelAsNoLongerNeeded(_arrow1)

		_arrow2 = CreateObject(m2b, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z+2.5, false, false, true)
		SetEntityVisible(_arrow2, false, 0)
		SetEntityHeading(_arrow2, Config.WheelPos.h)
		SetModelAsNoLongerNeeded(_arrow2)
		
		h = GetEntityRotation(_wheel)
	end)

	exports['qb-target']:AddBoxZone("casinowheel", vector3(1111.119, 229.6535, -49.63581), 1.0, 2.0, {
        name = "casinowheel",
        heading = 0,
        debugPoly = false,
        minZ = -49.6 - 2.0 ,
        maxZ = -49.6 + 2.0
    }, {
        options = {
            {
                event = 'Polar-Casino:Client:Wheel',
                icon = "fas fa-bolt",
                label = "View Wheel",
            },
        },
        distance = 2.5
    })
end)
RegisterNetEvent('Polar-Casino:Client:Wheel', function()
	local menu = {
		{
			isMenuHeader = true,
            header = "Diamond Casino Wheel",
            txt = "Where Dreams Come True!",
            icon = "fa-solid fa-gem",
            params = {
                event = "star",
            },
			
        },
        {
            header = "Spin That Wheel!",
            txt = "Make that Bank Roll!",
            icon = "fas fa-bolt",
            params = {
                event = "Polar-Casino:Client:Spin",
            }
        },
        {
            header = "View Star Rewards",
            txt = "View the Weekly Wheel Rewards",
            icon = "fa-solid fa-coins",
            params = {
                event = "Polar-Casino:Client:ViewRewards",
            }
        },
        {
            header = "Close Menu",
            txt = "",
            icon = "fa-solid fa-circle-xmark",
            params = {
                event = "menu",
            }
        }
    }

	exports['qb-menu']:openMenu(menu)
end)
RegisterNetEvent('Polar-Casino:Client:Spin', function()

	TriggerServerEvent('vns_cs_wheel:getwheel')
end)
RegisterNetEvent('Polar-Casino:Client:ViewRewards', function()
	local menu = {
		{
			isMenuHeader = true,
            header = "Casino Rewards",
            txt = "Spin That Wheel!",
            icon = "fa-solid fa-coins",
            params = {
                event = "star",
            },
			
        },
        {
			isMenuHeader = true,
            header = "Star 1",
            txt = "Ooh Big Mystery Item",
            icon = "fa-solid fa-gem",
            params = {
                event = "star",
            },
			
        },
        {
			isMenuHeader = true,
            header = "Star 2",
            txt = "Ooh Small Mystery Item",
            icon = "fa-solid fa-question",
            params = {
                event = "star",
            },
			
        },
		{
			isMenuHeader = true,
            header = "Star 3",
            txt = "1,000 - 25,000 Cash Money",
            icon = "fa-solid fa-sack-dollar",
            params = {
                event = "star",
            },
			
        },
		{
			isMenuHeader = true,
            header = "Star 4",
            txt = "1-6 Premium Drinks",
            icon = "fa-solid fa-champagne-glasses",
            params = {
                event = "star",
            },
			
        },
		{
			isMenuHeader = true,
            header = "Star 5",
            txt = "1,000 - 50,000 Diamond Casino Chips",
            icon = "fa-solid fa-coins",
            params = {
                event = "star",
            },
			
        },
		{
            header = "Go Back",
            txt = "Back to Previous Menu",
            icon = "fa-solid fa-chevron-left",
            params = {
                event = "Polar-Casino:Client:Wheel",
            }
        }
    }

	exports['qb-menu']:openMenu(menu)
end)
local heading = Config.VehiclePos.h
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		if Config.SpawnWheel == false then
			local o = GetClosestObjectOfType(Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z, 2.5, GetHashKey('ch_prop_casino_lucky_wheel_01a'), 0 ,0 , 0)
			SetEntityCollision(o, false, false)
			SetEntityVisible(o, false)
			if DoesEntityExist(o) and GetEntityCoords(o) ~= GetEntityCoords(_wheel) then
				Config.WheelPos.x = GetEntityCoords(o).x
				Config.WheelPos.y = GetEntityCoords(o).y-2.0
				Config.WheelPos.z = GetEntityCoords(o).z
				Config.WheelPos.h = GetEntityHeading(o)
				SetEntityCoords(_wheel, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z+1.50)
				SetEntityCoords(_base, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z)
				
				SetEntityCoords(_lights1, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z)
				SetEntityCoords(_lights2, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z)
				SetEntityCoords(_arrow1, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z)
				SetEntityCoords(_arrow2, Config.WheelPos.x, Config.WheelPos.y, Config.WheelPos.z)
				
				
				
				SetEntityHeading(_lights1, Config.WheelPos.h)
				SetEntityHeading(_lights2, Config.WheelPos.h)
				SetEntityHeading(_arrow1, Config.WheelPos.h)
				SetEntityHeading(_arrow2, Config.WheelPos.h)
				SetEntityHeading(_wheel, Config.WheelPos.h)
				SetEntityHeading(_base, Config.WheelPos.h)
				
			end
		end
	
		if GetDistanceBetweenCoords(GetEntityCoords(    PlayerPedId()    ), Config.VehiclePos.x, Config.VehiclePos.y, Config.VehiclePos.z, true) < 40 then
			if DoesEntityExist(vehicle) == false then
				if car then
					RequestModel(GetHashKey(car))
					while not HasModelLoaded(GetHashKey(car)) do
						Wait(1)
					end
					vehicle = CreateVehicle(GetHashKey(car), Config.VehiclePos.x, Config.VehiclePos.y, Config.VehiclePos.z, heading, false, false)
					FreezeEntityPosition(vehicle, true)
					SetEntityInvincible(vehicle, true)
					SetVehicleColours(vehicle, 62, 159)
					SetEntityCoords(vehicle, Config.VehiclePos.x, Config.VehiclePos.y, Config.VehiclePos.z, false, false, false, true)
					local props = QBCore.Functions.GetVehicleProperties(vehicle)
					props['wheelColor'] = 147
					props['plate'] = "DIAMONDS"
					QBCore.Functions.SetVehicleProperties(vehicle, props)
					SetVehicleDirtLevel(vehicle, 0.0)
				end
			else
				SetVehicleDoorsLocked(vehicle, 2)
				if Config.VehicleRot == true then
					SetEntityHeading(vehicle, heading)
					heading = heading+0.1
				end
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent("vns_cs_wheel:syncanim")
AddEventHandler("vns_cs_wheel:syncanim", function()
	doRoll(0)
end)

RegisterNetEvent("vns_cs_wheel:startroll")
AddEventHandler("vns_cs_wheel:startroll", function(s, index, p)
	Citizen.Wait(550)
	print(index)
	SetEntityVisible(_lights1, false, 0)
	SetEntityVisible(_lights2, true, 0)
	win = (index - 1) * 18 + 0.0
	local j = 360
	
	if s == GetPlayerServerId(PlayerId()) then
		PlaySoundFromEntity(-1, "Spin_Start", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
	end
	
	for i=1,1100,1 do
		
		SetEntityRotation(_wheel, h.x, j+0.0, h.z, 0, false)
		if i < 50 then
			j = j - 1.5
		elseif i < 100 then
			j = j - 2.0
		elseif i < 150 then
			j = j - 2.5
			
			
		elseif i > 1060 then
			j = j - 0.3
		elseif i > 1030 then
			j = j - 0.6
		elseif i > 1000 then
			j = j - 0.9
		elseif i > 970 then
			j = j - 1.2
		elseif i > 940 then
			j = j - 1.5
		elseif i > 910 then
			j = j - 1.8
		elseif i > 880 then
			j = j - 2.1
		elseif i > 850 then
			j = j - 2.4
		elseif i > 820 then
			j = j - 2.7
		else
			j = j - 3.0
		end
		if i == 850 then j = math.random(win-4, win+10) + 0.0 end
		if j > 360 then j = j + 0 end
		if j < 0 then j = j + 360 end
		if i == 900 then
		end
		Wait(0)
	end
	Wait(300)
	SetEntityVisible(_arrow1, false, 0)
	SetEntityVisible(_arrow2, true, 0)
	local t = true
	
	if s == GetPlayerServerId(PlayerId()) then
		if p.sound == 'car' then
			PlaySoundFromEntity(-1, "Win_Car", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
		elseif p.sound == 'cash' then
			PlaySoundFromEntity(-1, "Win_Cash", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
		elseif p.sound == 'chips' then
			PlaySoundFromEntity(-1, "Win_Chips", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
		elseif p.sound == 'clothes' then
			PlaySoundFromEntity(-1, "Win_Clothes", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
		elseif p.sound == 'mystery' then
			PlaySoundFromEntity(-1, "Win_Mystery", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
		else
			PlaySoundFromEntity(-1, "Win", _wheel, 'dlc_vw_casino_lucky_wheel_sounds', 1, 1)
		end
		TriggerEvent('chCasinoWall:bigWin')
	end
	
	for i=1,15,1 do
		Citizen.Wait(200)
		SetEntityVisible(_lights1, t, 0)
		SetEntityVisible(_arrow2, t, 0)
		t = not t
		SetEntityVisible(_lights2, t, 0)
		SetEntityVisible(_arrow1, t, 0)
		if i == 5 then
			if s == GetPlayerServerId(PlayerId()) then
				TriggerServerEvent('vns_cs_wheel:give', s, p)
			end
		end
	end
	Citizen.Wait(1000)
	SetEntityVisible(_lights1, true, 0)
	SetEntityVisible(_lights2, false, 0)
	SetEntityVisible(_arrow1, true, 0)
	SetEntityVisible(_arrow2, false, 0)
	TriggerServerEvent('vns_cs_wheel:stoproll')
end)

RegisterNetEvent("vns_cs_wheel:rollFinished")
AddEventHandler("vns_cs_wheel:rollFinished", function() 
    _isRolling = false
end)

function doRoll()
    if not _isRolling then
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
        RequestAnimDictVNS(lib, function()
			local _movePos = GetObjectOffsetFromCoords(GetEntityCoords(_base), GetEntityHeading(_base),-0.9, -0.8, -1.0)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  3000,  GetEntityHeading(_base),  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Wait(0)
            end
			SetEntityHeading(playerPed, GetEntityHeading(_base))
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Wait(0)
				DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Wait(0)
                DisableAllControlActions(0)
				FreezeEntityPosition(playerPed, true)
            end
			Wait(5000)
			TriggerServerEvent('Polar-Casino:Client:StartWheelSpin')
			TaskPlayAnim(0, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
			--[[exports['qb-core']:DrawText('Press E to Spin!', 'left')
			while true do 
				if IsDisabledControlJustPressed(0, 38) then
					exports['qb-core']:HideText()
					TriggerServerEvent('Polar-Casino:Client:StartWheelSpin')
					TaskPlayAnim(0, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
					FreezeEntityPosition(playerPed, false)
					break
				end
			Wait(100)
			end]]
        end)
    end
end

function RequestAnimDictVNS(animDict, cb)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
	end

	if cb ~= nil then
		cb()
	end
end

RegisterNetEvent('vns_cs_wheel:winCar', function(vehicle, plate)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, Config.VehicleWinPos.w)
        SetEntityAsMissionEntity(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end, Config.VehicleWinPos, true)
end)

function helpText(text)
	AddTextEntry('helptextnotification', text)
	BeginTextCommandDisplayHelp('helptextnotification')
	EndTextCommandDisplayHelp(0, false, true, 1)
end
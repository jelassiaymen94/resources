

--RegisterCommand("guard", function(source)  bodyguard(0, "npcguards") end, false)
--RegisterCommand("enemy", function(source)  bodyguard(5, "npcenemy") end, false)

local model = "s_m_m_prisguard_01"
local weapon = 'weapon_smg'
local ammo = 50
local health = 200
local accuracy = 50
local range = 2

function bodyguard(what, guard)
    SetPedRelationshipGroupHash(PlayerPedId(), 'PLAYER')
    AddRelationshipGroup(guard)

    RequestModel(model) while not HasModelLoaded(model) do Wait(0) end
    local enemy = CreatePed(4, model, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, 0, true, true)
    GiveWeaponToPed(enemy, weapon, ammo, 0, 1)
    SetPedCombatAttributes(enemy, 46, true)
    SetPedCombatAttributes(enemy, 5, true)
    SetPedCombatAbility(enemy, 100)
    SetPedCombatMovement(enemy, 1)
    SetPedAsEnemy(enemy, true)
    SetEntityHealth(enemy, health) 
    SetPedAccuracy(enemy, accuracy) 
    SetPedCombatRange(enemy, range)
    SetPedRelationshipGroupDefaultHash(enemy, guard)
    SetPedRelationshipGroupHash(enemy, guard)
    SetCanAttackFriendly(enemy, true, true)
    SetEntityHeading(enemy, GetEntityCoords(PlayerPedId()).w)

    SetRelationshipBetweenGroups(0, guard, guard)
    SetRelationshipBetweenGroups(what, guard, 'PLAYER')
    SetRelationshipBetweenGroups(what, 'PLAYER', guard)
end


local color = {
    r=255,
    g=0,
    b=75,
    a=255
}

--[[
    CreateThread(function()
    while true do
        Wait(5)
        SetTextFont(0) -- 0-4
        SetTextScale(0.4, 0.4) -- Size of text
        SetTextColour(color.r, color.g, color.b, color.a) -- RGBA
        SetTextEntry("STRING")
        AddTextComponentString("My Epic Server!") -- Main Text string
        DrawText( 0.0001, 0.0001) -- x,y of the screen
        
       
    end
end)
]]






















RegisterCommand("spawn", function()
    --spawnCar("adder")
    spawnCar("cheetah")
    --spawnCar("comet")
    whee()
end)
function whee()
    --SetCreditsActive(true)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist("XMAS")
    SetWeatherTypeNow("XMAS")
    SetWeatherTypeNowPersist("XMAS")
    SetWind(99.0)
    SetWindSpeed(12.0)
    Wait(10)
    while true do 

        
        --SetPedIsDrunk(PlayerPedId(), true)
        SetVehicleDensityMultiplierThisFrame(1.0)
		SetPedDensityMultiplierThisFrame(1.0)
		SetRandomVehicleDensityMultiplierThisFrame(1.0)
		SetParkedVehicleDensityMultiplierThisFrame(1.0)
		SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
		SetClockTime(15,05,23)
		SetGarbageTrucks(0)
		SetRandomBoats(0)

		SetDispatchCopsForPlayer(GetPlayerPed(-1), true)


       
        
        SetPedGravity(PlayerPedId(), true)
        --SetPadShake(0, 100, 200)
		SetPedAccuracy(100)
		SetPedAlertness(PlayerId(), 3)
        SetCreateRandomCops(true)

        --SetEntityMotionBlur(PlayerPedId(), true)
		SetEntityVelocity(PlayerId(), 1,1,1)
		SetFadeOutAfterDeath(true) 
		SetFakeWantedLevel(6)
		SetFarShadowsSuppressed(true)
		--SetFlashLightFadeDistance(9999)
		SetFollowVehicleCamZoomLevel(999)
		SetForceVehicleTrails(true)
		SetForcePedFootstepsTracks(true)
		--SetGameplayCamRelativeHeading(255)
		--SetGameplayCamRelativePitch(40, 0x3F800000)
		--SetGameplayCamShakeAmplitude(5)
		--SetGameplayHintFov(360)
       -- SetGpsFlashes(true)
        SetRunSprintMultiplierForPlayer(GetPlayerPed(-1),1.3)
        SetPlayerWantedLevel(GetPlayerPed(-1), 5, true)
        
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
       -- AddExplosion(x,y,z,5, 0.0, false, false, 1.0)
        
--[[    Breaks, when you die 	
    	SetCamFov(CreateCam("DEFAULT_SPLINE_CAMERA", true), 360)
		SetCamFov(CreateCam("DEFAULT_ANIMATED_CAMERA", true), 130)
		SetCamFov(CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true), 130)
		SetCamFov(CreateCam("TIMED_SPLINE_CAMERA", true), 130)
      ]]
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
           --SetVehicleGravityAmount(vehicle, 0)
            SetVehicleWheelHealth(vehicle, 1, 0)
            SetVehicleTurboPressure(vehicle, 50)
            SetVehicleBoostActive(vehicle, true)
            SetVehicleForwardSpeed(vehicle, 247.3)
            SetVehicleHandlingField(vehicle, 'CHandlingData', 'fSteeringLock', 120.0)
            SetVehicleDoorControl(vehicle, 0, 12, 120.0)
            SetVehicleDoorControl(vehicle, 1, 12, 120.0)
            SetVehicleDoorControl(vehicle, 2, 12, 120.0)
            SetVehicleDoorControl(vehicle, 3, 12, 120.0)
            SetVehicleDoorControl(vehicle, 4, 12, 120.0)
            SetVehicleDoorControl(vehicle, 5, 12, 120.0)
            SetVehicleBoostActive(vehicle, false)
            --SetVehicleCurrentRpm(vehicle, 9999)
        end
        
       --[[  if IsPedJumping(GetPlayerPed(-1)) then 
            SetEntityHealth(GetPlayerPed(-1), 0)
        end  ]]
    end
end


function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end
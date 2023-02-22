local mp_pointing = false

startPointing = function()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
	TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, false, 'anim@mp_point', 24)
    RemoveAnimDict("anim@mp_point")
end

stopPointing = function()
    local ped = PlayerPedId()
	RequestTaskMoveNetworkStateTransition(ped, 'Stop')
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end
local NumberJump = 15

Citizen.CreateThread(function()
  local Jump = 0
  while true do

      Citizen.Wait(1)

      local ped = PlayerPedId()

      if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then

        Jump = Jump + 1

          if Jump == NumberJump then

              SetPedToRagdoll(ped, 5000, 1400, 2)

              Jump = 0

          end

      else 

          Citizen.Wait(500)
          
      end
  end
end)
CreateThread(function ()
    SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
end)

local lastped = nil

CreateThread(function ()
    while true do
        if PlayerPedId() ~= lastped then
            lastped = PlayerPedId()
            SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
        end
        Wait(100)
    end
end
)
RegisterNetEvent('qb-weapons:client:scratch', function()
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    local weaponammo = GetAmmoInPedWeapon(ped, weapon)
    if weapon == `WEAPON_UNARMED` then
        QBCore.Functions.Notify('You dont have a weapon in your hands..', 'error')
    else
        TaskStartScenarioInPlace(ped, 'PROP_HUMAN_PARKING_METER')
        QBCore.Functions.Progressbar("search_register", "Scratching Serial Numbers..", math.random(500,500) , false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {}, {}, {}, function() -- Done
            ClearPedTasks(ped)
            TriggerServerEvent('qb-weapons:server:scratch', weapon, weaponammo)
          end, function()
            ClearPedTasks(ped)
          end) -- Cancel
    end
end)
RegisterCommand('point', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if mp_pointing then
            stopPointing()
            mp_pointing = false
        else
            startPointing()
            mp_pointing = true
        end
        while mp_pointing do
            local ped = PlayerPedId()
            local camPitch = GetGameplayCamRelativePitch()
            if camPitch < -70.0 then
                camPitch = -70.0
            elseif camPitch > 42.0 then
                camPitch = 42.0
            end
            camPitch = (camPitch + 70.0) / 112.0

            local camHeading = GetGameplayCamRelativeHeading()
            local cosCamHeading = Cos(camHeading)
            local sinCamHeading = Sin(camHeading)
            if camHeading < -180.0 then
                camHeading = -180.0
            elseif camHeading > 180.0 then
                camHeading = 180.0
            end
            camHeading = (camHeading + 180.0) / 360.0

            local blocked

            local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
            local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7)
            _, blocked = GetRaycastResult(ray)
			SetTaskMoveNetworkSignalFloat(ped, "Pitch", camPitch)
			SetTaskMoveNetworkSignalFloat(ped, "Heading", camHeading * -1.0 + 1.0)
			SetTaskMoveNetworkSignalBool(ped, "isBlocked", blocked)
			SetTaskMoveNetworkSignalBool(ped, "isFirstPerson", GetCamViewModeForContext(GetCamActiveViewModeContext()) == 4)
            Wait(1)
        end
    end
end)

RegisterKeyMapping('point', 'Toggles Point', 'keyboard', 'b')

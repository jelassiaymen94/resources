local QBCore = exports['qb-core']:GetCoreObject()

-- NUI Callback

RegisterNUICallback('GetAvailableRaces', function(_, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:GetRaces', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('JoinRace', function(data)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(veh)
    if IsPedInAnyVehicle(PlayerPedId()) then
        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            TriggerServerEvent('qb-lapraces:server:JoinRace', data.RaceData, plate)
        end
    else
        QBCore.Functions.Notify('You need to be in a vehicle')
    end
    cb("ok")
end)

RegisterNUICallback('LeaveRace', function(data, cb)
    TriggerServerEvent('qb-lapraces:server:LeaveRace', data.RaceData)
    cb("ok")
end)

RegisterNUICallback('StartRace', function(data, cb)
    TriggerServerEvent('qb-lapraces:server:StartRace', data.RaceData.RaceId)
    cb("ok")
end)

RegisterNUICallback('SetAlertWaypoint', function(data, cb)
    local coords = data.alert.coords
    QBCore.Functions.Notify('GPS set: '..data.alert.title, "primary")
    SetNewWaypoint(coords.x, coords.y)
    cb("ok")
end)

RegisterNUICallback('GetRaces', function(_, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:GetListedRaces', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('GetTrackData', function(data, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:GetTrackData', function(TrackData, CreatorData)
        TrackData.CreatorData = CreatorData
        cb(TrackData)
    end, data.RaceId)
end)

RegisterNUICallback('SetupRace', function(data, cb)
    TriggerServerEvent('qb-lapraces:server:SetupRace', data.RaceId, tonumber(data.AmountOfLaps), data.isPhasing)
    cb("ok")
end)
RegisterNUICallback('HasCreatedRace', function(_, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:HasCreatedRace', function(HasCreated)
        cb(HasCreated)
    end)
end)

RegisterNUICallback('IsInRace', function(data, cb)
    local InRace = exports['racing']:IsInRace()
    cb(InRace)
end)

RegisterNUICallback('IsAuthorizedToCreateRaces', function(data, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:IsAuthorizedToCreateRaces', function(IsAuthorized, NameAvailable)
        local data = {
            IsAuthorized = IsAuthorized,
            IsBusy = exports['racing']:IsInEditor(),
            IsNameAvailable = NameAvailable,
        }
        cb(data)
    end, data.TrackName)
end)

RegisterNUICallback('StartTrackEditor', function(data, cb)
    TriggerServerEvent('qb-lapraces:server:CreateLapRace', data.TrackName)
    cb("ok")
end)

RegisterNUICallback('GetRacingLeaderboards', function(_, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:GetRacingLeaderboards', function(Races)
        cb(Races)
    end)
end)
RegisterNUICallback('RaceDistanceCheck', function(data, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:GetRacingData', function(RaceData)
        if RaceData then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local checkpointcoords = RaceData.Checkpoints[1].coords
            local dist = #(coords - vector3(checkpointcoords.x, checkpointcoords.y, checkpointcoords.z))
            if dist <= 115.0 then
                if data.Joined then
                    TriggerEvent('qb-lapraces:client:WaitingDistanceCheck')
                end
                cb(true)
            else
                QBCore.Functions.Notify('You\'re too far away from the race. GPS set.', "error", 5000)
                SetNewWaypoint(checkpointcoords.x, checkpointcoords.y)
                cb(false)
            end
        else
            QBCore.Functions.Notify('You need to select a race.', "error", 5000)
        end
    end, data.RaceId)
end)

RegisterNUICallback('IsBusyCheck', function(data, cb)
    if data.check == "editor" then
        cb(exports['racing']:IsInEditor())
    else
        cb(exports['racing']:IsInRace())
    end
end)

RegisterNUICallback('CanRaceSetup', function(_, cb)
    QBCore.Functions.TriggerCallback('qb-lapraces:server:CanRaceSetup', function(CanSetup)
        cb(CanSetup)
    end)
end)

-- Events

RegisterNetEvent('qb-phone:client:RaceNotify', function(message)
    TriggerEvent('qb-phone:client:CustomNotification',
        "Racing",
        message,
        "fas fa-flag-checkered",
        "#353b48",
        3500
    )
end)

RegisterNetEvent('qb-phone:client:UpdateLapraces', function()
    SendNUIMessage({
        action = "UpdateRacingApp",
    })
end)
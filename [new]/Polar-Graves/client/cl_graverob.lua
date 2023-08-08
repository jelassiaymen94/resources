
local QBCore = exports['qb-core']:GetCoreObject()

local gravess = Config.Graves

CementaryLocation = {}
local blipSpawned = false


local isDigging = false


AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
      
    end
end)


local ZoneSpawned = false 
local ZoneCreated = {}

CreateThread(function()
  graves()
end)
function graves()
    for k, v in pairs(gravess) do
        if ZoneSpawned then
            return
        end

        for k, v in pairs(gravess) do
            if not ZoneCreated[k] then
                ZoneCreated[k] = {}
            end

            ZoneCreated[k] = exports['qb-target']:AddBoxZone(v["GraveName"], v["Coords"], 1, 1, {
                name = v["GraveName"],
                heading = 0.0,
                debugPoly = false,
            }, {
                options = {
                    {
                        icon = "fa-solid fa-trowel",
                        label = "Dig Grave",
                        event = "Graverobbery:Client:StartDigging",
                    },
                },
        
                distance = 1
            })

            ZoneSpawned = true
        end
    end

end
RegisterNetEvent('Graverobbery:Client:ResetGrave', function(OldGrave, state)
    gravess[OldGrave].Looted = state
end)
RegisterNetEvent("Graverobbery:Client:StartDigging", function()
    GravepoliceAlert(GetEntityCoords(PlayerPedId()))
    if isDigging == false and QBCore.Functions.HasItem('shovel') then
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        for k, v in pairs(gravess) do
            local dist = #(GetEntityCoords(ped) - vector3(gravess[k]["Coords"].x, gravess[k]["Coords"].y, gravess[k]["Coords"].z))
            if dist <= 1.5 then
                if gravess[k].Looted == false then
                    gravess[k].Looted = true
                    CurGrave = k
                    QBCore.Functions.Progressbar("digging", "Digging...", math.random(8000, 15000), false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = 'amb@world_human_gardener_plant@male@base',
                        anim = 'base',
                        flags = 1,
                    }, {}, {}, function() -- Done
                        Diggin = true
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('Graverobbery:Server:SetGraveState', CurGrave)
                        TriggerServerEvent('Graverobbery:Server:GiveItems', CurGrave)
                       
                    end, function() -- Cancel
                        ClearPedTasks(PlayerPedId())
                        QBCore.Functions.Notify("Cancelled.", "error")
                        gravess[k].Looted = false
                    end)
                elseif gravess[k].Looted == true then
                    QBCore.Functions.Notify('Seems like someone beat you to it!', 'error', 5000)
                end
            end
        end
    end
end)



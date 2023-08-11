
local QBCore = exports['qb-core']:GetCoreObject()



CementaryLocation = {}
local blipSpawned = false


local isDigging = false


AddEventHandler('onResourceStop', function(resourceName) if GetCurrentResourceName() == resourceName then removetargets()  end end)


local ZoneSpawned = false 


function removetargets() for k, v in pairs(Config.Graves) do  exports['qb-target']:RemoveZone(k)  end end
RegisterNetEvent('Polar-Graves:Client:TargetRemove', function(target) exports['qb-target']:RemoveZone(target)  end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) graves()  end)

RegisterNetEvent('Polar-Graves:Client:Reset', function()
    print('Res')
    ZoneSpawned = false
    removetargets()
    Wait(2000)
    graves()
    TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Cemetary', 'New Bodies have been dumped', 'fas fa-file-invoice-dollar', '#b3e0f2', '10000')
end)

function graves()
    for k, v in pairs(Config.Graves) do
        if ZoneSpawned then
            return
        end

        for k, v in pairs(Config.Graves) do
            exports['qb-target']:AddBoxZone(k, v["coords"], 1, 1, {
                name = k,
                heading = 0.0,
                debugPoly = false,
            }, {
                options = {
                    {
                        icon = "fa-solid fa-trowel",
                        label = "Dig Grave",
                        event = "Graverobbery:Client:StartDigging",
                        item = 'shovel',
                        hi = k,
                    },
                },
        
                distance = 1
            })

            ZoneSpawned = true
        end
    end
end




RegisterNetEvent("Graverobbery:Client:StartDigging", function(data)
    local target = data.hi
    if isDigging == false and QBCore.Functions.HasItem('shovel') then
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        for k, v in pairs(Config.Graves) do
            local dist = #(GetEntityCoords(ped) - v["coords"])
            if dist <= 1.5 then
                TriggerServerEvent('Polar-Graves:Server:TargetRemove', target)
                    local CurGrave = k
                    exports["qb-dispatch"]:CustomAlert({
                        coords = v["coords"], message = "Suspicious Activity",
                        dispatchCode = "10-16", description = "Possible Grave Digging", radius = 10,
                        sprite = 58,  color = 46, scale = 1.0,  length = 1,
                    })   
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
                        TriggerServerEvent('Graverobbery:Server:GiveItems', CurGrave)
                        TriggerServerEvent('Polar-Graves:Server:GraveSet')
                    end, function() -- Cancel
                        ClearPedTasks(PlayerPedId())
                        QBCore.Functions.Notify("Cancelled.", "error")
                       
                    end)
            end
        end
    end
end)



function Notify(text, type, time)
    QBCore.Functions.Notify(text, type, time)
end

local QBCore = exports['qb-core']:GetCoreObject()



 CreateThread(function()

    for k, v in pairs(Config.Locations["bells"]) do
        exports['qb-target']:AddBoxZone("bells"..k, vector3(v.x, v.y, v.z), 0.5, 0.5, {
            name = "bells"..k,
            heading = -72,
            debugPoly = false,
            minZ = v.z - 2,
            maxZ = v.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    icon = "fa-solid fa-bell",
                    event = "polar:client:burgershotding",
                    label = "Ring Bell",
                }
            },
            distance = 1.5
        })
    end
    for k, v in pairs(Config.Locations["gavels"]) do
        exports['qb-target']:AddBoxZone("gavels"..k, vector3(v.x, v.y, v.z), 0.5, 0.5, {
            name = "gavels"..k,
            heading = -72,
            debugPoly = false,
            minZ = v.z - 2,
            maxZ = v.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "polar:client:burgershotding",
                    icon = "fa-solid fa-gavel",
                    label = "Use Gavel",
                }
            },
            distance = 1.5
        })
    end
   
        exports['qb-target']:AddBoxZone("PDArmory", vector3(482.47, -995.17, 30.69), 2.5, 2.3, {
            name = "PDArmory",
            heading = -20,
                debugPoly = false,
                minZ = 30.03,
                maxZ = 30.99,
            }, {
                options = {
                    {
                        type = "client",
                    event = "qb-police:client:openArmoury",
                    icon = "fas fa-clipboard",
                    label = "Open Armory",
                    job = "police"
                    }
                },
                distance = 2.5
            })
           

        
    
end)














RegisterNetEvent('polar:client:judgeGavel', function()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "gavel_hits", 0.5)
end)
RegisterNetEvent('polar:client:burgershotding', function()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "bell-sound", 0.5)
end)
 

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

CreateThread(function()

    for k, v in pairs(Config.Locations["tattoshops"]) do
        exports['qb-target']:AddBoxZone("tattoshops"..k, vector3(v.x, v.y, v.z), 1.5, 1.5, {
            name = "tattoshops"..k,
            heading = -72,
            debugPoly = false,
            minZ = v.z - 2,
            maxZ = v.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "qb-tatto:client:GoToMeno",
                    icon = "fa-solid fa-bolt",
                    label = "Tattoo Shop",
                }
            },
            distance = 1.5
        })
    end
  
    exports['qb-target']:AddBoxZone("apartment", vector3(-271.01, -959.305, 32.692 - 1.12), 2.5, 2.3, {
        name = "apartment",
        heading = -20,
            debugPoly = false,
            minZ = 32.692 - 1.12 - 1,
            maxZ = 32.692 - 1.12 + 1,
        }, {
            options = {
                {
                    type = "client",
                    event = "apartments:client:EnterApartment",
                    icon = "fa-solid fa-bolt",
                    label = "Enter Apartment",
                }
            },
            distance = 1.5
        })


end)

















RegisterNetEvent('polar:client:judgeGavel', function()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "gavel_hits", 0.5)
   end)
   RegisterNetEvent('polar:client:burgershotding', function()
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "bell-sound", 0.5)
   end)
 
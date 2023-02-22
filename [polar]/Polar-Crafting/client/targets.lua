local QBCore = exports['qb-core']:GetCoreObject()



CreateThread(function()
    targets()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        targets()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    targets()
    
end)

function targets()

    if Config.Debug then print('starting') end

end
RegisterNetEvent('Polar-Crafting:Client:OpenBench', function(data)
    type = data.type
    print(type)

end)


--[[
CreateThread(function()
    --Weapon Parts

  
    exports['qb-target']:AddBoxZone("public2", vector3(2510.49, -977.5, 31.01), 5, 5, {
        name = "public2",
        heading = 0,
        debug = true,
            minZ = 30.6,
            maxZ =  34.6,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Crafting:Client:OpenMenuPublicparts",
                    icon = "fa-solid fa-bolt",
                    label = "Open",
                    --job = 'police',
                   -- excludejob = 'police'
                }
            },
            distance = 1.5
        })
    

end)

]]
CreateThread(function()
    --Ammo Bench

  
    exports['qb-target']:AddBoxZone("public3", vector3(2781.2, 1400.37, 24.4), 5, 5, {
        name = "public3",
        heading = 0,
        debug = true,
            minZ = 20.6,
            maxZ =  24.6,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Crafting:Client:OpenMenuPublicammo",
                    icon = "fa-solid fa-bolt",
                    label = "Open",
                    --job = 'police',
                   -- excludejob = 'police'
                }
            },
            distance = 1.5
        })


    exports['qb-target']:AddBoxZone("public10", vector3(-52.58, 1888.6, 195.35), 5, 5, {
            name = "public10",
            heading = 0,
            debug = true,
                minZ = 195.0,
                maxZ =  195.5,
        }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Crafting:Client:OpenMenuPublicammo",
                        icon = "fa-solid fa-bolt",
                        label = "Open",
                        --job = 'police',
                       -- excludejob = 'police'
                    }
                },
                distance = 1.5
        })
    
    
     

end)
CreateThread(function()
    --Tools Bench

  
    exports['qb-target']:AddBoxZone("public4", vector3(2463.35, 3452.09, 49.9), 5, 5, {
        name = "public4",
        heading = 0,
        debug = true,
            minZ = 49.9,
            maxZ =  50.6,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Crafting:Client:OpenMenuPublictools",
                    icon = "fa-solid fa-bolt",
                    label = "Open",
                    --job = 'police',
                   -- excludejob = 'police'
                }
            },
            distance = 1.5
        })

        
    exports['qb-target']:AddBoxZone("25", vector3(303.76, 2899.5, 43.48), 5, 5, {
        name = "25",
        heading = 35,
        debug = true,
            minZ = 43.4,
            maxZ =  43.9,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Crafting:Client:OpenMenuPublictools",
                    icon = "fa-solid fa-bolt",
                    label = "Open",
                    --job = 'police',
                   -- excludejob = 'police'
                }
            },
            distance = 1.5
        })
     

end)
CreateThread(function()
    -- weapon Bench

        -- 1
        exports['qb-target']:AddBoxZone("public1", vector3(1598.52, -1666.9, 88.02), 5, 5, {
            name = "public1",
            heading = 0,
            debug = true,
                minZ = 88.0,
                maxZ =  88.5,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Crafting:Client:WeaponsBench",
                        icon = "fa-solid fa-bolt",
                        label = "Open",
                        --job = 'police',
                        --gang = "scrap",
                       -- excludejob = 'police'
                    }
                },
                distance = 1.5
            })

          
         



end)



CreateThread(function()
    -- explosive Bench

        -- 1
        exports['qb-target']:AddBoxZone("public5", vector3(679.32, 1287.06, 360.27), 5, 5, {
            name = "public5",
            heading = 0,
            debug = true,
                minZ = 360.0,
                maxZ =  360.5,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Crafting:Client:OpenMenuExplosives",
                        icon = "fa-solid fa-bolt",
                        label = "Open",
                        --job = 'police',
                       -- excludejob = 'police'
                    }
                },
                distance = 1.5
            })
    
         



end)
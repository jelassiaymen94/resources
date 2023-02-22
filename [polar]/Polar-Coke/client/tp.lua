local QBCore = exports['qb-core']:GetCoreObject()





function targets()



    exports['qb-target']:AddBoxZone("enterlab3", vector3(387.1, 3584.2, 33.79), 1, 1, {
        name = "enterlab3",
        heading = 0,
             debugPoly = false,
            minZ =  32.79,
            maxZ =  34.79,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Coke:Client:Enter",
                    icon = "fa-solid fa-bolt",
                    label = "Enter",
                }
            },
            distance = 1.5
        })


end
    
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        targets()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(10000)
    targets()
    
end)

CreateThread(function()



    exports['qb-target']:AddBoxZone("enterlab2", vector3(387.1, 3584.2, 33.79), 1, 1, {
        name = "enterlab3",
        heading = 0,
             debugPoly = false,
            minZ =  32.79,
            maxZ =  34.79,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Coke:Client:Enter",
                    icon = "fa-solid fa-bolt",
                    label = "Enter",
                }
            },
            distance = 1.5
        })


end)
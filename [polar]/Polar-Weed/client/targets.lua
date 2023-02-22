local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports['qb-target']:AddTargetModel('bkr_prop_weed_bud_pruned_01a', {
        options = {
            {
                event = "Polar-Weed:Client:Check",
                icon = "fa-solid fa-cannabis", 
                label = "Check",
            },
        },
        distance = 2.5
    })
    exports['qb-target']:AddTargetModel('bkr_prop_weed_bud_02b', {
        options = {
            {
                event = "Polar-Weed:Client:Check",
                icon = "fa-solid fa-cannabis", 
                label = "Check",
            },
        },
        distance = 2.5
    })
    end)
    CreateThread(function()
        exports['qb-target']:AddTargetModel('bkr_prop_weed_bud_02a', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 2.5
        })
        exports['qb-target']:AddTargetModel('bkr_prop_weed_01_small_01b', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
    end)
    CreateThread(function()
        exports['qb-target']:AddTargetModel('bkr_prop_weed_med_01b', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddTargetModel('bkr_prop_weed_lrg_01b', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
    end)

    CreateThread(function()
        
    if Config.UseWeedFarm then
            
            -- WeedField
            exports['qb-target']:AddTargetModel('prop_weed_02', {
	            options = {
		            {
			            event = "Polar-Weed:Client:harvestLakeCrop",
			            icon = "fas fa-cannabis",
			            label = "Harvest Crop",
		            },
	            },
	        distance = 1.3
        }) 

        -- WeedFarm
            exports['qb-target']:AddTargetModel('prop_weed_01', {
                options = {
                    {
                        event = "Polar-Weed:Client:harvestFarmCrop",
                        icon = "fas fa-cannabis",
                        label = "Harvest Crop",
                    },
                },
            distance = 1.3
        }) 
 
    end
    end)

    CreateThread(function()
        exports['qb-target']:AddTargetModel('bkr_prop_weed_01_small_01c', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddTargetModel('bkr_prop_weed_01_small_01a', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
    end)

    CreateThread(function()
        exports['qb-target']:AddTargetModel('bkr_prop_weed_med_01a', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddTargetModel('bkr_prop_weed_lrg_01a', {
            options = {
                {
                    event = "Polar-Weed:Client:Check",
                    icon = "fa-solid fa-cannabis", 
                    label = "Check",
                },
            },
            distance = 1.5
        })
    end)





function targets()


    exports['qb-target']:AddBoxZone("enterlab2", vector3(2849.3, 4449.72, 48.52), 1, 1, {
        name = "enterlab3",
        heading = 0,
             debug = Config.Debug,
            minZ =  47.79,
            maxZ =  49.79,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:Enter",
                    icon = "fa-solid fa-cannabis",
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
    Wait(100)
    targets()
    
end)
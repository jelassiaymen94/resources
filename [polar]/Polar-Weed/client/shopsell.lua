-- Smoke on the water
if Config.UseShops then
exports['qb-target']:AddTargetModel('a_f_y_hippie_01', {
    options = {
        {
            event = "Polar-Weed:Client:smokeOnTheWaterMenu",
            icon = "fab fa-speakap", 
            label = "Speak with employee",
        },
    },
    distance = 2.0
}) 
end
if Config.OnlySellShops then
    RegisterNetEvent('Polar-Weed:Client:smokeOnTheWaterMenu', function()
        exports['qb-menu']:openMenu({
            {
                header = "Smoke on the Water",
                txt = "Marijuana Vendor",
                isMenuHeader = true
            },
            {
                header = "Sell",
                txt = "See current prices",
                params = {
                    event = "Polar-Weed:Client:sellOzMenu",
                }
            },
            {
                header = "exit",
                params = {
                    event = "qb-menu:closeMenu"
                }
            },
        })
    end)

elseif Config.UseSellAbleShops then
RegisterNetEvent('Polar-Weed:Client:smokeOnTheWaterMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Smoke on the Water",
            txt = "Marijuana Vendor",
            isMenuHeader = true
        },
        {
            header = "Sell to Shop",
            txt = "See current prices",
            params = {
                event = "Polar-Weed:Client:sellOzMenu",
            }
        },
        {
            header = "Browse Shop",
            txt = "See what we have to offer",
            params = {
                event = "inventory:client:OpenSmokeShop",
            }
        },
        {
            header = "exit",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)
else
    RegisterNetEvent('Polar-Weed:Client:smokeOnTheWaterMenu', function()
        exports['qb-menu']:openMenu({
            {
                header = "Smoke on the Water",
                txt = "Marijuana Vendor",
                isMenuHeader = true
            },
            {
                header = "Browse Shop",
                txt = "See what we have to offer",
                params = {
                    event = "inventory:client:OpenSmokeShop",
                }
            },
            {
                header = "exit",
                params = {
                    event = "qb-menu:closeMenu"
                }
            },
        })
    end)


end
RegisterNetEvent('Polar-Weed:Client:sellOzMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Smoke on the Water",
            txt = "We only accept ounces",
            isMenuHeader = true
        },
        {
            header = "$"..Config.lowGradeOzPrice.." per Low Grade Oz",
            txt = "",
            params = {
                event = "Polar-Weed:Server:sellOz",
                isServer = true,
                args = 1
            }
        },
        {
            header = "$"..Config.midGradeOzPrice.." per Mid Grade Oz",
            txt = "",
            params = {
                event = "Polar-Weed:Server:sellOz",
                isServer = true,
                args = 2

            }
        },
        {
            header = "$"..Config.highGradeOzPrice.." per High Grade Oz",
            txt = "",
            params = {
                event = "Polar-Weed:Server:sellOz",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Return",
            params = {
                event = "Polar-Weed:Client:smokeOnTheWaterMenu"
            }
        },
    })
end)
if Config.UseShops then
RegisterNetEvent('inventory:client:OpenSmokeShop')
AddEventHandler('inventory:client:OpenSmokeShop', function()
    local ShopItems = {}
    ShopItems.label = "Smoke on the Water"
    ShopItems.items = Config.SmokeontheWaterItems
    ShopItems.slots = #Config.SmokeontheWaterItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "SmokeShop_", ShopItems)
end)
end
Config = {}

Config.Night = {20, 4} -- Players can rob only from 20:00 to 04:00.


Config.Locations = {
    {
        name = "Wild Oats Drive",
        location = vector3(228.7230, 765.6281, 204.9766),
        outside = vector3(228.0065, 766.3203, 204.7808),
        
        
    },
   

}
Config.LootSpots = {
    {"polar_hr_1", vector3(-166.54, 497.74, 137.76)},
    {"polar_hr_2", vector3(-171.44, 482.59, 137.33)},
    {"polar_hr_3", vector3(-167.5186, 488.1292, 132.8436)},
    {"polar_hr_4", vector3(-167.6, 488.73, 134.01)},
}
Config.Items = {
    normalItems = {
        "cryptostick",
        "vodka",
        "iphone",
        "samsungphone"
    },
    rareItems = {
        "tablet",
        "laptop",
        "rolex",
        "goldchain",
        "diamond_ring",
        "10kgoldchain"
    },
    veryRareItems = {
        "drill",
        "moneybag"
    }
}



local QBCore = exports['qb-core']:GetCoreObject()
local called = false


function callPolice(house)
    if called then return end
    called = true
    exports["ps-dispatch"]:CustomAlert({
        coords = house.location, message = "House Burglery",
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
    })         
    QBCore.Functions.Notify(Lang:t('notify.alarm'), 'error')
end
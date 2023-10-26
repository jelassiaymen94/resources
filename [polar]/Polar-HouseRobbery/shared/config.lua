Config = {}

Config.Night = {20, 4} -- Players can rob only from 20:00 to 04:00.


Config.Locations = {
    {
        name = "Wild Oats Drive",
        location = vector3(228.7230, 765.6281, 204.9766),
        outside = vector3(228.0065, 766.3203, 204.7808),
        
        
    },
   

}

Config.MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,}
Config.FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,}

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
       
    },
    rareItems = {
        "tablet",
        "laptop",
        "rolex",
        "goldchain",
        "diamond_ring",
       
    },
    veryRareItems = {
        "drill",
       
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



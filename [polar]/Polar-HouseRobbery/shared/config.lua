Config = {}

Config.Night = {20, 4} -- Players can rob only from 20:00 to 04:00.


Config.Locations = {
    {
        name = "Wild Oats Drive",
        location = vector3(229.18, 765.06, 204.98),
        outside = vector4(228.63, 765.84, 204.98, 59.21),
        
        
    },
   

}

Config.MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,}
Config.FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,}

Config.BagUseID = 82
Config.HideBagID = 0

Config.LootSpots = {

    {"polar_hr_1", vector3(-171.09, 481.76, 134.95)},
    {"polar_hr_2", vector3(-168.13, 488.68, 133.84)},

    {"polar_hr_3", vector3(-166.68, 497.42, 138.59)},
    {"polar_hr_4", vector3(-167.51, 493.14, 138.33)},

    {"polar_hr_5", vector3(-171.91, 486.41, 138.23)},
    {"polar_hr_6", vector3(-171.20, 482.22, 138.19)},

    {"polar_hr_7", vector3(-163.26, 482.80, 134.56)},
    {"polar_hr_8", vector3(-166.74, 496.07, 134.73)},

    {"polar_hr_9", vector3(-172.94, 501.01, 131.22)},
    {"polar_hr_10", vector3(-175.33, 494.32, 130.56)},
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



Config = {}

Config.Debug = false 

Config.Fuel = 'LegacyFuel'

Config.Dealership = {
    cardealer = {
        vehicles = {
            --["Brand Name"] =    {"spawnname1", "spawnname2"},
            ["Imports"] = { "r32", "mgt","subwrx","evo9", "gt63", "gtr", "lc100", "488misha", "fnfrx7", "bt62r", "r8h", "audirs6tk", "m4", "trhawk", "rr14", "s15rb" },
            ["Cycles"] = {"bati","bati2","akuma" },
            ["Regular"] = { "adder", "turismo2","cheetah","cheetah2", "elegy", "elegy2" },
           
        },
        bossMenuThreshold = 3, -- what job grade can access
        moneyMenuThreshold = 4,  -- what job grade can access
        margin = 0.6, -- 35% increase
        platform = vector4(-1278.68, -3037.11, -48.49, 347.61),
        delivery = {
           -- [1] = vector4(1215.87, -2956.84, 5.87, 90.14), 
           -- [2] = vector4(1215.65, -2960.41, 5.87, 90.4),
           -- [3] = vector4(1215.76, -2964.48, 5.87, 91.48),
           -- [4] = vector4(1215.93, -2968.27, 5.87, 86.64),
           -- [5] = vector4(1215.91, -2971.74, 5.87, 90.08),
            [1] = vector4(-1279.59, -3038.23, -48.49, 276.1),
        },
        displays = {
            [1] = vector4(-1272.78, -3022.1, -48.49, 322.97), 
            [2] = vector4(-1267.02, -3023.55, -48.49, 3.89),
            [3] = vector4(125.22, -3022.78, 7.04, 269.71),
            [4] = vector4(-1259.8, -3020.77, -48.49, 43.69),
            [5] = vector4(-1256.57, -3013.93, -48.49, 80.72),
            [6] = vector4(-1259.94, -3005.45, -48.49, 140.41),
            [7] = vector4(-1268.62, -3002.43, -48.49, 187.9),
            [8] = vector4(-1274.45, -3005.86, -48.49, 224.97),
            [9] = vector4(-1277.14, -3013.68, -48.49, 272.02),
        },
        showroom = {
            vector2(-1474.24, -2810.61),
            vector2(-1606.06, -3024.24),
            vector2(-1192.42, -3271.21),
            vector2(-1028.79, -3056.06)
        },
        minZ = -50.07,
        maxZ = 10.07
    },
}

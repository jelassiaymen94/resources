Config = {}

Config.Debug = false -- Toggle server console prints

Config.Fuel = 'LegacyFuel'

Config.Dealership = {
    cardealer = {
        vehicles = {
            --["Brand Name"] =    {"spawnname1", "spawnname2"},
            ["Imports"] = { "r32", "mgt","subwrx","evo9", "gt63", "gtr", "lc100", "488misha", "fnfrx7", "bt62r", "r8h", "audirs6tk", "m4", "trhawk", "rr14", "s15rb" },
            ["Cycles"] = {"bati","bati2","akuma" },
            ["Regular"] = { "adder", "turismo2","cheetah","cheetah2", "elegy", "elegy2" },
           
        },
        bossmenu = vector3(148000000000.16, -141.82, 54.8),
        bossMenuThreshold = 4, -- what job grade can access
        moneyMenuThreshold = 4,  -- what job grade can access
        margin = 0.6, -- 35% 
        garage = vector4(0, 0, 0, 0),
        platform = vector4(1217.92, -2956.92, 5.87, 91.13), -- 122.0757, -143.4386, 54.8001, 212.3672
        displays = {
            [1] = vector4(-1272.78, -3022.1, -48.49, 322.97), -- 138.1914, -149.5041, 55.0501, 111.8849
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
   --[[ tuner = {
        vehicles = {
            --["Brand Name"] =    {"spawnname1", "spawnname2"},
        },
        bossmenu = vector3(-20.78344, -1055.242, 32.400444),
        bossMenuThreshold = 3,
        moneyMenuThreshold = 4,
        margin = 1.1, -- 10%
        garage = vector4(128.25, -3023.1, 7.04, 269.17),
        platform = vector4(136.09, -3031.26, 7.04, 1.06),
        displays = {
            [1] = vector4(145.2, -3045.95, 7.04, 42.05),
            [2] = vector4(141.22, -3046.24, 7.04, 42.05),
            [3] = vector4(137.81, -3045.98, 7.04, 42.05),
            [4] = vector4(133.53, -3046.09, 7.04, 42.05),
            [5] = vector4(123.8, -3047.51, 7.04, 267.89),
        },
        showroom = {
            vector2(154.39083862305, -3051.4331054688),
            vector2(120.80993652344, -3051.5971679688),
            vector2(120.60404205322, -3007.771484375),
            vector2(153.39619445801, -3007.0881347656)
        },
        minZ = 28.27,
        maxZ = 30.26
    },
    redline = {
        vehicles = {
            --["Brand Name"] =    {"spawnname1", "spawnname2"},
            ["Redline Imports"] =    {"lwgtr", "m3e46"},
        },
        bossmenu = vector3(-589.0047, -930.8109, 23.8866), -- -589.0047, -930.8109, 23.8866, 115.8622
        bossMenuThreshold = 4,
        moneyMenuThreshold = 4,
        margin = 2.0, -- 10%
        garage = vector4(0,0,0, 0),
        platform = vector4(-591.3436, -916.8173, 23.8866, 136.6419),
        displays = { 
            [1] = vector4(-570.8351, -936.6249, 23.8866, 314.3223), -- upstairs
            [2] = vector4(-575.9909, -936.4629, 23.8866, 313.9818), -- upstairs
            [3] = vector4(-593.7063, -933.2158, 17.5926, 351.7946), -- down
            [4] = vector4(-584.3689, -923.3737, 17.5926, 39.0835), -- down
            [5] = vector4(-602.6048, -922.9838, 17.5926, 308.4578), -- down
        },
        showroom = {
            vector2(-622.73, -850.00),
 vector2(-625.76, -948.48),
 vector2(-542.42, -951.52),
 vector2(-510.61, -883.33),
 vector2(-513.64, -856.06),
 vector2(-560.61, -846.97)
        },
        minZ = 15.27,
        maxZ = 25.26
    }]]
}

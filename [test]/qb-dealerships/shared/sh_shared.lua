Shared = {}

Shared.Debug = true -- Toggle server console prints

Shared.Dealerships = {
    cardealer = {
        vehicles = {
            --["Brand Name"] =    {"spawnname1", "spawnname2"},
            ["Imports"] = { "r32", "mgt","subwrx","evo9", "gt63", "gtr", "lc100", "488misha", "fnfrx7", "bt62r", "r8h", "audirs6tk", "m4", "trhawk", "rr14", "s15rb" },
            
        },
        bossmenu = vector3(148000000000.16, -141.82, 54.8),
        bossMenuThreshold = 4, -- -30.6791, -1106.8265, 27.2743, 58.5962
        moneyMenuThreshold = 4,
        margin = 0.6, -- 35% vector3(148.56, -141.84, 54.8)
        garage = vector4(0, 0, 0, 0),
        platform = vector4(144.81, -3030.27, 7.04, 177.8), -- 122.0757, -143.4386, 54.8001, 212.3672
        displays = {
            [1] = vector4(144.48, -3047.42, 6.04, 0), -- 138.1914, -149.5041, 55.0501, 111.8849
            [2] = vector4(138.66, -3047.47, 6.04, 0),
            [3] = vector4(125.22, -3022.78, 7.04, 269.71),
            --[[[2] = vector4(-54.58, -1097.09, 27.3-0.99, 31.02),
            [3] = vector4(-50.01, -1083.48, 27.3-0.99, 251.83),
            [4] = vector4(-37.05, -1093.44, 27.3-0.99, 18.96),
            [5] = vector4(-47.3, -1091.95, 27.3-0.99, 94.8),
            [6] = vector4(-42.1, -1115.7, 26.67-0.99, 36.33),
            [7] = vector4(-66.64, -1095.59, 26.42-0.99, 127.1),]]
        },
        showroom = {
            vector2(123.48, -2842.80),
            vector2(121.21, -2957.58),
            vector2(166.67, -2957.58),
            vector2(169.32, -2842.80)
        },
        minZ = 1.07,
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

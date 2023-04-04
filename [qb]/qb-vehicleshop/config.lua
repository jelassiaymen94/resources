Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.08 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.08 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(125.99, -142.99, 54.68)-- Where the finance menu is located
Config.PaymentWarning = 12000000000000000000000000000000 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 300000000000 -- time in hours between payment being due
Config.MinimumDown = 50 -- minimum percentage allowed down
Config.MaximumPayments = 12 -- maximum payments allowed
Config.PreventFinanceSelling = true -- allow/prevent players from using /transfervehicle if financed
Config.Shops = {
   --[[ ['pdm'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0, -- min height of the shop zone
            ['maxZ'] = 28.0, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles'
        },
        ['TestDriveTimeLimit'] = 5.0, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(0, 0, 0, 0), -- where the vehicle will spawn on display
                defaultVehicle = 'bati', -- Default display vehicle
                chosenVehicle = 'bati', -- Same as default but is dynamically changed when swapping vehicles
            }, ------- RIGHT IS HIGHER NUMBER
            [2] = {
                coords = vector4(-42.02, -1101.37, 27.3-0.99, 113.67),
                defaultVehicle = 'xls',
                chosenVehicle = 'xls'
            }, 
            [3] = {
                coords = vector4(0, 0, 0, 0),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2'
            },
            [4] = {
                coords = vector4(-54.93, -1096.89, 27.3-0.99, 240.0),
                defaultVehicle = 'Greenwood',
                chosenVehicle = 'Greenwood'
            },
            [5] = {
                coords = vector4(0, 0, 0, 0),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [6] = {
                coords = vector4(-47.7, -1091.83, 27.3-0.99, 200.01),
                defaultVehicle = 'Vigero2',
                chosenVehicle = 'Vigero2'
            },
            [7] = {
                coords = vector4(-37.03, -1092.88, 27.3-0.99, 157.2),
                defaultVehicle = 'buffalo4',
                chosenVehicle = 'buffalo4'
            },
            [8] = {
                coords = vector4(-49.84, -1083.56, 27.3-0.99, 120.58),
                defaultVehicle = 'deity',
                chosenVehicle = 'deity'
            }
        },
    },]]
    ['pdm'] = {
        ['Type'] = 'managed',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
            vector2(-89.39, -1127.27),
            vector2(-89.39, -1083.33),
            vector2(1.52, -1083.33),
            vector2(1.52, -1127.27)
            },
            ['minZ'] = 26.0,  -- min height of the shop zone
            ['maxZ'] = 28.0,  -- max height of the shop zone
            ['size'] = 2.75, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = false,  -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 3,  -- Blip color
        ['Categories'] = { -- Categories available to browse
            --['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            --['suvs'] = 'SUVs',--
            --['offroad'] = 'Offroad',
            --['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
          --['motorcycles'] = 'Motorcycles',
            --['vans'] = 'Vans',
            ['cycles'] = 'Bicycles',
            --['truck'] = 'Trucks',
            --['civ'] = 'More Cars',
            --['sports'] = 'Sports',
            --['super'] = 'Super'
        },
        ['TestDriveTimeLimit'] = 1, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector4(-37.83, -1079.25, 27.04, 249.3), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-51.64, -1109.29, 26.67, 63.04), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-47.5, -1076.1, 27.04, 70.66),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(4200000000000000000000000000000000000.14, -1101.5, 27.3-0.99, 19.46), -- where the vehicle will spawn on display
                defaultVehicle = 'xls', -- Default display vehicle
                chosenVehicle = 'xls', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(4200000000000000000000000000000000000.58, -1097.09, 27.3-0.99, 31.02),
                defaultVehicle = 'dominator8',
                chosenVehicle = 'dominator8',
            }, -- vector4(-42.1, -1115.7, 26.67, 36.33)
            [3] = {
                coords = vector4(4200000000000000000000000000000000000.01, -1083.48, 27.3-0.99, 251.83),
                defaultVehicle = 'deity',
                chosenVehicle = 'deity',
            },
            [4] = {
                coords = vector4(4200000000000000000000000000000000000.05, -1093.44, 27.3-0.99, 18.96),
                defaultVehicle = 'buffalo4',
                chosenVehicle = 'buffalo4',
            },
           
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(105.68, -109.09),
                vector2(96.21, -129.17),
                vector2(88.26, -153.41),
                vector2(148.11, -179.17),
                vector2(160.23, -149.62),
                vector2(168.18, -128.79),
                vector2(130.30, -114.77)
            },
            ['minZ'] = 36.646457672119,
            ['maxZ'] = 37.516143798828,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Luxury Autos',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['super'] = 'Super',
            ['sports'] = 'Sports',
             ['sportsclassics'] = 'Sports Classics',
             ['sedans'] = 'Sedans',
             ['coupes'] = 'Coupes',
             ['suvs'] = 'SUVs',
             ['offroad'] = 'Offroad',
             ['muscle'] = 'Muscle',
             ['compacts'] = 'Compacts',
             ['motorcycles'] = 'Motorcycles',
             ['vans'] = 'Vans',
             ['cycles'] = 'Bicycles',
            -- ['truck'] = 'Trucks',
        },
        ['TestDriveTimeLimit'] = 1.0,
        ['Location'] = vector3(107.43, -125.12, 54.1),
        ['ReturnLocation'] = vector3(107.43, -125.12, 54.1),
        ['VehicleSpawn'] = vector4(104.08, -134.17, 54.1, 156.72),
        ['TestDriveSpawn'] = vector4(104.08, -134.17, 54.1, 156.72), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(143.03, -164.59, 54.86-0.99, 201.7),
                defaultVehicle = 'italigtb',
                chosenVehicle = 'italigtb'
            },
            [2] = {
                coords = vector4(137.22, -162.22, 54.86-0.99, 201.51),
                defaultVehicle = 'emerus',
                chosenVehicle = 'emerus'
            },
            [3] = {
                coords = vector4(131.49, -160.09, 54.86-0.99, 204.39),
                defaultVehicle = 'nero',
                chosenVehicle = 'nero'
            },
            [4] = {
                coords = vector4(-1252.07, -364.2, 34.86-0.99, 56.44),
                defaultVehicle = 'tyrant',
                chosenVehicle = 'tyrant'
            },
            [5] = {
                coords = vector4(125.84, -157.97, 54.86-0.99, 205.17),
                defaultVehicle = 'adder',
                chosenVehicle = 'adder'
            },
            [6] = {
                coords = vector4(120.53, -156.25, 54.86-0.99, 204.72),
                defaultVehicle = 'tempesta',
                chosenVehicle = 'tempesta'
            },
        }
    }, -- Add your next table under this comma
    --[[['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0, -- min height of the shop zone
            ['maxZ'] = 5.0, -- max height of the shop zone
            ['size'] = 6.2 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Marina Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 410, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['boats'] = 'Boats'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark', -- Default display vehicle
                chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
   ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99, -- min height of the shop zone
            ['maxZ'] = 16.99, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Air Shop', -- Blip name
        ['showBlip'] = false, -- true or false
        ['blipSprite'] = 251, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['helicopters'] = 'Helicopters',
            ['planes'] = 'Planes'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus', -- Default display vehicle
                chosenVehicle = 'volatus' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },]]
}

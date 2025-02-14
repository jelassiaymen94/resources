--[[
    Author: JDev17#8160
    TRANSLATION:
        To create a new translation file, copy an existing one and rename it to e.g. es (spanish), then translate it and change the imported file in the fxmanifest under shared_scripts.
    GARAGE CONFIGURATION EXAMPLE:
    ['somegarage'] = {
        ['Zone'] = {
            ['Shape'] = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
            vector2(-1030.4713134766, -3016.3388671875),
            vector2(-970.09686279296, -2914.7397460938),
            vector2(-948.322265625, -2927.9030761718),
            vector2(-950.47174072266, -2941.6584472656),
            vector2(-949.04180908204, -2953.9467773438),
            vector2(-940.78369140625, -2957.2941894532),
            vector2(-943.88732910156, -2964.5512695312),
            vector2(-897.61529541016, -2990.0505371094),
            vector2(-930.01025390625, -3046.0695800782),
            vector2(-942.36407470704, -3044.7858886718),
            vector2(-952.97467041016, -3056.5122070312),
            vector2(-957.11712646484, -3057.0900878906)
            },
            ['minZ'] = 12.5,  -- min height of the parking zone, cannot be the same as maxZ, and must be smaller than maxZ
            ['maxZ'] = 20.0,  -- max height of the parking zone
            -- Important: Make sure the parking zone is high enough - higher than the tallest vehicle and touches the ground (turn on debug to see)
        },
        label = 'Hangar', -- label displayed on phone
        type = 'public', -- 'public', 'job', 'depot' or 'gang'
        showBlip = true, -- optional, when not defined, defaults to false
        blipName = 'Police', -- otional
        blipNumber = 90, -- optional, numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipColor = 69, -- optional, defaults to 3 (Blue), numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipcoords = vector3(-972.66, -3005.4, 13.32), -- blip coordinates
        job = 'police', -- optional, everyone can use it when not defined
        useVehicleSpawner = true, uses the configured job vehicles, make sure to have the job attribute set! (job = 'police')                            <---  NEW
        vehicleCategories = {'helicopter', 'plane'}, -- categories defined in VehicleCategories
        drawText = 'Hangar', -- the drawtext text, shown when entering the polyzone of that garage
        ParkingDistance = 10.0 -- Optional ParkingDistance, to override the global ParkingDistance
        SpawnDistance = 5.0 -- Optional SpawnDistance, to override the global SpawnDistance
        debug = false -- will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list.
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        }
    },
]]

 -- NEW --
StoreDamageAccuratly = false -- Do not use, if on latest qb-core, if set to true, make sure to apply / run patch1.sql
StoreParkinglotAccuratly = false  -- store the last parking lot in the DB, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet for qb-phone from the ReadMe to the phone so you can track the vehicle to the exact parking lot
SpawnAtLastParkinglot = false -- spawn the vehicle at hte last parked location if StoreParkinglotAccuratly = true, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet from the ReadMe to the phone so you can track the vehicle to the exact parking lot
GarageNameAsBlipName = true -- if set to true, the blips name will match the garage name
UseEnc0dedPersistenVehicles = false -- enable if you use this script, not really a requirement for your server and I don't recommend it if you don't know what you're doing as it requires a lot of changes in other places
-- NEW --

FuelScript = 'LegacyFuel' -- change to lj-fuel / LegacyFuel if you use lj-fuel / LegacyFuel or something else if you use any other LegcyFuel compatible script
UseLoafHousing = false
AllowSpawningFromAnywhere = true -- if set to true, the car can be spawned from anywhere inside the zone on the closest parking lot, if set to false you will have to walk up to a parking lot 
AutoRespawn = false --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
HouseParkingDrawText = 'Parking' -- text when driving on to the HOUSE parking lot
ParkingDistance = 2.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
DepotPrice = 500.0 -- The price to take out a despawned vehicle from impound.
DrawTextPosition = 'left' -- location of drawtext: left, top, right

-- set useVehicleSpawner = true for each garage that has type job and should use the vehicle spawner instead of personal vehicles
JobVehicles = {
	['police'] = { -- job
        label = "Police Vehicles",
        -- Grade 0
        vehicles = {
            [0] = {
               
            },
            -- Grade 1
            [1] = {
                

            },
            -- Grade 2
            [2] = {
                
            },
            -- Grade 3
            [3] = {
               
            },
            -- Grade 4
            [4] = {
               
            }
        }
    }
}

-- '/restorelostcars <destination_garage>' allows you to restore cars that have been parked in garages which no longer exist in the config (garage renamed or removed). The restored cars get sent to the destination garage or if left empty to a random garage in the list.
-- NOTE: This may also send helis and boats to said garaga so choose wisely
RestoreCommandPermissionLevel = 'admin' -- sets the permission level for the above mentioned command

-- Here you can define which category contains which vehicle class. These categories can then be used in the garage config
-- All vehicle classes can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
VehicleCategories = {
    ['car'] = {0,1,2,3,4,5,6,7,9,10,11,12},
    ['motorcycle'] = {8},
    ['boat'] = {14},
    ['helicopter'] = {15},
    ['plane'] = {16},
    ['service'] = {17},
    ['emergency'] = {18},
    ['other'] = {13} -- cycles: 13 - you can move cycles to cars if you want and have anything else like military vehicles in this category
    -- you can also create new / delete or update categories, and use them below in the config.
}

HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


VehicleHeading = 'driverside' -- only used when NO parking spots are defined in the garage config
--[[^^^^^^^^
    'forward' = will face the sameway as the ped
    'driverside' = will put the driver door closets to the ped
    'hood' = will face the hood towards ped
    'passengerside' = will put the passenger door closets to the ped
]]

SharedJobGarages = { -- define the job garages which are shared
    --'pdgarage',
}

Garages = {
    --[[
        types:
        - public
        - job
        - depot
        vehicleCategories:
        - car
        - motorcycle
        - boat
        - helicopter
        - plane
        - other
    ]]
    ['impoundlot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-128.76565551758, -1186.7231445312),
            vector2(-128.95680236816, -1158.9990234375),
            vector2(-155.75888061524, -1158.6616210938),
            vector2(-155.84657287598, -1186.7335205078)
            },
            ['minZ'] = 22.25,  -- min height of the parking zone
            ['maxZ'] = 26.31,  -- max height of the parking zone
            debug = false,
        },
        label = "Impound Lot",
        showBlip = true,
        blipcoords = vector3(-143.15, -1175.06, 23.77),
        blipName = "Impound Lot",
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Impound',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-152.91, -1170.13, 23.14, 270.11),
            vector4(-153.26, -1166.51, 23.14, 270.74),
            vector4(-147.67, -1161.83, 23.14, 179.67),
            vector4(-144.19, -1161.83, 23.14, 179.02),
            vector4(-139.1, -1161.6, 23.14, 178.95),
            vector4(-131.92, -1166.54, 23.14, 89.09),
            vector4(-132.01, -1170.05, 23.14, 90.24),
            vector4(-132.03, -1175.15, 23.14, 90.94),
            vector4(-131.99, -1178.68, 23.14, 90.07),
            vector4(-131.95, -1182.25, 23.14, 90.11),
        }
    },
    --[[
    ['helilot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-744.6532, -1480.8138),
            vector2(-712.5233, -1442.7585),
            vector2(-725.8422, -1431.7751),
            vector2(-757.6620, -1469.6812)
            },
            ['minZ'] = 4.25,  -- min height of the parking zone
            ['maxZ'] = 6.31,  -- max height of the parking zone
            debug = false,
        },
        label = "Heli Impound Lot",
        showBlip = true,
        blipcoords = vector3(-735.4299, -1456.1945, 5.0005),
        blipName = "Heli Impound",
        blipNumber = 602,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'air', 'helicopter',},
        drawText = 'Heli Impound',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-726.0460, -1442.8839, 5.0005, 5.2751),
            vector4(-724.7318, -1444.1283, 5.0005, 256.8534),
            vector4(-723.7924, -1444.9420, 5.0005, 305.1173),
            vector4(-744.3351, -1469.5605, 5.0005, 76.5672),
            vector4(-745.4728, -1468.7004, 5.0005, 142.1768),
            vector4(-746.3964, -1467.7324, 5.0005, 134.9358),
        }
    },
    ['pillboxgarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(75.48, -576.16),
                vector2(63.96, -572.52),
                vector2(55.68, -570.44),
                vector2(48.57, -568.98),
                vector2(38.42, -567.4),
                vector2(31.73, -566.63),
                vector2(20.83, -566.22),
                vector2(19.61, -569.19),
                vector2(15.02, -567.57),
                vector2(3.76, -598.58),
                vector2(23.77, -605.67),
                vector2(7.99, -648.6),
                vector2(21.81, -653.62),
                vector2(20.7, -657.82),
                vector2(32.76, -662.45),
                vector2(34.63, -661.22),
                vector2(48.2, -666.25),
                vector2(78.06, -584.13),
                vector2(73.72, -582.12),
            },
            ['minZ'] = 30.6,  -- min height of the parking zone
            ['maxZ'] = 32.6,  -- max height of the parking zone
        },
        label = 'Lower Power St Parking',
        showBlip = true,
        blipcoords = vector3(37.08, -616.99, 34.19),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(48.46, -600.58, 31.05, 339.83),
            vector4(45.27, -598.81, 31.05, 337.94),
            vector4(41.67, -597.67, 31.05, 340.45),
            vector4(38.56, -596.16, 31.05, 338.12),
            vector4(34.99, -595.47, 31.05, 340.89),
            vector4(31.2, -593.92, 31.05, 339.65),
            vector4(27.64, -592.9, 31.05, 341.86),
            vector4(7.72, -596.58, 31.05, 251.56),
            vector4(9.52, -592.97, 31.05, 249.91),
            vector4(10.79, -589.67, 31.05, 248.15),
            vector4(11.64, -586.28, 31.05, 250.38),
            vector4(13.02, -582.73, 31.05, 250.56),
            vector4(14.43, -579.28, 31.05, 250.48),
            vector4(15.79, -575.91, 31.05, 250.57),
            vector4(16.99, -572.2, 31.05, 250.35),
            vector4(32.27, -579.78, 31.05, 338.59),
            vector4(36.28, -581.01, 31.05, 342.11),
            vector4(39.79, -581.82, 31.05, 339.93),
            vector4(42.7, -583.86, 31.05, 338.52),
            vector4(46.25, -584.88, 31.05, 343.14),
            vector4(49.66, -586.2, 31.05, 341.91),
            vector4(53.64, -586.94, 31.05, 341.75),
            vector4(57.03, -588.71, 31.05, 340.63),
            vector4(64.95, -576.19, 31.05, 163.06),
            vector4(68.08, -577.66, 31.05, 154.95),
            vector4(72.16, -578.61, 31.05, 155.89),
            vector4(73.41, -586.19, 31.05, 69.64),
            vector4(72.48, -589.82, 31.05, 67.8),
            vector4(70.89, -592.9, 31.05, 68.41),
            vector4(69.46, -596.76, 31.05, 68.6),
            vector4(67.89, -600.17, 31.05, 69.91),
            vector4(67.24, -603.68, 31.05, 67.92),
            vector4(65.89, -607.19, 31.05, 68.69),
            vector4(64.22, -611.22, 31.1, 68.4),
            vector4(54.68, -638.55, 31.09, 246.21),
            vector4(53.23, -641.75, 31.06, 69.7),
            vector4(52.06, -645.06, 31.05, 70.13),
            vector4(50.58, -648.56, 31.05, 67.35),
            vector4(49.61, -652.33, 31.05, 69.85),
            vector4(48.33, -655.49, 31.05, 68.67),
            vector4(47.37, -659.23, 31.05, 69.73),
            vector4(45.67, -662.47, 31.05, 66.96),
        }
    },
    ['pillboxlowergarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(352.34439086914, -620.59851074219),
                vector2(344.32354736328, -636.03747558594),
                vector2(325.94189453125, -628.93359375),
                vector2(331.88412475586, -613.10968017578)
            },
            ['minZ'] = 28.2,  -- min height of the parking zone
            ['maxZ'] = 31.30,  -- max height of the parking zone
        },
        label = 'Pillbox Parking',
        showBlip = true,
        blipcoords = vector3(341.7, -623.33, 29.29),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(342.07, -632.51, 28.87, 340.17),
            vector4(338.89, -631.43, 28.87, 341.89),
            vector4(335.77, -630.04, 28.87, 340.85),
            vector4(332.61, -628.68, 28.87, 342.74),
            vector4(329.16, -627.36, 28.87, 341.84),
            vector4(346.44, -620.82, 28.87, 157.15),
            vector4(343.13, -619.38, 28.87, 157.56),
            vector4(339.76, -619.01, 28.87, 157.43),
            vector4(336.5, -617.88, 28.87, 162.09),
            vector4(333.34, -616.15, 28.87, 160.22),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },]]
    ['mirrorpark'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(1043.447265625, -767.26947021484),
                vector2(1049.4702148438, -769.44775390625),
                vector2(1049.4797363281, -794.31622314453),
                vector2(1048.9655761719, -794.32214355469),
                vector2(1049.03125, -793.87451171875),
                vector2(1043.466796875, -793.80151367188),
                vector2(1043.3436279297, -794.52691650391),
                vector2(1031.5026855469, -794.34808349609),
                vector2(1007.7255859375, -764.88061523438),
                vector2(1022.2494506836, -752.11022949219),
                vector2(1025.6563720703, -755.25653076172),
                vector2(1030.9210205078, -758.50311279297),
                vector2(1031.2462158203, -758.19201660156),
                vector2(1035.1042480469, -760.79956054688),
                vector2(1030.6268310547, -767.16302490234),
                vector2(1025.9473876953, -763.81085205078),
                vector2(1024.8063964844, -765.39245605469),
                vector2(1033.9915771484, -772.05816650391),
                vector2(1036.6497802734, -781.24871826172),
                vector2(1038.708984375, -780.87786865234),
                vector2(1035.7690429688, -770.72528076172),
                vector2(1032.0593261719, -768.04278564453),
                vector2(1034.0390625, -764.51586914062),
                vector2(1036.8060302734, -766.30773925781),
                vector2(1038.0424804688, -763.41851806641),
                vector2(1043.5157470703, -766.21325683594)
            },
            ['minZ'] = 56.50,
            ['maxZ'] = 59.20
        },
        label = 'Mirror Park Parking',
        showBlip = true,
        blipcoords = vector3(1037.65, -771.62, 58.01),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(1023.5, -756.15, 57.48, 225.44),
            vector4(1020.64, -758.19, 57.49, 225.22),
            vector4(1017.57, -760.75, 57.47, 222.83),
            vector4(1014.9, -763.11, 57.4, 223.82),
            vector4(1016.1, -770.57, 57.41, 311.2),
            vector4(1018.8, -773.42, 57.43, 308.15),
            vector4(1020.68, -776.34, 57.39, 311.86),
            vector4(1023.75, -779.38, 57.41, 309.66),
            vector4(1025.72, -782.07, 57.4, 308.8),
            vector4(1028.49, -784.92, 57.41, 307.36),
            vector4(1030.06, -787.96, 57.38, 310.65),
            vector4(1038.12, -791.16, 57.47, 1.48),
            vector4(1046.49, -785.56, 57.5, 89.6),
            vector4(1046.38, -782.01, 57.51, 92.17),
            vector4(1046.22, -778.03, 57.52, 89.04),
            vector4(1046.27, -774.45, 57.52, 90.5),
            vector4(1030.96, -773.4, 57.57, 144.89),
            vector4(1028.05, -771.42, 57.55, 146.44),
            vector4(1029.35, -763.6, 57.49, 56.05),
            vector4(1041.6, -791.45, 57.5, 0.97),
        }
    },
    --[[
    ['casinop'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(915.48345947266, -14.229139328003),
                vector2(912.52160644531, -19.256662368774),
                vector2(914.41729736328, -20.468030929565),
                vector2(928.14013671875, -29.422761917114),
                vector2(931.68640136719, -24.097787857056),
                vector2(943.31915283203, -31.373510360718),
                vector2(940.18115234375, -36.682193756104),
                vector2(940.63336181641, -37.222324371338),
                vector2(941.06457519531, -38.056762695312),
                vector2(940.69250488281, -39.514526367188),
                vector2(945.86834716797, -42.898574829102),
                vector2(936.578125, -58.041912078857),
                vector2(935.71746826172, -59.93187713623),
                vector2(935.32781982422, -63.596141815186),
                vector2(935.49609375, -65.299346923828),
                vector2(936.2734375, -67.329566955566),
                vector2(938.08367919922, -69.736022949219),
                vector2(939.06182861328, -70.789291381836),
                vector2(942.05615234375, -73.50260925293),
                vector2(944.24096679688, -76.701873779297),
                vector2(945.71282958984, -80.333465576172),
                vector2(945.46759033203, -86.331184387207),
                vector2(944.24163818359, -90.072593688965),
                vector2(942.83435058594, -92.46647644043),
                vector2(928.69256591797, -105.37116241455),
                vector2(926.07592773438, -107.04386138916),
                vector2(922.68194580078, -107.79019927979),
                vector2(918.29956054688, -107.78350067139),
                vector2(914.76385498047, -106.68801879883),
                vector2(891.66986083984, -92.136535644531),
                vector2(894.90283203125, -86.966018676758),
                vector2(877.28314208984, -75.933624267578),
                vector2(873.83764648438, -81.048561096191),
                vector2(849.61877441406, -65.853485107422),
                vector2(842.07305908203, -59.212493896484),
                vector2(832.29779052734, -48.991901397705),
                vector2(836.66088867188, -44.546573638916),
                vector2(834.18530273438, -42.00004196167),
                vector2(832.93865966797, -39.975162506104),
                vector2(832.380859375, -35.275825500488),
                vector2(833.16229248047, -31.17188835144),
                vector2(839.43792724609, -22.388980865479),
                vector2(849.22601318359, -10.30827331543),
                vector2(871.66424560547, 12.689045906067),
                vector2(872.94342041016, 12.611633300781),
                vector2(881.33111572266, 7.0416121482849),
                vector2(880.61773681641, 5.6222538948059),
                vector2(880.45855712891, 1.066015958786),
                vector2(889.86468505859, -5.0284695625305),
                vector2(894.46960449219, -2.9582657814026),
                vector2(895.51623535156, -1.5529407262802)
            },
            ['minZ'] = 77.50,
            ['maxZ'] = 80.00
        },
        label = 'Casino Parking',
        showBlip = true,
        blipcoords = vector3(888.47, -37.44, 78.76),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(868.22, -74.12, 78.34, 327.6),
            vector4(865.89, -71.32, 78.34, 327.2),
            vector4(862.79, -70.26, 78.34, 327.35),
            vector4(859.57, -67.92, 78.34, 326.45),
            vector4(856.54, -66.59, 78.34, 326.94),
            vector4(853.6, -64.76, 78.34, 329.96),
            vector4(850.98, -62.23, 78.34, 315.33);
            vector4(848.28, -60.42, 78.34, 316.25),
            vector4(845.29, -58.06, 78.34, 316.99),
            vector4(843.2, -55.19, 78.34, 315.68),
            vector4(841.22, -52.13, 78.34, 315.19),
            vector4(838.31, -49.98, 78.34, 309.63),
            vector4(836.03, -47.87, 78.34, 310.48),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(934.99, -72.5, 78.27, 132.69),
            vector4(937.69, -74.87, 78.27, 135.96),
            vector4(940.12, -77.9, 78.27, 124.93),
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(894.66, -90.02, 78.34, 329.43),
            vector4(897.75, -92.07, 78.34, 328.5),
            vector4(900.96, -93.67, 78.34, 326.42),
            vector4(903.67, -95.7, 78.34, 328.69),
            vector4(906.77, -97.42, 78.34, 326.69),
            vector4(909.56, -98.98, 78.27, 329.54),
            vector4(912.88, -100.65, 78.27, 327.47),
            vector4(915.52, -102.44, 78.27, 328.46),
            vector4(919.92, -104.15, 78.27, 355.56),
            vector4(924.34, -102.86, 78.27, 23.29),
            vector4(928.29, -100.03, 78.27, 41.76),
            vector4(931.14, -98.26, 78.27, 42.82),
            vector4(933.29, -95.84, 78.27, 43.98),
            vector4(935.95, -93.66, 78.27, 43.12),
            vector4(938.28, -91.0, 78.27, 43.96),
            vector4(941.5, -86.74, 78.27, 71.64),
            vector4(942.22, -82.22, 78.27, 96.61),
            vector4(932.29, -67.33, 78.27, 108.81),
            vector4(931.48, -62.49, 78.27, 87.5),
            vector4(933.04, -58.41, 78.27, 74.44),
            vector4(934.81, -53.94, 78.27, 56.79),
            vector4(936.58, -51.51, 78.27, 59.07),
            vector4(938.49, -48.34, 78.27, 57.96),
            vector4(939.46, -45.37, 78.27, 57.51),
            vector4(941.87, -42.09, 78.27, 57.26),
            vector4(939.92, -33.37, 78.27, 147.28),
            vector4(937.11, -31.58, 78.27, 146.31),
            vector4(934.46, -29.74, 78.27, 147.43),
            vector4(931.24, -28.27, 78.27, 148.17),
            vector4(911.98, -15.91, 78.27, 148.59),
            vector4(908.33, -14.25, 78.27, 151.66),
            vector4(905.28, -11.85, 78.27, 146.75),
            vector4(901.6, -10.25, 78.27, 151.03),
            vector4(898.56, -7.47, 78.27, 150.42),
            vector4(894.74, -5.36, 78.27, 147.31),
            vector4(878.41, 5.09, 78.27, 148.03),
            vector4(874.81, 6.34, 78.27, 145.35),
            vector4(872.04, 8.2, 78.27, 147.69),
            vector4(857.52, -16.84, 78.27, 61.37),
            vector4(855.4, -18.91, 78.27, 56.95),
            vector4(853.22, -21.71, 78.27, 58.03),
            vector4(851.4, -24.62, 78.27, 56.48),
            vector4(849.71, -27.73, 78.27, 56.12),
            vector4(848.46, -30.95, 78.27, 58.58),
            vector4(846.43, -33.78, 78.27, 58.11),
            vector4(844.31, -36.58, 78.27, 58.6),
            vector4(851.99, -41.32, 78.27, 237.04),
            vector4(854.14, -38.45, 78.27, 237.84),
            vector4(855.52, -35.12, 78.27, 239.77),
            vector4(857.58, -32.6, 78.27, 237.61),
            vector4(859.49, -29.77, 78.27, 238.44),
            vector4(860.76, -26.41, 78.27, 239.23),
            vector4(862.82, -23.64, 78.27, 238.93),
            vector4(864.37, -20.41, 78.27, 237.61),
            vector4(867.05, -18.08, 78.27, 237.15),
            vector4(868.52, -15.1, 78.27, 236.79),
            vector4(870.25, -12.23, 78.27, 236.92),
            vector4(871.96, -9.18, 78.27, 236.79),
            vector4(860.59, -50.52, 78.27, 56.19),
            vector4(862.21, -47.59, 78.27, 57.87),
            vector4(864.07, -44.72, 78.27, 57.35),
            vector4(866.09, -41.98, 78.27, 59.81),
            vector4(868.02, -39.09, 78.27, 58.16),
            vector4(869.38, -35.99, 78.27, 59.41),
            vector4(871.76, -33.27, 78.27, 57.79),
            vector4(873.26, -30.41, 78.27, 58.11),
            vector4(875.5, -27.57, 78.27, 59.75),
            vector4(876.7, -24.3, 78.27, 55.59),
            vector4(878.68, -21.55, 78.27, 55.73),
            vector4(880.83, -18.82, 78.27, 58.7),
            vector4(882.29, -15.94, 78.27, 59.44),
            vector4(868.59, -55.55, 78.27, 239.79),
            vector4(870.31, -52.52, 78.27, 237.16),
            vector4(872.25, -49.62, 78.27, 238.25),
            vector4(873.82, -46.81, 78.27, 237.55),
            vector4(875.38, -43.64, 78.27, 240.61),
            vector4(877.57, -40.99, 78.27, 238.89),
            vector4(879.2, -37.86, 78.27, 239.24),
            vector4(881.32, -35.29, 78.27, 239.98),
            vector4(882.71, -32.06, 78.27, 239.47),
            vector4(884.88, -29.13, 78.27, 238.24),
            vector4(886.69, -26.11, 78.27, 238.21),
            vector4(888.29, -23.61, 78.27, 236.97),
            vector4(890.23, -20.25, 78.27, 237.91),
            vector4(879.01, -62.07, 78.27, 57.16),
            vector4(880.87, -59.46, 78.27, 56.4),
            vector4(882.31, -55.9, 78.27, 56.01),
            vector4(884.39, -53.05, 78.27, 55.15),
            vector4(886.74, -50.98, 78.27, 57.74),
            vector4(887.88, -47.3, 78.27, 56.18),
            vector4(889.9, -44.62, 78.27, 57.31),
            vector4(891.22, -41.1, 78.27, 56.82),
            vector4(893.37, -38.44, 78.27, 57.27),
            vector4(894.9, -35.5, 78.27, 57.88),
            vector4(896.66, -32.62, 78.27, 56.27),
            vector4(898.89, -29.89, 78.27, 59.62),
            vector4(900.59, -27.03, 78.27, 57.96),
            vector4(918.92, -38.5, 78.27, 57.96),
            vector4(917.27, -41.62, 78.27, 57.19),
            vector4(915.72, -44.57, 78.27, 58.35),
            vector4(913.25, -46.72, 78.27, 59.34),
            vector4(911.8, -50.19, 78.27, 58.27),
            vector4(909.86, -52.95, 78.27, 56.01),
            vector4(907.82, -56.09, 78.27, 58.75),
            vector4(906.64, -59.22, 78.27, 59.0),
            vector4(904.82, -62.24, 78.27, 58.09),
            vector4(902.76, -64.94, 78.27, 57.42),
            vector4(900.32, -67.77, 78.27, 60.95),
            vector4(898.92, -70.71, 78.27, 59.52),
            vector4(897.37, -73.94, 78.27, 60.01),
            vector4(905.41, -78.55, 78.27, 237.47),
            vector4(906.51, -75.4, 78.27, 239.08),
            vector4(908.51, -72.21, 78.27, 240.06),
            vector4(910.57, -69.75, 78.27, 239.33),
            vector4(912.5, -66.76, 78.27, 236.77),
            vector4(914.61, -63.85, 78.27, 236.27),
            vector4(916.47, -61.02, 78.27, 239.26),
            vector4(918.2, -57.97, 78.27, 239.18),
            vector4(919.83, -55.26, 78.27, 239.26),
            vector4(921.38, -52.13, 78.27, 239.95),
            vector4(923.46, -49.15, 78.27, 240.09),
            vector4(925.59, -46.6, 78.27, 238.16),
            vector4(925.88, -42.81, 78.27, 239.65),
            vector4(915.9, -84.07, 78.27, 56.96),
            vector4(917.48, -81.16, 78.27, 58.09),
            vector4(920.09, -78.3, 78.27, 55.86),
            vector4(927.69, -83.29, 78.27, 238.3),
            vector4(926.1, -86.14, 78.27, 236.23),
            vector4(924.0, -89.35, 78.27, 237.62),
        }
    },
    ['leigonsquarealley'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(69.414520263672, -849.34320068359),
                vector2(59.563220977783, -876.13598632812),
                vector2(53.812015533447, -873.94421386719),
                vector2(52.552845001221, -876.92974853516),
                vector2(58.53719329834, -879.25579833984),
                vector2(49.19457244873, -904.89520263672),
                vector2(12.526390075684, -891.47192382812),
                vector2(32.711112976074, -835.94616699219),
                vector2(43.370277404785, -840.03533935547),
                vector2(41.773113250732, -844.49047851562),
                vector2(44.550273895264, -845.6552734375),
                vector2(46.358081817627, -841.06768798828)
            },
            ['minZ'] = 29.0,
            ['maxZ'] = 31.10
        },
        label = 'Legion Square Parking',
        showBlip = true,
        blipcoords = vector3(52.41, -874.53, 30.42),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(19.23, -880.71, 29.8, 341.54),
            vector4(22.45, -882.16, 29.79, 340.09),
            vector4(25.93, -883.46, 29.79, 343.72),
            vector4(37.8, -887.64, 29.77, 160.81),
            vector4(40.91, -889.25, 29.75, 160.21),
            vector4(44.33, -890.22, 29.75, 159.58),
            vector4(48.14, -890.77, 29.75, 161.49),
            vector4(51.0, -892.1, 29.74, 158.87),
            vector4(52.71, -887.68, 29.81, 158.88),
            vector4(49.66, -885.99, 29.83, 161.45),
            vector4(45.81, -885.22, 29.83, 161.8),
            vector4(42.78, -884.27, 29.83, 161.42),
            vector4(39.63, -883.03, 29.84, 159.02),
            vector4(27.5, -878.27, 29.87, 160.31),
            vector4(24.28, -877.02, 29.88, 158.81),
            vector4(20.96, -876.17, 29.88, 157.99),
            vector4(25.15, -864.12, 30.08, 161.27),
            vector4(28.23, -865.24, 30.07, 158.11),
            vector4(32.0, -866.64, 30.06, 158.96),
            vector4(44.22, -870.05, 30.05, 159.97),
            vector4(47.29, -872.04, 30.03, 160.4),
            vector4(50.56, -873.75, 30.01, 158.52),
            vector4(60.1, -866.79, 30.13, 159.36),
            vector4(56.83, -865.6, 30.14, 161.35),
            vector4(53.77, -864.08, 30.16, 158.58),
            vector4(50.79, -863.1, 30.16, 159.63),
            vector4(47.46, -861.17, 30.18, 160.06),
            vector4(35.2, -857.05, 30.21, 160.46),
            vector4(31.39, -855.98, 30.22, 163.34),
            vector4(28.65, -854.67, 30.24, 156.84),
            vector4(34.44, -839.08, 30.49, 161.56),
            vector4(37.43, -840.18, 30.48, 159.6),
            vector4(41.04, -841.14, 30.47, 157.63),
            vector4(53.89, -846.47, 30.42, 159.93),
            vector4(56.93, -847.64, 30.41, 162.76),
            vector4(60.37, -848.47, 30.41, 161.79),
            vector4(63.44, -850.18, 30.39, 157.81),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(233.41, -774.07, 30.31, 248.68)
        }
    },
    ['motelgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(266.04238891602, -348.67025756836),
                vector2(285.89639282227, -356.23840332031),
                vector2(287.69180297852, -351.80249023438),
                vector2(294.92953491211, -354.30316162109),
                vector2(304.30255126953, -329.3703918457),
                vector2(268.12475585938, -316.15463256836),
                vector2(261.09896850586, -334.95642089844),
                vector2(268.07708740234, -337.50454711914),
                vector2(266.080078125, -343.24353027344),
                vector2(267.49453735352, -344.12811279297)
            },
            ['minZ'] = 43.5,  -- min height of the parking zone
            ['maxZ'] = 47.15,  -- max height of the parking zone
        },
        label = "Pink Cage Parking",
        showBlip = true,
        blipcoords = vector3(273.43, -343.99, 44.91),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},                --car, air, sea
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(277.62, -340.01, 44.5, 70.08),
            vector4(284.0, -342.32, 44.5, 70.09),
            vector4(278.33, -336.51, 44.49, 70.34),
            vector4(284.94, -338.87, 44.5, 70.28),
            vector4(285.3, -335.65, 44.5, 70.49),
            vector4(286.94, -332.56, 44.5, 67.79),
            vector4(288.56, -329.41, 44.5, 69.87),
            vector4(289.54, -325.98, 44.5, 70.81),
            vector4(300.23, -330.3, 44.5, 69.25),
            vector4(298.52, -333.09, 44.5, 69.25),
            vector4(298.66, -337.07, 44.5, 67.98),
            vector4(297.0, -340.11, 44.49, 69.9),
            vector4(296.05, -342.85, 44.49, 68.75),
            vector4(294.61, -346.22, 44.5, 67.07),
            vector4(292.54, -349.49, 44.52, 68.4),
            vector4(268.42, -325.58, 44.5, 249.47),
            vector4(267.58, -329.12, 44.49, 247.62),
            vector4(266.03, -332.22, 44.5, 247.32),
            vector4(271.12, -319.16, 44.5, 67.31),
            vector4(283.0, -323.71, 44.5, 73.83),
            vector4(281.99, -326.86, 44.5, 69.26),
            vector4(281.1, -330.43, 44.49, 71.55),
            vector4(279.59, -333.68, 44.5, 71.98),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    ['sapcounsel'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-362.48254394531, -793.2802734375),
                vector2(-362.46408081055, -730.71594238281),
                vector2(-360.078125, -727.29187011719),
                vector2(-359.91299438477, -726.02014160156),
                vector2(-355.41589355469, -725.94165039062),
                vector2(-347.00802612305, -729.64282226562),
                vector2(-312.21273803711, -742.18682861328),
                vector2(-310.43478393555, -737.13165283203),
                vector2(-266.06091308594, -753.01647949219),
                vector2(-275.53680419922, -777.63562011719),
                vector2(-284.21676635742, -774.40985107422),
                vector2(-285.57073974609, -778.85809326172),
                vector2(-287.20227050781, -778.1279296875),
                vector2(-289.10836791992, -783.76214599609),
                vector2(-319.63018798828, -772.48706054688),
                vector2(-335.69149780273, -786.58020019531),
                vector2(-345.55349731445, -791.60711669922)
            },
            ['minZ'] = 33.00,  -- min height of the parking zone
            ['maxZ'] = 37.60,  -- max height of the parking zone
        },
        label = "San Andreas Parking",
        showBlip = true,
        blipcoords = vector3(-330.01, -780.33, 33.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,                 --car, air, sea
        ['ParkingSpots'] = {
            vector4(-356.89, -749.29, 33.54, 270.15),
            vector4(-356.83, -753.66, 33.54, 269.64),
            vector4(-357.22, -756.74, 33.54, 269.93),
            vector4(-357.17, -760.01, 33.54, 269.71),
            vector4(-357.4, -764.54, 33.54, 268.82),
            vector4(-357.14, -767.51, 33.54, 269.67),
            vector4(-357.09, -770.59, 33.54, 271.03),
            vector4(-357.09, -776.02, 33.54, 267.95),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-357.37, -746.23, 33.54, 269.64),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-289.82, -764.25, 33.54, 160.83),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-295.59, -762.4, 33.54, 160.93),
            vector4(-298.43, -761.45, 33.54, 159.95),
            vector4(-302.41, -760.02, 33.54, 161.24),
            vector4(-305.16, -758.37, 33.54, 158.98),
            vector4(-308.23, -757.98, 33.54, 160.64),
            vector4(-311.14, -757.03, 33.54, 158.78),
            vector4(-315.09, -755.34, 33.54, 157.34),
            vector4(-317.51, -753.39, 33.54, 160.53),
            vector4(-320.45, -752.5, 33.55, 161.44),
            vector4(-323.24, -751.76, 33.54, 158.57),
            vector4(-329.02, -750.3, 33.54, 179.15),
            vector4(-331.75, -750.26, 33.54, 179.53),
            vector4(-334.52, -750.73, 33.54, 181.13),
            vector4(-337.46, -751.25, 33.54, 183.02),
            vector4(-342.14, -749.82, 33.55, 272.39),
            vector4(-341.94, -753.53, 33.55, 94.28),
            vector4(-341.97, -756.82, 33.55, 90.65),
            vector4(-342.23, -760.49, 33.55, 88.42),
            vector4(-341.84, -764.1, 33.55, 89.13),
            vector4(-341.93, -767.36, 33.55, 91.18),
            vector4(-357.3, -732.9, 33.54, 270.41),
            vector4(-357.24, -737.63, 33.55, 269.9),
            vector4(-357.33, -743.24, 33.54, 270.89),
            vector4(-295.82, -778.26, 33.54, 342.22),
            vector4(-299.37, -776.74, 33.54, 342.64),
            vector4(-307.47, -773.5, 33.54, 340.32),
            vector4(-303.19, -775.79, 33.54, 339.27),
            vector4(-310.37, -772.78, 33.54, 339.1),
            vector4(-313.07, -771.64, 33.54, 338.38),
            vector4(-315.73, -770.26, 33.54, 339.87),
            vector4(-273.07, -761.54, 33.54, 69.58),
            vector4(-273.81, -765.05, 33.54, 71.99),
            vector4(-276.05, -771.7, 33.54, 68.27),
            vector4(-277.3, -775.37, 33.54, 70.28),
            vector4(-277.07, -751.83, 33.54, 160.8),
            vector4(-279.97, -750.75, 33.54, 160.08),
            vector4(-284.28, -748.9, 33.54, 159.2),
            vector4(-287.28, -748.29, 33.54, 160.63),
            vector4(-290.22, -747.64, 33.54, 159.94),
            vector4(-292.89, -746.25, 33.54, 160.17),
            vector4(-297.03, -744.69, 33.54, 159.37),
            vector4(-299.71, -743.7, 33.54, 159.26),
            vector4(-302.62, -742.8, 33.54, 159.48),
            vector4(-275.18, -768.22, 33.54, 71.26)
        }
    },
    ['spanishave'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1135.1311035156, -778.41644287109),
                vector2(-1114.7188720703, -761.08288574219),
                vector2(-1142.3354492188, -729.19293212891),
                vector2(-1161.1352539062, -745.50402832031)
            },
            ['minZ'] = 17.69,  -- min height of the parking zone
            ['maxZ'] = 20.61,  -- max height of the parking zone
        },
        label = "Spanish Ave Parking",
        showBlip = true,
        blipcoords = vector3(-1160.86, -741.41, 19.63),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false
    },
    ['fishinglot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1584.8425, 5166.9561),
                vector2(-1582.8080, 5172.6553),
                vector2(-1578.0510, 5174.6143),
                vector2(-1573.3340, 5171.5674),
                vector2(-1571.1439, 5163.7656),
                vector2(-1569.5393, 5156.0386),
                vector2(-1572.3870, 5150.0225),
                vector2(-1580.0217, 5149.3975),
                vector2(-1586.5621, 5153.2197),
                vector2(-1590.2334, 5158.4951),
            },
            ['minZ'] = 18.00,  -- min height of the parking zone
            ['maxZ'] = 20.45,  -- max height of the parking zone
        },
        label = "Fishing Pier Parking",
        showBlip = true,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1580.5864, 5152.7275, 19.8536, 147.3090),
            vector4(-1582.6608, 5155.2813, 19.7531, 130.0863),
            vector4(-1585.1796, 5158.7749, 19.6318, 96.7041),
            vector4(-1583.9077, 5163.2886, 19.5860, 71.2468),
            vector4(-1583.1678, 5167.7280, 19.5607, 50.9878),
            vector4(-1580.9167, 5171.1250, 19.5601, 26.6823),
            vector4(-1577.6772, 5172.9951, 19.5665, 30.3135),
            vector4(-1574.3787, 5169.2490, 19.5802, 341.2831),
            vector4(-1572.5984, 5163.6543, 19.5720, 358.3312),
            vector4(-1571.4631, 5156.1104, 19.8187, 359.5001),
        }
    },

    ['wuchanglot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-847.1815, -751.9269),
                vector2(-807.6706, -750.9960),
                vector2(-807.3759, -773.1528),
                vector2(-843.8290, -773.5460),
                vector2(-844.1145, -757.4321),
                vector2(-847.1011, -755.3939),
            },
            ['minZ'] = 20.00,  -- min height of the parking zone
            ['maxZ'] = 24.45,  -- max height of the parking zone
        },
        label = "Wu-Chang Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-841.0349, -772.0761, 20.9949, 90.6529),
            vector4(-840.7654, -768.0583, 21.3286, 90.2873),
            vector4(-840.8613, -764.1443, 21.6743, 90.3110),
            vector4(-841.1373, -760.5427, 22.0583, 87.1470),
            vector4(-829.9928, -768.2301, 21.3127, 269.8421),
            vector4(-830.0801, -764.1995, 21.6670, 271.4218),
            vector4(-829.7979, -760.6628, 22.0300, 268.6245),
            vector4(-829.6534, -757.0917, 22.3551, 267.1165),
            vector4(-822.3988, -768.1045, 21.3228, 90.8852),
            vector4(-822.4138, -764.2464, 21.6615, 91.1272),
            vector4(-822.3272, -760.5499, 22.0230, 86.4016),
            vector4(-822.5344, -757.1262, 22.3429, 88.0896),
            vector4(-810.9299, -771.9081, 21.0052, 269.1368),
            vector4(-810.9129, -768.3572, 21.2998, 268.8229),
            vector4(-810.7755, -764.2637, 21.6561, 269.1393),
            vector4(-810.7285, -760.6671, 21.9932, 266.9161),
            vector4(-810.6542, -757.0665, 22.3262, 269.2076),
            vector4(-810.4664, -753.4540, 22.6744, 268.8644),
        }
    },


    ['vulot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(130.0572, -1318.0892),
                vector2(135.2324, -1314.7942),
                vector2(154.8048, -1328.5175),
                vector2(151.2167, -1334.5228),
            },
            ['minZ'] = 28.00,  -- min height of the parking zone
            ['maxZ'] = 30.45,  -- max height of the parking zone
        },
        label = "Vanilla Unicorn Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(151.1527, -1328.8937, 29.2156, 324.0431),
            vector4(149.0453, -1327.1033, 29.2173, 327.5661),
            vector4(146.6463, -1325.7971, 29.2139, 326.8974),
            vector4(144.6837, -1324.4755, 29.2118, 324.9914),
            vector4(142.8348, -1323.0786, 29.2100, 327.0063),
            vector4(140.6355, -1321.5085, 29.2076, 326.0431),
            vector4(138.1314, -1319.8497, 29.2022, 324.4772),
            vector4(136.2252, -1318.6997, 29.2022, 327.9397),
            vector4(134.2890, -1317.5713, 29.2022, 327.7503),
        }
    },

    ['wuroof'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-841.4285, -717.9707),
                vector2(-830.9104, -718.1366),
                vector2(-830.8128, -728.2653),
                vector2(-841.2303, -728.2330),
            },
            ['minZ'] = 122.00,  -- min height of the parking zone
            ['maxZ'] = 124.45,  -- max height of the parking zone
        },
        label = "Wu Chang Helipad",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'air', "helicopter",},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-836.1098, -722.9332, 123.3460, 268.9737),
        }
    },





    ['catcafelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-588.9241, -1137.7004),
                vector2(-567.0118, -1137.1968),
                vector2(-565.8194, -1097.4412),
                vector2(-589.5472, -1097.8214),
            },
            ['minZ'] = 20.00,  -- min height of the parking zone
            ['maxZ'] = 24.45,  -- max height of the parking zone
        },
        label = "Cafe Parking",
        showBlip = false,
        blipcoords = vector3(-577.5554, -1131.8627, 22.3786),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-581.9435, -1101.0701, 22.1788, 270.9661),
            vector4(-582.1682, -1104.6973, 22.1788, 271.1520),
            vector4(-582.1841, -1108.2633, 22.1788, 271.1994),
            vector4(-582.2826, -1111.9799, 22.1789, 269.3935),
            vector4(-582.5386, -1115.6244, 22.1789, 268.7911),
            vector4(-582.7723, -1119.4158, 22.1789, 270.1539),
            vector4(-582.6857, -1122.9143, 22.1789, 268.0033),
            vector4(-583.1277, -1126.6755, 22.1789, 270.0027),
            vector4(-583.1841, -1130.4299, 22.1789, 271.0358),
            vector4(-583.3534, -1134.1290, 22.1789, 271.3668),
            vector4(-572.1157, -1133.6799, 22.1789, 90.7528),
            vector4(-572.0358, -1130.4553, 22.1789, 89.6926),
            vector4(-571.6968, -1126.5216, 22.1789, 90.1893),
            vector4(-571.4604, -1122.9247, 22.1789, 87.9964),
            vector4(-571.4042, -1118.9241, 22.1789, 91.1036),
            vector4(-571.5327, -1115.5000, 22.1789, 90.9395),
            vector4(-571.2685, -1111.6853, 22.1789, 91.9579),
            vector4(-571.4459, -1107.9833, 22.1789, 104.3734),
            vector4(-571.3775, -1104.2444, 22.1789, 98.4005),
            vector4(-571.3880, -1100.5918, 22.1788, 91.5241),

        }
    },

    ['wuchangEmployeelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-819.4358, -724.3546),
                vector2(-813.4964, -724.3086),
                vector2(-813.5106, -732.5904),
                vector2(-819.4010, -732.7242),
            },
            ['minZ'] = 20.00,  -- min height of the parking zone
            ['maxZ'] = 25.45,  -- max height of the parking zone
        },
        label = "Wu-Chang Employee Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-817.6674, -727.2195, 23.7790, 0.8240),
            vector4(-814.8331, -727.1450, 23.7790, 358.0512),
        }
    },


    ['ottoEmployeelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(810.1544, -821.0538),
                vector2(810.4301, -803.9794),
                vector2(795.3796, -803.8007),
                vector2(795.1454, -819.4581),
            },
            ['minZ'] = 24.00,  -- min height of the parking zone
            ['maxZ'] = 28.45,  -- max height of the parking zone
        },
        label = "Otto's Employee Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        job = 'otto',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(797.7812, -818.2239, 26.1810, 89.3021),
            vector4(797.9774, -814.8818, 26.1810, 95.9969),
            vector4(798.0566, -811.7076, 26.1810, 90.0629),
            vector4(798.0638, -808.5242, 26.2601, 91.3981),
            vector4(798.0080, -805.1540, 26.2682, 92.9180),
            vector4(808.0618, -805.5784, 26.2287, 269.9660),
            vector4(807.8286, -808.9188, 26.2187, 269.0383),
            vector4(807.9376, -812.0867, 26.1823, 269.3809),
            vector4(807.8598, -815.2382, 26.1855, 269.4330),
        }
    },

    ['tacoEmployeelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(24.5161, -1595.0259),
                vector2(18.9930, -1590.3751),
                vector2(40.0121, -1564.8713),
                vector2(46.3482, -1570.0778),
            },
            ['minZ'] = 28.00,  -- min height of the parking zone
            ['maxZ'] = 30.45,  -- max height of the parking zone
        },
        label = "Taco Shop Employee Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        job = 'taco',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(41.8605, -1568.7502, 29.2923, 47.1707),
            vector4(39.6923, -1570.9661, 29.2923, 53.3872),
            vector4(37.6033, -1573.3099, 29.2923, 49.5388),
            vector4(35.7432, -1575.7787, 29.2835, 47.1323),
            vector4(33.6984, -1578.0311, 29.2651, 52.4311),
            vector4(31.8966, -1580.3705, 29.2403, 51.4016),
            vector4(29.8276, -1582.7523, 29.2194, 50.3521),
            vector4(27.8972, -1585.1952, 29.1944, 56.0737),
            vector4(26.0187, -1587.2990, 29.1976, 49.8350),
            vector4(24.3303, -1589.5679, 29.1593, 48.5294),
            vector4(22.3750, -1591.7649, 29.2769, 54.2687),
        }
    },

    ['cophouselot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-821.2178, 187.0661),
                vector2(-818.5788, 181.8530),
                vector2(-822.9729, 177.1818),
                vector2(-828.4794, 181.4185),
            },
            ['minZ'] = 70.00,  -- min height of the parking zone
            ['maxZ'] = 75.45,  -- max height of the parking zone
        },
        label = "Polomina House Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-824.0276, 184.6031, 71.9263, 309.2167),
            vector4(-823.2508, 183.1981, 71.8665, 286.1164),
            vector4(-822.0615, 181.5836, 71.7757, 319.1055),
            vector4(-821.0554, 180.1049, 71.6556, 305.0092),
        }
    },

    ['hillcresthouselot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-859.8026, 701.2599),
                vector2(-861.3588, 695.3580),
                vector2(-868.0183, 698.7187),
                vector2(-865.5638, 702.0477),
            },
            ['minZ'] = 147.00,  -- min height of the parking zone
            ['maxZ'] = 150.45,  -- max height of the parking zone
        },
        label = "Hillcrest House Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-862.3853, 698.4318, 149.0187, 154.1908),
            vector4(-863.5359, 698.9456, 149.0545, 132.4780),
            vector4(-865.2007, 699.6062, 149.0633, 146.3220),
        }
    },

    ['macdonaldhouselot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(334.3976, -1752.2816),
                vector2(331.3670, -1755.2570),
                vector2(309.6888, -1737.0372),
                vector2(312.3727, -1733.8558),
            },
            ['minZ'] = 28.00,  -- min height of the parking zone
            ['maxZ'] = 30.45,  -- max height of the parking zone
        },
        label = "Macdonald House Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(312.5923, -1736.8888, 29.5086, 47.9566),
            vector4(315.9440, -1739.7271, 29.4382, 232.6702),
            vector4(318.7088, -1741.9242, 29.3823, 231.8786),
            vector4(321.6802, -1744.2148, 29.3632, 231.4183),
            vector4(324.0996, -1746.5305, 29.3048, 219.5280),
            vector4(326.5071, -1748.1987, 29.3092, 261.0994),
            vector4(329.3434, -1750.4615, 29.2944, 231.0774),
            vector4(332.0955, -1752.7800, 29.2914, 228.3284),
        }
    },

    ['maxdamagelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(22.2157, -1115.6195),
                vector2(28.0101, -1118.0267),
                vector2(45.1776, -1089.2415),
                vector2(37.5747, -1087.4126),
            },
            ['minZ'] = 28.00,  -- min height of the parking zone
            ['maxZ'] = 30.45,  -- max height of the parking zone
        },
        label = "Max Damage Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(39.1369, -1090.8230, 29.4895, 90.7514),
            vector4(37.7975, -1093.5839, 29.4778, 91.2648),
            vector4(36.4647, -1095.7861, 29.4546, 89.7030),
            vector4(34.8576, -1098.2810, 29.4130, 87.3049),

            vector4(33.4904, -1100.7590, 29.3841, 89.4310),
            vector4(32.2435, -1103.3470, 29.3659, 88.9987),
            vector4(29.7112, -1108.0677, 29.3185, 88.8203),
            vector4(28.6082, -1110.8877, 29.3101, 81.3684),
        }
    },

    ['scrappganglot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1258.4552, -1592.0908),
                vector2(1254.7360, -1586.6512),
                vector2(1273.7710, -1573.2678),
                vector2(1277.6357, -1578.9719),
            },
            ['minZ'] = 50.00,  -- min height of the parking zone
            ['maxZ'] = 55.45,  -- max height of the parking zone
        },
        label = "MOB Scrapp Gang Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        gang = 'scrappgang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(1260.4191, -1589.3033, 52.8990, 124.8084),
            vector4(1258.7584, -1586.4950, 53.4398, 121.1762),
            vector4(1261.9844, -1584.0594, 53.3376, 112.6635),
            vector4(1263.5924, -1586.9349, 53.0343, 128.4887),
            vector4(1267.9781, -1583.9175, 52.7635, 120.0661),
            vector4(1265.0753, -1581.5757, 53.1105, 120.8652),
            vector4(1270.1331, -1578.3778, 52.7220, 121.5386),
            vector4(1272.4856, -1581.4877, 52.2752, 138.2042),
        }
    },

    ['mrsmonkeylot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(393.5370, -769.9302),
                vector2(369.7110, -769.8674),
                vector2(369.2094, -762.4714),
                vector2(393.5833, -761.1497),
            },
            ['minZ'] = 27.00,  -- min height of the parking zone
            ['maxZ'] = 31.45,  -- max height of the parking zone
        },
        label = "Mrs. Monkey's Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other', 'commercial'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(391.2454, -766.8457, 29.2916, 178.2488),
            vector4(387.6658, -766.8408, 29.2921, 178.2555),
            vector4(384.0265, -766.9188, 29.2928, 177.0439),
            vector4(380.1535, -767.0377, 29.2936, 175.5835),
            vector4(376.6318, -767.2711, 29.2931, 178.2261),
            vector4(373.0529, -767.2252, 29.2926, 175.6007),
        }
    },


    ['gsflot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-133.9083, -1630.2651),
                vector2(-131.0248, -1632.1512),
                vector2(-146.6851, -1652.4540),
                vector2(-149.2402, -1650.3993),
            },
            ['minZ'] = 31.00,  -- min height of the parking zone
            ['maxZ'] = 33.45,  -- max height of the parking zone
        },
        label = "GSF Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other', 'commercial'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-146.4205, -1649.1681, 32.6758, 322.7890),
            vector4(-144.8193, -1646.9125, 32.6319, 324.9154),
            vector4(-142.4987, -1644.0706, 32.5803, 321.1437),
            vector4(-140.9554, -1641.8879, 32.5237, 316.6236),
            vector4(-138.3909, -1639.2755, 32.4673, 321.2514),
            vector4(-135.1387, -1635.0905, 32.3829, 320.9783),
        }
    },

    ['cophouselot2'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-829.1654, 179.4629),
                vector2(-816.8765, 188.3923),
                vector2(-814.8616, 183.1516),
                vector2(-824.1201, 175.9573),
            },
            ['minZ'] = 70.00,  -- min height of the parking zone
            ['maxZ'] = 72.45,  -- max height of the parking zone
        },
        label = "Cop House Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other', 'commercial'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-820.1923, 186.2766, 72.1913, 292.6938),
            vector4(-820.3339, 184.8588, 72.1376, 291.5597),
            vector4(-817.8895, 183.2630, 72.2185, 15.6984),
            vector4(-821.4447, 181.2514, 71.7744, 299.1074),
            vector4(-822.9626, 182.4483, 71.8264, 297.8601),
            vector4(-824.0146, 184.5861, 71.9257, 298.9299),
            vector4(-827.8298, 180.4278, 71.4244, 314.1063),
            vector4(-825.3134, 178.5125, 71.3204, 317.4182),
            vector4(-823.7634, 177.4742, 71.2732, 320.6580),
        }
    },


    ['tunerslot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(158.9387, -3039.7063),
                vector2(167.1936, -3039.5466),
                vector2(167.5213, -3058.9658),
                vector2(159.2390, -3058.9336),
            },
            ['minZ'] = 4.00,  -- min height of the parking zone
            ['maxZ'] = 8.45,  -- max height of the parking zone
        },
        label = "Tuners Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
      -- job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(163.9794, -3056.7085, 5.9231, 87.6709),
            vector4(164.3282, -3050.8892, 5.9168, 89.8116),
            vector4(164.4033, -3046.5227, 5.9153, 87.4046),
            vector4(163.6966, -3041.9043, 5.9283, 89.3392),
        }
    },

    ['brickhouselot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1019.1514, -775.3672),
                vector2(-1022.7716, -781.7842),
                vector2(-1009.5656, -788.0942),
                vector2(-1005.8656, -782.7296),
            },
            ['minZ'] = 15.00,  -- min height of the parking zone
            ['maxZ'] = 17.45,  -- max height of the parking zone
        },
        label = "Law Firm Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
      -- job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1010.1442, -782.0970, 16.3736, 58.6343),
            vector4(-1011.9285, -784.8885, 16.3736, 65.2651),
            vector4(-1017.4029, -782.2136, 16.3736, 62.1097),
            vector4(-1015.8246, -779.0465, 16.3736, 55.4188),
        }
    },



    ['familylot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-326.6781, -2429.6968),
                vector2(-335.5629, -2422.3191),
                vector2(-346.7751, -2434.8306),
                vector2(-336.9879, -2442.2427),
            },
            ['minZ'] = 5.00,  -- min height of the parking zone
            ['maxZ'] = 7.45,  -- max height of the parking zone
        },
        label = "Family Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        gang = 'family',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea 
        debug = false,
        ['ParkingSpots'] = {
            vector4(-331.1189, -2427.8230, 6.0003, 229.0306),
            vector4(-333.3871, -2430.3159, 6.0003, 229.5047),
            vector4(-335.6287, -2432.8535, 6.0003, 230.1607),
            vector4(-337.8628, -2435.4993, 6.0003, 230.7067),
            vector4(-340.3240, -2438.4124, 6.0003, 234.1624),

            vector4(-343.8449, -2435.5645, 6.0003, 48.0673),
            vector4(-341.5040, -2433.1008, 6.0003, 49.8942),
            vector4(-339.3357, -2430.3625, 6.0003, 50.0354),
            vector4(-336.5216, -2427.2825, 6.0003, 50.9175),
            vector4(-333.8866, -2424.5593, 6.0003, 46.6095),
        }
    },

    ['cripslot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-351.4272, 38.7364),
                vector2(-360.4335, 40.5557),
                vector2(-362.3988, 25.1765),
                vector2(-354.2368, 24.1727),
            },
            ['minZ'] = 45.00,  -- min height of the parking zone
            ['maxZ'] = 49.45,  -- max height of the parking zone
        },
        label = "Crips Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        gang = 'crips',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea 
        debug = false,
        ['ParkingSpots'] = {
            vector4(-357.5410, 26.6039, 47.7086, 256.5625),
            vector4(-356.7105, 29.7699, 47.7802, 254.1326),
            vector4(-356.2786, 33.0896, 47.8058, 257.6239),
            vector4(-355.8357, 37.8718, 47.9901, 255.9700),
        }
    },


    
    ['cartellot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(489.0464, -1518.5823),
                vector2(502.0915, -1529.7435),
                vector2(511.5942, -1517.2274),
                vector2(502.3176, -1510.5276),
                vector2(493.6983, -1513.7484),
            },
            ['minZ'] = 28.00,  -- min height of the parking zone
            ['maxZ'] = 31.45,  -- max height of the parking zone
        },
        label = "Cartel Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'gang',                --public, job, gang, depot
        gang = 'cartel',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea 
        debug = false,
        ['ParkingSpots'] = {
            vector4(503.3520, -1513.9139, 29.2888, 318.2997),
            vector4(505.8564, -1516.2412, 29.2885, 319.2229),
            vector4(508.3258, -1518.3596, 29.2880, 309.1255),
            vector4(502.3448, -1526.8324, 29.2883, 139.3404),
            vector4(500.0445, -1524.6162, 29.2887, 136.9665),
            vector4(497.5948, -1522.4503, 29.2893, 141.7806),
            vector4(495.2448, -1520.4669, 29.2895, 141.1566),
            vector4(492.7576, -1518.0786, 29.2897, 137.4941),
        }
    },



    ['triadslot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-635.7165, -1223.6317),
                vector2(-641.1046, -1227.8835),
                vector2(-652.7413, -1210.1566),
                vector2(-647.0505, -1206.3033),
            },
            ['minZ'] = 10.00,  -- min height of the parking zone
            ['maxZ'] = 13.45,  -- max height of the parking zone
        },
        label = "Triads Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
      -- job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-647.1492, -1211.3989, 11.3265, 121.3861),
            vector4(-645.1448, -1214.4843, 11.3742, 112.7717),
            vector4(-643.7040, -1217.6390, 11.3661, 132.7524),
            vector4(-641.1494, -1220.5568, 11.4742, 121.5681),
            vector4(-639.3747, -1223.9860, 11.4873, 113.7056),
        }
    },


    ['lostmclot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(960.1813, -117.2161),
                vector2(955.9567, -112.3982),
                vector2(964.4956, -103.9048),
                vector2(970.5028, -109.8868),
            },
            ['minZ'] = 72.00,  -- min height of the parking zone
            ['maxZ'] = 76.45,  -- max height of the parking zone
        },
        label = "Lost MC Parking",
        showBlip = false,
        blipcoords = vector3(-642.1804, -1219.8580, 10.8070),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
      -- job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(964.6461, -109.1160, 74.3636, 44.8975),
            vector4(959.9365, -113.7902, 74.3636, 40.0065),
          --  vector4(-643.7040, -1217.6390, 11.3661, 132.7524),
          --  vector4(-641.1494, -1220.5568, 11.4742, 121.5681),
          --  vector4(-639.3747, -1223.9860, 11.4873, 113.7056),
        }
    },

]]

    ['churchlot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-754.5422, -74.9344),
                vector2(-750.2325, -83.2393),
                vector2(-723.5532, -69.5727),
                vector2(-727.9136, -61.2608),
            },
            ['minZ'] = 40.00,  -- min height of the parking zone
            ['maxZ'] = 45.45,  -- max height of the parking zone
        },
        label = "Church of Rockford Parking",
        showBlip = true,
        blipcoords = vector3(-737.3054, -78.4081, 37.3847),
        blipName = "Church Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-727.8050, -68.8191, 41.7503, 205.7655),
            vector4(-733.3608, -71.7324, 41.7475, 205.8104),
            vector4(-736.7394, -73.3857, 41.7475, 206.6678),
            vector4(-740.2360, -74.9508, 41.7476, 208.2990),
            vector4(-743.5924, -76.6576, 41.7476, 208.1983),
            vector4(-748.5743, -78.9737, 41.7492, 207.4665),
        }
    },

--[[
    ['churchemployeelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-744.7968, -27.2546),
                vector2(-742.9469, -30.2652),
                vector2(-766.7476, -42.6748),
                vector2(-768.4919, -39.7280),
            },
            ['minZ'] = 35.00,  -- min height of the parking zone
            ['maxZ'] = 40.45,  -- max height of the parking zone
        },
        label = "Church Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Church Parking",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        job = 'church',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-746.8135, -30.3046, 37.6857, 116.7853),
            vector4(-752.7751, -33.4855, 37.6855, 116.5935),
            vector4(-757.9271, -36.2942, 37.6856, 117.9196),
            vector4(-762.9835, -38.8057, 37.6856, 118.0872),
        }
    },




    ['weazelnewslot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-618.8336, -937.4190),
                vector2(-614.0425, -935.8394),
                vector2(-613.9462, -908.0169),
                vector2(-618.5573, -909.5723),
            },
            ['minZ'] = 20.00,  -- min height of the parking zone
            ['maxZ'] = 25.45,  -- max height of the parking zone
        },
        label = "Weazel News Public Parking",
        showBlip = true,
        blipcoords = vector3(-737.3054, -78.4081, 37.3847),
        blipName = "Weazel News Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        --job = 'wuchang',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-615.8295, -911.8581, 24.0460, 285.2578),
            vector4(-615.7861, -916.2426, 23.7316, 287.5848),
            vector4(-615.4643, -920.3929, 23.4528, 286.2590),
            vector4(-615.4993, -925.3731, 23.0016, 288.5671),
            vector4(-615.6114, -929.4561, 22.6100, 284.1417),
            vector4(-615.8690, -933.4016, 22.3112, 282.6950),
        }
    },


    ['weazelnewsemployeelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-559.4248, -922.5743),
                vector2(-553.5477, -922.9617),
                vector2(-553.0242, -940.4899),
                vector2(-559.6862, -941.3497),
            },
            ['minZ'] = 20.00,  -- min height of the parking zone
            ['maxZ'] = 25.45,  -- max height of the parking zone
        },
        label = "Weazel News Employee Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Weazel News Employee Parking",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        job = 'weazelnews',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-556.5184, -937.7166, 23.8490, 96.7520),
            vector4(-556.4828, -933.2719, 23.8491, 90.3456),
            vector4(-556.6352, -929.3871, 23.8615, 86.8757),
            vector4(-556.6924, -924.9027, 23.8678, 89.0693),
        }
    },

    ['pizzathisemployeelot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(812.3553, -739.8754),
                vector2(816.0122, -736.7521),
                vector2(813.1152, -732.0365),
                vector2(808.0544, -736.7479),
            },
            ['minZ'] = 25.00,  -- min height of the parking zone
            ['maxZ'] = 30.45,  -- max height of the parking zone
        },
        label = "PIzza This! Employee Parking",
        showBlip = false,
        blipcoords = vector3(-1578.2623, 5158.5210, 19.8344),
        blipName = "Pizza This! Employee Parking",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        job = 'pizzathis',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(812.0329, -735.4792, 27.5992, 122.8790),
        }
    },

    ['eclipse'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-813.4774, 366.7200),
                vector2(-813.6294, 376.4943),
                vector2(-734.5599, 376.5663),
                vector2(-735.6427, 363.3566),
            },
            ['minZ'] = 85.00,  -- min height of the parking zone
            ['maxZ'] = 90.45,  -- max height of the parking zone
        },
        label = "Eclipse Tower Parking",
        showBlip = true,
        blipcoords = vector3(69.84, 12.6, 68.96),
        blipName = "Eclipse Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-810.2371, 373.3717, 87.8760, 357.9057),
            vector4(-806.6000, 373.2708, 87.8760, 2.6815),
            vector4(-803.2155, 373.3283, 87.8760, 337.2070),
            vector4(-799.5231, 373.4134, 87.8761, 359.7201),

            vector4(-796.2139, 373.5016, 87.8760, 358.7960),
            vector4(-792.6806, 373.4887, 87.8760, 359.6986),
            vector4(-789.3113, 373.2711, 87.8760, 358.0274),
            vector4(-781.2021, 373.1230, 87.8761, 0.0936),


            vector4(-777.0140, 373.1283, 87.8760, 357.8212),
            vector4(-773.6037, 373.1576, 87.8760, 357.3373),
            vector4(-770.3563, 373.0388, 87.8760, 352.3955),
            vector4(-766.3818, 372.9558, 87.8758, 359.2885),

            vector4(-759.4843, 373.6751, 87.8757, 2.5848),
            vector4(-756.2785, 373.7761, 87.8755, 359.8435),
            vector4(-752.8362, 373.5953, 87.8749, 356.6562),
            vector4(-749.1274, 373.3766, 87.8743, 357.7160),
            vector4(-738.3557, 374.5951, 87.8744, 272.9784),
            vector4(-738.2606, 371.1880, 87.8701, 264.1232),
            vector4(-738.5817, 367.9301, 87.8660, 260.9443),
        }
    },






    ['caears24'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(76.188446044922, 7.9120540618896),
                vector2(81.977760314941, 23.525623321533),
                vector2(55.219917297363, 32.982769012451),
                vector2(49.228351593018, 16.684007644653),
                vector2(68.127639770508, 9.6578321456909),
                vector2(68.597557067871, 10.655039787292)
            },
            ['minZ'] = 68.00,  -- min height of the parking zone
            ['maxZ'] = 70.45,  -- max height of the parking zone
        },
        label = "Caesar 24h Parking",
        showBlip = true,
        blipcoords = vector3(69.84, 12.6, 68.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(54.49, 19.49, 69.14, 339.68),
            vector4(57.48, 17.98, 68.92, 340.13),
            vector4(60.49, 16.99, 68.8, 338.05),
            vector4(64.03, 16.28, 68.75, 337.71),
        }
    },
    ['caears242'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-480.87042236328, -819.84265136719),
                vector2(-441.08392333984, -820.39178466797),
                vector2(-440.29922485352, -795.61010742188),
                vector2(-450.12713623047, -795.83892822266),
                vector2(-450.57876586914, -792.54748535156),
                vector2(-480.38143920898, -792.79217529297)
            },
            ['minZ'] = 29.47,  -- min height of the parking zone
            ['maxZ'] = 32.82,  -- max height of the parking zone
        },
        label = "Caesar 24h Parking",
        showBlip = true,
        blipcoords = vector3(-475.31, -818.73, 30.46),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-477.62, -816.44, 30.05, 271.2),
            vector4(-477.28, -813.29, 30.1, 265.04),
            vector4(-477.3, -809.77, 30.12, 268.93),
            vector4(-477.37, -806.7, 30.12, 271.51),
            vector4(-477.45, -803.55, 30.12, 268.73),
            vector4(-477.12, -800.59, 30.12, 270.28),
            vector4(-476.98, -796.99, 30.12, 269.26),
            vector4(-476.98, -796.99, 30.12, 269.26),
            vector4(-476.99, -794.09, 30.13, 268.72),
            vector4(-459.54, -797.15, 30.12, 267.11),
            vector4(-460.45, -800.21, 30.12, 270.89),
            vector4(-460.18, -803.33, 30.11, 269.85),
            vector4(-460.74, -809.84, 30.11, 270.31),
            vector4(-460.21, -813.14, 30.13, 271.44),
            vector4(-460.21, -816.42, 30.16, 269.02),
            vector4(-444.8, -797.5, 30.12, 90.73),
            vector4(-444.33, -801.16, 30.12, 92.51),
            vector4(-444.6, -804.72, 30.11, 90.88),
            vector4(-444.63, -808.75, 30.11, 89.24),
            vector4(-443.84, -812.02, 30.13, 87.33),
            vector4(-444.21, -816.02, 30.24, 89.21),
            vector4(-460.34, -806.46, 30.11, 267.68),
            vector4(-466.14, -816.36, 30.11, 88.66),
            vector4(-466.18, -812.98, 30.11, 88.96),
            vector4(-466.22, -809.72, 30.11, 89.54),
            vector4(-467.38, -806.99, 30.11, 89.36),
            vector4(-466.99, -803.3, 30.12, 85.98),
            vector4(-466.81, -800.55, 30.12, 89.29),
            vector4(-466.41, -797.08, 30.12, 88.09),
            vector4(-460.34, -806.46, 30.11, 267.68),
        }
    },
    ['lagunapi'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(358.69207763672, 302.30017089844),
                vector2(351.44546508789, 277.92486572266),
                vector2(355.01831054688, 277.03842163086),
                vector2(353.3766784668, 270.50997924805),
                vector2(387.72875976562, 257.78961181641),
                vector2(399.73132324219, 290.71780395508),
                vector2(364.49926757812, 300.54202270508),
                vector2(362.70568847656, 295.12139892578),
                vector2(359.67681884766, 296.56146240234),
                vector2(361.49871826172, 301.58950805664)
            },
            ['minZ'] = 102.00,  -- min height of the parking zone
            ['maxZ'] = 105.89,  -- max height of the parking zone
        },
        label = "Laguna Parking",
        showBlip = true,
        blipcoords = vector3(364.37, 297.83, 103.49),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(359.53, 270.99, 102.65, 341.37),
            vector4(363.59, 269.88, 102.64, 341.77),
            vector4(368.05, 267.75, 102.62, 337.77),
            vector4(371.2, 266.77, 102.6, 340.94),
            vector4(375.32, 265.38, 102.59, 339.29),
            vector4(379.12, 264.74, 102.59, 337.98),
            vector4(388.53, 269.67, 102.58, 68.7),
            vector4(389.17, 272.93, 102.58, 72.26),
            vector4(391.11, 276.63, 102.57, 69.67),
            vector4(392.57, 280.58, 102.57, 70.77),
            vector4(393.81, 283.91, 102.55, 71.82),
            vector4(390.92, 290.55, 102.58, 163.29),
            vector4(386.89, 291.62, 102.63, 162.58),
            vector4(383.07, 292.87, 102.69, 164.08),
            vector4(379.23, 293.87, 102.77, 162.43),
            vector4(374.93, 294.49, 102.85, 162.54),
            vector4(375.86, 274.26, 102.65, 157.86),
            vector4(371.94, 275.54, 102.71, 158.54),
            vector4(368.03, 277.26, 102.77, 156.9),
            vector4(378.84, 281.93, 102.68, 336.98),
            vector4(375.05, 283.0, 102.75, 339.72),
            vector4(370.91, 284.66, 102.83, 337.04),
            vector4(361.12, 293.52, 103.08, 251.69),
            vector4(359.6, 290.0, 103.08, 249.21),
            vector4(357.99, 286.45, 103.1, 248.69),
            vector4(356.98, 283.01, 103.0, 248.05),
        }
    },]]
    ['airportp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-779.76104736328, -2023.2966308594),
                vector2(-775.14440917969, -2019.8140869141),
                vector2(-767.18334960938, -2012.3591308594),
                vector2(-760.70989990234, -2004.76171875),
                vector2(-756.01049804688, -1997.4604492188),
                vector2(-753.18353271484, -1990.4525146484),
                vector2(-751.64544677734, -1983.7036132812),
                vector2(-748.98046875, -1969.5380859375),
                vector2(-748.11468505859, -1967.5456542969),
                vector2(-746.72650146484, -1965.5721435547),
                vector2(-744.23596191406, -1963.4608154297),
                vector2(-739.22473144531, -1961.9007568359),
                vector2(-733.59368896484, -1962.0502929688),
                vector2(-729.30279541016, -1963.3483886719),
                vector2(-727.666015625, -1964.8414306641),
                vector2(-725.72021484375, -1966.9916992188),
                vector2(-714.04919433594, -2019.2927246094),
                vector2(-710.76025390625, -2032.8103027344),
                vector2(-707.01336669922, -2040.8115234375),
                vector2(-704.6533203125, -2044.3029785156),
                vector2(-703.19024658203, -2045.3291015625),
                vector2(-701.63171386719, -2045.6253662109),
                vector2(-699.74157714844, -2045.2917480469),
                vector2(-687.05395507812, -2039.5653076172),
                vector2(-685.76708984375, -2038.6518554688),
                vector2(-684.13092041016, -2036.3044433594),
                vector2(-672.29400634766, -2041.8348388672),
                vector2(-670.67193603516, -2043.4077148438),
                vector2(-665.39947509766, -2046.6591796875),
                vector2(-657.96466064453, -2048.1787109375),
                vector2(-655.55963134766, -2048.3508300781),
                vector2(-651.94177246094, -2047.6011962891),
                vector2(-649.02130126953, -2046.1932373047),
                vector2(-633.71252441406, -2030.9672851562),
                vector2(-631.34783935547, -2030.0726318359),
                vector2(-628.30303955078, -2030.5014648438),
                vector2(-616.89349365234, -2042.3790283203),
                vector2(-616.16394042969, -2045.1605224609),
                vector2(-617.02777099609, -2047.9118652344),
                vector2(-648.34002685547, -2079.3305664062),
                vector2(-652.69281005859, -2082.1706542969),
                vector2(-658.36376953125, -2083.3293457031),
                vector2(-671.02252197266, -2082.0708007812),
                vector2(-676.02673339844, -2082.1984863281),
                vector2(-684.85815429688, -2084.7019042969),
                vector2(-695.00408935547, -2087.8937988281),
                vector2(-701.19207763672, -2088.712890625),
                vector2(-703.89630126953, -2088.4221191406),
                vector2(-708.56176757812, -2085.2458496094),
                vector2(-713.30065917969, -2087.1435546875),
                vector2(-718.29937744141, -2082.3813476562),
                vector2(-724.05651855469, -2078.2341308594),
                vector2(-736.53204345703, -2071.5529785156),
                vector2(-746.24493408203, -2067.9118652344),
                vector2(-751.45703125, -2073.4653320312),
                vector2(-787.72106933594, -2037.2147216797)
            },
            ['minZ'] = 8.85,  -- min height of the parking zone
            ['maxZ'] = 10.10,  -- max height of the parking zone
        },
        label = "Airport Parking",
        showBlip = true,
        blipcoords = vector3(-796.86, -2024.85, 8.88),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false
    },
    ['beachp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1177.4599609375, -1504.8297119141),
                vector2(-1170.6567382812, -1500.1866455078),
                vector2(-1167.892578125, -1496.4272460938),
                vector2(-1167.0075683594, -1491.4938964844),
                vector2(-1168.083984375, -1487.3162841797),
                vector2(-1184.8902587891, -1461.9444580078),
                vector2(-1203.3045654297, -1475.2700195312),
                vector2(-1202.2609863281, -1476.640625),
                vector2(-1208.1496582031, -1480.9470214844),
                vector2(-1207.1524658203, -1483.8693847656),
                vector2(-1207.7424316406, -1485.8941650391),
                vector2(-1188.0931396484, -1513.3830566406),
                vector2(-1185.7036132812, -1511.7416992188),
                vector2(-1187.1550292969, -1509.7088623047),
                vector2(-1183.7425537109, -1507.1494140625),
                vector2(-1182.2048339844, -1508.9814453125)
            },
            ['minZ'] = 3.20,  -- min height of the parking zone
            ['maxZ'] = 6.53,  -- max height of the parking zone
        },
        label = "Beach Parking",
        showBlip = true,
        blipcoords = vector3(-1183.1, -1511.11, 4.36),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false
    },
    ["themotorhotel"] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1140.2746582031, 2644.5261230469),
                vector2(1108.8831787109, 2644.2172851562),
                vector2(1108.5783691406, 2660.1645507812),
                vector2(1089.9521484375, 2660.1198730469),
                vector2(1091.3571777344, 2677.4743652344),
                vector2(1133.5280761719, 2674.8422851562),
                vector2(1133.7532958984, 2658.8393554688),
                vector2(1140.4176025391, 2658.8898925781)
            },
            ['minZ'] = 36.78,  -- min height of the parking zone
            ['maxZ'] = 39.74,  -- max height of the parking zone
        },
        label = "The Motor Hotel Parking",
        showBlip = true,
        blipcoords = vector3(1137.77, 2663.54, 37.9),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false
    },
    ['liqourparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(934.54669189453, 3604.5546875),
                vector2(954.29815673828, 3604.1672363281),
                vector2(954.35180664062, 3626.7893066406),
                vector2(934.75305175781, 3626.3806152344)
            },
            ['minZ'] = 31.5,  -- min height of the parking zone
            ['maxZ'] = 35.99,  -- max height of the parking zone
        },
        label = "Liquor Parking",
        showBlip = true,
        blipcoords = vector3(934.95, 3606.59, 32.81),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false
    },
    ['haanparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(67.230964660645, 6414.7719726562),
                vector2(53.828144073486, 6401.8227539062),
                vector2(59.075645446777, 6396.736328125),
                vector2(57.678955078125, 6394.4799804688),
                vector2(55.321895599365, 6393.0532226562),
                vector2(49.954971313477, 6398.6840820312),
                vector2(32.203670501709, 6380.2915039062),
                vector2(36.029750823975, 6376.328125),
                vector2(33.88489151001, 6373.9545898438),
                vector2(31.614000320435, 6372.1850585938),
                vector2(27.5251121521, 6376.2802734375),
                vector2(3.0867385864258, 6350.3901367188),
                vector2(7.4540538787842, 6345.6538085938),
                vector2(6.2227344512939, 6343.2216796875),
                vector2(3.7218370437622, 6341.9638671875),
                vector2(-0.76969349384308, 6346.2749023438),
                vector2(-22.776170730591, 6325.3828125),
                vector2(-24.351142883301, 6322.0849609375),
                vector2(-23.452659606934, 6319.2861328125),
                vector2(-12.439478874207, 6304.8647460938),
                vector2(-10.365778923035, 6304.6127929688),
                vector2(5.0310492515564, 6313.4970703125),
                vector2(5.2357106208801, 6314.859375),
                vector2(41.809215545654, 6335.396484375),
                vector2(42.73751449585, 6334.2446289062),
                vector2(71.22339630127, 6349.8232421875),
                vector2(68.208351135254, 6355.2939453125),
                vector2(117.06902313232, 6378.890625)
            },
            ['minZ'] = 30.00,  -- min height of the parking zone
            ['maxZ'] = 33.38,  -- max height of the parking zone
        },
        label = "Cluckin Bell Farms Parking",
        showBlip = true,
        blipcoords = vector3(78.34, 6418.74, 31.28),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false
    },
    ['legionsquare'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(239.88751220703, -820.52038574219),
                vector2(252.71513366699, -784.91027832031),
                vector2(258.39483642578, -786.82489013672),
                vector2(264.27755737305, -769.99841308594),
                vector2(218.69738769531, -754.69787597656),
                vector2(200.07238769531, -805.74285888672)
            },
            ['minZ'] = 29.07,  -- min height of the parking zone
            ['maxZ'] = 40.0,  -- max height of the parking zone
        },
        label = "Legion Square Parking",
        showBlip = true,
        blipcoords = vector3(215.9499, -809.698, 30.731),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(219.38, -765.95, 30.41, 247.04),
            vector4(218.07, -768.47, 30.41, 248.86),
            vector4(216.93, -770.89, 30.42, 249.93),
            vector4(216.35, -773.48, 30.43, 249.43),
            vector4(215.02, -775.62, 30.44, 252.59),
            vector4(214.22, -778.6, 30.45, 247.99),
            vector4(213.67, -780.92, 30.45, 248.98),
            vector4(212.9, -783.52, 30.46, 249.01),
            vector4(210.97, -785.75, 30.5, 250.38),
            vector4(210.35, -788.41, 30.51, 249.85),
            vector4(209.74, -790.91, 30.51, 248.14),
            vector4(209.21, -793.47, 30.52, 249.87),
            vector4(207.96, -795.82, 30.55, 248.81),
            vector4(206.91, -798.68, 30.57, 248.97),
            vector4(205.45, -800.74, 30.6, 249.38),
            vector4(234.07, -771.23, 30.33, 249.64),
            vector4(232.09, -776.31, 30.3, 248.31),
            vector4(230.94, -778.87, 30.29, 248.97),
            vector4(230.7, -781.41, 30.28, 250.6),
            vector4(229.02, -783.81, 30.28, 250.06),
            vector4(227.64, -789.2, 30.26, 247.99),
            vector4(226.28, -791.42, 30.26, 248.95),
            vector4(225.72, -794.21, 30.24, 249.28),
            vector4(224.66, -796.59, 30.24, 247.01),
            vector4(223.2, -798.92, 30.25, 248.79),
            vector4(222.61, -801.4, 30.25, 248.1),
            vector4(221.77, -804.1, 30.26, 245.92),
            vector4(221.6, -806.74, 30.25, 247.77),
            vector4(219.83, -808.89, 30.26, 251.3),
            vector4(228.63, -768.88, 30.36, 69.31),
            vector4(227.76, -771.74, 30.35, 71.5),
            vector4(226.39, -773.88, 30.35, 68.62),
            vector4(225.43, -776.69, 30.35, 69.02),
            vector4(224.35, -778.81, 30.34, 64.93),
            vector4(224.25, -781.78, 30.33, 70.11),
            vector4(222.81, -784.16, 30.34, 72.1),
            vector4(221.16, -786.48, 30.35, 68.66),
            vector4(221.04, -789.3, 30.34, 68.07),
            vector4(219.76, -791.48, 30.34, 70.29),
            vector4(218.97, -794.38, 30.34, 68.04),
            vector4(218.34, -796.97, 30.34, 66.59),
            vector4(217.56, -799.45, 30.35, 69.51),
            vector4(216.23, -801.69, 30.37, 70.17),
            vector4(215.69, -804.56, 30.38, 68.56),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(236.32, -812.55, 29.88, 248.26),
            vector4(237.41, -809.93, 29.89, 244.26),
            vector4(238.45, -807.4, 29.9, 244.04),
            vector4(238.94, -804.82, 29.93, 248.53),
            vector4(240.36, -802.39, 29.94, 246.63),
            vector4(241.52, -799.87, 29.96, 245.68),
            vector4(242.03, -797.37, 29.98, 246.08),
            vector4(243.06, -794.79, 30.01, 249.35),
            vector4(244.27, -792.42, 30.03, 247.07),
            vector4(245.14, -789.87, 30.06, 247.13),
            vector4(246.18, -787.38, 30.08, 248.58),
            vector4(246.61, -784.52, 30.12, 248.32),
            vector4(248.17, -782.46, 30.14, 248.95),
            vector4(249.12, -779.63, 30.18, 249.01),
            vector4(249.32, -776.78, 30.22, 247.42),
            vector4(250.19, -774.3, 30.26, 248.86),
            vector4(244.75, -772.24, 30.29, 69.17),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(231.42, -810.44, 30.01, 70.18),
            vector4(231.62, -807.79, 30.03, 68.27),
            vector4(232.96, -805.51, 30.02, 66.62),
            vector4(234.88, -803.0, 30.02, 69.62),
            vector4(235.38, -800.43, 30.04, 68.23),
            vector4(236.58, -797.83, 30.05, 69.89),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(237.88, -792.75, 30.08, 66.76),
            vector4(238.84, -790.11, 30.11, 68.34),
            vector4(240.15, -787.59, 30.13, 67.55),
            vector4(241.01, -785.27, 30.15, 69.84),
            vector4(244.51, -775.07, 30.26, 70.7),
            vector4(243.65, -777.69, 30.22, 67.25),
            vector4(242.44, -779.84, 30.2, 68.04),
            vector4(241.32, -782.41, 30.18, 69.19),
        }
    },
--[[
    ['police'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(427.85052490234, -1017.9293212891),
                vector2(428.14498901367, -1030.7161865234),
                vector2(459.05325317383, -1026.896484375),
                vector2(459.12948608398, -1012.3634033203),
                vector2(449.7737121582, -1012.4426879883),
                vector2(449.38006591797, -1011.4791870117),
                vector2(434.09115600586, -1011.4317016602),
                vector2(434.05737304688, -1013.9020996094),
                vector2(427.95745849609, -1013.9678344727)
            },
            ['minZ'] = 28.10,  -- min height of the parking zone
            ['maxZ'] = 30.97,  -- max height of the parking zone
        },
        label = "Police",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(449.57, -1024.85, 28.06, 5.95),
            vector4(446.04, -1025.62, 28.14, 5.18),
            vector4(442.53, -1025.66, 28.2, 6.39),
            vector4(438.8, -1025.99, 28.27, 7.28),
            vector4(435.41, -1026.74, 28.35, 3.84),
        }
    },
    ['policevinewood'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(635.9017944336, 22.776243209838),
                vector2(631.24255371094, 20.99640083313),
                vector2(577.78063964844, 37.087455749512),
                vector2(575.10681152344, 41.017986297608),
                vector2(593.0210571289, 39.446407318116)
            },
            ['minZ'] = 86.00,  -- min height of the parking zone
            ['maxZ'] = 98.0,  -- max height of the parking zone
        },
        label = "Vinewood Police Station",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(581.11, 38.73, 92.21, 265.09),
            vector4(586.74, 37.68, 91.64, 260.63),
            vector4(591.54, 36.7, 91.16, 256.37),
            vector4(597.57, 34.71, 90.54, 250.52),
            vector4(604.28, 32.61, 89.86, 251.49),
            vector4(609.33, 30.9, 89.33, 251.35),
            vector4(613.83, 29.36, 88.87, 251.19),
            vector4(619.65, 27.35, 88.26, 250.98),
            vector4(627.16, 24.64, 87.48, 247.88)
        }
    },
    ['mechanic'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-321.17425537109, -166.47213745117),
                vector2(-335.71780395508, -160.89682006836),
                vector2(-330.77108764648, -147.37300109863),
                vector2(-323.12185668945, -150.04736328125),
                vector2(-322.16271972656, -148.189453125),
                vector2(-315.29968261719, -150.44552612305)
            },
            ['minZ'] = 36.15,  -- min height of the parking zone
            ['maxZ'] = 38.22,  -- max height of the parking zone
            debug = false,
        },
        label = 'LS Customs',
        type = 'job',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        job = 'mechanic',
        debug = false
    },]]
    ['apartments'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-363.8267211914, -862.93182373046),
                vector2(-268.29055786132, -885.1919555664),
                vector2(-282.65710449218, -925.12030029296),
                vector2(-298.25598144532, -919.4287109375),
                vector2(-302.71203613282, -930.14245605468),
                vector2(-297.5908203125, -932.38952636718),
                vector2(-310.84530639648, -969.61614990234),
                vector2(-289.9221496582, -977.25311279296),
                vector2(-296.0697631836, -994.66876220704),
                vector2(-364.01559448242, -969.91552734375)
            },
            ['minZ'] = 30.0,  -- min height of the parking zone
            ['maxZ'] = 33.0,  -- max height of the parking zone

        },
        label = 'Alta Apartments',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-297.71, -990.11, 30.76, 338.79),
            vector4(-301.09, -988.82, 30.76, 339.11),
            vector4(-304.64, -987.72, 30.76, 339.36),
            vector4(-308.09, -986.34, 30.76, 339.47),
            vector4(-311.46, -985.08, 30.76, 339.5),
            vector4(-315.07, -983.98, 30.76, 339.18),
            vector4(-318.71, -982.49, 30.76, 338.43),
            vector4(-285.76, -888.04, 30.76, 168.44),
            vector4(-289.39, -887.34, 30.76, 168.59),
            vector4(-292.99, -886.36, 30.76, 167.4),
            vector4(-296.78, -885.82, 30.75, 167.93),
            vector4(-300.35, -885.14, 30.76, 167.76),
            vector4(-303.82, -884.06, 30.76, 167.76),
            vector4(-307.59, -883.44, 30.76, 167.24),
            vector4(-311.16, -882.7, 30.76, 166.92),
            vector4(-314.74, -881.99, 30.75, 166.91),
            vector4(-318.34, -881.19, 30.75, 167.5),
            vector4(-322.02, -880.47, 30.75, 167.75),
            vector4(-325.62, -879.65, 30.75, 168.31),
            vector4(-329.11, -878.9, 30.75, 168.35),
            vector4(-332.88, -878.22, 30.75, 167.35),
            vector4(-336.55, -877.38, 30.75, 168.02),
            vector4(-340.1, -876.67, 30.75, 167.45),
            vector4(-343.78, -875.91, 30.75, 167.01),
            vector4(-352.86, -874.08, 30.75, 0.76),
            vector4(-360.26, -889.43, 30.75, 269.23),
            vector4(-360.46, -893.17, 30.75, 268.23),
            vector4(-360.24, -896.83, 30.75, 270.26),
            vector4(-360.37, -900.58, 30.75, 268.61),
            vector4(-360.29, -904.27, 30.75, 269.75),
            vector4(-360.14, -908.01, 30.75, 270.4),
            vector4(-360.5, -911.66, 30.76, 269.55),
            vector4(-360.12, -915.4, 30.76, 269.63),
            vector4(-360.28, -919.07, 30.76, 270.11),
            vector4(-360.56, -922.77, 30.75, 268.41),
            vector4(-360.46, -926.49, 30.76, 270.43),
            vector4(-360.37, -930.12, 30.76, 269.72),
            vector4(-360.22, -933.88, 30.76, 270.34),
            vector4(-360.28, -937.58, 30.76, 269.99),
            vector4(-360.47, -941.31, 30.75, 269.54),
            vector4(-360.28, -944.99, 30.76, 270.14),
            vector4(-360.32, -948.72, 30.76, 269.82),
            vector4(-360.38, -952.44, 30.75, 269.95),
            vector4(-360.57, -956.16, 30.76, 270.31),
            vector4(-322.02, -981.29, 30.76, 339.92),
            vector4(-325.56, -980.1, 30.76, 340.1),
            vector4(-329.0, -978.69, 30.76, 338.49),
            vector4(-332.49, -977.59, 30.76, 339.58),
            vector4(-335.9, -976.3, 30.76, 339.7),
            vector4(-339.43, -975.08, 30.76, 339.47),
            vector4(-342.7, -973.45, 30.76, 338.85),
            vector4(-326.58, -956.4, 30.75, 250.37),
            vector4(-325.37, -952.84, 30.76, 250.47),
            vector4(-324.03, -949.43, 30.76, 250.37),
            vector4(-322.69, -945.96, 30.75, 249.91),
            vector4(-321.47, -942.43, 30.76, 250.29),
            vector4(-320.23, -939.06, 30.76, 250.38),
            vector4(-318.8, -935.56, 30.76, 249.46),
            vector4(-317.66, -932.03, 30.76, 250.73),
            vector4(-316.5, -928.43, 30.76, 250.15),
            vector4(-345.07, -932.2, 30.76, 69.27),
            vector4(-343.99, -928.61, 30.76, 70.11),
            vector4(-342.58, -925.18, 30.76, 70.69),
            vector4(-341.39, -921.67, 30.76, 69.83),
            vector4(-327.34, -924.44, 30.76, 69.82),
            vector4(-328.81, -927.89, 30.76, 69.43),
            vector4(-330.09, -931.33, 30.76, 70.81),
            vector4(-331.29, -934.83, 30.76, 70.29),
            vector4(-332.71, -938.34, 30.76, 69.75),
            vector4(-333.91, -941.81, 30.76, 69.46),
            vector4(-335.02, -945.3, 30.75, 71.24),
            vector4(-336.56, -948.74, 30.75, 70.65),
            vector4(-337.69, -952.22, 30.76, 70.31),
            vector4(-340.74, -902.45, 30.75, 167.89),
            vector4(-337.18, -903.24, 30.75, 167.65),
            vector4(-333.64, -903.98, 30.75, 167.05),
            vector4(-329.93, -904.61, 30.75, 167.95),
            vector4(-326.38, -905.62, 30.75, 168.51),
            vector4(-322.65, -906.2, 30.75, 167.96),
            vector4(-318.98, -906.94, 30.75, 168.06),
            vector4(-315.39, -907.89, 30.75, 166.81),
            vector4(-311.81, -908.81, 30.75, 167.5),
            vector4(-308.14, -909.33, 30.75, 167.34),
            vector4(-285.56, -921.9, 30.76, 70.14),
            vector4(-283.75, -918.52, 30.76, 70.23),
            vector4(-282.97, -914.81, 30.75, 69.93),
            vector4(-281.65, -911.4, 30.76, 69.49),
            vector4(-280.5, -908.04, 30.76, 69.51),
            vector4(-279.28, -904.45, 30.76, 70.18),
            vector4(-302.07, -933.44, 30.75, 69.9),
            vector4(-303.19, -937.09, 30.76, 70.71),
            vector4(-304.56, -940.34, 30.76, 70.04),
            vector4(-305.74, -943.95, 30.76, 70.49),
            vector4(-307.19, -947.34, 30.76, 69.04),
            vector4(-308.26, -950.95, 30.76, 70.24),
            vector4(-309.63, -954.35, 30.76, 68.9),
            vector4(-310.83, -957.88, 30.76, 69.56),
            vector4(-312.07, -961.38, 30.76, 70.21),
            vector4(-313.39, -964.8, 30.76, 68.92),
            vector4(-298.26, -899.82, 30.66, 346.23),
            vector4(-302.47, -898.86, 30.66, 348.7),
            vector4(-305.9, -898.52, 30.66, 351.35),
            vector4(-309.58, -897.38, 30.66, 347.24),
            vector4(-313.04, -896.37, 30.65, 349.98),
            vector4(-316.74, -895.46, 30.65, 347.83),
            vector4(-320.36, -894.95, 30.65, 348.97),
            vector4(-324.05, -893.86, 30.65, 348.71),
            vector4(-327.67, -893.18, 30.65, 347.61),
            vector4(-331.02, -892.69, 30.65, 346.03),
            vector4(-334.83, -891.72, 30.65, 350.2),
            vector4(-338.6, -891.08, 30.65, 348.34),
        },
        debug = false

    },
    
    ['cityhall'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-475.55926513672, -222.67430114746),
            vector2(-472.03475952148, -220.5464630127),
            vector2(-498.85870361328, -173.8444366455),
            vector2(-502.67169189454, -175.96449279786),
            },
            ['minZ'] = 35.0,  -- min height of the parking zone
            ['maxZ'] = 39.0,  -- max height of the parking zone
        },
        label = 'City Hall Parking',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        showBlip = true,
        blipcoords = vector3(215.9499, -809.698, 30.731),
        blipName = "Public Parking",
        blipNumber = 357,
        ["ParkingSpots"] = {
            vector4(-475.26, -219.26, 36.05, 30.12),
            vector4(-478.26, -214.06, 36.21, 30.11),
            vector4(-481.41, -208.59, 36.37, 30.32),
            vector4(-484.34, -203.49, 36.52, 30.67),
            vector4(-487.17, -198.51, 36.67, 30.37),
            vector4(-490.26, -193.18, 36.83, 29.72),
            vector4(-493.21, -187.98, 36.99, 29.64),
            vector4(-496.19, -182.75, 37.14, 29.96),
            vector4(-499.21, -177.5, 37.3, 30.1),
        },
        debug = false
    },
    --[[['pdfront'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(405.13595581054, -998.57788085938),
            vector2(410.59521484375, -1002.8664550782),
            vector2(410.91711425782, -979.44134521484),
            vector2(405.4065246582, -974.57928466796),
            },
            ['minZ'] = 28.0,  -- min height of the parking zone
            ['maxZ'] = 31.0,  -- max height of the parking zone

        },
        label = 'Front of MRPD',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(407.44, -997.7, 28.94, 52.87),
            vector4(407.55, -992.85, 28.94, 51.63),
            vector4(407.7, -988.49, 28.94, 52.48),
            vector4(407.42, -983.95, 28.94, 51.54),
            vector4(407.68, -979.62, 28.94, 51.69),
        },
        debug = false
    },
    ['pdgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
               	vector2(448.33670043945, -998.80895996094),
                vector2(423.15826416016, -998.98077392578),
                vector2(423.48205566406, -973.94946289063),
                vector2(428.74041748047, -974.35272216797),
                vector2(428.564453125, -984.02642822266),
                vector2(448.21347045898, -983.94213867188),
            },
            ['minZ'] = 24.0,  -- min height of the parking zone
            ['maxZ'] = 27.0,  -- max height of the parking zone
        },
        label = 'MRPD Garage',
        type = 'job',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(445.67, -997.0, 24.81, 269.98),
            vector4(445.83, -994.31, 25.21, 267.42),
            vector4(445.53, -991.53, 25.21, 269.55),
            vector4(445.51, -988.84, 25.21, 269.43),
            vector4(445.55, -986.12, 25.21, 270.71),
            vector4(437.35, -986.1, 25.21, 89.31),
            vector4(437.27, -988.86, 25.21, 90.05),
            vector4(437.32, -991.57, 25.21, 90.47),
            vector4(437.3, -994.26, 25.21, 90.38),
            vector4(437.31, -996.97, 25.21, 90.1),
            vector4(425.76, -997.07, 25.21, 270.57),
            vector4(425.72, -994.41, 25.21, 269.31),
            vector4(425.72, -991.68, 25.21, 269.53),
            vector4(425.69, -989.03, 25.21, 270.22),
            vector4(425.69, -984.26, 25.21, 269.65),
            vector4(425.67, -981.55, 25.21, 269.33),
            vector4(425.68, -978.88, 25.21, 269.76),
            vector4(425.68, -976.24, 25.21, 270.49),
        },
        debug = false
    },
    ['helipad'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Helipad',
        showBlip = true,
        blipName = "Helipad",
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ["ParkingSpots"] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 10.0,
        debug = false
    },
    ['shoreheli'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1774.4047851562, 3246.9484863281),
                vector2(1762.30859375, 3244.3928222656),
                vector2(1765.3605957031, 3231.908203125),
                vector2(1777.5689697266, 3235.4580078125)
            },
            ['minZ'] = 40.0,  -- min height of the parking zone
            ['maxZ'] = 46.0,  -- max height of the parking zone
        },
        label = 'Sandy Shores Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Sandy Shores Helipad',
        showBlip = true,
        blipName = 'Helipad',
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(1769.62, 3240.14, 42.01),
        ['ParkingSpots'] = {
            vector4(1769.62, 3240.14, 42.01, 60.44),
        },
        ParkingDistance = 100.0,
        debug = false
    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1235.3253173828, -3378.4008789062),
                vector2(-1284.2642822266, -3350.1474609375),
                vector2(-1284.5589599609, -3350.7241210938),
                vector2(-1289.5042724609, -3348.0512695312),
                vector2(-1308.7587890625, -3382.4091796875),
                vector2(-1307.0877685547, -3383.8776855469),
                vector2(-1307.6185302734, -3385.4577636719),
                vector2(-1306.0087890625, -3386.4213867188),
                vector2(-1308.2755126953, -3391.1662597656),
                vector2(-1306.2180175781, -3392.1394042969),
                vector2(-1264.1188964844, -3420.0451660156),
                vector2(-1258.6077880859, -3412.1069335938),
                vector2(-1258.1317138672, -3412.4846191406),
                vector2(-1237.5152587891, -3387.8581542969),
                vector2(-1236.4268798828, -3387.1162109375),
                vector2(-1233.0942382812, -3380.8115234375),
                vector2(-1233.4357910156, -3380.13671875),
                vector2(-1235.1755371094, -3379.1962890625)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Air Depot',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'AIR DEPOT',
        showBlip = true,
        blipName = 'Air Depot',
        blipNumber = 569,
        blipColor = 33,
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 200.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1286.09, -3363.24, 14.54, 275.59),
            vector4(-1292.65, -3383.11, 14.54, 280.17),
            vector4(-1252.97, -3385.7, 14.54, 11.75),
            vector4(-1268.63, -3402.56, 14.54, 14.72),
            vector4(-1280.83, -3395.7, 14.54, 330.47),

        },
    },
    ['boathouse1'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-778.9291381836, -1513.3040771484),
                vector2(-803.83276367188, -1521.1665039062),
                vector2(-816.67852783204, -1493.2373046875),
                vector2(-791.34436035156, -1481.7546386718)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Boat House',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-784.84, -1498.33, 0.2),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-798.39, -1499.15, 0.37, 109.87),
            vector4(-797.47, -1506.73, 0.3, 114.49),
        },
        ExitWarpLocations = {
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        },
    },
    ['intairport'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-992.59680175781, -2949.84375),
                vector2(-1030.8975830078, -3016.2927246094),
                vector2(-1030.3382568359, -3016.5925292969),
                vector2(-1029.6291503906, -3017.0434570312),
                vector2(-1028.7434082031, -3018.0705566406),
                vector2(-1022.2585449219, -3021.5798339844),
                vector2(-1021.3436279297, -3020.5522460938),
                vector2(-1016.1632080078, -3023.6635742188),
                vector2(-1016.3262329102, -3024.7385253906),
                vector2(-966.09301757812, -3052.3435058594),
                vector2(-965.42352294922, -3051.1135253906),
                vector2(-961.01477050781, -3052.7600097656),
                vector2(-923.76300048828, -2978.2124023438)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Airport Hangar',
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'Airport Hangar',
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 359,
        blipColor = 50,
        blipcoords = vector3(-930.23, -2995.38, 19.85),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-985.04, -2965.05, 14.55, 128.92),
            vector4(-964.84, -2974.78, 14.55, 125.92),
            vector4(-945.49, -2985.63, 14.55, 117.77),
            vector4(-967.17, -3034.71, 14.55, 14.16),
            vector4(-990.13, -3022.86, 14.55, 15.42),
            vector4(-1010.91, -3012.56, 14.55, 2.31),
            vector4(-968.09, -3004.59, 14.55, 62.25)
        },
    },]]












































    ['pinkcage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(312.88, -182.58),
            vector2(298.48, -223.48),
            vector2(346.97, -243.18),
            vector2(360.61, -196.97),
            },
            ['minZ'] = 53.00,  -- min height of the parking zone
            ['maxZ'] = 55.50,  -- max height of the parking zone
        },
        label = "Pink Cage",
        showBlip = false,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(335.63, -213.84, 54.09, 68.07),
            vector4(335.15, -217.33, 54.09, 66.99),
            vector4(337.29, -210.68, 54.09, 65.32),
            vector4(338.48, -207.54, 54.09, 67.34),
            vector4(319.03, -199.92, 54.09, 247.83),
            vector4(316.79, -202.85, 54.09, 241.37),
            vector4(314.95, -205.96, 54.09, 241.96),
            vector4(314.06, -209.34, 54.09, 246.54),






        },
    },
    
}


HouseGarages = {} -- DO NOT TOUCH!

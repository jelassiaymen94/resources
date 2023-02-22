Config = {}
Config.Debug = false

Config.RemoveItemsOnDeath = true 
Config.UseTokens = false -- false = use price, true = use cw-tokens
Config.Cooldown = 60 --- Cooldown until next allowed meth run
Config.DefaultValues = {
    armor = 25,
    accuracy = 15,
}
--- METH RUN ---

local MethBoss = {
    coords = vector4(-2609.76, 1867.66, 167.32, 347.67),
    model = 'g_m_m_mexboss_01',
    missionTitle = "Start Meth Run",
    available = {from = 1, to = 24},
}

local MethItems = {
    FetchItemLocation = vector4(3828.87, 4471.85, 3.0, 176.02),
    FetchItemTime = math.random(60000, 120000), -- time it takes for the item to activate
    FetchItem = 'securitycase', -- item (inventory)
    FetchItemProp = 'hei_prop_hei_security_case', -- item (world object)
    FetchItemContents = 'meth_cured', -- item that drops from FetchItem after FetchItemTime is over
    FetchItemContentsAmount = math.random(1, 2), -- Amount of FetchItemContent items
    FetchItemMinigame = {
        Type = 'Scrambler',
        Variables = {braille,20,1 }
    }
}

local MethGuards = {
    --ORIGINAL
        { coords = vector4(3820.32, 4458.0, 3.57, 230.37),  model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},
       { coords = vector4(3819.05, 4464.62, 3.61, 162.91), model = 'g_m_y_lost_03', weapon = 'WEAPON_microsmg'},
        { coords = vector4(3810.61, 4469.97, 3.97, 110.91), model = 'g_m_y_lost_02', weapon = 'WEAPON_assaultrifle'},
        { coords = vector4(3803.51, 4464.97, 4.81, 18.9), model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},
        { coords = vector4(3809.33, 4455.14, 4.13, 352.57), model = 'g_m_y_lost_03', weapon = 'WEAPON_smg'},
        { coords = vector4(3800.44, 4452.45, 4.54, 309.68), model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3799.84, 4474.73, 5.99, 108.55), model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},
        { coords = vector4(3820.13, 4483.23, 5.99, 66.19), model = 'g_m_y_lost_03', weapon = 'WEAPON_assaultrifle'},
        { coords = vector4(3849.42, 4463.54, 2.7, 59.84),  model = 'g_m_y_lost_02', weapon = 'WEAPON_microsmg'},
        { coords = vector4(3829.66, 4458.0, 2.75, 88.73),  model = 'g_m_y_lost_01', weapon = 'WEAPON_microsmg'},

        -- BRIDGE
        { coords = vector4(3786.54, 4464.37, 5.97, 89.05),  model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3476.35, 4650.87, 55.18, 344.47),  model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},
        { coords = vector4(3488.36, 4642.55, 55.95, 14.72),  model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3491.79, 4655.3, 54.3, 27.11),  model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3495.24, 4672.08, 52.81, 55.79),  model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},
        { coords = vector4(3474.61, 4660.47, 54.42, 347.16),  model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},

    -- ROOF
        { coords = vector4(3829.73, 4438.97, 7.89, 17.18),  model = 'g_m_y_lost_01', weapon = 'WEAPON_assaultrifle'},
        { coords = vector4(3821.25, 4438.71, 8.12, 38.67),  model = 'g_m_y_lost_03', weapon = 'WEAPON_assaultrifle'},
--BOAT
       { coords = vector4(3820.21, 4451.37, 5.06, 33.13),  model = 'g_m_y_lost_02', weapon = 'WEAPON_assaultrifle'},
        { coords = vector4(3831.19, 4450.34, 5.47, 16.81),  model = 'g_m_y_lost_03', weapon = 'WEAPON_smg'},
        { coords = vector4(3823.77, 4471.73, 5.19, 179.88),  model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3830.72, 4479.63, 7.37, 312.49),  model = 'g_m_y_lost_03', weapon = 'WEAPON_assaultrifle'},

        { coords = vector4(3838.24, 4468.96, 1.35, 101.94),  model = 'g_m_y_lost_01', weapon = 'WEAPON_microsmg'},
        { coords = vector4(3799.57, 4439.08, 4.97, 317.84),  model = 'g_m_y_lost_01', weapon = 'WEAPON_smg'},
        { coords = vector4(3786.54, 4448.74, 4.93, 54.42),  model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3781.56, 4479.63, 6.21, 117.56),  model = 'g_m_y_lost_03', weapon = 'WEAPON_smg'},
        { coords = vector4(3788.17, 4499.86, 7.14, 103.92),  model = 'g_m_y_lost_01', weapon = 'WEAPON_assaultrifle'},
        { coords = vector4(3795.26, 4492.27, 5.95, 151.09),  model = 'g_m_y_lost_03', weapon = 'WEAPON_microsmg'},
        { coords = vector4(3819.54, 4493.15, 4.26, 357.57),  model = 'g_m_y_lost_03', weapon = 'WEAPON_smg'},
        { coords = vector4(3830.43, 4473.99, 3.04, 140.7),  model = 'g_m_y_lost_02', weapon = 'WEAPON_smg'},
        { coords = vector4(3826.35, 4470.67, 3.46, 193.02),  model = 'g_m_y_lost_01', weapon = 'WEAPON_microsmg'},
}
-- vector4(3830.72, 4479.63, 7.37, 312.49)
local MethVehicles = {
    { coords = vector4(3814.76, 4461.75, 3.6, 230), model = 'slamvan2'},
    { coords = vector4(3487.41, 4646.9, 55.61, 60.36), model = 'slamvan2'},
    { coords =vector4(3479.6, 4651.81, 55.3, 327.2), model = 'gburrito'},
}
 -- vector4(3483.84, 4642.94, 55.88, 303.26)
local MethSpecialRewards = {
    { Item = 'methylamine', Amount = math.random(1, 3), Chance = 100 },
}

local MethJobPayout = math.random(60000, 84000)
local MethJob = {
    JobName = 'meth',
    Token = 'lme',
    Boss = MethBoss,
    Guards = MethGuards,
    Vehicles = MethVehicles,
    Items = MethItems,
    MinimumPolice = 1,
    RunCost = 35000,
    Payout =  MethJobPayout,
    SpecialRewards = MethSpecialRewards  
}

-- Cocaine job
local CokeBoss = {
    coords = vector4(20820000000.29, 1869.73,  167.32, 277.32),
    model = 's_m_m_movprem_01',
    missionTitle = "Coke Run",
    animation = 'WORLD_HUMAN_GUARD_STAND', -- OPTIONAL https://pastebin.com/6mrYTdQv
    available = {from = 6, to = 18}
}

local CokeItems = {
    FetchItemLocation = vector4(20820000000.82, -1019.6, 12.62, 180.78),
    FetchItemTime = 120000, -- time it takes for the item to activate
    FetchItem = 'securitycase', -- item (inventory)
    FetchItemProp = 'hei_prop_hei_security_case', -- item (world object)
    FetchItemContents = 'coke_pure', -- item that drops from FetchItem after FetchItemTime is over
    FetchItemContentsAmount = 20, -- Amount of FetchItemContent items
    FetchItemMinigame = {
        Type = 'Circle',
        Variables = { 2, 20 }
    }
}

-- These will be used to pick random spots for the guards
local CokeGuardPositions = {
    vector4(-2048.04, -1033.31, 2.57, 333.61),
    vector4(-2061.42, -1032.78, 5.88, 161.71),
    vector4(-2077.04, -1024.95, 5.88, 70.61),
    vector4(-2071.45, -1020.09, 5.88, 66.23),
    vector4(-2078.82, -1020.1, 5.88, 10.66),
    vector4(-2089.93, -1013.48, 5.88, 258.26),
    vector4(-2091.54, -1021.34, 5.91, 250.19),
    vector4(-2092.88, -1008.09, 5.88, 325.87),
    vector4(-2105.32, -1005.26, 8.97, 334.65),
    vector4(-2108.19, -1016.64, 8.97, 208.1),
    vector4(-2096.17, -1018.9, 8.97, 108.6),
    vector4(-2093.38, -1010.66, 8.97, 38.31),
    vector4(-2085.1, -1018.12, 8.97, 72.87),
    vector4(-2077.95, -1027.82, 8.97, 173.91),
    vector4(-2074.35, -1014.07, 8.97, 313.32),
    vector4(-2053.42, -1031.69, 8.97, 347.54),
    vector4(-2050.5, -1026.81, 8.97, 188.6),
    vector4(-2037.12, -1035.75, 8.97, 263.51),
    vector4(-2035.78, -1031.22, 8.97, 232.05),
    vector4(-2057.16, -1020.12, 11.91, 28.73),
    vector4(-2062.66, -1032.35, 11.91, 141.95),
    vector4(-2059.16, -1029.9, 11.91, 265.68),
    vector4(-2084.53, -1020.01, 12.78, 46.12)
}

local CokeCivilians = {
    { coords = vector4(-2084.22, -1018.2, 12.78, 258.77), model = 'mp_m_boatstaff_01' },
    { coords = vector4(-2113.34, -1006.53, 9.64, 100.85), model = 'a_f_y_beach_01', animation = 'WORLD_HUMAN_SUNBATHE' },
    { coords = vector4(-2114.71, -1010.66, 9.63, 66.88), model = 'a_f_y_beach_01', animation = 'WORLD_HUMAN_SUNBATHE_BACK' },
}

local CokeGuards = {
    { model = 's_m_m_highsec_02', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
    { model = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
    { model = 's_m_m_highsec_02', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
    { model = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
    { model = 's_m_m_highsec_02', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(-2082.71, -1012.14, 5.88, 159.0), model = 's_m_m_highsec_01', weapon = 'WEAPON_PISTOL50'},
    { coords = vector4(-2041.38, -1032.34, 11.98, 88.73), model = 's_m_m_highsec_01', weapon = 'WEAPON_SMG', armor = 100 },
}

local CokeVehicles = {
    { coords = vector4(-2014.52, -1052.52, -0.53, 285.69), model = 'speeder'}
}

local CokeSpecialRewards = {
    { Item = 'cokebaggy', Amount = math.random(20, 30), Chance = 90 },
    { Item = '10kgoldchain', Amount = 1, Chance = 70 }
}

local CokeMessages = {
    Sender = 'Unknown',
    Subject = 'Briefcase Location',
    Message = "Updated your gps with the location to the yacht. Get over there and find the fucking briefcase. Retrieve whats inside it and bring it back to me. I've given you a special key that would be used to remove the first layer of security on the case."
}

local CokeJob = {
    JobName = 'coke',
    Token = 'raidcocaine',
    Boss = CokeBoss,
    Guards = CokeGuards,
    GuardPositions = CokeGuardPositions,
    Civilians = CokeCivilians,
    Vehicles = CokeVehicles,
    Items = CokeItems,
    MinimumPolice = 0,
    RunCost = 15000,
    Payout =  math.random(150000, 220000),
    SpecialRewards = CokeSpecialRewards,
    Messages = CokeMessages 
}

-- Weed job
local WeedBoss = {
    coords = vector4(20820000000.69, -1655.61, 29.36, 60.04),
    model = 'g_f_importexport_01',
    missionTitle = "Accept weed raid",
    animation = 'WORLD_HUMAN_SMOKING_POT', -- OPTIONAL https://pastebin.com/6mrYTdQv
    available = {from = 10, to = 20}
}

local WeedItems = {
    FetchItemLocation = vector4(2194.9, 5601.85, 53.37, 343.94),
    FetchItemTime = 30000, -- time it takes for the item to activate
    FetchItem = 'securitycase', -- item (inventory)
    FetchItemProp = 'hei_prop_hei_security_case', -- item (world object)
    FetchItemContents = 'weed_notes', -- item that drops from FetchItem after FetchItemTime is over
    FetchItemContentsAmount = 1 -- Amount of FetchItemContent items
}

local WeedGuards = {
        { coords = vector4(2220.62, 5614.49, 54.72, 100.83), model = 'a_m_m_hillbilly_02', weapon = 'WEAPON_PISTOL', accuracy = 30, armor = 25 },
        { coords = vector4(2221.24, 5602.82, 54.76, 153.79), model = 'a_m_m_hillbilly_02', weapon = 'WEAPON_PISTOL', accuracy = 30, armor = 25 },
        { coords = vector4(2211.45, 5574.69, 53.58, 23.77), model = 'a_m_m_hillbilly_02', weapon = 'WEAPON_PISTOL', accuracy = 30, armor = 25 },
        { coords = vector4(2195.79, 5574.87, 53.83, 0.81), model = 'a_m_m_rurmeth_01', weapon = 'WEAPON_PISTOL', accuracy = 30, armor = 25 },
        { coords = vector4(2246.8, 5561.69, 52.1, 226.76), model = 'a_m_m_rurmeth_01', weapon = 'WEAPON_PISTOL', accuracy = 30, armor = 25 },
        { coords = vector4(2250.25, 5563.66, 52.15, 186.65), model = 'a_m_m_rurmeth_01', weapon = 'WEAPON_PISTOL', accuracy = 30, armor = 25 },
        { coords = vector4(2181.14, 5554.24, 53.93, 167.81), model = 'a_m_m_hillbilly_01', weapon = 'WEAPON_DBSHOTGUN', accuracy = 30, armor = 25 },
}

local WeedVehicles = {
    { coords = vector4(2207.95, 5600.41, 53.78, 354.28), model = 'pony2'}
}

-- Add random chance of getting different kind of weed. maybe. figure out something for the special item too
local WeedSpecialRewards = {
    { Item = 'weed_purple-haze', Amount = math.random(20, 30), Chance = 90 },
    { Item = 'thermite', Amount = 1, Chance = 10 }
}

local WeedJob = {
    JobName = 'weed',
    Token = 'raidweed',
    Boss = WeedBoss,
    Guards = WeedGuards,
    Vehicles = WeedVehicles,
    Items = WeedItems,
    MinimumPolice = 0,
    RunCost = 500,
    Payout =  math.random(15000, 22000),
    SpecialRewards = WeedSpecialRewards  
}

-- Clown job
local ClownBoss = {
    coords = vector4(99973.7594, -1651.8781, 29.4250, 20.1910),
    model = 's_m_m_strperf_01',
    missionTitle = "Do you hate clowns too?  to get your hands dirty?",
    animation = 'WORLD_HUMAN_HUMAN_STATUE', -- OPTIONAL https://pastebin.com/6mrYTdQv
    available = { from = 1 , to = 24 }
}

local ClownItems = {
    FetchItemLocation = vector4(-1578.44, 2099.56, 67.54, 343.32),
    FetchItemTime = 30000, -- time it takes for the item to activate
    FetchItem = 'securitycase', -- item (inventory)
    FetchItemProp = 'hei_prop_hei_security_case', -- item (world object)
    FetchItemContents = 'lockpick', -- item that drops from FetchItem after FetchItemTime is over
    FetchItemContentsAmount = 1 -- Amount of FetchItemContent items
}

-- These will be used to pick random spots for the guards
local ClownGuardPositions = {
    vector4(-1579.7, 2097.14, 68.85, 9.44),
    vector4(-1566.39, 2100.68, 68.97, 346.99),
    vector4(-1581.25, 2089.2, 70.51, 31.35),
    vector4(-1586.97, 2104.1, 67.43, 336.84),
    vector4(-1583.12, 2109.8, 66.01, 314.2),
    vector4(-1571.17, 2118.67, 62.83, 343.53),
    vector4(-1568.33, 2118.86, 62.76, 283.28),
    vector4(-1569.99, 2107.57, 65.99, 212.12),    
}

local ClownGuards = {
        { model = 's_m_y_clown_01', weapon = 'weapon_snspistol'},
        { model = 's_m_y_clown_01', weapon = 'weapon_snspistol'},
        { model = 's_m_y_clown_01', weapon = 'weapon_snspistol'},
        { model = 's_m_y_clown_01', weapon = 'weapon_snspistol'},
        { coords = vector4(-1575.7, 2100.51, 68.36, 91.81), model = 's_m_y_clown_01', weapon = 'weapon_snspistol'},
        { coords = vector4(-1578.12, 2101.79, 68.15, 143.86), model = 's_m_y_clown_01', weapon = 'weapon_minismg'},
}

local ClownVehicles = {
    { coords = vector4(-1582.67, 2098.87, 70.23, 12.97), model = 'speedo2'}
}

local ClownSpecialRewards = {
    { Item = 'xtcbaggy', Amount = math.random(10, 30), Chance = 90 },
    { Item = 'nitrous', Amount = 1, Chance = 30 }
}

local ClownMessages = {
    Sender = 'Unknown',
    Subject = 'HONK HONK',
    Message = "Honk honk mother fucker it's me. Time to pie some clowns! Send you the GPS location of where they are. Head over there and steal the secrets of the clowns for me 🗿"
}

local ClownJob = {
    JobName = 'clown',
    Boss = ClownBoss,
    Guards = ClownGuards,
    GuardPositions = ClownGuardPositions,
    Vehicles = ClownVehicles,
    Items = ClownItems,
    MinimumPolice = 0,
    RunCost = 200,
    Payout =  math.random(3000, 4000),
    SpecialRewards = ClownSpecialRewards,
    Messages = ClownMessages
}

-- Materials job
local ArtBoss = {
    coords = vector4(-1344.6625, 45.6245, 55.2457, 310.6857),
    model = 'a_m_m_golfer_01',
    missionTitle = "Accept Scrap Job",
    animation = 'WORLD_HUMAN_GOLF_PLAYER', -- OPTIONAL https://pastebin.com/6mrYTdQv
    available = {from = 1, to = 24}
}
-- 930.1734, -1628.7979, 39.8120, 305.8762
local ArtItems = {
    FetchItemLocation = vector4(933.4912, -1628.3762, 44.5679, 82.8663),
    FetchItemTime = 180000, -- time it takes for the item to activate
    FetchItem = 'securitycase', -- item (inventory)
    FetchItemProp = 'ex_prop_adv_case_sm_03', -- item (world object)
    FetchItemContents = 'deed', -- item that drops from FetchItem after FetchItemTime is over
    FetchItemContentsAmount = 1, -- Amount of FetchItemContent items
    FetchItemMinigame = {
        Type = 'Circle',
        Variables = { 10, 11 }
    },
    FetchItemRandom = {
        CircleCenter = vector3(946.9948, -1630.9601, 30.3186),
        Locations = {
            vector4(963.7053, -1644.8999, 29.9198, 43.4231),
            vector4(964.8780, -1635.0586, 35.5911, 254.7872),
            vector4(932.8581, -1628.3937, 43.50679, 74.8320),
        }
    }
}

-- These will be used to pick random spots for the guards
local ArtGuardPositions = {
    --[[vector4(967.5609, -1626.4957, 30.1106, 357.4035),
    vector4(967.5854, -1638.9662, 30.1107, 177.0497),]]
    vector4(945.8005, -1634.7710, 35.0687, 81.2633),
    vector4(961.3444, -1629.8660, 30.3073, 66.2601),
    vector4(963.8297, -1631.9226, 30.3290, 180.9377),
    vector4(960.5316, -1634.4414, 30.3073, 356.0388),
    vector4(945.7532, -1635.4476, 30.5693, 304.5635),
    vector4(948.8224, -1641.7803, 30.3053, 354.8971),
    vector4(953.1635, -1640.0913, 30.3214, 90.0617),
    vector4(962.7858, -1645.0768, 30.9100, 14.7892),
    vector4(945.2003, -1627.1417, 30.3073, 134.9139),
    vector4(933.6765, -1628.2472, 35.0670, 260.2715),
    vector4(949.1882, -1635.6273, 35.6925, 72.1254),
    vector4(953.4191, -1626.2211, 35.8388, 219.9693),
    vector4(962.3577, -1625.9961, 36.0169, 138.3839),
    vector4(955.2947, -1634.9484, 35.6925, 321.7735),
    vector4(921.6250, -1627.3228, 39.8120, 243.5775),
    vector4(936.9341, -1631.4695, 39.8221, 54.7177),
    vector4(950.5989, -1627.9938, 30.3074, 295.5002),
    
}

local ArtCivilians = {
   -- { coords = vector4(954.7362, -1626.9626, 30.0842, 272.5546), model = '',animation = 'PROP_HUMAN_BBQ' },
    { coords = vector4(955.8776, -1627.6030, 31.2844, 46.2528), model = 'a_f_y_beach_01', animation = 'WORLD_HUMAN_SMOKING_POT' },
    { coords = vector4(954.2493, -1626.5699, 30.8841, 226.4920), model = 'a_f_y_beach_01', animation = 'WORLD_HUMAN_SMOKING_POT' },
    { coords = vector4(967.3304, -1630.0063, 30.1106, 270.0336), model = 'g_m_m_mexboss_02', animation = 'WORLD_HUMAN_SMOKING_POT' },
}

local ArtGuards = {
    { model = 'g_m_y_mexgang_01', weapon = 'weapon_pistol50', armor = 100 },
    { model = 'ig_ramp_mex', weapon = 'weapon_vintagepistol'},
    { model = 'ig_ramp_mex', weapon = 'weapon_vintagepistol'},
   -- { model = 'ig_ramp_mex', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 'g_m_y_mexgoon_03', weapon = 'weapon_vintagepistol'},
    { model = 'g_m_y_mexgoon_03', weapon = 'WEAPON_PISTOL'},
   -- { model = 'g_m_y_mexgoon_03', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 'g_m_y_pologoon_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(962.8946, -1631.7418, 35.6926, 103.0902), model = 'a_m_y_mexthug_01', weapon = 'weapon_microsmg', armor = 100 },
    { model = 'g_m_y_mexgang_01', weapon = 'weapon_pistol50', armor = 100 },
    { model = 'ig_ramp_mex', weapon = 'weapon_vintagepistol'},
    { model = 'ig_ramp_mex', weapon = 'weapon_vintagepistol'},
    { model = 'ig_ramp_mex', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 'g_m_y_mexgoon_03', weapon = 'weapon_vintagepistol'},
    { model = 'g_m_y_mexgoon_03', weapon = 'WEAPON_PISTOL'},
    { model = 'g_m_y_mexgoon_03', weapon = 'weapon_pumpshotgun', armor = 100 },
    { model = 'g_m_y_pologoon_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(921.8884, -1627.3739, 44.5679, 232.8544), model = 'a_m_y_mexthug_01', weapon = 'weapon_microsmg', armor = 100 },
}

local ArtVehicles = {
    { coords = vector4(967.5956, -1627.8992, 30.1106, 328.3823), model = 'bmx'}
}

local ArtSpecialRewards = {
    { Item = 'matcoupon', Amount = math.random(2, 4), Chance = 100 },
    --[[{ Item = 'copper', Amount = 1, Chance = 5 },
    { Item = 'steel', Amount = 1, Chance = 5 },
    { Item = 'iron', Amount = 1, Chance = 5 },
    { Item = 'rubber', Amount = 1, Chance = 5 },
    { Item = 'glass', Amount = 1, Chance = 5 }]]
}

local ArtMessages = {
    Sender = 'Unknown',
    Subject = 'That THING',
    Message = "Move fast before the cartel escapes! I have updated your gps with the location to the warehouse. Get over there and find the box. You're looking for a small wooden crate! There should be a case inside it with the deed. Retrieve it and bring it back to me when it's safe. I've given you a special key that should allow you to unlock the crate lock, but you might need to disable the security device. Godspeed."
}

local ArtJob = {
    JobName = 'art',
    Token = 'raidart',
    Boss = ArtBoss,
    Guards = ArtGuards,
    GuardPositions = ArtGuardPositions,
    Civilians = ArtCivilians,
    Vehicles = ArtVehicles,
    Items = ArtItems,
    MinimumPolice = 0,
    RunCost = 3500,
    Payout =  math.random(4500, 7000),
    SpecialRewards = ArtSpecialRewards,
    Messages = ArtMessages 
}

Config.Jobs = {
    MethJob,
    CokeJob,
    WeedJob,
    ClownJob,
    ArtJob
}

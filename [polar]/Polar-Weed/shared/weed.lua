Config = {} or Config

-- Core Values----------------------------------------------------------------
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'qb-inventory'
Config.Skillbar = 'qb-skillbar'
----------------------------------------------------------------
Config.img = "qb-inventory/html/images/"
-- Debug
Config.Debug = false -- debug for checks

-- GROUND TYPES -- WEED CAN ONLY BE PLANTED ON THESE TYPES
Config.Ground1 = -1286696947
Config.Ground2 = -1885547121
Config.Ground3 = 223086562
Config.Ground4 = -461750719

-- HOW FAST PLANT GROWS
-- it grows less the further along                                                                                                           1000 seconds, / minute / hour
Config.GrowRate = 30 -- In how many seconds it takes to update the plant (plant will grow 0.1% every update) (10 Hours roughly, takes Config.GrowRate * 1000 / 60 / 60)
Config.MinHarvest = 98 -- how much percent before you can harvest

-- see rate
Config.SeeRate = false
Config.PlantName = "Weed Plant"

-- min and max each fertilizer gives your plant
Config.FertPecentMin = 30
Config.FertPecentMax = 50

-- min and max each water gives your plant
Config.WaterPecentMin = 30
Config.WaterPecentMax = 50

-- How much it decreases by each time it grows, as the plant grows it removes more and more because its growing
Config.FertDecrease = 0.01 -- 2%
Config.WaterDecrease = 0.02 -- 0.02


Config.PlowItem = 'trowel'
Config.PlowItemName = 'Trowel'
Config.WaterItem = 'purifiedwater'
Config.WaterItemAmount = 1
Config.FertilizerItem = 'weed_nutrition'
Config.FertilizerItemAmount = 1

--- ITEM NEEDED TO ENTER & EXIT
Config.Usekey = true
Config.LabKeyCard = 'weedkey'
Config.LabKeyCardAmount = 1

-- Item needed to trim plants
Config.NeededPickItem = 'scissors'
Config.NeededPickItemAmount = 1

-- FUTURE UPDATE ---------------------------------
Config.PotItem = 'specialsauce'
Config.PotItemAmount = 1
Config.GivenPotItem = 'specialsauce'
Config.GivenPotItemAmount = 1

--- OUTSIDE LAB
Config.OutSideLabCord = vector3(2848.24, 4450.16, 48.51)
Config.OutsideLabHead = 107.58
--- INSIDE LAB
Config.InsideLabCord = vector3(1066.15, -3183.41, -39.16)
Config.InsideLabHead = 84.85

Config.ProcessItem = 'scissors'
Config.ProcessItemAmount = 1

-- ITEM GOT FROM TRIMMING
Config.TrimItem1 = 'croplow'
Config.TrimItem2 = 'croplow'
Config.TrimItem3 = 'croplow'
Config.TrimItem4 = 'croplow'
Config.TrimItem5 = 'cropmid'
Config.TrimItem6 = 'cropmid'
Config.TrimItem7 = 'cropmid'
Config.TrimItem8 = 'cropmid'
Config.TrimItem9 = 'crophigh'
Config.TrimItem10 = 'crophigh'
Config.TrimItemAmount = 1

Config.UseProps = true
Config.TableHeight = -40
Config.Floor = -39.16


Config.UseScene = true
Config.UseCam = true







Config.FieldAbove = vector3(3713.15, 416.39, 0.47) -- dont touch


------ PRODUCT SOURCING ---------------
Config.MinimumPolice = 0 -- how many cops min to start source
Config.MissionCooldownTime = 25 -- in minutes

-- burner phone sourcing
Config.UseBurnerPhone = true
Config.RemovePhoneOnUse = true -- set to false to disable break phone
Config.BreakPhone = true -- chance to remove phone
Config.BreakChance = 75 -- this number or above to break out of 100. 75 has a 25% chance of breaking

-- lab sourcing
Config.UseSourcing = true


Config.DefaultValues = {
    armor = 10, -- armor of enemy peds
    accuracy = 40, -- accuracy of enemy peds
}

Config.BoatHouseBoat = 'dinghy'
Config.BoatHouseBoatLocation = vector3(3847.62, 4451.75, -0.47)
Config.BoatHouseObject = 'bkr_prop_weed_bigbag_03a'
Config.BoatHouseObjectLocation = vector3(4109.89, 4499.4, 16.82)
Config.BoatHouseGuards = {
    { coords = vector4(3820.32, 4458.0, 3.57, 230.37),  model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3819.05, 4464.62, 3.61, 162.91), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3810.61, 4469.97, 3.97, 110.91), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3803.51, 4464.97, 4.81, 18.9), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3809.33, 4455.14, 4.13, 352.57), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3800.44, 4452.45, 4.54, 309.68), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3799.84, 4474.73, 5.99, 108.55), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3820.13, 4483.23, 5.99, 66.19), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3849.42, 4463.54, 2.7, 59.84),  model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(3829.66, 4458.0, 2.75, 88.73),  model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
}



Config.BeachBoat = 'dinghy'
Config.BeachBoatLocation = vector3(2864.39, -724.61, 0.17)
Config.BeachObject = 'bkr_prop_weed_bigbag_03a'
Config.BeachObjectLocation = vector3(2854.62, -1340.16, 15.71)
Config.BeachGuards = {
    { coords = vector4(2793.36, -708.71, 4.51, 90.2),  model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2788.64, -715.82, 5.25, 111.8), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2772.57, -722.6, 6.99, 52.73), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2780.65, -703.23, 5.09, 120.61), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2768.52, -703.06, 7.79, 98.37), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2741.07, -714.9, 11.66, 99.95), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2820.2, -702.38, 1.89, 84.43), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2817.48, -712.03, 2.46, 87.86), model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2822.16, -720.38, 2.95, 110.45),  model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
    { coords = vector4(2822.44, -734.54, 2.28, 53.2),  model = 'g_m_y_lost_01', weapon = 'WEAPON_PISTOL'},
}



-- ITEM NEEDED TO SEARCH PACKAGE
Config.PackageSearchItem = 'weedkey'
Config.PackageSearchItemAmount = 1
-- ITEM NEEDED TO SEARCH PEDS
Config.PedSearchItem = 'weedkey'
Config.PedSearchItemAmount = 1


-- SEARCHING REWARDS
-- 9%
Config.SearchReward9 = '1ozhigh'
Config.SearchReward9Amount = 1
-- 25%
Config.SearchReward25 = '1ozmid'
Config.SearchReward25Amount = 1
-- 66%
Config.SearchReward66 = '1ozlow'
Config.SearchReward66Amount = 1

-- SPECIAL SEARCHING REWARDS
-- 9%
Config.SpecialSearchReward9 = '1ozhigh'
Config.SpecialSearchReward9Amount = 12
-- 25%
Config.SpecialSearchReward25 = '1ozhigh'
Config.SpecialSearchReward25Amount = 7
-- 66%
Config.SpecialSearchReward66 = '1ozmid'
Config.SpecialSearchReward66Amount = 6









--------- SHOPS
-- at vector3(-1168.26, -1573.2, 11.11)
Config.UseShops = false -- Ped spawns
Config.OnlySellShops = false -- can only sell to the shop
Config.UseSellAbleShops = false -- can sell and buy from shop

Config.SmokeontheWaterItems = {                      -- Items sold at Some on the Water shop
    [1] = { name = "drugbag",         price = 5,   amount = 999, info = {}, type = "item", slot = 1 },
    [2] = { name = "scale",           price = 500, amount = 999, info = {}, type = "item", slot = 2 },
    [3] = { name = "rollingpaper",   price = 500, amount = 999, info = {}, type = "item", slot = 3 },
    [4] = { name = "lighter",         price = 500, amount = 999, info = {}, type = "item", slot = 4 },
    [5] = { name = "trowel",          price = 500, amount = 999, info = {}, type = "item", slot = 5 },
    [6] = { name = "burnerphone",           price = 500, amount = 999, info = {}, type = "item", slot = 6 },
    [7] = { name = "purifiedwater",           price = 500, amount = 999, info = {}, type = "item", slot = 7 },
    [8] = { name = "weed_nutrition",       price = 500, amount = 999, info = {}, type = "item", slot = 8 },
}

Config.lowGradeEighthPrice  = math.random(20,40)        -- Price of 1 low grade eighth
Config.midGradeEighthPrice  = math.random(45,60)        -- Price of 1 mid grade eighth
Config.highGradeEighthPrice = math.random(70,99)        -- Price of 1 high grade eighth





--- WEED FARM THAT YOU CAN PICK PLANTS
-- at vector3(2194.42, 5582.53, 53.6)
Config.UseWeedFarm = false

---- adds target model to 'a_m_m_farmer_01'
Config.UseTrimmer = false









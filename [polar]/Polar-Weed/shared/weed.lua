Config = {} or Config

--==========================================================================
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'ps-inventory'
Config.Skillbar = 'qb-skillbar'
Config.img = "ps-inventory/html/images/"
--==========================================================================
Config.Notify = 'qb'


Config.Debug = false -- debug for checks

Config.WetBudLow = 65 -- if health <= WetBudLow then youll get low quality
Config.WetBudMid = 97  -- if health <= WetBudMid then youll get medium quality

Config.PoliceJob = 'police' -- police can destroy plants
Config.DestroyIcon = 'fas fa-fire'
Config.CloseIcon =  '' -- 'fas fa-chevron-left' -- for closing menu icon
Config.GrowthIcon =  '' --'fas fa-chart-simple' -- for growth menu icon
Config.TargetIcon = 'fas fa-cannabis' -- for third eye icon
Config.Sound = true


--==========================================================================
Config.QuickPlant = true ---- if planting doesnt want to work turn this to TRUE
--==========================================================================
Config.Offset = - 0.5
Config.Distance = 7.0

--------- GENERAL ----------
Config.RestartPlantRemoval = true -- remove dead plants on restart
Config.TimeToGrow = math.random(1, 10) -- Time in minutes for a plant to grow from 0 to 100
Config.Updates = 10 -- Time in minutes to update everything
Config.HealthRemoved = {2, 6} -- Min/Max Amount of health decay when the plant is below the above thresholds for water and nutrition
Config.PlaceTime = 2000 -- progressbar time to place plant
Config.RemovePlantTime = 8500

--------- MALE SEED --------------
Config.MaleSeed = 'male_seed' -- item that makes plants pregnant
Config.GiveMaleSeed = false -- do you want to get more male seeds from 1 male seed?
Config.GiveMaleSeedAmount = 0 -- use if Config.GiveMaleSeedOverHealth = False
Config.GiveMaleSeedOverHealth = false -- use if you want to do Health / Config.HealthMaleRateSeed
Config.HealthMaleRateSeed = 50 -- Divider over Health EX. 100 / 50 = 2


--------- FEMALE SEED ------------
Config.FemaleSeed = 'female_seed' -- usable item to place plants
Config.GiveFemaleSeedAmount = 6 -- use if Config.GiveMaleSeedOverHealth = False
Config.GiveFemaleSeedOverHealth = false
Config.HealthFemaleRateSeed = 20 -- Divider over Health EX. 100 / 20 = 5


------------ WATER ------------
Config.WaterItem = 'purifiedwater'
Config.WaterMin = 40 -- minimum water or health will degrade
Config.WaterTime = 0.4 -- Percent of water that is removed every minute
Config.WaterProgressTime = 6000 -- progressbar time
Config.WaterIcon =  'fas fa-shower' --'fas fa-shower'

------------ FERTILIZER ------------
Config.FertilizerItem = 'weed_nutrition'
Config.FertMin = 40 -- minimum fert or health will degrade
Config.FertTime = 0.4 -- Percent of fertilizer that is removed every minute
Config.FertProgressTime = 6000 -- progressbar time
Config.FertIcon =  'fab fa-nutritionix' --'fab fa-nutritionix'

---------- HARVEST -------

Config.SingleWeed = 'wetbud' -- uses if UseMultipleWeeds = false

Config.GrowingWeedAmount = true
Config.WeedPlantItemLow = 'wetbud' -- item you get from harvest
Config.WeedPlantItemMid = 'wetbud2'
Config.WeedPlantItemGood = 'wetbud3'
Config.WeedPlantItemAmount = 1 -- amount you get per plant
Config.HarvestTime = 8500 -- progressbar time
Config.HarvestIcon =  '' --'fas fa-scissors'

------ TREASURE -----------------
Config.FemaleWeedTreasure = true -- get possible treasure when harvesting Female weed?
Config.MaleWeedTreasure = true -- get possible treasure when harvesting Male weed?
Config.TreasureChance = 10 -- uses math.random(1,100) 10 = 10%
Config.TreasureItemAmount = math.random(1,3)
Config.TreasureItem = { -- common sense chance
    'scrapmetal',  'scrapmetal',  'scrapmetal', -- 60%
    'iron', -- 20%
    'plastic', -- 20%
}



Config.Props = {
    [1] = 'bkr_prop_weed_01_small_01b', -- 0% growth
    [2] = 'bkr_prop_weed_med_01a', -- 20% growth
    [3] = 'bkr_prop_weed_med_01b', -- 40% growth
    [4] = 'bkr_prop_weed_lrg_01a', -- 60% growth
    [5] = 'bkr_prop_weed_lrg_01b' -- 80+% growth
}

Config.ProcessItemReturn = 'weedpound' -- after process what do you get (low quality)
Config.ProcessItemReturn2 = 'weedpound2' -- after process what do you get (medium quality)
Config.ProcessItemReturn3 = 'weedpound3' -- after process what do you get (high quality)
Config.ProcessItemReturnAmountMin = 1 -- after process how much you get
Config.ProcessItemReturnAmountMax = 1

Config.BagItem = 'drugbag' -- item needed to process
Config.BagAmount = 1 -- amount needed to process
Config.BagOunces = true -- to get ounces does it require another bag?
Config.TubItem = 'weedtub'



--- ITEM NEEDED TO ENTER & EXIT
Config.Usekey = true
Config.LabKeyCard = 'weedkey'
Config.LabKeyCardAmount = 1

-------- JOINTS -----------
Config.Lighter = 'lighter'
Config.SmallJointItem = 'smalljoint'
Config.LargeJointItem = 'largejoint'
Config.ScaleItem = 'scale'


Config.FieldAbove = vector3(3713.15, 416.39, 0.47) -- pickable weed field












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









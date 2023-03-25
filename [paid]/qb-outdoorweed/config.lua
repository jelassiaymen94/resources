Config = {}

Config.CoreName = 'qb-core' -- The qb-core resource name if you have renamed it

Config.GrowthTime = 60

Config.MinPlantDistance = 3.0 -- Minimum distance between plants - recommended to be at least 4.0 minimum

Config.MaleFactor = 0.9
Config.FertilizerFactor = 0.9

Config.HarvestPercent = 95

Config.WaterAdd = math.random(20,40)
Config.FertilizerAdd = math.random(20,40)

Config.WaterReduceAmt = 5 -- How much to reduce water units by (5 default)
Config.FertReduceAmt = 5 -- How much to reduce fertilizer units by (5 default)


Config.DebugPolyzone = false

---- ** FEMALE SEED CONFIG ** ----

-- This is calculated like this
-- Water + FertiLizer / Config.QualityAmt
-- Remember only female gives the actual weed, if you fuse them they get seeds
Config.QualityAmt = 200 -- This means a maximum of 20 weed (Making this number smaller = more weed making this number higher = less weed)


---- ** MALE SEED CONFIG ** ----
Config.FemaleSeeds = math.random(2,4)
Config.MaleSeeds = math.random(1,1)

---- ** ITEM CONFIG ** ----
Config.DryWeed = "crophigh"
Config.WeedItem = "wetbud"
Config.Weed = "marijuana"
Config.JointItem = 'rolling_paper' -- What item is needed to roll joints?
Config.WeedBag = 'drugbag' -- What item is needed to Bag weed?
Config.WeedInBag = '1ozhigh'
Config.FinalJoint = "joint"

Config.FertilizerItem = 'weed_nutrition'
Config.WaterItem = 'purifiedwater'
Config.MaleSeedItem = 'male_seed'
Config.FemaleSeedItem = 'female_seed'

---- ** TIME CONFIG ** ----
Config.ProcessTime = 4000 -- This is in Milliseconds so this is 2.5 seconds
Config.UpdateInterval = 5 * (60 * 1000) -- How often do you want to update your plants (30mins default)

---- ** Process CONFIG ** ----
Config.BagMaxProcess = 16 -- How many items can they process at a time?
Config.DryMaxProcess = 1

---- ** Emotes ** ----
Config.EmoteDryingWeed = 'mechanic'
Config.EmoteBaggingWeed = 'mechanic'
Config.EmoteMakingJoints = 'mechanic'

---- ** Scenarios ** ----
Config.ScenarioPlantSeed = 'WORLD_HUMAN_GARDENER_PLANT'
Config.ScenarioRemovePlant = 'WORLD_HUMAN_GARDENER_PLANT'
Config.ScenarioAddMaleSeed = 'WORLD_HUMAN_GARDENER_PLANT'
Config.ScenarioPickPlant = 'WORLD_HUMAN_GARDENER_PLANT'

---- ** Prop Offsets ** ----
-- Only adjust if you have issues with plants disappearing

-- To hide pots, use this config

--Config.PropOffsetStage1 = -0.5
--Config.PropOffsetStage2 = -3.0
--Config.PropOffsetStage3 = -3.0
--Config.PropOffsetStage4 = -3.0
--Config.PropOffsetStage5 = -3.0

-- To show pots, comment all PropOffsetStages above and use this config:

Config.PropOffsetStage1 = 0.0
Config.PropOffsetStage2 = -2.5
Config.PropOffsetStage3 = -2.5
Config.PropOffsetStage4 = -2.5
Config.PropOffsetStage5 = -2.5

---- ** This uses QB Target Box Zones ** ----
-- Here you process the weed into baggies etc.
Config.WeedProcessing = {
    [1] = {["Coords"] = vector3(1038.8072, -3205.8753, -38.2674)}
}

-- Here you get the dry bud
Config.WeedExtraction = {
[1] = {["Coords"] = vector3(1040.2549, -3202.4442, -37.6640)}

}

---- ** This uses PolyZones ** ----
Config.PlantZones = {
    [1] = {
        label = "Chiliad", -- HAS TO BE UNIQUE
        zones = {
            vector2(4478.8535, -4116.6655),
            vector2(-3747.0024, -4400.0000),
            vector2(-3736.6926, 7974.7920),
            vector2(4477.8169, 7890.8271),
        },
    },
}
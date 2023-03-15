Config = {
    Debug = false, -- Displays polyzones. (Green Boxes)
    MaxInvWeight = 120000, -- Set this to your inventory's max weight.

    -- ## Exports
    CoreExport = 'qb-core',
    TargetExport = 'qb-target',
    MenuExport = 'qb-menu',
    FuelExport = 'ps-fuel',
    VehicleKeysTrigger = "vehiclekeys:client:SetOwner",

    -- ## Items
    PhoneItem = "phone", 
    OxyItem = 'chemicals',
    SusPackItem = 'suspackage',
    DirtyCashItem = 'band',

    -- ## Blips
    -- Blip Sprites - https://docs.fivem.net/docs/game-references/blips/
    BlipScale = 1.25, -- Blip Size
    PickupCarBlipSprite = 523,
    PickupCarBlipLabel = "Pickup Car", 
    PickupPackagesBlipSprite = 568,
    PickupPackagesBlipLabel = "Pickup Packages",
    SellAreaBlipSprite = 51,
    SellAreaBlipLabel = "Sell Area",
    JobEndBlipSprite = 357,
    JobEndBlipLabel = "Return Job Vehicle",

    -- ## Chances
    PoliceAlertChance = 12,

    -- ## Job Configs
    JobMenuHeader = "Oxy Runs", -- Menu for job start.
    JobStartPrice = 1250,
    CleanMoney = true, -- True will check for DirtyCashItem and clean it to cash.
    Deliveries = math.random(5, 8), -- Amount of deliveries per run.
    ResetTime = 10, -- How often sell spots are reset. (In Minutes)
    OxyReward = math.random(1, 2), -- How much oxy given per sale.
    DirtyItemValue = math.random(241, 432), -- How much clean cash is exhanged for one DirtyCashItem.
    Payout = math.random(350, 600), -- Cash payed upon job finish MULTIPLIED by amount drop-offs.

    -- ## Waits / Timings
    PackageGrabTime = math.random(2000, 2900), -- Progress bar time when picking up packages.
    DeliverTime = math.random(2000, 2900), -- Progress bar time when dropping package into buyer's vehicle.
    BuyInfoWait = math.random(2000, 3200),
    JobVehicleWait = math.random(10000, 15000),
    PackagePedWaitTime = math.random(10000, 15000),
    SellLocationWait = math.random(10000, 15000),
    BuyerSpawnWait = math.random(15000, 25000),

    -- ## Peds / Locations
    JobStartPed = 'a_m_y_stwhi_01',
    JobStartPedLocation = vector4(-99.0618, 366.3341, 113.2747, 145.5593), --, vector4(1560.79, -2165.73, 77.49, 264.04), vector4(1560.79, -2165.73, 77.49, 264.04) },
    PackagePed = 'cs_chengsr',
    PackagePedLocations = { vector4(-15.88, -1295.54, 29.35, 187.96), vector4(-1193.23, -1510.38, 4.37, 308.69), vector4(-440.6753, 295.2094, 83.2292, 84.8682) },
    JobEndPed = 'g_f_y_vagos_01',
    JobEndLocation = vector4(1560.79, -2165.73, 77.49, 264.04),
    BuyerPeds = { 'g_m_m_chigoon_02', 'a_f_y_eastsa_02', 'a_m_m_golfer_01', 'a_m_m_skater_01', 'a_m_y_bevhills_01' },
    BuyerVehicles = { 'dominator', 'warrener', 'asterope', 'schafter2', 'primo' },
    VehicleLocations = {
        {
            vehicle = "felon",
            vehiclePos = vector4(357.01, -1848.68, 27.98, 137.1),
        },
        {
            vehicle = "sultan",
            vehiclePos = vector4(900.21, -1067.11, 32.22, 359.53), 
        },
        {
            vehicle = "bison",
            vehiclePos = vector4(-1531.77, -982.57, 12.55, 139.66),
        },
        {
            vehicle = "blista",
            vehiclePos = vector4(-1440.957, -367.29, 42.89, 34.94),
        }
    },
    SellZones = {
        {
            label = "Pink Cage",
            busy = false,
            waypoint = vector3(323.63, -184.99, 57.39),
            buyerSpawn = vector4(351.18, -132.84, 65.55, 339.5),
            buyerEndpoint = vector3(329.68, -183.91, 57.67),
            zones = {
                vector2(349.1067199707, -197.12756347656),
                vector2(308.88522338867, -182.44351196289),
                vector2(316.93676757812, -157.05372619629),
                vector2(358.19366455078, -167.19665527344)
            },
        },

    },


}
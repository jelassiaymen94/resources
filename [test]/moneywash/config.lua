Config = {}


Config.DiscordWebhooks = {
    Washing_Logs = "https://discord.com/api/webhooks/1079720657044131880/9_VKGuorflQasSVHO-a4ygk6xfPc6rns8-wNqtxfKBUfIN96ytTzKvzM8ns1NpsStWKu",
    Drying_Logs = "https://discord.com/api/webhooks/1079720749583044608/tukTWLYJftZl1nDKYjAjUFrQe8EnpuJl6LsQmjwT63OKgx5kvyvnurYZpiUVrCvn5Nyc"
}

Config.Washable_Items = {
    -- The left string is the item name. The right string is the item value.
    ['markedbills'] = {
        worth_type = "metadata", -- Use this if your items worth is set in the metadata
        worth_identifier = "worth" -- Example Item name is markedbills, the item value is called worth
    },
    ['markedcash'] = {
        worth_type = "amount", -- Use this if your items worth is defined in how many of the same item you have. Ex: 600x Marked Cash
    },
}

Config.Wash_Time = 3 -- 15% Example: $1000 would take 150 seconds to wash

-- Machine Locations For Drawtext Users --

-- Machine Locations For Drawtext Users --

-- Machine Locations For Target Users --
Config.Machines_QBTARGET = {
    ['Washing Machines'] = {
        { location = vector3(-591.13, -1626.86, 33.00), heading = 96.63, width = 0.8, depth = 0.5}, -- done
        { location = vector3(-585.37, -1623.1, 33.00), heading = 343.46, width = 1.0, depth = 0.2}, -- done
        { location = vector3(-576.15, -1623.9, 33.00), heading = 38.19, width = 0.8, depth = 0.2}, -- done
        { location = vector3(-572.51, -1624.71, 33.00), heading = 324.38, width = 1.0, depth = 0.3},
    },
    ['Dryers'] = {
       -- { location = vector3(1138.91, -991.87, 46.11), heading = 8.0, width = 0.73, depth = 0.73, minZ=45.2, maxZ=46.4, distance = 8.0 },
       -- vector3(1141.94, -993.92, 46.1),
        { location = vector3(-581.99, -1613.12, 27.10), heading = 90.0, width = 1.5, depth = 1.5},
        { location = vector3(-586.5, -1599.03, 27.10), heading = 8.0, width = 1.5, depth = 1.5},
        { location = vector3(-583.7, -1599.03, 27.10), heading = 8.0, width = 1.5, depth = 1.5},
         --[[ { location = vector3(1138.62, -988.78, 46.11), heading = 8.0, width = 0.72, depth = 0.72, minZ= 27.10  - 1.0, maxZ= 27.10  + 1.0, distance = 8.0 },
       { location = vector3(1139.66, -991.77, 46.11), heading = 8.0, width = 0.72, depth = 0.72, minZ=45.2  - 1.0, maxZ=46.4  + 1.0, distance = 8.0 },
        { location = vector3(1139.56, -991.08, 46.11), heading = 8.0, width = 0.72, depth = 0.72, minZ=45.2  - 1.0, maxZ=46.4  + 1.0, distance = 8.0 },
        { location = vector3(1139.47, -990.34, 46.11), heading = 8.0, width = 0.72, depth = 0.72, minZ=45.2  - 1.0, maxZ=46.4  + 1.0, distance = 8.0 },
        { location = vector3(1139.4, -989.65, 46.11), heading = 8.0, width = 0.72, depth = 0.72, minZ=45.2  - 1.0, maxZ=46.4  + 1.0  + 1.0, distance = 8.0 },]]
    }
}
-- Machine Locations For Target Users --

-- Money Destruction Rate
Config.MoneyDestructionRate = {
    [0] = { -- How many experience points are needed
        mdr = 50, -- How much percentage of the money that will be destroyed in the process
        level = 1, -- Self explanitory
        experience_knowledge = 2 -- How many experience points should you get per successful money laundering
    },
    [10] = {
        mdr = 45,
        level = 2,
        experience_knowledge = 2
    },
    [30] = {
        mdr = 40,
        level = 3,
        experience_knowledge = 2
    },
    [60] = {
        mdr = 38,
        level = 4,
        experience_knowledge = 2
    },
    [100] = {
        mdr = 36,
        level = 5,
        experience_knowledge = 2 
    },
    [140] = {
        mdr = 34,
        level = 6,
        experience_knowledge = 2
    },
    [180] = {
        mdr = 32,
        level = 7,
        experience_knowledge = 2
    },
    [220] = {
        mdr = 30,
        level = 8,
        experience_knowledge = 2
    },
    [260] = {
        mdr = 28,
        level = 9,
        experience_knowledge = 2
    },
    [300] = {
        mdr = 26,
        level = 10,
        experience_knowledge = 2
    },
    [340] = {
        mdr = 24,
        level = 11,
        experience_knowledge = 2
    },
    [380] = {
        mdr = 22,
        level = 12,
        experience_knowledge = 2
    },
    [420] = {
        mdr = 20,
        level = 13,
        experience_knowledge = 1
    },
    [460] = {
        mdr = 18,
        level = 14,
        experience_knowledge = 1
    },
    [500] = {
        mdr = 16,
        level = 15,
        experience_knowledge = 1
    },
    [540] = {
        mdr = 14,
        level = 16,
        experience_knowledge = 1
    },
    [580] = {
        mdr = 12,
        level = 17,
        experience_knowledge = 1
    },
    [620] = {
        mdr = 10,
        level = 18,
        experience_knowledge = 1
    },
    [660] = {
        mdr = 8,
        level = 19,
        experience_knowledge = 1
    },
    [700] = {
        mdr = 6,
        level = 20,
        experience_knowledge = 1
    },
    [1000] = {
        mdr = 5,
        level = 21,
        experience_knowledge = 1
    },
}
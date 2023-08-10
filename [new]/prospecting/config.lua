-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------

Config = {}

Config.Core = "QBCore" -- ESX or QBCore
Config.PlayerLoadedEvent = "QBCore:Client:OnPlayerLoaded" -- esx:playerLoaded || QBCore:Client:OnPlayerLoaded

Config.ShowBlip = true -- show blip on map

Config.Chances = {
    ["common"] = 100, -- 100%
    ["rare"] = 15, -- 15%
    ["epic"] = 5, -- 5%
}
Config.ShowDrawMaker = false -- show draw marker on in game while prospecting
Config.DetectorItem = "detector"

Config.Zones = {
    [1] = {coords = vector3(1596.19, 6607.72, 15.6), data = "loc1", zoneSize = 100, zoneLocations = 200},
  --  [2] = {coords = vector3(1615.378, 2095.902, 85.007), data = "loc2", zoneSize = 100, zoneLocations = 100},
}

Config.DefaultItems = {
    [1] = {name = "steel", min = 1, max = 2} 
} -- will be selected if you dont put the common, rare and epic items in the config

Config.Items = {
    ["loc1"] = {
        ["common"] = {
            [1] = {name = "ironore", min = 1, max = 1},
            [2] = {name = "copperore", min = 1, max = 1},
            [3] = {name = "silverore", min = 1, max = 1},
            [4] = {name = "iron", min = 1, max = 1},
            [5] = {name = "copper", min = 1, max = 1},
            [6] = {name = "metalscrap", min = 1, max = 1},
            [7] = {name = "steel", min = 1, max = 1},
        },
        ["rare"] = {
            [1] = {name = "sapphire_necklace_silver", min = 1, max = 1},
            [2] = {name = "emerald_necklace_silver", min = 1, max = 1},
            [3] = {name = "goldearring", min = 1, max = 1},
            [4] = {name = "diamond_earring", min = 1, max = 1},
            [5] = {name = "ruby_earring", min = 1, max = 1},
            [6] = {name = "sapphire_earring", min = 1, max = 1},
            [7] = {name = "emerald_earring", min = 1, max = 1},
            [8] = {name = "silverearring", min = 1, max = 1},
            [9] = {name = "diamond_earring_silver", min = 1, max = 1},
            [10] = {name = "ruby_earring_silver", min = 1, max = 1},
            [11] = {name = "sapphire_earring_silver", min = 1, max = 1},
            [12] = {name = "emerald_earring_silver", min = 1, max = 1},
            [13] = {name = "ironore", min = 1, max = 1},
            [14] = {name = "copperore", min = 1, max = 1},
            [15] = {name = "silverore", min = 1, max = 1},
            [16] = {name = "goldpan", min = 1, max = 1},
            [17] = {name = "randombag", min = 1, max = 1},
            [18] = {name = "silveringot", min = 1, max = 1},
            [19] = {name = "silver_ring", min = 1, max = 1},
            [20] = {name = "diamond_ring_silver", min = 1, max = 1},
            [21] = {name = "phone", min = 1, max = 1},
            [22] = {name = "metalscratchy", min = 1, max = 1},
            [23] = {name = "funkopop_snape", min = 1, max = 1},
            [24] = {name = "sprunk", min = 1, max = 1},
            [25] = {name = "goldbar", min = 1, max = 1},
            [26] = {name = "welcomeguide", min = 1, max = 1},
            [27] = {name = "silver_ring", min = 1, max = 1},
            [28] = {name = "diamond_ring_silver", min = 1, max = 1},
            [29] = {name = "ruby_ring_silver", min = 1, max = 1},
            [31] = {name = "sapphire_ring_silver", min = 1, max = 1},
            [32] = {name = "emerald_ring_silver", min = 1, max = 1},
            [33] = {name = "ruby_necklace", min = 1, max = 1},
            [34] = {name = "sapphire_necklace", min = 1, max = 1},
            [35] = {name = "emerald_necklace", min = 1, max = 1},
            [36] = {name = "silverchain", min = 1, max = 1},
            [37] = {name = "diamond_necklace_silver", min = 1, max = 1},
            [38] = {name = "ruby_necklace_silver", min = 1, max = 1},
            [39] = {name = "diamond_necklace", min = 1, max = 1},
            [40] = {name = "fishbait", min = 1, max = 1},
        },
        ["epic"] = {
            [1] = {name = "handcuffs", min = 1, max = 1},
            [2] = {name = "weapon_microsmg2", min = 1, max = 1},
            [3] = {name = "weapon_fnx45", min = 1, max = 1},
            [4] = {name = "weapon_shoe", min = 1, max = 1},
            [5] = {name = "goldtower", min = 1, max = 1},
            [6] = {name = "valuablegoods", min = 1, max = 1},
            [7] = {name = "dirtyband", min = 1, max = 1},
            [8] = {name = "weapon_dp9", min = 1, max = 1},
            [9] = {name = "captainskull", min = 1, max = 1},
            [10] = {name = "weapon_bzgas", min = 1, max = 1},
            [11] = {name = "weapon_pipebomb", min = 1, max = 1},
            [12] = {name = "tequillabottle1", min = 1, max = 1},
            [13] = {name = "captainskull", min = 1, max = 1},
            [14] = {name = "captainskull", min = 1, max = 1},
        }
    },
}

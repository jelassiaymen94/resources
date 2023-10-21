Config = Config or {}

Config.MinZOffset = 40
Config.TakeoverPrice = 5000
Config.Pawnshop = {
    [1] = {
        coords = {
            ["enter"] = vector3( -140.2207, 224.5665, 9400000000000000000000000.9870) ,
            ["interaction"] = vector3( -140.2207, 224.5665, 9400000000000000000000000.9870),
        },
        keyholders = {},
        pincode = 1234,
        inventory = {},
        opened = false,
        takingover = false,
        money = 0,
    },

    [99] = {
        coords = {
            ["enter"] = vector3( 157.7, -1316.18, 124.3) ,
            ["interaction"] = vector3( 157.7, -1316.18, 124.3),
        },
        keyholders = {},
        pincode = 1234,
        inventory = {},
        opened = false,
        takingover = false,
        money = 0,
    },
}
Config.Items = {
   


    --Jewelery
    ["ruby"] = {
        name = "ruby",
        wait = 1500,
        reward = 10000,
    },
    ["sapphire"] = {
        name = "sapphire",
        wait = 1500,
        reward = 10500,
    },
    ["emerald"] = {
        name = "emerald",
        wait = 1500,
        reward = 11000,
    },
    ["diamond"] = {
        name = "diamond",
        wait = 1500,
        reward = 11500,
    },
    ["yellow-diamond"] = {
        name = "yellow-diamond",
        wait = 1500,
        reward = 12000,
    },
    ["bluediamond"] = {
        name = "bluediamond",
        wait = 1500,
        reward = 12500,
    },


	-- Silver

    ["silverearring"] = {
        name = "silverearring",
        wait = 1500,
        reward = 100,
    },
    ["silver_ring"] = {
        name = "silver_ring",
        wait = 1500,
        reward = 200,
    },
    ["silverchain"] = {
        name = "silverchain",
        wait = 1500,
        reward = 300,
    },


    ["ruby_earring_silver"] = {
        name = "ruby_earring_silver",
        wait = 1500,
        reward = 200,
    },
    ["ruby_ring_silver"] = {
        name = "ruby_ring_silver",
        wait = 1500,
        reward = 300,
    },
    ["ruby_necklace_silver"] = {
        name = "ruby_necklace_silver",
        wait = 1500,
        reward = 400,
    },


    ["sapphire_earring_silver"] = {
        name = "sapphire_earring_silver",
        wait = 1500,
        reward = 250,
    },
    ["sapphire_ring_silver"] = {
        name = "sapphire_ring_silver",
        wait = 1500,
        reward = 375,
    },
    ["sapphire_necklace_silver"] = {
        name = "sapphire_necklace_silver",
        wait = 1500,
        reward = 500,
    },


    ["emerald_earring_silver"] = {
        name = "emerald_earring_silver",
        wait = 1500,
        reward = 300,
    },
    ["emerald_ring_silver"] = {
        name = "emerald_ring_silver",
        wait = 1500,
        reward = 450,
    },
    ["emerald_necklace_silver"] = {
        name = "emerald_necklace_silver",
        wait = 1500,
        reward = 600,
    },


    ["diamond_earring_silver"] = {
        name = "diamond_earring_silver",
        wait = 1500,
        reward = 400,
    },
    ["diamond_ring_silver"] = {
        name = "diamond_ring_silver",
        wait = 1500,
        reward = 600,
    },
    ["diamond_necklace_silver"] = {
        name = "diamond_necklace_silver",
        wait = 1500,
        reward = 800,
    },


	-- Gold

    ["goldearring"] = {
        name = "goldearring",
        wait = 1500,
        reward = 200,
    },
    ["gold_ring"] = {
        name = "gold_ring",
        wait = 1500,
        reward = 300,
    },
    ["goldchain"] = {
        name = "goldchain",
        wait = 1500,
        reward = 400,
    },


    ["ruby_earring"] = {
        name = "ruby_earring",
        wait = 1500,
        reward = 300,
    },
    ["ruby_ring"] = {
        name = "ruby_ring",
        wait = 1500,
        reward = 400,
    },
    ["ruby_necklace"] = {
        name = "ruby_necklace",
        wait = 1500,
        reward = 500,
    },



    ["sapphire_earring"] = {
        name = "sapphire_earring",
        wait = 1500,
        reward = 375,
    },
    ["sapphire_ring"] = {
        name = "sapphire_ring",
        wait = 1500,
        reward = 500,
    },
    ["sapphire_necklace"] = {
        name = "sapphire_necklace",
        wait = 1500,
        reward = 625,
    },


    ["emerald_earring"] = {
        name = "emerald_earring",
        wait = 1500,
        reward = 450,
    },
    ["emerald_ring"] = {
        name = "emerald_ring",
        wait = 1500,
        reward = 600,
    },
    ["emerald_necklace"] = {
        name = "emerald_necklace",
        wait = 1500,
        reward = 750,
    },


    ["diamond_earring"] = {
        name = "diamond_earring",
        wait = 1500,
        reward = 600,
    },
    ["diamondring"] = {
        name = "diamondring",
        wait = 1500,
        reward = 800,
    },
    ["diamond_ring"] = {
        name = "diamond_ring",
        wait = 1500,
        reward = 800,
    },
    ["diamondnecklace"] = {
        name = "diamondnecklace",
        wait = 1500,
        reward = 1000,
    },
    ["diamond_necklace"] = {
        name = "diamond_necklace",
        wait = 1500,
        reward = 1000,
    },


    ["rolex"] = {
        name = "rolex",
        wait = 1500,
        reward = 600,
    },
    ["goldbar"] = {
        name = "goldbar",
        wait = 1500,
        reward = 1000,
    },
    ["band"] = {
        name = "band",
        wait = 1500,
        reward = 450,
    },
-- Garbage Loot

["microwave"] = {
    name = "microwave",
    wait = 1500,
    reward = 800,
},
["iphone"] = {
    name = "iphone",
    wait = 1500,
    reward = 700,
},
["phone"] = {
    name = "phone",
    wait = 1500,
    reward = 500,
},
["television"] = {
    name = "television",
    wait = 1500,
    reward = 700,
},
["safe"] = {
    name = "safe",
    wait = 1500,
    reward = 700,
},

["samsungphone"] = {
    name = "samsungphone",
    wait = 1500,
    reward = 900,
},
["megaphone"] = {
    name = "megaphone",
    wait = 1500,
    reward = 400,
},
["radio"] = {
    name = "radio",
    wait = 1500,
    reward = 800,
},
["painting"] = {
    name = "painting",
    wait = 1500,
    reward = 1100,
},
["tablet"] = {
    name = "tablet",
    wait = 1500,
    reward = 700,
},
["fitbit"] = {
    name = "fitbit",
    wait = 1500,
    reward = 1200,
},





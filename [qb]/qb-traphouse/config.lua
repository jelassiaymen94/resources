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
        reward = 10000,
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
["wheelchair"] = {
    name = "wheelchair",
    wait = 1500,
    reward = 300,
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








["sleepypop"] = {
    name = "sleepypop",
    wait = 1500,
    reward = 200,
},
["chapopop"] = {
    name = "chapopop",
    wait = 1500,
    reward = 200,
},
["monkeypop"] = {
    name = "monkeypop",
    wait = 1500,
    reward = 500,
},
["mrsmonkeypop"] = {
    name = "mrsmonkeypop",
    wait = 1500,
    reward = 200,
},


["johnpop"] = {
    name = "johnpop",
    wait = 1500,
    reward = 100,
},
["jessepop"] = {
    name = "jessepop",
    wait = 1500,
    reward = 100,
},

["blakepop"] = {
name = "blakepop",
wait = 1500,
reward = 100,
},
["funkopop_harrypotter"] = {
name = "funkopop_harrypotter",
wait = 1500,
reward = 75,
},
["funkopop_draco"] = {
name = "funkopop_draco",
wait = 1500,
reward = 50,
},
["funkopop_ron"] = {
name = "funkopop_ron",
wait = 1500,
reward = 70,
},
["funkopop_dumbledore"] = {
name = "funkopop_dumbledore",
wait = 1500,
reward = 60,
},
["funkopop_hedwig"] = {
name = "funkopop_hedwig",
wait = 1500,
reward = 30,
},
["funkopop_hermione"] = {
name = "funkopop_hermione",
wait = 1500,
reward = 70,
},
["funkopop_hagrid"] = {
name = "funkopop_hagrid",
wait = 1500,
reward = 50,
},
["funkopop_moaningmertle"] = {
name = "funkopop_moaningmertle",
wait = 1500,
reward = 40,
},
["funkopop_voldemort"] = {
name = "funkopop_voldemort",
wait = 1500,
reward = 70,
},
["funkopop_snape"] = {
name = "funkopop_snape",
wait = 1500,
reward = 60,
},















-- Comic Shop Items
    ["ted"] = {
        name = "ted",
        wait = 1500,
        reward = 50,
    },
    ["bubble"] = {
        name = "Cat Thief",
        wait = 1500,
        reward = 100,
    },
    ["hentai"] = {
        name = "hentai",
        wait = 1500,
        reward = 250,
    },
    ["01_monkeyman"] = {
        name = "01_monkeyman",
        wait = 1500,
        reward = 1500,
    },
    ["01_monkeymansigned"] = {
        name = "01_monkeymansigned",
        wait = 1500,
        reward = 5000,
    },
    ["02_mrsmonkey"] = {
        name = "02_mrsmonkey",
        wait = 1500,
        reward = 1000,
    },
    ["02_mrsmonkeysigned"] = {
        name = "02_mrsmonkeysigned",
        wait = 1500,
        reward = 4500,
    },
    ["03_tommyscaletta"] = {
        name = "03_tommyscaletta",
        wait = 1500,
        reward = 500,
    },
    ["03_tommysigned"] = {
        name = "03_tommysigned",
        wait = 1500,
        reward = 1500,
    },
    ["04_seymourbutts"] = {
        name = "04_seymourbutts",
        wait = 1500,
        reward = 900,
    },
    ["04_seymoursigned"] = {
        name = "04_seymoursigned",
        wait = 1500,
        reward = 4000,
    },
    ["05_reese"] = {
        name = "05_reese",
        wait = 1500,
        reward = 700,
    },
    ["05_reese"] = {
        name = "04_seymoursigned",
        wait = 1500,
        reward = 1500,
    },
}

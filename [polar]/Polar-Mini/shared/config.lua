Config = {} or Config
Config.img = "inventory/html/images/"
Config.Debug = false


Config.CheckBalance = true
Config.CheckDead = true
Config.Coords = vector4(2812.18, 5977.55, 350.08, 12.71)
Config.Cost = 500
Config.MoneyType = 'cash'




Config.TruckBlipName = "Los Santos Trucking" -- blip name
Config.TruckBlipSprite = 477 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.TruckBlipColor = 39  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip


Config.PickupLoc = {

    vector4(-985.67, -2941.83, 13.95, 146.56),
    vector4(233.1, -3114.72, 5.79, 354.99),
    vector4(853.02, -3127.8, 5.9, 90.58),
    vector4(853.01, -3143.86, 5.9, 91.18),
    vector4(473.82, -2992.51, 6.04, 85.94),
    vector4(-206.57, -1978.1, 27.62, 180.86),
    vector4(-1803.93, 799.54, 138.51, 38.93),
    vector4(211.06, 2747.4, 43.43, 95.55),
    vector4(1854.13, 2625.45, 45.67, 357.95),
    vector4(-3146.63, 1043.02, 20.76, 336.96),
    vector4(-1051.42, -1566.17, 4.81, 304.45),
    vector4(-1097.89, -2398.09, 13.95, 63.3),
    vector4(-1051.42, -1566.17, 4.81, 304.45),
    vector4(-1392.11, 83.84, 53.99, 0.8),
    vector4(1043.83, -2491.49, 28.51, 153.18),
    vector4(1151.86, -3017.54, 5.9, 88.19),

}
Config.Trailers = {
    'docktrailer',
    'trailers3',
    'trailerlogs',
    'tvtrailer',
    'tanker',
    'trailers4',
    'trailers',
    'trailers2',
    'tr2',
    'docktrailer',
    'tr4',
    'tr3',
}

Config.Dropoff = {

    vector4(803.32, -764.96, 26.73, 88.6),
    vector4(-1921.37, 2085.64, 137.03, 172.67),
    vector4(-1526.96, 83.48, 56.59, 273.54),
    vector4(103.55, -129.25, 54.75, 157.09),
    vector4(-886.61, -1488.29, 5.02, 107.36),
    vector4(258.25, 2578.75, 45.15, 278.74),
    vector4(-1028.54, -493.36, 36.94, 114.5),
    vector4(1794.73, 107.68, 169.52, 300.82),
    vector4(-1044.46, -522.1, 36.04, 28.73),
    vector4(2683.58, 3292.73, 55.24, 238.18),
    vector4(1032.41, -2492.01, 28.51, 153.41),
    vector4(1549.47, 3561.8, 35.36, 42.65),
    vector4(-1181.6, -904.75, 13.77, 302.18),
    vector4(972.42, 3.15, 81.04, 145.91),
    vector4(103.55, -129.25, 54.75, 157.09),
    vector4(258.25, 2578.75, 45.15, 278.74),
    vector4(1794.73, 107.68, 169.52, 300.82),
    vector4(-96.01, -2682.36, 6.01, 358.93),
    vector4(-1816.56, -1234.23, 13.02, 109.54),

}































Config.DJLocations = {
    { -- Vanilla Unicorn DJ Booth
        job = "vu", -- Set this to required job role
        enableBooth = true, -- option to disable rather than deleting code
        DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
        radius = 25, -- The radius of the sound from the booth
        coords = vector3(120.0, -1281.72, 29.48), -- Where the booth is located
    },
    { -- VU VIP Room
    job = "vu", -- "public" makes it so anyone can add music.
    enableBooth = true,
    DefaultVolume = 0.15,
    radius = 7,
    coords = vector3(111.3007, -1304.3901, 28.6876),
    --soundLoc = vector3(113.4731, -1303.0309, 29.8930), -- Add sound origin location if you don't want the music to play from the dj booth
    prop = 'prop_radio_01'
},
    { -- Sisyphus Theater
        job = "public", -- "public" makes it so anyone can add music.
        enableBooth = true,
        DefaultVolume = 0.15,
        radius = 200,
        coords = vector3(206.9, 1181.04, 226.51),
        soundLoc = vector3(212.32, 1155.87, 227.01), -- Add sound origin location if you don't want the music to play from the dj booth
    },
    { -- Henhouse (smokeys MLO coords)
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.1,
        radius = 30,
        coords = vector3(-311.35, 6265.18, 32.06),
    },
    { -- Tequilala bar (ingame mlo)
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.1,
        radius = 30,
        coords = vector3(-549.68, 282.64, 82.98),
    },


    { -- GabzTuners Radio Prop
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.1,
        radius = 30,
        coords = vector3(127.04, -3030.65, 6.80),
        prop = 'prop_radio_01' -- Prop to spawn at location, if the location doesn't have one already
                               -- (can be changed to any prop, coords determine wether its placed correctly)
    },
    { -- Gabz Popsdiner Radio Prop
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.1,
        radius = 30,
        coords = vector3(1595.53, 6453.02, 26.165),
        prop = 'prop_boombox_01'
    },
    { -- LostMC compound next to Casino
        gang = "lostmc",
        enableBooth = true,
        DefaultVolume = 0.1,
        radius = 20,
        coords = vector3(983.14, -133.17, 79.59),
        soundLoc = vector3(988.79, -131.62, 78.89), -- Add sound origin location if you don't want the music to play from the dj booth
    },
    { -- pdm
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.2,
        radius = 35,
        coords = vector3(-32.26, -1099.46, 27.27),
        soundLoc = vector3(-44.33, -1096.22, 28.27), -- Add sound origin location if you don't want the music to play from the dj booth
        
    },
    { -- mic
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.17,
        radius = 20,
        coords = vector3(-838.89, -719.29, 28.85),
        soundLoc = vector3(-831.81, -721.57, 28.06), -- Add sound origin location if you don't want the music to play from the dj booth
        
    },
    { -- studio
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.2,
        radius = 25,
        coords = vector3(-821.75, -724.13, 32.34),
        soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth
        
    },

    { -- luxury autos
    job = "public",
    enableBooth = true,
    DefaultVolume = 0.2,
    radius = 50,
    coords = vector3(127.64, -143.24, 54.61),
    --soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth
    
},


{ -- GALAXY NIGHTCLUB
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 30,
coords = vector3(-1602.2810, -3012.5500, -79.0498),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

},

{ -- Skarr Hillcrest
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 20,
coords = vector3(-859.7776, 675.8516, 152.4534),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

},

{ -- Pizza This!
job = "pizzathis",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(796.0356, -748.2004, 26.8438),
soundLoc = vector3(804.4647, -749.1584, 26.7808), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Ottos
job = "otto",
enableBooth = true,
DefaultVolume = 0.2,
radius = 20,
coords = vector3(827.0007, -808.6041, 33.5819),
--soundLoc = vector3(804.4647, -749.1584, 26.7808), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- LJ's House
--job = "pizzathis",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-763.5918, 316.5329, 174.8565),
--soundLoc = vector3(804.4647, -749.1584, 26.7808), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Reese's Eclipse House
--job = "pizzathis",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-763.9574, 316.5620, 221.3105),
--soundLoc = vector3(804.4647, -749.1584, 26.7808), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Taco!
job = "taco",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(14.5372, -1609.0043, 29.1865),
soundLoc = vector3(14.5372, -1609.0043, 29.1865), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Max Damage!
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(19.9091, -1107.2761, 29.9082),
soundLoc = vector3(19.9091, -1107.2761, 30.9082), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- event!
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-1551.9783, -1010.9634, 12.0179),
soundLoc = vector3(-1551.9783, -1010.9634, 12.0179), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},
{ --Reese 
enableBooth = true,
DefaultVolume = 0.1,
radius = 35,
coords = vector3(943.4400, -1808.0016, 1.3817),
soundLoc = vector3(943.4400, -1808.0016, 1.3817), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- cop House
--job = "pizzathis",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-787.6706, 179.5905, 71.9202),
soundLoc = vector3(-787.6706, 179.5905, 72.9202), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Recycle
enableBooth = true,
DefaultVolume = 0.2,
radius = 50,
coords = vector3(1212.81631, -3275.9954, 5.5035),
soundLoc = vector3(1212.3658, -3277.3535, 5.5334), -- Add sound origin location if you don't want the music to play from the dj booth
--prop = 'prop_50s_jukebox'

},

{ -- GSF
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-153.70127, -1612.7387, 33.094),
soundLoc = vector3(-154.1127, -1612.3887, 33.6494), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Scrap Gang!
--ob = "pizzathis",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(1258.2873, -1563.3812, 58.3516),
soundLoc = vector3(1258.2873, -1563.3812, 58.3516), -- Add sound origin location if you don't want the music to play from the dj booth
--prop = 'prop_radio_01'

},


--[[{ -- Wu Chang
--job = "pizzathis",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-838.6557, -719.6387, 28.2849),
soundLoc = vector3(-838.6557, -719.6387, 28.2849), -- Add sound origin location if you don't want the music to play from the dj booth
--prop = 'prop_radio_01'

},]]


{ -- Dynasty8
job = "realestate",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-700.3314, 268.1309, 83.1073),
soundLoc = vector3(-700.3314, 268.8309, 83.1473), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},


{ -- Cat Cafe
job = "catcafe",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-586.7386, -1058.1617, 22.2442),
soundLoc = vector3(-586.5386, -1058.1617, 22.3442), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- Scaletta Family
gang = "family",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-324.4760, -2440.1594, 2.5265),
soundLoc = vector3(-324.4760, -2440.1594, 3.0265), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},


{ -- Cartel
gang = "cartel",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(495.5525, -1530.9779, 33.88502),
soundLoc = vector3(495.5525, -1530.9779, 35.1502), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},


{ -- Crips
gang = "crips",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-344.9845, 51.7271, 53.7918),
soundLoc = vector3(-344.9845, 51.7271, 53.7918), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},


{ -- Triads
gang = "triads",
enableBooth = true,
DefaultVolume = 0.2,
radius = 15,
coords = vector3(-654.2123, -1220.9775, 17.4427),
soundLoc = vector3(-654.2123, -1220.9775, 18.4427), -- Add sound origin location if you don't want the music to play from the dj booth
prop = 'prop_radio_01'

},

{ -- WeazelNews
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 10,
coords = vector3(-565.3200, -932.7093, 23.8157),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

},

{ -- Church
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 30,
coords = vector3(-770.2414, -17.2734, 45.0152),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

},
{ -- pillbox
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 50,
coords = vector3(309.36, -593.23, 43.11),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

},
{ -- pawnshop
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 25,
coords = vector3(172.01, -1316.84, 29.07),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

}, -- vector3(-1193.14, -896.02, 15.02)
{ -- burgershot
job = "public",
enableBooth = true,
DefaultVolume = 0.2,
radius = 25,
coords = vector3(-1193.14, -896.02, 14.03),
--soundLoc = vector3(-815.17, -718.96, 32.34), -- Add sound origin location if you don't want the music to play from the dj booth

},


































}


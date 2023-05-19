Config = {} or Config
Config.img = "qb-inventory/html/images/"
Config.Debug = false


Config.CheckBalance = true
Config.CheckDead = true
Config.Coords = vector4(2812.18, 5977.55, 350.08, 12.71)
Config.Cost = 500
Config.MoneyType = 'cash'




Config.TruckBlipName = "Los Santos Trucking" -- blip name
Config.TruckBlipSprite = 477 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.TruckBlipColor = 39  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip





Config.TruckSpots = {
    [1] = {
        name = 'Pillbox Medical Delivery',
        icon = "",
        text = 'Required: A Truck',
        loc = vector4(281.14, -589.6, 17.91, 171.16),
        amount = math.random(500,1000),
        xp = math.random(1,25),
        pickloc = vector4(-1243.13, -1508.28, 4.45, 199.23),
        trailer = 'trailers'
    },
    [2] = {
        name = 'Smoke On The Water Route',
        icon = "",
        text = 'Required: A Truck',
        loc = vector4(-1227.31, -1504.08, 4.27, 171.16),
        amount = math.random(500,1000),
        xp = math.random(1,25),
        pickloc = vector4(-1243.13, -1508.28, 4.45, 199.23),
        trailer = 'tvtrailer'
    },
}






Config.Menu = {
    
    [1] = {
        item = 'nos',
        icon = "",
        text = 'Required: 5 GNE',
        crypto = 'gne',
        amount = 5,
       
    },
    [2] = {
        item = 'engine5',
        icon = "",
        text = 'Required: 65 Shungnite',
        crypto = 'shung',
        amount = 65,
       
    },
    [3] = {
        item = 'transmission4',
        icon = "",
        text = 'Required: 55 Shungnite',
        crypto = 'shung',
        amount = 55,

    },
    [4] = {
        item = 'brakes3',
        icon = "",
        text = 'Required: 45 Shungnite',
        crypto = 'shung',
        amount = 45,

    },
    [5] = {
        item = 'suspension5',
        icon = "",
        text = 'Required: 40 Shungnite',
        crypto = 'shung',
        amount = 40,
       
    },

}










Config.FuelExport = 'LegacyFuel'

Config.Locations = {
    vehicle = {
        coords = vector4(-295.67, -996.3, 29.25, 206.46),
        pedhash = 'a_m_y_business_03',
        spawnpoint = vector4(-301.97, -1004.54, 29.39, 248.97),
    },

    vehicle2 = {
        coords = vector4(2009.4813, 3050.4080, 46.2136, 46.6862),
        pedhash = 'a_m_y_business_03',
        spawnpoint = vector4(2008.5135, 3055.6599, 47.0502, 334.8710),
    },


    vehicle3 = {
        coords = vector4(-131.8657, 6332.7012, 30.4905, 81.1188),
        pedhash = 'a_m_y_business_03',
        spawnpoint = vector4(-135.2698, 6336.2402, 31.4905, 134.5961),
    },


    aircraft = {
        coords = vector4(-1686.57, -3149.22, 12.99, 240.88),
        pedhash = 's_m_y_airworker',
        spawnpoint = vector4(-1673.4, -3158.47, 13.99, 331.49),
    },

    boat = {
        coords = vector4(-753.5, -1512.27, 4.02, 25.61),
        pedhash = 'mp_m_boatstaff_01',
        spawnpoint = vector4(-794.95, -1506.27, 1.08, 107.79),
    },

    boat2 = {
        coords = vector4(-1604.2683, 5256.1191, 1.0711, 24.3268),
        pedhash = 'mp_m_boatstaff_01',
        spawnpoint = vector4(-1601.4264, 5259.3525, 0.3078, 19.8618),
    },

    boat3 = {
        coords = vector4(-308.6725, -2447.0972, 0.8159, 97.7039),
        pedhash = 'mp_m_boatstaff_01',
        spawnpoint = vector4(-314.7404, -2449.2549, 0.7465, 137.7735),
    },
}

Config.Blips = { 
    {title= "Vehicle Rentals", colour= 50, id= 56, x= -295.67, y= -996.3, z= 29.25},
    {title= "Vehicle Rentals", colour= 50, id= 56, x= 2009.5, y= 3050.4, z= 46.608},
    {title= "Vehicle Rentals", colour= 50, id= 56, x= -131.8, y= 6332.7, z= 31.48},
    {title= "Aircraft Rentals", colour= 32, id= 578, x= -1673.39, y= -3158.45, z= 13.99},
    {title= "Boat Rentals", colour= 42, id= 455, x= -753.55, y= -1512.24, z= 5.02}, 
    {title= "Boat Rentals", colour= 42, id= 455, x= -1604.4263, y= 5257.0586, z= 5.02}, 
}

Config.Vehicles = {
    land = {
        [1] = {
            model = 'bmx', --DONT CHANGE PLEASE
            money = 200,
        },
        [2] = {
            model = 'tornado', --DONT CHANGE PLEASE
            money = 500,
        },
        [3] = {
            model = 'ratbike', --DONT CHANGE PLEASE
            money = 700,
        },
        [4] = {
            model = 'speedo', --DONT CHANGE PLEASE
            money = 1200,
        },
    },
    air = {
        [1] = {
            model = 'dodo',
            money = 9500,
        },
        [2] = {
            model = 'frogger2',
            money = 10000,
        },
        [3] = {
            model = 'nimbus',
            money = 15000,
        },
        
    },
    sea = {
        [1] = {
            model = 'seashark3',
            money = 100,
        },
        [2] = {
            model = 'dinghy3',
            money = 500,
        },
        [3] = {
            model = 'tug',
            money = 750,
        },
        [4] = {
            model = 'longfin',
            money = 2500,
        },
    }
}
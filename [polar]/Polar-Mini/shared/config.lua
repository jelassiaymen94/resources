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




Config.RegularTrucking = {

    [1] = {
        name = 'Sandy Shores Repair', -- done
        loc = vector4(258.25, 2578.75, 45.15, 278.74),
        amount = math.random(1000,3000),
        xp = math.random(5,15),
        pickloc = vector4(853.02, -3127.8, 5.9, 90.58),
        trailer = 'docktrailer',
          


    },
    [2] = {
        name = 'Tennis Court Rental', -- done
        loc = vector4(-1028.54, -493.36, 36.94, 114.5),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(853.01, -3143.86, 5.9, 91.18),
        trailer = 'trailers3',


    },
    [3] = {

        name = 'Damned Damn', -- done
        loc = vector4(1794.73, 107.68, 169.52, 300.82),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(473.82, -2992.51, 6.04, 85.94),
        trailer = 'trailerlogs',

    },
    [4] = {

        name = 'Fame or Shame Route', -- done
        loc = vector4(-1044.46, -522.1, 36.04, 28.73),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-206.57, -1978.1, 27.62, 180.86),
        trailer = 'tvtrailer',

    },
    [5] = {

        name = 'Gas Hog',
        loc = vector4(2683.58, 3292.73, 55.24, 238.18),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-1803.93, 799.54, 138.51, 38.93),
        trailer = 'tanker',

    },
    [6] = {

        name = 'Prisoner Garbage Dump',
        loc = vector4(1032.41, -2492.01, 28.51, 153.41),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(1854.13, 2625.45, 45.67, 357.95),
        trailer = 'trailers4',

    },
    [7] = {

        name = 'Construction Supplies',
        loc = vector4(1549.47, 3561.8, 35.36, 42.65),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(211.06, 2747.4, 43.43, 95.55),
        trailer = 'trailers',


    },
    [8] = {
        name = 'Up N Atom Burger', -- done
        loc = vector4(-1181.6, -904.75, 13.77, 302.18),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-1051.42, -1566.17, 4.81, 304.45),
        trailer = 'trailers2',




    },
    [9] = {

        name = 'Casino Vending Machines', -- done
        loc = vector4(972.42, 3.15, 81.04, 145.91),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-3146.63, 1043.02, 20.76, 336.96),
        trailer = 'trailers3',

        

    },
    [10] = {

        name = 'Dealership Resupply', -- done
        loc = vector4(103.55, -129.25, 54.75, 157.09),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-1097.89, -2398.09, 13.95, 63.3),
        trailer = 'tr2',

        

    },
    [11] = {



        name = 'Sandy Shores Repair',-- done
        loc = vector4(258.25, 2578.75, 45.15, 278.74),
        amount = math.random(1000,3000),
        xp = math.random(5,15),
        pickloc = vector4(853.02, -3127.8, 5.9, 90.58),
        trailer = 'docktrailer',

    },
    [12] = {


        name = 'Tennis Court Rental', -- done
        loc = vector4(-1028.54, -493.36, 36.94, 114.5),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(853.01, -3143.86, 5.9, 91.18),
        trailer = 'trailers3',
        

    },
    [13] = {


        name = 'Damned Damn', -- done
        loc = vector4(1794.73, 107.68, 169.52, 300.82),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(473.82, -2992.51, 6.04, 85.94),
        trailer = 'trailerlogs',
        

    },
    [14] = {


        name = 'Fame or Shame Route', -- done
            loc = vector4(-1044.46, -522.1, 36.04, 28.73),
            amount = math.random(500,1000),
            xp = math.random(5,15),
            pickloc = vector4(-206.57, -1978.1, 27.62, 180.86),
            trailer = 'tvtrailer',

    },
    [15] = {

        name = 'Gas Hog',
        loc = vector4(2683.58, 3292.73, 55.24, 238.18),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-1803.93, 799.54, 138.51, 38.93),
        trailer = 'tanker',

    },
    [16] = {


        name = 'Prisoner Garbage Dump',
        loc = vector4(1032.41, -2492.01, 28.51, 153.41),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(1854.13, 2625.45, 45.67, 357.95),
        trailer = 'trailers4',
        

    },
    [17] = {


        name = 'Construction Supplies',
        loc = vector4(1549.47, 3561.8, 35.36, 42.65),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(211.06, 2747.4, 43.43, 95.55),
        trailer = 'trailers',


    },
    [18] = {


        name = 'Up N Atom Burger', -- done
        loc = vector4(-1181.6, -904.75, 13.77, 302.18),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-1051.42, -1566.17, 4.81, 304.45),
        trailer = 'trailers2',
        

    },
    [19] = {
        name = 'Casino Vending Machines', -- done
        loc = vector4(972.42, 3.15, 81.04, 145.91),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-3146.63, 1043.02, 20.76, 336.96),
        trailer = 'trailers3',

    },
}
Config.Special = {
    [1] = {

        name = 'Dealership Resupply', -- done
        loc = vector4(103.55, -129.25, 54.75, 157.09),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-1097.89, -2398.09, 13.95, 63.3),
        trailer = 'tr2',

        

    },
    [2] = {



        name = 'Richmans Boat',
        loc = vector4(-886.61, -1488.29, 5.02, 107.36),
        amount = math.random(500,3000),
        xp = math.random(5,15),
        pickloc = vector4(-1392.11, 83.84, 53.99, 0.8),
        trailer = 'tr3',

    },
    [3] = {


        name = 'Playboy Vehicles Special',
        loc = vector4(-1526.96, 83.48, 56.59, 273.54),
        amount = math.random(500,3000),
        xp = math.random(5,15),
        pickloc = vector4(233.1, -3114.72, 5.79, 354.99),
        trailer = 'tr4',

    },
    [4] = {


        name = 'Army Special Delivery', -- done
        loc = vector4(-96.01, -2682.36, 6.01, 358.93),
        amount = math.random(500,3000),
        xp = math.random(5,15),
        pickloc = vector4(1043.83, -2491.49, 28.51, 153.18),
        trailer = 'armytrailer2',

    },
    [5] = {


        name = 'Freight Liner', -- done
        loc = vector4(-1921.37, 2085.64, 137.03, 172.67),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(-985.67, -2941.83, 13.95, 146.56),
        trailer = 'freighttrailer',

        

    },
    [6] = {


        name = 'Army Base Supply CO.', -- done
        loc = vector4(2683.58, 3292.73, 55.24, 238.18),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(1151.86, -3017.54, 5.9, 88.19),
        trailer = 'armytanker',


    },
    [7] = {


        name = 'Seafood Delight', -- done
        loc = vector4(-1816.56, -1234.23, 13.02, 109.54),
        amount = math.random(500,1000),
        xp = math.random(5,15),
        pickloc = vector4(803.32, -764.96, 26.73, 88.6),
        trailer = 'trflat',
        

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

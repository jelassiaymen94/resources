Config = {} or Config



Config.MinimumCops = 0 -- how many cops min to start corner selling

--------------- THIRD EYE CORNER SELLING


Config.GiveBonusOnPolice = true -- \ Give bonus on selling drugs to police (Edit on server side)
Config.ChanceSell = 85 -- \ Chance to sell drug (in %)
Config.Zones = { -- \ Sell zones (these zones are linked with the certain drugs check below)
    ['groove'] = {        
        points = {
            vector2(-51.52, -1734.09),
 vector2(89.39, -1847.73),
 vector2(149.24, -1777.27),
 vector2(250.76, -1863.64),
 vector2(136.36, -1992.42),
 vector2(125.00, -2022.73),
 vector2(93.94, -2019.70),
 vector2(40.91, -1946.21),
 vector2(-143.94, -1782.58)
        },
        minZ = 18.035144805908,
        maxZ = 75.059997558594,                      
    },
    ['vinewood'] = {
        points = {
            vector2(486.36, 48.48),
 vector2(524.24, 113.64),
 vector2(521.21, 146.97),
 vector2(51.52, 292.42),
 vector2(16.67, 200.00),
 vector2(472.73, 16.67)
        },
        minZ = 45.0,
        maxZ = 125.0
    },
 
    ['forumdr'] = {
        points = {
            vector2(-259.09, -1446.21),
 vector2(-237.88, -1441.67),
 vector2(-196.21, -1426.52),
 vector2(-170.45, -1454.55),
 vector2(-129.55, -1410.61),
 vector2(-71.21, -1405.30),
 vector2(65.15, -1406.82),
 vector2(108.33, -1427.27),
 vector2(87.88, -1462.12),
 vector2(-19.70, -1590.15),
 vector2(-130.30, -1720.45),
 vector2(-181.82, -1773.48),
 vector2(-262.12, -1703.79),
 vector2(-338.64, -1656.06),
 vector2(-283.33, -1557.58),
 vector2(-262.12, -1478.79)
        },
        minZ = 15.0,
        maxZ = 38.0
    },
    
}
local weed = math.random(349,651)
local meth = math.random(499,1499)
local coke = math.random(399,1251)
Config.ZoneDrugs = { -- \ Names should be same as zone names
    -- Multiple drugs can be added to a zone like shown below
    [1] = {zone="sellzonegroove", item = 'cokebag', price = math.random(399,1251)},
    [2] = {zone="sellzonegroove", item = 'meth', price =math.random(499,1499)},  
    [3] = {zone="sellzonegroove", item = '1ozhigh', price = math.random(400,600)},   
    --[[[3] = {zone="sellzonegroove", item = '35weedlow', price = math.random(100,400)}, 
    [4] = {zone="sellzonegroove", item = '35weedmid', price = math.random(451,851)}, 
    [5] = {zone="sellzonegroove", item = '35weedhigh', price = math.random(851,1251)},]] 
    [4] = {zone="sellzonevinewood", item = 'cokebag', price = math.random(399,1251)},
    [5] = {zone="sellzonevinewood", item = 'meth', price = math.random(499,1499)},   
    [6] = {zone="sellzonevinewood", item = '1ozhigh', price = math.random(400,600)},  
    --[[[9] = {zone="sellzonevinewood", item = '35weedlow', price = math.random(100,400)},
    [10] = {zone="sellzonevinewood", item = '35weedmid', price = math.random(451,851)},
    [11] = {zone="sellzonevinewood", item = '35weedhigh', price = math.random(851,1251)},]]
    [7] = {zone="sellzoneforumdr", item = 'cokebag', price = math.random(399,1251)},
    [8] = {zone="sellzoneforumdr", item = 'meth', price = math.random(499,1499)}, 
    [9] = {zone="sellzoneforumdr", item = '1ozhigh', price = math.random(400,600)},     
    --[[[15] = {zone="sellzoneforumdr", item = '35weedlow', price = math.random(100,400)}, 
    [16] = {zone="sellzoneforumdr", item = '35weedmid', price = math.random(451,851)},  
    [17] = {zone="sellzoneforumdr", item = '35weedhigh', price = math.random(851,1251)},]]  


--[[
    [15] = {zone="sellzonepier", item = '35weedlow', price = math.random(100,400)}, 
    [16] = {zone="sellzonepier", item = 'cokebag', price = math.random(399,1251)},   
    [17] = {zone="sellzonepier", item = 'meth', price = math.random(499,1499)},  
    [18] = {zone="sellzonepier", item = '35weedmid', price = math.random(250,750)},  
    [19] = {zone="sellzonepier", item = '35weedhigh', price = math.random(499,1499)},  


    [20] = {zone="sellzonesoul", item = 'cokebag', price = math.random(399,1251)},  
    [21] = {zone="sellzonesoul", item = '35weedlow', price = math.random(100,400)},   
    [22] = {zone="sellzonesoul", item = 'meth', price = math.random(499,1499)},  
    [23] = {zone="sellzonesoul", item = '35weedmid', price = math.random(250,750)},  
    [24] = {zone="sellzonesoul", item = '35weedhigh', price = math.random(499,1499)},  
]]

    
}

Config.BlacklistPeds = { -- \ Ped models that should be blacklisted
    "mp_m_shopkeep_01",
    "s_m_y_ammucity_01",
    "s_m_m_lathandy_01",
    "s_f_y_clubbar_01",
    "ig_talcc",
    "g_f_y_vagos_01",
    "hc_hacker",
    "s_m_m_migrant_01",
    "u_m_m_bankman",
    "ig_barry",
    "S_F_Y_Shop_LOW",
    "S_F_Y_SweatShop_01",
    "s_m_m_migrant_01",
    "IG_Benny_02",
    "MP_F_BennyMech_01",
    "S_M_M_Autoshop_03",
    `cs_nervousron`,
    `IG_RussianDrunk`,
    `U_M_Y_MilitaryBum`,
    `A_F_M_TrampBeac_01`,
    `A_M_M_Tramp_01`,
    `S_M_M_StrVend_01`,
    `s_m_m_ammucountry`,
    `mp_f_weed_01`,
			`MP_M_Weed_01`,
			`A_M_Y_MethHead_01`,
			`A_F_Y_RurMeth_01`,
			`a_m_y_hippy_01`,
			`MP_M_WareMech_01`,
			`A_M_M_Farmer_01`,
			`MP_M_ExArmy_01`,
			`S_M_Y_ArmyMech_01`,
			`S_M_M_Armoured_02`,
            `mp_f_weed_01`,
			`MP_M_Weed_01`,
			`A_M_Y_MethHead_01`,
			`A_F_Y_RurMeth_01`,
			`A_M_M_RurMeth_01`,
			`MP_F_Meth_01`,
			`MP_M_Meth_01`,
            `a_m_y_hippy_01`,
            `mp_m_boatstaff_01`,
			`a_m_y_beach_01`,
}








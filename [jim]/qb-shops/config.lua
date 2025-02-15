
Config = {
	Debug = false, -- Enable to add debug boxes and message.
	img = "inventory/html/images/", -- Set this to your inventory
	JimMenu = true, -- Enable this if you are using an updated qb-menu resource with icon support
	ApGov = false, -- Add support for AP-Goverment Tax 
	Peds = true, -- Set to true if you want Shops to have Peds
	Limit = true, -- Enable this to add Stash features, This adds limits to items and gets refilled at each restart
	MaxSlots = 30, -- Set this to your player inventory slot count, this is default "41"
	BlackMarket = true, -- enable to add blackmarket locations (defined at the bottom of this file)
	Measurement = "lb", -- Custom Weight measurement
	Gabz247 = true,  -- Enable if using gabz 247 stores
	GabzAmmu = true, -- Enable if using gabz Ammunation stores
	VendOverride = true, -- Enable this if you want all the vending machines to use this script
	RandomAmount = false, -- Sets wether a stash should have a "random" amount of stock or full.

	Scenarios = { -- List of scenarios the peds do, This is called "fun", much better than standing staring at the void.
		"WORLD_HUMAN_GUARD_PATROL",
		"WORLD_HUMAN_JANITOR",
		"WORLD_HUMAN_MUSCLE_FLEX",
		"WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
		"PROP_HUMAN_STAND_IMPATIENT",
		"WORLD_HUMAN_VALET",
		"WORLD_HUMAN_AA_COFFEE",
		"WORLD_HUMAN_AA_SMOKE",
		"WORLD_HUMAN_DRUG_DEALER",
		"WORLD_HUMAN_GUARD_STAND_CASINO",
	},
	Products = {
		["normal"] = {
			{ name = "tosti", price = 10, amount = 50, },
			{ name = "water_bottle", price = 10, amount = 50, },
			{ name = "kurkakola", price = 10, amount = 50, },
			{ name = "twerks_candy", price = 10, amount = 50, },
			{ name = "snikkel_candy", price = 10, amount = 50, },
			{ name = "sandwich", price = 10, amount = 25, },
			{ name = "notepad", price = 10, amount = 25, },
			--{ name = "beer", price = 7, amount = 50, },
			--{ name = "whiskey", price = 10, amount = 50, },
			--{ name = "", price = 70000, amount = 50, },
			{ name = "bandage", price = 10, amount = 25, },
			{ name = "lighter", price = 100, amount = 15, },
			--{ name = "rolling_paper", price = 2, amount = 5000,  },
		},
		["bar"] = {
			{ name = "water_bottle", price = 600, amount = 50, },
			{ name = "beer", price = 100, amount = 50, },
			{ name = "whiskey", price = 150, amount = 50, },
			{ name = "vodka", price = 100, amount = 50, },
			{ name = "wine", price = 150, amount = 25, },
			{ name = "ecola", price = 600, amount = 50, },
			{ name = "ecolalight", price = 600, amount = 50, },
			{ name = "sprunk", price = 600, amount = 50, },
			{ name = "sprunklight", price = 600, amount = 25, },
		},
		["weedseed"] = {
			{ name = "male_seed", price = 600, amount = 50, },
			{ name = "female_seed", price = 100, amount = 50, },
			
		},
		["hardware"] = {
			{ name = "lockpick", price = 500, amount = math.random(30,45), },
			{ name = "ducttape", price = 100, amount = math.random(15,30), },
			{ name = "powersaw", price = 2500, amount = 10,} ,
			{ name = "goldpan", price = 750, amount = 10, },
			{ name = "pickaxe", price = 1500, amount = math.random(15,20), },
			{ name = "miningdrill", price = 22000, amount = math.random(5,10), },
			{ name = "mininglaser", price = 22000, amount = math.random(5,10), },
			{ name = "drillbit", price = 150, amount = 50, },
			{ name = "binoculars", price = 150, amount = 10, },
		--	{ name = "bakingsoda", price = 550, amount = 2, },
		--	{ name = "petfood", price = 50, amount = 50 },
		--	{ name = "collarpet", price = 1500, amount = 50 },
		--	{ name = "firstaidforpet", price = 250, amount = 50 },
		--	{ name = "petwaterbottleportable", price = 500, amount = 50 },
		--	{ name = "petnametag", price = 1500, amount = 50 },
		--	{ name = "scissors", price = 1000, amount = 5, },
			{ name = "detector", price = 425, amount = 25, },
			{ name = "shovel", price = 155, amount = 25, },
			{ name = "weapon_hammer", price = 5, amount = 50, },
		--	{ name = "cleaningkit", price = 5, amount = 50, },
			{ name = "cleaningkit", price = 5, amount = 50, },
			--{ name = "fishbait", price = 25, amount = math.random(250,500)},
			{ name = "screwdriverset", price = 2500, amount = 20, },
		},
		["weedshop"] = {
			--{ name = "joint", price = 100, amount = 30, },
			--{ name = "scale", price = 2500, amount = 5, },
			{ name = "weed_nutrition", price = 100, amount = math.random(75,125), },
			{ name = "drugbag", price = 100, amount = math.random(125,260), },
			{ name = "purifiedwater", price = 100, amount = math.random(75,125), },
			{ name = "rollingpaper", price = 50, amount = math.random(50,75), },
			--{ name = "male_seed", price = 8500, amount = math.random(5,15), },
			--{ name = "female_seed", price = 2500, amount = math.random(20,45), },
			--{ name = "smalljoint", price = 100, amount = 25, },
			
			
		},
		["gearshop"] = {
			{ name = "diving_gear", price = 2500, amount = 5, },
			{ name = "fishingrod", price = 1000, amount = math.random(15,25),},
			{ name = "fishbait", price = 25, amount = math.random(250,500)},
			{ name = "jerry_can", price = 2500, amount = 5, },
			
		},
		
		["leisureshop"] = {
			{ name = "parachute", price = 1500, amount = 5, },
			{ name = "binoculars", price = 750, amount = 5, },
			--{ name = "jerry_can", price = 1250, amount = 15, },
		},
		["weapons"] = {
			{ name = "weapon_knife", price = 500, amount = 10, },
			{ name = "weapon_bat", price = 500, amount = 10, },
			--{ name = "weapon_hatchet",price = 500, amount = 5,   },
			--{ name = "weapon_poolcue", price = 500, amount = 5,},
			{ name = "weapon_flashlight", price = 250, amount = 5,},
			{ name = "weapon_m9", price = 3500, amount = 10, requiresLicense = true },
			{ name = "weapon_pistol", price = 3500, amount = 10, requiresLicense = true },
			{ name = "pistol_ammo", price = 250, amount = 50,  requiresLicense = true },
			--{ name = "weapon_huntingrifle", price = 5000, amount = 5,  requiresLicense = true },
			--{ name = "spolar_ammo", price = 250, amount = 5,  requiresLicense = true },
		},
		["beansvending"] = {
			[1] =   {name = "coffee",            price = 10,        amount = 25,    info = {}},
			[2] =   {name = "water_bottle",                price = 6,        amount = 25,    info = {}},
			
		},
		["coffeeplace"] = {
			--{ name = "coffee", price = 5, amount = 1 },
			--{ name = "lighter", price = 2, amount = 1 },
		},
		["casino"] = {
			--{ name = 'casinochips', price = 1, amount = 50000 },
		},
		["electronics"] = {
			{ name = "phone", price = 500, amount = 10 },
			{ name = "radio", price = 1000, amount = 20, },
			{ name = "racingdevice", price = 1250, amount = 15, },
			{ name = "laptop", price = 12500, amount = 15, },
		},
	
		["blackmarket"] = {
			--{ name = "laptop", price = 10000, amount = 15 },
			{ name = "drill", price = 12500, amount = math.random(2,4) },
			{ name = "aluminumoxide", price = 1250, amount = 5 },
			{ name = "vpn", price = 2500, amount = math.random(2,8) },
			{ name = "metalscratchy", price = 2500, amount = 2 },
			{ name = "thermite", price = 9500, amount = math.random(2,8) },
			{ name = "hacking_device", price = 16750, amount = math.random(2,5) },
			{ name = "head_bag", price = 5000, amount = 5 },
		},
		["bm2"] = {
		
		--	{ name = "thermite", price = 125, amount = 2 },
		--	{ name = "hacking_device", price = 16750, amount = 1 },
			--{ name = "laptop_green", price = 12250, amount = 1 },
		--	{ name = "head_bag", price = 5000, amount = 5 },
			--{ name = "cocainekey", price = 5000, amount = 5 },
		},
		["bm3"] = {
		
		--	{ name = "thermite", price = 9000, amount = 2 },
		--	{ name = "screwdriverset", price = 1750, amount = 5 },
			--{ name = "noscan", price = 12000, amount = 15 },
			--{ name = "vpn", price = 3500, amount = 15 },
			--{ name = "cocainekey", price = 5000, amount = 5 },
		},
	
	
	

		

		["armory"] = {
			{ name = "weapon_stungun", price = 325, amount = 25,},
			{ name = "weapon_glock", price = 675, amount = 25,},
		--	{ name = "policetablet", price = 125, amount = 25, },
			{ name = "handcuffs", price = 800, amount = 25, },
			--{ name = "scanner", price = 125, amount = 25, },
			{ name = "spikestrip", price = 125, amount = 25, },
			{ name = "armor", price = 450, amount = 45, },
			{ name = "ifaks", price = 50, amount = 45, },
			{ name = "radio", price = 125, amount = 25, },
			{ name = "empty_evidence_bag", price = 25, amount = 45, },
			{ name = "weapon_nightstick", price = 125, amount = 25, },
			{ name = "weapon_flashlight", price = 125, amount = 25, },
			{ name = "notepad", price = 10, amount = 50, },
			{ name = "taser_cardridge", price = 75, amount = 45, },
			{ name = "pistol_ammo", price = 250, amount = 45, },
			{ name = "rifle_ammo", price = 450, amount = 25, },
		--	{ name = "shotgun_ammo", price = 200, amount = 25, },
			{ name = "smg_ammo", price = 250, amount = 25, },
			{ name = "mg_ammo", price = 600, amount = 25, },
		--	{ name = "weapon_m4", price = 2650, amount = 15,},
			{ name = "weapon_scarh", price = 4650, amount = 15,},
			--{ name = "weapon_ar15", price = 500, amount = 25,requiresLicense = true },
			--{ name = "weapon_remington", price = 1000, amount = 25,requiresLicense = true  },
			--{ name = "weapon_scarh", price = 750, amount = 25, requiresLicense = true },
		},

		
		


	
	},
}

Config.Locations = {
    -- 24/7 Locations
    ["247supermarket"] = {
        ["label"] = "24/7 Supermarket",
		["type"] = "items",
		["targetLabel"] = "Talk",
		["model"] = {
			'mp_m_shopkeep_01',
			'S_F_Y_Shop_LOW',
			'S_F_Y_SweatShop_01',
		},
		["killable"] = true,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(24.5, -1346.19, 29.5, 266.78),
			vector4(-3039.91, 584.26, 7.91, 16.79),
			vector4(-3243.27, 1000.1, 12.83, 358.73),
			vector4(1728.28, 6416.03, 35.04, 242.45),
			vector4(1697.96, 4923.04, 42.06, 326.61),
			vector4(1959.6, 3740.93, 32.34, 296.84),
			vector4(549.16, 2670.35, 42.16, 92.53),
			vector4(2677.41, 3279.8, 55.24, 334.16),
			vector4(2556.19, 380.89, 108.62, 355.58),
			vector4(372.82, 327.3, 103.57, 255.46),
			vector4(161.21, 6642.32, 31.61, 223.57),
		},
        ["products"] = Config.Products["normal"],
        ["blipsprite"] = 628,
		["blipcolour"] = 2,
		["hideblip"] = true,
    },
    -- LTD Gasoline Locations
    --[[["shops"] = {
        ["label"] = "Supermarket",
		["type"] = "items",
		["model"] = {
			'mp_m_shopkeep_01',
			'S_F_Y_Shop_LOW',
			'S_F_Y_SweatShop_01',
			'S_M_M_Autoshop_03',
			'IG_Benny',
			'IG_Benny_02',
			'MP_F_BennyMech_01',
		},
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(803.72, -757.35, 26.78, 135.03),
			
		},
        ["products"] = Config.Products["shops"],
        ["blipsprite"] = 59,
		["blipcolour"] = 5,
		["hideblip"] = true,
    },]]
	["shops2"] = {
        ["label"] = "Supermarket",
		["type"] = "items",
		["targetLabel"] = "Talk",
		["killable"] = true,
		["model"] = {
			'mp_m_shopkeep_01',
			'S_F_Y_Shop_LOW',
			'S_F_Y_SweatShop_01',
			'S_M_M_Autoshop_03',
			'IG_Benny',
			'IG_Benny_02',
			'MP_F_BennyMech_01',
		},
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
		--	vector4(-1206.1, -1460.67, 4.37, 308.72),
			
		},
        ["products"] = Config.Products["normal"],
        ["blipsprite"] = 59,
		["blipcolour"] = 5,
		
    },





	
	["ltdgasoline"] = {
        ["label"] = "LTD Gas Station",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			's_m_m_autoshop_02',
			'S_F_M_Autoshop_01',
			'S_M_M_AutoShop_01',
			'S_M_M_Autoshop_03',
			'IG_Benny',
			'IG_Benny_02',
			'MP_F_BennyMech_01',
		},
		["logo"] = "https://static.wikia.nocookie.net/gtawiki/images/7/72/LTD-GTAO-LSTunersBanner.png",
        ["coords"] = {
			vector4(-47.42, -1758.67, 29.42, 47.26),
			vector4(-706.17, -914.64, 19.22, 88.77),
			vector4(-1819.53, 793.49, 138.09, 131.46),
			vector4(1164.82, -323.66, 69.21, 106.86),
		},
        ["products"] = Config.Products["normal"],
        ["blipsprite"] = 628,
		["blipcolour"] = 5,
    },
    -- Rob's Liquor Locations
    ["robsliquor"] = {
        ["label"] = "Rob's Liqour",
		["type"] = "items",
		["targetLabel"] = "Talk",
		["model"] = {
			'cs_nervousron',
			'IG_RussianDrunk',
			'U_M_Y_MilitaryBum',
			'A_F_M_TrampBeac_01',
			'A_M_M_Tramp_01',
		},
		["logo"] = "https://static.wikia.nocookie.net/gtawiki/images/d/de/RebsLiquor-GTAV.png",
        ["coords"] = {
			vector4(-1221.38, -907.89, 12.33, 27.51),
			vector4(-1486.82, -377.48, 40.16, 130.89),
			vector4(-2966.41, 391.62, 15.04, 87.82),
			vector4(1165.15, 2710.78, 38.16, 177.96),
			vector4(1134.3, -983.26, 46.42, 276.3),
		},
        ["products"] = Config.Products["bar"],
       -- ["blipsprite"] = 628,
		--["blipcolour"] = 31,
    },
	
    -- Hardware Store Locations
    ["hardware"] = {
        ["label"] = "Hardware Store",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			's_m_m_autoshop_02',
			'S_F_M_Autoshop_01',
			'S_M_M_AutoShop_01',
			'S_M_M_Autoshop_03',
			'IG_Benny',
			'IG_Benny_02',
			'MP_F_BennyMech_01',
		},
		["coords"] = {
			vector4(46.52, -1749.55, 29.64, 50.82),
			vector4(2747.76, 3472.9, 55.67, 243.88),
			vector4(-421.65, 6135.97, 31.88, 232.98),
		},
        ["products"] = Config.Products["hardware"],
        ["blipsprite"] = 402,
		["blipcolour"] = 5,
    },
	-- Ammunation VANILLA Locations
    ["ammunation"] = {
        ["label"] = "Ammunation",
        ["targetLabel"] = "Talk",
		["type"] = "weapons",
		["killable"] = true,
		["model"] = {
			's_m_m_ammucountry',
			'S_M_Y_AmmuCity_01',
			'MP_M_WareMech_01',
			'A_M_M_Farmer_01',
			'MP_M_ExArmy_01',
			'S_M_Y_ArmyMech_01',
			'S_M_M_Armoured_02',
		},
		["logo"] = "https://static.wikia.nocookie.net/gtawiki/images/a/aa/Ammunation-GTAV.png",
        ["coords"] = {
            vector4(808.94, -2158.99, 29.62, 330.26),
            vector4(-660.98, -933.6, 21.83, 154.74),
			vector4(1693.16, 3761.94, 34.71, 189.83),
            vector4(-330.72, 6085.81, 31.45, 190.52),
			vector4(253.41, -51.67, 69.94, 28.88),
			--vector4(23.69, -1105.95, 29.8, 124.58),
            vector4(2566.81, 292.54, 108.73, 320.09),
            vector4(-1118.19, 2700.5, 18.55, 185.31),
            vector4(841.31, -1035.28, 28.19, 334.27),
			vector4(-1304.44, -395.68, 36.7, 41.85),
		},
        ["products"] = Config.Products["weapons"],
        ["blipsprite"] = 567,
		["blipcolour"] = 1,
    },
    -- Casino Locations
	["casino"] = {
		["label"] = "Diamond Casino",
		["targetLabel"] = "Buy Chips",
		["type"] = "items",
		["model"] = {
			'U_F_M_CasinoShop_01',
			'U_F_M_CasinoCash_01',
			'S_F_Y_Casino_01',
			'S_M_Y_Casino_01',
		},
		["coords"] = {
			--vector4(990.08, 30.35, 71.47, 94.81),
			--vector4(990.96, 31.8, 71.47, 19.59),
		},
		["products"] = Config.Products["casino"],
		["hideblip"] = true,
		["blipsprite"] = 617,
		["blipcolour"] = 0,
	},
    --[[["bm2"] = {
		["label"] = "Black Market",
		["coords"] = { vector4(-1507.0, -3006.09, -81.56, 327.43), },
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'mp_f_weed_01',
			'MP_M_Weed_01',
			'A_M_Y_MethHead_01',
			'A_F_Y_RurMeth_01',
			'A_M_M_RurMeth_01',
			'MP_F_Meth_01',
			'MP_M_Meth_01',
		},
		["products"] = Config.Products["bm2"],
		["blipsprite"] = 52,
		["blipcolour"] = 0,
		["hideblip"] = true,
	},

	["bm3"] = {
		["label"] = "Black Market",
		["coords"] = { vector4(-2079.7310, 2611.6172, 3.0840, 119.5305), },
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'mp_f_weed_01',
			'MP_M_Weed_01',
			'A_M_Y_MethHead_01',
			'A_F_Y_RurMeth_01',
			'A_M_M_RurMeth_01',
			'MP_F_Meth_01',
			'MP_M_Meth_01',
		},
		["products"] = Config.Products["bm3"],
		["blipsprite"] = 52,
		["blipcolour"] = 0,
		["hideblip"] = true,
	},]]
	
	
    -- Weedshop Locations
    ["weedshop"] = {
		["label"] = "Smoke on the Water",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'mp_f_weed_01',
			'MP_M_Weed_01',
			'A_M_Y_MethHead_01',
			'A_F_Y_RurMeth_01',
			'a_m_y_hippy_01',
		},
		["coords"] = { vector4(-1220.5, -1489.87, 4.37, 38.51), },
		["products"] = Config.Products["weedshop"],
		["blipsprite"] = 496,
		["blipcolour"] = 2,
	},

    ["seaworld"] = {
		["label"] = "Sea World",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'mp_m_boatstaff_01',
			'a_m_y_beach_01',
		},
		["coords"] = { vector4(-1686.48, -1072.53, 13.15, 49.85), },
		["products"] = Config.Products["gearshop"],
		["blipsprite"] = 52,
		["blipcolour"] = 3,
	},

    -- Leisure Shop Locations
    ["leisureshop"] = {
		["label"] = "Leisure Shop",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'mp_m_boatstaff_01',
			'a_m_y_beach_01',
		},
		["coords"] = { 
			vector4(-1505.67, 1512.29, 115.29, 244.94),
			--vector4(-818.8972, -723.4490, 121.2673, 99.8275),
		 },
		["products"] = Config.Products["leisureshop"],
		["blipsprite"] = 52,
		["blipcolour"] = 2,
    },

    -- Local Store Locations
    ["delvecchioliquor"] = {
        ["label"] = "Del Vecchio Liquor",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'cs_nervousron',
			'IG_RussianDrunk',
			'U_M_Y_MilitaryBum',
			'A_F_M_TrampBeac_01',
			'A_M_M_Tramp_01',
		},
        ["coords"] = { vector4(-160.54, 6320.85, 31.59, 317.79), },
        ["products"] = Config.Products["normal"],
        ["blipsprite"] = 52,
		["blipcolour"] = 2,
		["hideblip"] = true,
    },
	
	
	
	
	["armory"] = {
        ["label"] = "Police Armory",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'csb_prolsec',
			'csb_mweather',
			'mp_m_securoguard_01',
			'mp_s_m_armoured_01',
			's_m_m_chemsec_01',
			's_m_m_fibsec_01',
			's_m_m_marine_01',
			's_m_m_prisguard_01',
			's_m_m_snowcop_01',
			's_m_y_blackops_03',
			's_m_y_marine_03',
			's_m_y_cop_01',
			
		},
        ["coords"] = { vector4(360.28, -1601.61, 25.45, 273.7), vector4(454.0464, -979.9395, 30.6896, 87.0339),},
        ["products"] = Config.Products["armory"],
		["hideblip"] = true,
		["job"] = "police",
    },

	

	["digitalden"] = {
		["label"] = "Digital Den",
		["type"] = "items",
		["killable"] = true,
		["targetLabel"] = "Talk",
		["model"] = {
			'S_M_M_LifeInvad_01',
			'IG_Ramp_Hipster',
			'A_M_Y_Hipster_02',
			'A_F_Y_Hipster_01',
			'IG_LifeInvad_01',
			'IG_LifeInvad_02',
			'CS_LifeInvad_01',
		},
		["logo"] = "https://static.wikia.nocookie.net/gtawiki/images/b/b5/DigitalDen-GTAV-Logo.png",
		["coords"] = {
			--vector4(1133.56, -467.84, 66.49, 162.63),
			vector4(-1271.8373, -1411.2112, 4.3739, 121.3387),
			--vector4(-509.55, 278.63, 83.31, 176.65),
			--vector4(-656.27, -854.73, 24.5, 359.39),
			--vector4(-1088.29, -254.3, 37.76, 252.7),
			},
		["products"] = Config.Products["electronics"],
		["blipsprite"] = 619,
		["blipcolour"] = 7,
	}, 
}
if Config.Gabz247 then
	Config.Locations["247supermarket"]["coords"] = {
		vector4(24.91, -1346.86, 29.5, 268.37),
		vector4(-3039.64, 584.78, 7.91, 21.88),
		vector4(-3242.73, 1000.46, 12.83, 2.08),
		vector4(1728.44, 6415.4, 35.04, 243.26),
		vector4(1697.96, 4923.04, 42.06, 326.61),
		vector4(1960.26, 3740.6, 32.34, 300.45),
		vector4(548.67, 2670.94, 42.16, 101.0),
		vector4(2677.97, 3279.95, 55.24, 325.89),
		vector4(2556.8, 381.27, 108.62, 359.15),
		vector4(373.08, 326.75, 103.57, 253.14),
		vector4(161.2, 6641.74, 31.7, 221.02),
		vector4(812.86, -782.01, 26.17, 270.01),
	}
end
if Config.GabzAmmu then
	Config.Locations["ammunation"]["coords"] = {
		vector4(-659.16, -939.79, 21.83, 91.25),
		vector4(812.85, -2155.16, 29.62, 355.85),
		vector4(1698.04, 3757.43, 34.71, 136.69),
		vector4(-326.03, 6081.17, 31.45, 138.33),
		vector4(246.87, -51.3, 69.94, 335.47),
		vector4(4.8863, -1109.0562, 29.7972, 340.6324),
		vector4(2564.85, 298.83, 108.74, 283.17),
		vector4(-1112.4, 2697.08, 18.55, 152.96),
		vector4(841.16, -1028.63, 28.19, 294.2),
		vector4(-1310.71, -394.33, 36.7, 340.51),
	}
end
if Config.BlackMarket then
	Config.Locations["blackmarket"] = {
		["label"] = "Black Market",
		["type"] = "items",
		["model"] = {
			'mp_f_weed_01',
			'MP_M_Weed_01',
			'A_M_Y_MethHead_01',
			'A_F_Y_RurMeth_01',
			'A_M_M_RurMeth_01',
			'MP_F_Meth_01',
			'MP_M_Meth_01',
		},
		["coords"] = {
			vector4(831.99, -3244.74, -98.7, 302.25),
		},
		["products"] = Config.Products["blackmarket"],
		["hideblip"] = true,
	}
end

Config.ItemModels = {
	["repairkit"] = 'v_ind_cs_toolbox4',
	["advancedrepairkit"] = 'v_ind_cs_toolbox4',
	["phone"] = 'p_amb_phone_01',
	["tosti"] = 'prop_sandwich_01',
	["sandwich"] = 'prop_sandwich_01',
	["water_bottle"] = 'ba_prop_club_water_bottle',
	["kurkacola"] = 'prop_ecola_can',
	["sprunk"] = 'v_res_tt_can03',
	["sprunklight"] = 'v_res_tt_can03',
	["ecola"] = 'prop_ecola_can',
	["ecolalight"] = 'prop_ecola_can',
	["twerks_candy"] = 'prop_choc_pq',
	["snikkel_candy"] = 'prop_choc_pq',
	["beer"] = 'prop_sh_beer_pissh_01',
	["whiskey"] = 'prop_whiskey_bottle',
	["vodka"] = 'prop_vodka_bottle',
	["lighter"] = 'lux_prop_lighter_luxe',
	["welcomeguide"] = 'lux_prop_lighter_luxe',
	["screwdriverset"] = 'prop_tool_screwdvr01',
	["radio"] = 'prop_cs_hand_radio',
	["binoculars"] = 'v_serv_ct_binoculars',
	["cleaningkit"] = 'prop_huf_rag_01',

	["casinochips"] = 'vw_prop_chip_100dollar_st',
	["diving_gear"] = 'p_s_scuba_tank_s',
	["jerry_can"] = 'prop_jerrycan_01a',
	["parachute"] = 'p_parachute_s_shop',

	["coffee"] = 'prop_fib_coffee',
	["fitbit"] = 'p_watch_02',
	["radioscanner"] = 'prop_police_radio_main',
	--Weapons
	["weapon_bat"] = 'p_cs_bbbat_01',
	["weapon_knife"] = 'prop_w_me_knife_01',
	["weapon_hammer"] = 'w_me_hammer',
	["weapon_hatchet"] = 'prop_w_me_hatchet',
	['weapon_dagger'] = 'prop_w_me_dagger',
	['weapon_bottle'] = 'prop_w_me_bottle',
	['weapon_crowbar'] = 'prop_ing_crowbar',
	['weapon_flashlight'] = 'w_me_flashlight',
	['weapon_golfclub'] = 'prop_golf_iron_01',
	['weapon_knuckle'] = 'w_me_knuckle',
	['weapon_machete'] = 'prop_ld_w_me_machette',
	['weapon_switchblade'] = 'w_me_switchblade',
	['weapon_nightstick'] = 'w_me_nightstick',
	['weapon_wrench'] = 'v_ind_cs_wrench',
	['weapon_battleaxe'] = 'w_me_battleaxe',
	['weapon_poolcue'] = 'w_me_poolcue',
	['weapon_handcuffs']  = 'prop_cs_cuffs_01',
	['weapon_bread']  = 'v_res_fa_bread01',
	['weapon_stone_hatchet'] = 'w_me_stonehatchet',

	['weapon_pistol'] = 'w_pi_pistol',
	['weapon_pistol_mk2'] = 'w_pi_pistolmk2',
	['weapon_combatpistol'] = 'w_pi_combatpistol',
	['weapon_appistol']  = 'w_pi_appistol',
	['weapon_stungun'] 	 = 'w_pi_stungun',
	['weapon_pistol50']  = 'w_pi_pistol50',
	['weapon_snspistol']  = 'w_pi_sns_pistol',
	['weapon_heavypistol']  = 'w_pi_heavypistol',
	['weapon_vintagepistol'] = 'w_pi_vintage_pistol',
	['weapon_flaregun'] = 'w_pi_flaregun',
	--['weapon_marksmanpistol'] = '',
	['weapon_revolver'] = 'w_pi_revolver',
	['weapon_revolver_mk2'] = 'w_pi_revolvermk2',
	['weapon_doubleaction'] = 'w_pi_wep1_gun',
	['weapon_snspistol_mk2'] = 'w_pi_sns_pistolmk2',
	['weapon_raypistol'] = 'w_pi_raygun_ev',
	['weapon_ceramicpistol'] = 'w_pi_ceramic_pistol',
	['weapon_navyrevolver'] = 'w_pi_wep2_gun',
	--['weapon_gadgetpistol'] = '',
	['weapon_microsmg'] = 'w_sb_microsmg',
	['weapon_smg'] = 'w_sb_smg',
	['weapon_smg_mk2'] = 'w_sb_smgmk2',
	['weapon_assaultsmg'] = 'w_sb_assaultsmg',
	['weapon_combatpdw'] = 'w_sb_pdw',
	--['weapon_machinepistol'] = '',
	['weapon_minismg'] = 'w_sb_minismg',
	['weapon_raycarbine'] = 'w_ar_srifle',
	['weapon_pumpshotgun'] = 'w_sg_pumpshotgun',
	['weapon_pumpshotgun_mk2'] = 'w_sg_pumpshotgunmk2',
	['weapon_sawnoffshotgun'] = 'w_sg_sawnoff',
	['weapon_assaultshotgun'] = 'w_sg_assaultshotgun',
	['weapon_bullpupshotgun'] = 'w_sg_bullpupshotgun',
	['weapon_musket'] = 'w_ar_musket',
	['weapon_heavyshotgun'] = 'w_sg_heavyshotgun',
	['weapon_dbshotgun'] = 'w_sg_doublebarrel',
	--['weapon_autoshotgun'] = '',
	--['weapon_combatshotgun'] = '',

	['weapon_assaultrifle'] = 'w_ar_assaultrifle',
	['weapon_assaultrifle_mk2'] = 'w_ar_assaultriflemk2',
	['weapon_carbinerifle'] = 'w_ar_carbinerifle',
	['weapon_carbinerifle_mk2'] = 'w_ar_carbineriflemk2',
	['weapon_advancedrifle'] = 'w_ar_advancedrifle',
	['weapon_specialcarbine'] = 'w_ar_specialcarbine',
	['weapon_specialcarbine_mk2'] = 'w_ar_specialcarbinemk2',
	['weapon_bullpuprifle'] = 'w_ar_bullpuprifle',
	['weapon_bullpuprifle_mk2'] = 'w_ar_bullpupriflemk2',
	['weapon_compactrifle']  = 'w_ar_assaultrifle_smg',
	['weapon_militaryrifle'] = 'w_ar_heavyrifleh',
	['weapon_mg'] = 'w_mg_mg',
	['weapon_combatmg'] = 'w_mg_combatmg',
	['weapon_combatmg_mk2'] = 'w_mg_combatmgmk2',
	['weapon_gusenberg'] = 'w_sb_gusenberg',

	['weapon_sniperrifle'] = 'w_sr_sniperrifle',
	['weapon_heavysniper'] = 'w_sr_heavysniper',
	['weapon_heavysniper_mk2'] = 'w_sr_heavysnipermk2',
	['weapon_marksmanrifle'] = 'w_sr_marksmanrifle',
	['weapon_marksmanrifle_mk2'] = 'w_sr_marksmanriflemk2',
	--['weapon_remotesniper'] = '',
	['weapon_rpg'] = 'w_lr_rpg',
	['weapon_grenadelauncher'] = 'w_lr_grenadelauncher',
	['weapon_grenadelauncher_smoke'] = 'w_lr_grenadelauncher',
	['weapon_minigun'] = 'prop_minigun_01',
	['weapon_firework'] = 'w_lr_firework',
	['weapon_railgun'] = 'w_ar_railgun',
	--['weapon_hominglauncher'] = '',
	--['weapon_compactlauncher'] = '',
	--['weapon_rayminigun'] = '',
	['weapon_grenade'] = 'w_ex_grenadefrag',
	['weapon_bzgas'] = 'prop_gas_grenade',
	['weapon_molotov'] = 'w_ex_molotov',
	--['weapon_stickybomb'] = '',
	['weapon_proxmine'] = 'gr_prop_gr_pmine_01a',
	['weapon_snowball'] = 'w_ex_snowball',
	['weapon_pipebomb'] = 'w_ex_pipebomb',
	['weapon_ball'] = 'w_am_baseball',
	['weapon_smokegrenade'] = 'w_ex_grenadesmoke',
}

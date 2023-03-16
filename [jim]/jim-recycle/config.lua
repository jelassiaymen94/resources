print("Jim-Recycle - Recycling Script by Jimathy")

Config = {}

Config = {
	Blips = true, -- Enable Blips?
	BlipNamer = false, -- Enable to Name Blips different things, disable if you already have too many blips as this will group them together
	PropSpawn = true, -- Enable Ore Props
	Pedspawn = true, -- Do you want to spawn peds for main locations?
	Invincible = true, --Do you want the peds to be invincible?
	Frozen = true, --Do you want the peds to be unable to move? It's probably a yes, so leave true in there.
	Stoic = true, --Do you want the peds to react to what is happening in their surroundings?
	Fade = true, -- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
	Distance = 40.0, --The distance you want peds to spawn at
	EnableOpeningHours = true, -- Enable opening hours? If disabled you can always open the pawnshop.
	OpenHour = 9, -- From what hour should the pawnshop be open?
	CloseHour = 21, -- From what hour should the pawnshop be closed?
}

Config['delivery'] = {
	OutsideLocation = {x=1204.65,y=-3267.51,z=5.5,a=346.58}, -- vector4(1204.65, -3267.51, 5.5, 346.58) DONE
	
	InsideLocation = {x=1202.09,y=-3268.44,z=5.5,a=96.05}, -- vector4(1202.09, -3268.44, 5.5, 96.05) DONE

	SellLocation = {x=1211.84,y= -3270.53,z=5.5,a=268.58}, -- vector4(1211.84, -3270.53, 5.5, 268.58) DONE
	PersonalStash = {x=1211.89,y=-3273.1,z=5.5,a=271.99}, -- vector4(1211.89, -3273.1, 5.5, 271.99) DONE
	TradeItems = {x=1211.93,y=-3267.02,z=5.5,a=283.63},  --vector4(1211.93, -3267.02, 5.5, 283.63), DONE
	
	officeOut = {x= 1204.48,y= -3259.19,z = 5.5,a = 358.09 }, -- vector4(1204.48, -3259.19, 5.5, 358.09) DONE
	officeIn = {x= 1208.48,y= -3259.08,z = 5.5,a = 8.15 }, -- vector4(1208.48, -3259.08, 5.5, 8.15) DONE

	PackagePickupLocations = {
		[1] = {x=1198.77,y=-3283.34,z=5.5,a=354.03}, --[[[1] = { vector4(1198.77, -3283.34, 5.5, 354.03) },--]]
		[2] = {x=1197.8,y=-3275.85,z=5.5,a=180.77}, -- [2] = {vector4(1197.8, -3275.85, 5.5, 180.77)}, DONE
		[3] = {x=1190.68,y=-3283.38,z=5.5,a=355.62}, -- [3] = {vector4(1190.68, -3283.38, 5.5, 355.62)}, DONE
		[4] = {x=1194.93,y=-3275.93,z=5.5 ,a=181.68}, --[4] = {vector4(1194.93, -3275.93, 5.5, 181.68)}, DONE
		[5] = {x=1198.94,y=-3272.29,z=5.5,a=0.33},  --	[5] = {vector4(1198.94, -3272.29, 5.5, 0.33)}, DONE
		[6] = {x=1198.94,y=-3272.29,z=5.5,a=0.33}, --[6] = {vector4(1198.94, -3272.29, 5.5, 0.33)}, DONE
		[7] = {x=1189.12,y=-3272.56,z=5.5,a=356.85},-- [7] = {vector4(1189.12, -3272.56, 5.5, 356.85)}, DONE
		[8] = {x=1189.76,y=-3265.13,z=5.5,a=179.84},--[8] = {vector4(1189.76, -3265.13, 5.5, 179.84)}, DONE
		[9] = {x=1197.5,y=-3265.13,z=5.5,a=178.11},-- [9] = {vector4(1197.5, -326 5.13, 5.5, 178.11)}, DONE
		[10] = {x=1219.51,y=-3282.51,z=5.5,a=173.38},-- [10] = {vector4(1219.51, -3282.51, 5.5, 173.38)}, DONE
		[11] = {x=1225.93,y=-3282.7,z=5.5,a=194.5},-- [11] = {vector4(1225.93, -3282.7, 5.5, 194.5)}, DONE
		[12] = {x=1226.61,y=-3289.79,z=5.5,a=3.02},-- [12] = {vector4(1226.61, -3289.79, 5.5, 3.02)}, DONE
		[13] = {x=1221.42,y=-3289.63,z=5.5,a=188.28},--[13] = { vector4(1221.42, -3289.63, 5.5, 352.01)}, DONE
		[14] = {x=1218.23,y=-3296.92,z=5.5,a=3.12},-- [14] = {vector4(1218.23, -3296.92, 5.5, 3.12)}, DONE
		[15] = {x=1227.47,y=-3296.9,z=5.5,a=356.06},-- [15] = {vector4(1227.47, -3296.9, 5.5, 356.06)}, DONE
		[16] = {x=1225.67,y=-3252.58,z=5.5,a=263.29},--[16] = {vector4(1225.67, -3252.58, 5.5, 263.29)}, DONE
		[17] = {x=1223.47,y=-3259.26,z=5.5,a=80.8},-- [17] = {vector4(1223.47, -3259.26, 5.5, 80.8)}, DONE
		[18] = {x=1214.72,y=-3254.02,z=5.5,a=89.42},-- [18] = {vector4(1214.72, -3254.02, 5.5, 89.42)}, DONE
		[19] = {x=1221.54,y=-3238.07,z=5.5,a=261.02},--[19] = { vector4(1221.54, -3238.07, 5.5, 261.02)}, DONE
	},
	
	DropLocation = {x =1225.59, y =-3276.04, z =5.5, a = 0.46}, -- vector4(1225.59, -3276.04, 5.5, 0.46) DONE
	
	DropLocationop = {
		[1] =  {x =1218.94, y =-3275.22, z = 5.5, a =  269.47}, -- vector4(1218.94, -3275.22, 5.5, 269.47) DONE
		
	},
	WareHouseObjects = {
		"prop_toolchest_05",
	},
}
-- vector4(1211.97, -3271.34, 5.5, 81.37)
Config.Locations =  {
	['Recycle'] = { name = "Recycle Center", location = vector3(1211.97, -3271.34 , 5.5 - 1.0), heading = 81.37, blipTrue = true, Sprite = 365, Scale = 0.8, Colour = 2, }, -- The location where you enter the mine 
	['Trade'] = { name = "Recyclable Trader", location = vector3(1211.93, -3267.02, 5.5-1.0), heading = 81.37, blipTrue = false, Sprite = 365, Scale = 0.8, Colour = 2, }, -- The location where you enter the mine 
	['BottleBank'] = { name = "Bottle Bank", location = vector3(0,0,0-1.0), heading = 2.86, blipTrue = false, Sprite = 642, Scale = 0.8, Colour = 2,}, -- The location where you enter the mine 
	['BottleBank2'] = { name = "Bottle Bank", location = vector3(0,0,0-1.0), heading = 337.89, blipTrue = false, Sprite = 642, Scale = 0.8, Colour = 2,}, -- The location where you enter the mine 
	['BottleBank3'] = { name = "Bottle Bank", location = vector3(0,0,0-1.0), heading = 357.19, blipTrue = false, Sprite = 642, Scale = 0.8, Colour = 2,}, -- The location where you enter the mine 
	['BottleBank4'] = { name = "Bottle Bank", location = vector3(0,0,0-1.0), heading = 50.0, blipTrue = false, Sprite = 642, Scale = 0.8, Colour = 2,}, -- The location where you enter the mine 
	['BottleBank5'] = { name = "Bottle Bank", location = vector3(0,0,0-1.0), heading = 310.12, blipTrue = false, Sprite = 642, Scale = 0.8, Colour = 2,}, -- The location where you enter the mine 
	['BottleBank6'] = { name = "Bottle Bank", location = vector3(0,0,0-1.0), heading = 128.12, blipTrue = false, Sprite = 642, Scale = 0.8, Colour = 2,}, -- The location where you enter the mine 

}


Config.ArmoryWhitelist = {
    "FUN28030",
    "HHV33808",
    "MWE31087",
    "UOH84809",
    "ONT04484",
    "SUC74168",
    "KGV59544",
    "OEJ87427",
}

Config.Prices = {
	['copper'] = { name = 'copper', amount = 8 },
	['plastic'] = { name = 'plastic', amount = 8 },
	['metalscrap'] = { name = 'metalscrap', amount = 8 },
	['steel'] = { name = 'steel', amount = 8 },
	['glass'] = { name = 'glass', amount = 8 },
	['iron'] = { name = 'iron', amount = 8 },
	['rubber'] = { name = 'rubber', amount = 8 },
	['aluminum'] = { name = 'aluminium', amount = 8 },
	--['bottle'] = { name = 'bottle', amount = 50 },
	['can'] = { name = 'bottle', amount = 5 },
}

Config.DumpItems = {
	"weapon_shoe","weapon_shoe","weapon_shoe","weapon_shoe","weapon_shoe",
"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",	"recyclablematerial",
"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic", "plastic",	"plastic",	"plastic",	"plastic",	"plastic", "plastic",	"plastic",	"plastic",	"plastic",	"plastic","plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic",	"plastic", "plastic",	"plastic",	"plastic",	"plastic",	"plastic", "plastic",	"plastic",	"plastic",	"plastic",	"plastic",
"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",	"rubber",
"wires",	"wires",	"wires",	"wires",	"wires",	"wires",	"wires",	"wires",	"wires",	"wires",	
"metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap","metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap","metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap", "metalscrap","metalscrap", 

"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",	"steel",
"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass",	"glass", "glass",	"glass",	"glass",
"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron","iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",	"iron",

"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",	"aluminum",
"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",	"copper",
"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",	"carbon",
"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",	"charcoal",
"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",	"stone",
"hydrochloric_acid",	"hydrochloric_acid",	"hydrochloric_acid",	"hydrochloric_acid",	"hydrochloric_acid",	"hydrochloric_acid",	"hydrochloric_acid",													
"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",	"weed_nutrition",										
"female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", "female_seed", 
--"male_seed", "male_seed",
"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",	"purifiedwater",																								
"sodium_hydroxide",	"sodium_hydroxide",	"sodium_hydroxide",	"sodium_hydroxide",	"sodium_hydroxide",	"sodium_hydroxide",	"sodium_hydroxide",													
"weapon_switchblade", "weapon_switchblade", "weapon_switchblade", "weapon_switchblade",	"weapon_knife",	"weapon_knife",	"weapon_knife",	"weapon_knife",															
"weapon_crowbar",	"weapon_crowbar",	"weapon_crowbar",	"weapon_crowbar",	"weapon_crowbar",															
"weapon_hammer",	"weapon_hammer",	"weapon_hammer",																	
"weapon_pistol",	"weapon_pistol",	"weapon_pistol",						
"aluminumoxide","aluminumoxide","aluminumoxide","aluminumoxide",
"diamond_necklace_silver",	"diamond_necklace_silver",	"diamond_necklace_silver",	"diamond_necklace_silver",	"diamond_necklace_silver",	"diamond_necklace_silver",														
"silverchain",	"silverchain",	"silverchain",	"silverchain",	"silverchain",	"silverchain",	"silverchain",	"silverchain",	"silverchain",	"silverchain",										
"ruby_necklace",	"ruby_necklace",	"ruby_necklace",	"ruby_necklace",	"ruby_necklace",	"ruby_necklace",	"ruby_necklace",	"ruby_necklace",												
"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",	"goldchain","goldchain",											
"sapphire_necklace",	"sapphire_necklace",	"sapphire_necklace",	"sapphire_necklace",	"sapphire_necklace",	"sapphire_necklace",	"sapphire_necklace",													
"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",	"silver_ring",										
"uncut_sapphire",	"uncut_sapphire",	"uncut_sapphire",	"uncut_sapphire",	"uncut_sapphire",															
"rolex",	"rolex",	"rolex",	"rolex",	"rolex",	"rolex",	"rolex",													
"diamondring",	"diamondring",	"diamondring",	"diamondring",	"diamondring",															
"uncut_diamond",	"uncut_diamond",	"uncut_diamond",																	
"goldingot",	"goldingot",	"goldingot",	"goldingot",	"goldingot",															
"silveringot",	"silveringot",	"silveringot",	"silveringot",	"silveringot",	"silveringot",														
"dong",																
"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",	"bottle",
"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",	"cloth",
"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",	"rock",
"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",	"flower",
"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",	"can",
"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",	"ted",
"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",	"bubble",
"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",	"hentai",
"phone",	"phone",	"phone",	"phone",	"phone",	"phone",	"phone",													
"iphone",	"iphone",	"iphone",	"iphone",	"iphone",	"iphone",	"iphone",													
"samsungphone",	"samsungphone",	"samsungphone",	"samsungphone",	"samsungphone",	"samsungphone",	"samsungphone",													
"tablet",	"tablet",	"tablet",	"tablet",	"tablet",	"tablet",	"tablet",													
"painting",	"painting",	"painting",	"painting",	"painting",															
"microwave",	"microwave",	"microwave",	"microwave",	"microwave",															
"television",	"television",	"television",	"television",	"television",															
"megaphone",	"megaphone",	"megaphone",	"megaphone",	"megaphone",															
"01_monkeyman",	"01_monkeyman",																		
"02_mrsmonkey",	"02_mrsmonkey",	"02_mrsmonkey",
"washkey",	"washkey",			
"weedkey", 	"weedkey", 													
"craftingkey",	"craftingkey",																		
"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",	"apple_juice",								
"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",	"raw_ham",								
"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",	"raw_bacon",								
"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",	"raw_beef",								
"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",	"bandage",								
"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",	"sprunklight",								
"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",	"ecolalight",								
"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",	"ecola",								
"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",	"pumpkin",								
"beer",	"beer",	"beer",	"beer",	"beer",	"beer",	"beer",	"beer",	"beer",	"beer",	"beer",	"beer",								
"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",	"whiskey",								
"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",	"tosti",								
"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",	"sandwich",								
"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",	"water_bottle",								
"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",	"sprunk",								
"firework3",	"firework3",	"firework3",	"firework3",	"firework3",	"firework3",														
"firework4",	"firework4",	"firework4",	"firework4",	"firework4",	"firework4",														
"walkstick",	"walkstick",	"walkstick",	"walkstick",																
"binoculars",	"binoculars",	"binoculars",	"binoculars",																
"snowball",	"snowball",	"snowball",	"snowball",	"snowball",	"snowball",	"snowball",													
"lighter",	"lighter",	"lighter",	"lighter",	"lighter",	"lighter",	"lighter",													
"ducttape",	"ducttape",	"ducttape",	"ducttape",	"ducttape",	"ducttape",	"ducttape",	"ducttape",	"ducttape",	"ducttape",										
"randombag",	"randombag",	"randombag",	"randombag",	"randombag",															
"welcomeguide",															
"paper",	"paper",	"paper",	"paper",	"paper",	"paper",	"paper",	"paper",	"paper",	"paper",										
"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",	"rolling_paper",										
"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",	"screwdriverset",										
"lockpick",	"lockpick",	"lockpick",	"lockpick",	"lockpick",	"lockpick",	"lockpick",													
"advancedlockpick",	"advancedlockpick",	"advancedlockpick",	"advancedlockpick",	"advancedlockpick",																													
"radio",	"radio",	"radio",	"radio",	"radio",	"radio",	"radio",													
"drugbag",	"drugbag",	"drugbag",	"drugbag",	"drugbag",	"drugbag",	"drugbag",	"drugbag",	"drugbag",	"drugbag",										
"fishingrod",	"fishingrod",	"fishingrod",	"fishingrod",	"fishingrod",															
"fishingbait",	"fishingbait",	"fishingbait",	"fishingbait",	"fishingbait",	"fishingbait",	"fishingbait",													
"drillbit",	"drillbit",	"drillbit",	"drillbit",	"drillbit",	"drillbit",														
"pickaxe",	"pickaxe",	"pickaxe",	"pickaxe",	"pickaxe",	"pickaxe",	"pickaxe",													
"pistol_ammo",	"pistol_ammo",	"pistol_ammo",	"pistol_ammo",	"pistol_ammo",	"pistol_ammo",	"pistol_ammo",													
"35weedlow", "35weedmid", "35weedhigh", 
"meth",	"meth",
"cokebag",																		
"tomato",	"tomato",	"tomato",	"tomato",	"tomato",	"tomato",	"tomato",	"tomato",	"tomato",	"tomato",										
"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",	"tomatopaste",										
}
Config.tenmin = "1"
Config.tenmax = "1"

Config.bulkmin = "1"
Config.bulkmax = "1"

Config.PedList = { -- APPARENTLY You can call config locations IN the config, learn't that one today
	{ model = "S_M_Y_Construct_01", coords = Config.Locations['Recycle'].location, heading = Config.Locations['Recycle'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
	{ model = "S_M_Y_Construct_01", coords = Config.Locations['Trade'].location, heading = Config.Locations['Trade'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, --Trade
	{ model = "S_M_Y_Construct_01", coords = Config.Locations['BottleBank'].location, heading = Config.Locations['BottleBank'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
	--{ model = "S_M_Y_Construct_01", coords = Config.Locations['BottleBank2'].location, heading = Config.Locations['BottleBank2'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
	--{ model = "S_M_Y_Construct_01", coords = Config.Locations['BottleBank3'].location, heading = Config.Locations['BottleBank3'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
	--{ model = "S_M_Y_Construct_01", coords = Config.Locations['BottleBank4'].location, heading = Config.Locations['BottleBank4'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
	--{ model = "S_M_Y_Construct_01", coords = Config.Locations['BottleBank5'].location, heading = Config.Locations['BottleBank5'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
	--{ model = "S_M_Y_Construct_01", coords = Config.Locations['BottleBank6'].location, heading = Config.Locations['BottleBank6'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", }, -- Outside Mine
}
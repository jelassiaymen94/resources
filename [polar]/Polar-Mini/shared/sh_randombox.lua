Config = {}
---Box and Case Can have completely different items within them. they do not inteferre with each other at all.
local two = math.random(3,6)
local bagamount = math.random(10,15)
Config.NumberOfItemsBox = 6  --amount of different items to receive from 1 (box) 
Config.NumberOfItemsCase = 5  --amount of different items to receive from 1 (Case) 
Config.NumberOfItemsBag = bagamount -- starter bag
Config.NumberOfItemsAmmo = 5
Config.NumberOfItemsMedkit = 3
Config.NumberOfItemsGun = 3
Config.NumberOfItemsShoe = 3
Config.ItemAmountBox = 1  --quantity of each item received (1 coffee or 2 coffee etc) (Box)
Config.ItemAmountCase = 1  --quantity of each item received (1 coffee or 2 coffee etc) (Case)
Config.ItemAmountBag = 1
Config.ItemAmountAmmo = 1
Config.ItemAmountMedkit = 1
Config.ItemAmountGun = 1
Config.ItemAmountShoe = 1
Config.LuckItemBox = "trojan_usb"  --change to whatever you want (Box)
Config.LuckItemCase = "bandage"  --change to whatever you want (Case)
Config.LuckItemBag = "advancedlockpick"

Config.LuckAmountBox = 1 --amount of luck item you receive if enabled (Box)
Config.LuckAmountCase = 1 --amount of luck item you receive if enabled (Case)
Config.LuckAmountBag = 1

Config.BoxItemList = {}  --dont touch

Config.BoxItems = {  --add as many items as you like. these are the random items you may get
"weapon_m9",
"advancedlockpick",
"weapon_pistol",
"randombag",
"ifaks",
"handcuffs",
"lockpick",
"washkey",
"stolencard",
"methkey",
"weapon_microsmg3",
"weapon_sledgehammer",
"thermitepowder",
"cloth",
"gunpowder",
"smg_ammo",
"pistol_ammo",
"pdarmor",
"armor",
"pistol_suppressor",
"weapon_switchblade",
"weapon_machete",
"weapon_flare",
"screwdriverset",
"rolex",
"diving_gear",
"meth",
"weapon_smokegrenade",
"weapon_poolcue",
"weapon_ball",
"weapon_molotov",
"gusenberg_extendedclip",
"walkstick",
"fitbit",
"radio",
"aluminumoxide",

}

Config.CaseItemList = {}  --dont touch

Config.CaseItems = {   --place whatever items you want in here. theres no limit
"pistolbarrel",
"pistolgrip",
"pistolbody",
"pistolbarrel",
"pistolgrip",
"pistolbody",
"pistolbarrel",
"pistolgrip",
"pistolbody",
"pistolbarrel",
"pistolgrip",
"pistolbody",
"pistolbarrel",
"pistolgrip",
"pistolbody",
"pistolbarrel",
"pistolgrip",
"pistolbody",
"smgbody",
"smggrip",
"smgbarrel",
"smgbody",
"smggrip",
"smgbarrel",
"smgbody",
"smggrip",
"smgbarrel",
"smgbody",
"smggrip",
"smgbarrel",
"rifletrigger",
"riflebody",
"riflereciever",
"rifletrigger",
"riflebody",
"riflereciever",
}

Config.BagItemList = {}

Config.BagItems = {   --place whatever items you want in here. theres no limit
    "coffee",
    "coffee",
    "coffee",
    "twerks_candy",
    "newsissueone",
    "lockpick",
    "lockpick",
    "bandage",
    "weapon_knife",
    "bandage",
    "bandage",
    "bandage",
    "monkeykush_blunt",
    "ogscar_blunt",
    "1ozhigh",
    "beer",
    "whiskey",
    "ducttape",
    "ducttape",
    "snikkel_candy",
    "snikkel_candy",
    "flower",
    "rolex",
    "coffee",
    "twerks_candy",
    "twerks_candy",
    "twerks_candy",
    "lockpick",
    "lockpick",
    "bandage",
    "weapon_knife",
    "weapon_bat",
    "bandage",
    "beer",
    "whiskey",
    "ducttape",
    "ducttape",
    "snikkel_candy",
    "snikkel_candy",
    "flower",
    "rolex",
    "lighter",

}

Config.AmmoItemList = {}

Config.AmmoItems = {
   "pistol_ammo",
   "pistol_ammo",
   "pistol_ammo",
   "pistol_ammo",
   "smg_ammo",
   "smg_ammo",
   "smg_ammo",
   "rifle_ammo",
   "rifle_ammo",
   "rpg_ammo",
}

Config.MedkitItemList = {}

Config.MedkitItems = {

}

Config.GunItemList = {}

Config.GunItems = {
    "01_monkeyman",
    "02_mrsmonkey",
    "02_mrsmonkey",
    "03_tommyscaletta",
    "03_tommyscaletta",
    "03_tommyscaletta",
    "04_seymourbutts",
    "04_seymourbutts",
    "04_seymourbutts",
    "04_seymourbutts",
    "05_reese",
    "05_reese",
    "05_reese",
    "05_reese",
    "05_reese",
}





Config.ShoeItemList = {}

Config.ShoeItems = {

    
    
}
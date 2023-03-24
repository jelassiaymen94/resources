Config = {}
---Box and Case Can have completely different items within them. they do not inteferre with each other at all.
local two = math.random(3,6)
local bagamount = math.random(10,15)
Config.NumberOfItemsBox = 6  --amount of different items to receive from 1 (box) 
Config.NumberOfItemsCase = 10  --amount of different items to receive from 1 (Case) 
Config.NumberOfItemsBag = bagamount -- starter bag
Config.NumberOfItemsAmmo = 10
Config.NumberOfItemsMedkit = 10
Config.NumberOfItemsGun = 10
Config.NumberOfItemsShoe = 10
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
 "notepad",
 "smgbody",
 "washkey",
 "cokekey",
 "methkey",
 "weapon_mac10",
 "weapon_sledgehammer",
 "thermitepowder",
 "plastic",
 "steel",
 "metalscrap",
 "cloth",
 "gunpowder",
 "smg_ammo",
 "pistol_ammo",
 "beer",
 "pdarmor",
 "armor",
 "purifiedwater",
 "pistol_suppressor",
 "weapon_switchblade",
 "weapon_machete",
 "weapon_flare",
 "shotgun_ammo",
 "whiskey",
 "vodka",
 "largejoint",
 "screwdriverset",
 "painkillers",
 "rolex",
 "firework1",
 "firework2",
 "firework3",
 "firework4",
 "diving_gear",
 "cleaningkit",
 "meth",
 "weapon_smokegrenade",
 "weapon_poolcue",
 "weapon_ball",
 "weapon_snowball",
 "weapon_molotov",
 "gusenberg_extendedclip",
 "walkstick",
 "fitbit",
 "radio",
 "bandage",
 "aluminumoxide",
 

}

Config.CaseItemList = {}  --dont touch

Config.CaseItems = {   --place whatever items you want in here. theres no limit

}

Config.BagItemList = {}

Config.BagItems = {   --place whatever items you want in here. theres no limit
    "coffee",
    "coffee",
    "coffee",
    "twerks_candy",
    "twerks_candy",
    "twerks_candy",
    "lockpick",
    "lockpick",
    "bandage",
    "weapon_knife",
    "weapon_ball",
     
    "bandage",
    "bandage",
    "bandage",
    "largejoint",
    "beer",
    "whiskey",
    "largejoint",
    "plastic",
    "ducttape",
    "ducttape",
    "snikkel_candy",
    "snikkel_candy",
    "flower",
    "rolex",
    "lighter",
    "painkillers",
    "coffee",
    "coffee",
    "coffee",
    "twerks_candy",
    "twerks_candy",
    "twerks_candy",
    "lockpick",
    "lockpick",
    "bandage",
    "weapon_knife",
    "weapon_ball",
     
    "bandage",
    "bandage",
    "bandage",
    "largejoint",
    "beer",
    "whiskey",
    "largejoint",
    "plastic",
    "ducttape",
    "ducttape",
    "snikkel_candy",
    "snikkel_candy",
    "flower",
    "rolex",
    "lighter",
    "painkillers",
}

Config.AmmoItemList = {}

Config.AmmoItems = {
   
}

Config.MedkitItemList = {}

Config.MedkitItems = {

}

Config.GunItemList = {}

Config.GunItems = {
  
}





Config.ShoeItemList = {}

Config.ShoeItems = {
   
    
    
}
Config = {} or Config
local QBCore = exports['qb-core']:GetCoreObject()
-- Core Values----------------------------------------------------------------
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'inventory'
Config.Skillbar = 'qb-skillbar'
----------------------------------------------------------------

-- Debug
Config.Debug = false -- debug for checks
Config.img = "inventory/html/images/"

Config.StoreBenchmin = 0
Config.ToolsBenchmin = 0
Config.WeaponsBenchmin = 200
Config.ExplosivesBenchmin = 520
Config.AmmoBenchmin = 2500

Config.Locations = {

    [1] = {
    Table =  vector4(-921.4268, 400.7218, 79.1264, 20.7826),
    type = 'weapons',
    name = '1',
    },
    [2] = {
    Table =  vector4(1223.0338, 1897.9207, 78.0086, 309.5884),
    type = 'tools',
    name = '2',
    },
    [3] = {
    Table =  vector4(63.8442, 6663.9414, 31.7869, 235.0951),
    type = 'ammo',
    name = '3',
    },
    [4] = {
    Table =  vector4(1516.1110, -2100.6833, 76.7760, 182.7406),
    type = 'explosives',
    name = '4',
    },
   --[[ [5] = {
    Table =  vector4(18.2827, -1100.2949, 29.7972, 340.9893),
    type = 'store',
    name = '5',
    },]]

}
 

Config.ToolsBench = {

    [1] = {
        item = 'lockpick',
        icon = "",
        required = {
            steel = 5,
            metalscrap = 10,
            rubber = 3,
        },
        exp = 0, -- required xp amount
    },
    [2] = {
        item = 'screwdriverset',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Iron".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Steel",
        exp = 20,
    },
    [3] = {
        item = 'armor',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 15 Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Carbon ",
        exp = 60,
    },
    [4] = {
        item = 'metalscratchy',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Iron".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Metal Scrap ",
        exp = 519,
    },
    [5] = {
        item = 'electronickit',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Gold Ingot".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Plastic Bottles",
        exp = 849,
    },
    [6] = {
        item = 'aluminumoxide',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['glass'].image.." width=25px onerror='this.onerror=null; this.remove();'> 20 Glass".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Gunpowder ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum",
        exp = 4254,
    },
    [7] = {
        item = 'thermitepowder',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2  Aluminum Oxide".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['glass'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Glass",
        exp = 5000,
    },
    [8] = {
        item = 'handcuffs',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5  Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron",
        exp = 9354,
    },
  
}


Config.WeaponsBench = {

    [1] = {
        item = 'weapon_switchblade',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 3 Rubber",
        exp = 120,
       
    },
    [2] = {
        item = 'weapon_sledgehammer',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 15 Metal Sheets".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 3 Rubber",
        exp = 204,
      
    },
    [3] = {
        item = 'weapon_knuckle',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=30px onerror='this.onerror=null; this.remove();'> 2 Gold Ingots".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel ",
        exp = 1289,
      
    },
    [4] = {
        item = 'weapon_fnx45',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolgrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Body ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Barrel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=30px onerror='this.onerror=null; this.remove();'> 5 Carbon ",
        exp = 3334,
      
    },
    [5] = {
        item = 'weapon_microsmg2',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Copper".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Barrel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Body".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smggrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=30px onerror='this.onerror=null; this.remove();'> 5 Carbon",
        exp = 15000,
      
    },
    [6] = {
        item = 'weapon_microsmg3',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Copper".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Barrel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Body".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smggrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=30px onerror='this.onerror=null; this.remove();'> 5 Carbon",
        exp = 17000,
      
    },
    [7] = {
        item = 'weapon_pistol50',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolgrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Body ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Barrel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum ",
        exp = 23379,
      
    },
    [8] = {
        item = 'weapon_assaultrifle2',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflereciever'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Reciever".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rifletrigger'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Trigger ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflebody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Body ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Carbon ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum " .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Copper ",
        exp = 29000,
      
    },
    [9] = {
        item = 'weapon_assaultrifle',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflereciever'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Reciever".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rifletrigger'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Trigger ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflebody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Body ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Carbon ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum " .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Copper ",
        exp = 31000,
      
    },
  
}

Config.AmmoBench = {

    [1] = {
        item = 'gunpowder',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['charcoal'].image.." width=25px onerror='this.onerror=null; this.remove();'> 25 Charcoal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Aluminum Oxide Powder",
        exp = 1839,
       
    },
    [2] = {
        item = 'pistol_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Gun Powder",
        exp = 2529,
      
    },
    [3] = {
        item = 'smg_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Gun Powder",
        exp = 14750,
       
    },
    [4] = {
        item = 'rifle_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 6 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Gun Powder",
        exp = 27000,
      
    },
  
}

Config.ExplosivesBench = {

    [1] = {
        item = 'weapon_flare',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Aluminum Oxide Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 20 Plastic ",
        exp = 309,
       
    },
    [2] = {
        item = 'thermite',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Refined Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder ",
        exp = 5500,
      
    },
    [3] = {
        item = 'weapon_smokegrenade',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['charcoal'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Charcoal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder",
        exp = 5534,
      
    },
    [4] = {
        item = 'weapon_molotov',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_petrolcan'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Gas Can".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['bottle'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Bottle".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Cloth",
        exp = 10500,
      
    },
    [5] = {
        item = 'weapon_pipebomb',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Gun Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder",
        exp = 12729,
      
    },
    [6] = {
        item = 'weapon_grenade',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 6 Metal Scrap".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Highly Explosive Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron",
        exp = 19500,
      
    },
  
}



Config.StoreBench = {

    [1] = {
        item = 'gunpowder',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['charcoal'].image.." width=25px onerror='this.onerror=null; this.remove();'> 25 Charcoal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Aluminum Oxide Powder",
        exp = 1839,
       
    },
    [2] = {
        item = 'pistol_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Gun Powder",
        exp = 2529,
      
    },
    [3] = {
        item = 'smg_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Gun Powder",
        exp = 14750,
       
    },
    [4] = {
        item = 'rifle_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 6 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Gun Powder",
        exp = 27000,
      
    },
    [5] = {
        item = 'pistolbarrel',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Scrap Metal",
        exp = 2529,
      
    },
    [6] = {
        item = 'pistolbody',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Scrap Metal",
        exp = 2529,
       
    },
    [7] = {
        item = 'pistolgrip',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Scrap Metal",
        exp = 2529,
      
    },
    [8] = {
        item = 'smgbarrel',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Scrap Metal",
        exp = 14750,
      
    },
    [9] = {
        item = 'smgbody',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Scrap Metal",
        exp = 14750,
       
    },
    [10] = {
        item = 'smggrip',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Scrap Metal",
        exp = 14750,
      
    },
    [11] = {
        item = 'riflebody',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Scrap Metal",
        exp = 27000,
      
    },
    [12] = {
        item = 'rifletrigger',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Scrap Metal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Gold Ingot",
        exp = 27000,
       
    },
    [13] = {
        item = 'riflereciever',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper Nails".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Iron Ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Scrap Metal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['silveringot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Silver Ingot",
        exp = 27000,
      
    },
}
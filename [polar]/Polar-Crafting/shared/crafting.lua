Config = {} or Config
local QBCore = exports['qb-core']:GetCoreObject()
-- Core Values----------------------------------------------------------------
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'qb-inventory'
Config.Skillbar = 'qb-skillbar'
----------------------------------------------------------------

-- Debug
Config.Debug = true -- debug for checks
Config.img = "qb-inventory/html/images/"

Config.ToolsBenchmin = 0
Config.WeaponsBenchmin = 200
Config.ExplosivesBenchmin = 520
Config.AmmoBenchmin = 2500



Config.ToolsBench = {

    [1] = {
        item = 'lockpick',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 3 Rubber",
        exp = 0,
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
        exp = 80,
    },
    [4] = {
        item = 'metalscratchy',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Iron".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Metal Scrap ",
        exp = 450,
    },
    [5] = {
        item = 'electronickit',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Gold Ingot".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Plastic Bottles",
        exp = 900,
    },
    [6] = {
        item = 'ironoxidepowder',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['glass'].image.." width=25px onerror='this.onerror=null; this.remove();'> 15 Glass".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Gun Powder ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron",
        exp = 4500,
    },
    [7] = {
        item = 'aluminumoxide',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['glass'].image.." width=25px onerror='this.onerror=null; this.remove();'> 20 Glass".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Copper ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum",
        exp = 5000,
    },
    [8] = {
        item = 'thermitepowder',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1  Aluminum Oxide Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ironoxidepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Iron Oxide Powder ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['glass'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Glass",
        exp = 6200,
    },
    [9] = {
        item = 'handcuffs',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5  Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron",
        exp = 9000,
    },
  
}


Config.WeaponsBench = {

    [1] = {
        item = 'weapon_switchblade',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 3 Rubber",
        exp = 200,
       
    },
    [2] = {
        item = 'weapon_sledgehammer',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 15 Metal Sheets".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 3 Rubber",
        exp = 300,
      
    },
    [3] = {
        item = 'weapon_knuckle',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=30px onerror='this.onerror=null; this.remove();'> 2 Gold Ingots".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel ",
        exp = 1800,
      
    },
    [4] = {
        item = 'weapon_fnx45',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolgrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Body ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Barrel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copper'].image.." width=30px onerror='this.onerror=null; this.remove();'> 4 Copper ",
        exp = 5500,
      
    },
    [5] = {
        item = 'weapon_microsmg3',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Copper".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Barrel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Body".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smggrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 5 Rubber",
        exp = 20100,
      
    },
    [6] = {
        item = 'weapon_pistol50',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolgrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Body ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['pistolbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Pistol Barrel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Refined Aluminum ",
        exp = 35000,
      
    },
    [7] = {
        item = 'weapon_assaultrifle2',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflereciever'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Reciever".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rifletrigger'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Trigger ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflegrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Grip ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Carbon ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum " .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Copper ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Rubber ",
        exp = 46000,
      
    },
    [8] = {
        item = 'weapon_assaultrifle',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflereciever'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Reciever".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rifletrigger'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Trigger ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflegrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Grip ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Carbon ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Aluminum " .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_copper'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Copper ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Rubber ",
        exp = 55000,
      
    },
  
}

Config.AmmoBench = {

    [1] = {
        item = 'gunpowder',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['charcoal'].image.." width=25px onerror='this.onerror=null; this.remove();'> 25 Charcoal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Aluminum Oxide Powder",
        exp = 2500,
       
    },
    [2] = {
        item = 'pistol_ammo',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['copperore'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Copper ore".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Gun Powder",
        exp = 3500,
      
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
        exp = 25000,
      
    },
  
}

Config.ExplosivesBench = {

    [1] = {
        item = 'weapon_flare',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminumoxide'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Aluminum Oxide Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 20 Plastic ",
        exp = 520,
       
    },
    [2] = {
        item = 'thermite',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Refined Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Cloth",
        exp = 6200,
      
    },
    [3] = {
        item = 'weapon_smokegrenade',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['charcoal'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Charcoal".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder",
        exp = 9500,
      
    },
    [4] = {
        item = 'weapon_molotov',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_petrolcan'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Gas Cans".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['bottle'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Bottle".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Cloth",
        exp = 10500,
      
    },
    [5] = {
        item = 'weapon_pipebomb',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Gun Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder",
        exp = 14500,
      
    },
    [6] = {
        item = 'weapon_grenade',
        icon = "",
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 6 Metal Scrap".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Highly Explosive Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Refined Iron",
        exp = 25000,
      
    },
  
}




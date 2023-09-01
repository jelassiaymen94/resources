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
        required = {
            {'steel', 5},
            {'metalscrap', 10},
            {'rubber', 3},
        },
        exp = 0, -- required xp amount
    },
    [2] = {
        item = 'screwdriverset',
        required = {
            {'iron', 4},
            {'metalscrap', 4},
            {'steel', 2},
        },
        exp = 20,
    },
    [3] = {
        item = 'armor',
        required = {
            {'carbon', 2},
            {'steel', 15},

        },exp = 60,
    },
    [4] = {
        item = 'metalscratchy',
        required = {
            {'metalscrap', 10},
            {'iron', 10},
        },
        exp = 519,
    },
    
    [5] = {
        item = 'electronickit',
        required = {
            {'refined_iron', 1},
            {'goldingot', 1},
            {'plastic', 5},
        },
       exp = 849,
    },
    [6] = {
        item = 'aluminumoxide',
        required = {
            {'glass', 20},
            {'plastic', 6},
            {'gunpowder', 5},
            {'refined_aluminum', 1},
         
        },
        exp = 4254,
    },
    [7] = {
        item = 'thermitepowder',
        required = {
            {'glass', 5},
            {'plastic', 5},
            {'aluminumoxide', 1},
          
        },
        exp = 5000,
    },
    [8] = {
        item = 'handcuffs',
        required = {
            {'metalscrap', 5},
            {'refined_steel', 5}, 
            {'refined_iron', 1},
        },
       exp = 9354,
    },
  
}



Config.WeaponsBench = {

    [1] = {
        item = 'weapon_switchblade',
        required = {
            {'metalscrap', 10},
            {'steel', 5}, 
            {'rubber', 3},
        },
        exp = 120,
       
    },
    [2] = {
        item = 'weapon_sledgehammer',
        required = {
            {'iron', 15},
            {'steel', 5}, 
            {'rubber', 5},
        },
        exp = 204,
      
    },
    [3] = {
        item = 'weapon_knuckle',
        required = {
            {'refined_steel', 2},
            {'goldingot', 2}, 
           
        },
        exp = 1289,
      
    },
    [4] = {
        item = 'weapon_fnx45',
        required = {
            {'refined_iron', 1},
            {'refined_aluminum', 1}, 
            {'pistolbarrel', 1},
            {'pistolbody', 1},
            {'pistolgrip', 1},
            {'carbon', 5},  
        },
        exp = 3334,
      
    },
    [5] = {
        item = 'weapon_microsmg2',
        required = {
            {'refined_steel', 1},
            {'refined_copper', 1}, 
            {'smgbarrel', 1},
            {'smgbody', 1},
            {'smggrip', 1},
            {'carbon', 5},  
        },
        exp = 15000,
      
    },
    [6] = {
        item = 'weapon_microsmg3',
        required = {
            {'refined_steel', 1},
            {'refined_copper', 1}, 
            {'smgbarrel', 1},
            {'smgbody', 1},
            {'smggrip', 1},
            {'carbon', 7},  
        },
        exp = 17000,
      
    },
    [7] = {
        item = 'weapon_pistol50',
        required = {
            {'refined_steel', 2},
            {'refined_aluminum', 1}, 
            {'pistolbarrel', 1},
            {'pistolbody', 1},
            {'pistolgrip', 1},
            {'carbon', 5},  
        },
        exp = 23379,
       
    },
    [8] = {
        item = 'weapon_assaultrifle2',
        required = {
            {'riflereciever', 1},
            {'rifletrigger', 1}, 
            {'riflebody', 1},
            {'refined_aluminum', 1},
            {'refined_steel', 3},
            {'carbon', 10},  
            {'refined_copper', 2},  
        },
        exp = 29000,
        
    },
    [9] = {
        item = 'weapon_assaultrifle',
        required = {
            {'riflereciever', 1},
            {'rifletrigger', 1}, 
            {'riflebody', 1},
            {'refined_aluminum', 2},
            {'refined_steel', 5},
            {'carbon', 12},  
            {'refined_copper', 3},  
        },
        exp = 31000,
      
    },
  
}

Config.AmmoBench = {

    [1] = {
        item = 'gunpowder',
        required = {
            {'aluminumoxide', 1},
            {'charcoal', 25}, 
            {'refined_iron', 1},
        },  exp = 1839,
       
    },
    [2] = {
        item = 'pistol_ammo',
        required = {
            {'copperore', 2},
            {'gunpowder', 1}, 
           
        },  exp = 2529,
      
    },
    [3] = {
        item = 'smg_ammo',
        required = {
            {'gunpowder', 2},
            {'copperore', 4}, 
           
        },  exp = 14750,
       
    },
    [4] = {
        item = 'rifle_ammo',
        required = {
            {'copperore', 3},
            {'gunpowder', 6}, 
           
        }, exp = 27000,
      
    },
  
}

Config.ExplosivesBench = {

    [1] = {
        item = 'weapon_flare',
        required = {
            {'aluminumoxide', 1},
            {'plastic', 20}, 
        },
        exp = 309,
       
    },
    [2] = {
        item = 'thermite',
        required = {
            {'refined_plastic', 4},
            {'thermitepowder', 1}, 
        },
        exp = 5500,
      
    },
    [3] = {
        item = 'weapon_smokegrenade',
        required = {
            {'aluminum', 5},
            {'charcoal', 5}, 
        },
        exp = 5534,
      
    },
    [4] = {
        item = 'weapon_molotov',
        required = {
            {'weapon_petrolcan', 1},
            {'bottle', 2}, 
            {'cloth', 1}, 
        },
         exp = 10500,
      
    },
    [5] = {
        item = 'weapon_pipebomb',
        required = {
            {'gunpowder', 10},
            {'rubber', 3}, 
            {'refined_aluminum', 2}, 
            {'thermitepowder', 1}, 
        },
        txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['gunpowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Gun Powder".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['thermitepowder'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Highly Explosive Powder",
        exp = 12729,
      
    },
    [6] = {
        item = 'weapon_m67',
        required = {
            {'metalscrap', 6},
            {'refined_aluminum', 2}, 
            {'thermitepowder', 2}, 
            {'refined_iron', 1}, 
        },
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
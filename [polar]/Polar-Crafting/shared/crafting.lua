Config = {} or Config


Config.Target = 'qb-target'


Config.Debug = false -- debug for checks
Config.img = "inventory/html/images/" -- used for images, change to qb-inventory if qb or whatever you use

Config.UseProp = true -- use the prop below spawn
Config.Prop = 'prop_tool_bench02'

Config.Locations = {

    [1] = {
    TitleName = "Crafting Bencheroni",
    Table =  vector4(-921.4268, 400.7218, 79.1264, 20.7826),
    Bench = "WeaponsBench",
    Min = 200,
    USESPECIAL = nil, -- either 'gang', 'job', 'cid', -- if none then keep nil
    SPECIAL = '', 
    },
    [2] = {
    TitleName = "Crafting Bencheroni",
    Table =  vector4(1223.0338, 1897.9207, 78.0086, 309.5884),
    Bench = "ToolsBench",
    Min = 0,
    USESPECIAL = nil, -- either 'gang', 'job', 'cid', -- if none then keep nil
    SPECIAL = '', 
    },
    [3] = {
    TitleName = "Crafting Bencheroni",
    Table =  vector4(63.8442, 6663.9414, 31.7869, 235.0951),
    Bench = "AmmoBench",
    Min = 2500,
    USESPECIAL = nil, -- either 'gang', 'job', 'cid', -- if none then keep nil
    SPECIAL = '', 
    },
    [4] = {
    TitleName = "Crafting Bencheroni",
    Table =  vector4(1516.1110, -2100.6833, 76.7760, 182.7406),
    Bench = "Explosive",
    Min = 520,
    USESPECIAL = nil, -- either 'gang', 'job', 'cid', -- if none then keep nil
    SPECIAL = '', 
    },
   

}
 

Config.Table = {
    ["ToolsBench"] = {
    [1] = {
        item = 'lockpick',
        give = 1,
        required = {
            {'steel', 5},
            {'metalscrap', 10},
            {'rubber', 3},
        },
        exp = 0, -- required xp amount
        giveexp = 0,
    },
    [2] = {
        item = 'screwdriverset',
        give = 1,
        required = {
            {'iron', 4},
            {'metalscrap', 4},
            {'steel', 2},
        },
        exp = 20,
        giveexp = 0,
    },
    [3] = {
        item = 'armor',
        give = 1,
        required = {
            {'carbon', 2},
            {'steel', 15},

        },exp = 60,
        giveexp = 0,
    },
    [4] = {
        item = 'metalscratchy',
        give = 1,
        required = {
            {'metalscrap', 10},
            {'iron', 10},
        },
        exp = 519,
        giveexp = 0,
    },
    
    [5] = {
        item = 'electronickit',
        give = 1,
        required = {
            {'refined_iron', 1},
            {'goldingot', 1},
            {'plastic', 5},
        },
       exp = 849,
       giveexp = 0,
    },
    [6] = {
        item = 'aluminumoxide',
        give = 1,
        required = {
            {'glass', 20},
            {'plastic', 6},
            {'gunpowder', 5},
            {'refined_aluminum', 1},
         
        },
        exp = 4254,
        giveexp = 0,
    },
    [7] = {
        item = 'thermitepowder',
        give = 1,
        required = {
            {'glass', 5},
            {'plastic', 5},
            {'aluminumoxide', 1},
          
        },
        exp = 5000,
        giveexp = 0,
    },
    [8] = {
        item = 'handcuffs',
        give = 1,
        required = {
            {'metalscrap', 5},
            {'refined_steel', 5}, 
            {'refined_iron', 1},
        },
       exp = 9354,
       giveexp = 0,
    },  
    },
  
}



Config.WeaponsBench = {

    [1] = {
        item = 'weapon_switchblade',
        give = 1,
        required = {
            {'metalscrap', 10},
            {'steel', 5}, 
            {'rubber', 3},
        },
        exp = 120,
        giveexp = 0,
       
    },
    [2] = {
        item = 'weapon_sledgehammer',
        give = 1,
        required = {
            {'iron', 15},
            {'steel', 5}, 
            {'rubber', 5},
        },
        exp = 204,
        giveexp = 0,
      
    },
    [3] = {
        item = 'weapon_knuckle',
        give = 1,
        required = {
            {'refined_steel', 2},
            {'goldingot', 2}, 
           
        },
        exp = 1289,
        giveexp = 0,
      
    },
    [4] = {
        item = 'weapon_fnx45',
        give = 1,
        required = {
            {'refined_iron', 1},
            {'refined_aluminum', 1}, 
            {'pistolbarrel', 1},
            {'pistolbody', 1},
            {'pistolgrip', 1},
            {'carbon', 5},  
        },
        exp = 3334,
        giveexp = 0,
      
    },
    [5] = {
        item = 'weapon_microsmg2',
        give = 1,
        required = {
            {'refined_steel', 1},
            {'refined_copper', 1}, 
            {'smgbarrel', 1},
            {'smgbody', 1},
            {'smggrip', 1},
            {'carbon', 5},  
        },
        exp = 15000,
        giveexp = 0,
      
    },
    [6] = {
        item = 'weapon_microsmg3',
        give = 1,
        required = {
            {'refined_steel', 1},
            {'refined_copper', 1}, 
            {'smgbarrel', 1},
            {'smgbody', 1},
            {'smggrip', 1},
            {'carbon', 7},  
        },
        exp = 17000,
        giveexp = 0,
      
    },
    [7] = {
        item = 'weapon_pistol50',
        give = 1,
        required = {
            {'refined_steel', 2},
            {'refined_aluminum', 1}, 
            {'pistolbarrel', 1},
            {'pistolbody', 1},
            {'pistolgrip', 1},
            {'carbon', 5},  
        },
        exp = 23379,
        giveexp = 0,
       
    },
    [8] = {
        item = 'weapon_assaultrifle2',
        give = 1,
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
        giveexp = 0,
        
    },
    [9] = {
        item = 'weapon_assaultrifle',
        give = 1,
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
        giveexp = 0,
      
    },
  
}

Config.AmmoBench = {

    [1] = {
        item = 'gunpowder',
        give = 10,
        required = {
            {'aluminumoxide', 1},
            {'charcoal', 25}, 
            {'refined_iron', 1},
        },  exp = 1839,
        giveexp = 0,
       
    },
    [2] = {
        item = 'pistol_ammo',
        give = 3,
        required = {
            {'copperore', 2},
            {'gunpowder', 1}, 
           
        },  exp = 2529,
        giveexp = 0,
      
    },
    [3] = {
        item = 'smg_ammo',
        give = 1,
        required = {
            {'gunpowder', 2},
            {'copperore', 4}, 
           
        },  exp = 14750,
        giveexp = 0,
       
    },
    [4] = {
        item = 'rifle_ammo',
        give = 1,
        required = {
            {'copperore', 3},
            {'gunpowder', 6}, 
           
        }, exp = 27000,
        giveexp = 0,
      
    },
  
}

Config.ExplosivesBench = {

    [1] = {
        item = 'weapon_flare',
        give = 1,
        required = {
            {'aluminumoxide', 1},
            {'plastic', 20}, 
        },
        exp = 309,
        giveexp = 0,
       
    },
    [2] = {
        item = 'thermite',
        give = 1,
        required = {
            {'refined_plastic', 4},
            {'thermitepowder', 1}, 
        },
        exp = 5500,
        giveexp = 0,
      
    },
    [3] = {
        item = 'weapon_smokegrenade',
        give = 1,
        required = {
            {'aluminum', 5},
            {'charcoal', 5}, 
        },
        exp = 5534,
        giveexp = 0,
      
    },
    [4] = {
        item = 'weapon_molotov',
        give = 1,
        required = {
            {'weapon_petrolcan', 1},
            {'bottle', 2}, 
            {'cloth', 1}, 
        },
         exp = 10500,
         giveexp = 0,
      
    },
    [5] = {
        item = 'weapon_pipebomb',
        give = 1,
        required = {
            {'gunpowder', 10},
            {'rubber', 3}, 
            {'refined_aluminum', 2}, 
            {'thermitepowder', 1}, 
        },
        exp = 12729,
        giveexp = 0,
      
    },
    [6] = {
        item = 'weapon_m67',
        give = 1,
        required = {
            {'metalscrap', 6},
            {'refined_aluminum', 2}, 
            {'thermitepowder', 2}, 
            {'refined_iron', 1}, 
        },
        exp = 19500,
        giveexp = 0,
      
    },
  
}




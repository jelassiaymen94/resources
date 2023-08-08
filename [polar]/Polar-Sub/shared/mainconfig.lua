Config = {} 
Config.img = "inventory/html/images/"
Config.Debug = false

Config.Job = nil

Config.Peds = {
    [1] = {
        coords = vector4(-557.29, -883.49, 25.24, 48.67),
        model = "a_m_m_genfat_01",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Amir',
    }
}
Config.MissionPeds = {
    [1] = {
        coords = vector4(270000000.14000000, -985.75, 31.05, 143.84),
        model = "a_m_m_genfat_01",
        icon = 'fa-solid fa-bolt',
        product = {
        types = 'cocaine',
        moneytype = 'gne',
        amount = 5,
        pedamount = 5,
        packagelocation = vector4(-2670000000.59, -982.04, 31.22, 87.57),
        radius = 15,
        },
    },
    [2] = {
        coords = vector4(264000000.57000000, -990.24, 30.64, 250.69),
        model = "a_m_m_genfat_01",
        icon = 'fa-solid fa-bolt',
        product = {
        types = 'meth',
        moneytype = 'cash',
        amount = 25000,
        pedamount = 5,
        packagelocation = vector4(-267000000.59, -982.04, 31.22, 87.57),
        radius = 15,
        },
    },
}


Config.Stashes = {
    
    [1] = {
        coords = vector3(144.86, 6655.93, 32.76),
        min = 31.3,
        max = 34.3,
        slots = 5,
        weight = 5,
        numba = '1',
    },


}

Config.GangStashes = {
    
    [1] = {
        coords = vector3(-247.0, 6266.92, 35.07),
        min = 34.3,
        max = 36.3,
        slots = 50,
        weight = 500,
        gang = 'aod',
        numba = '1',
    },
    

}

Config.JobStashes = {
    
    [1] = {
        coords = vector3(-24700000.0, 6266.92, 35.07),
        min = 34.3,
        max = 36.3,
        slots = 50,
        weight = 500,
        job = 'mechanic',
        numba = '1',
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

Config.TraderPeds = {
    [1] = { -- recyclablematerial
        coords = vector4(-1101.57, 2721.68, 18.8, 2.3),
        model = "s_m_o_busker_01",
        scene = "WORLD_HUMAN_AA_COFFEE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Namir',
        product = {
        item = "recyclablematerial",
        amount = 100,
        removeitem = "matcoupon",
        removeitemamount = 1,
        },
       
    },
    [2] = { -- aluminum
        coords = vector4(-1861.8, -317.13, 49.15, 341.3),
        model = "s_m_m_lathandy_01",
        scene = "WORLD_HUMAN_AA_COFFEE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Nabir',
        product = {
            item = "refined_aluminum",
            amount = 4,
            removeitem = "aluminum",
            removeitemamount = 40,
        },
      
        
    },
    [3] = { -- iron
        coords = vector4(852.74, 2133.78, 52.28, 127.66),
        model = "s_m_y_construct_01",
        scene = "world_human_clipboard",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Rabira',
        product = {
            item = "refined_iron",
            amount = 4,
            removeitem = "iron",
            removeitemamount = 40,
        },
      
        
    },
    [4] = { -- steel
        coords = vector4(-349.8787, -1569.8713, 25.2229, 297.9694),
        model = "s_m_y_dockwork_01",
        scene = "WORLD_HUMAN_AA_SMOKE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Mabir',
        product = {
            item = "refined_steel",
            amount = 4,
            removeitem = "steel",
            removeitemamount = 40,
        },
      
        
    },
    [5] = { -- plastic
        coords = vector4(589.6116, -3276.8467, 6.0696, 351.4336),
        model = "s_m_m_autoshop_01",
        scene = "WORLD_HUMAN_DRUG_DEALER",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Labir',
        product = {
            item = "refined_plastic",
            amount = 4,
            removeitem = "plastic",
            removeitemamount = 40,
        },
      
        
    },
    [6] = { -- copper
        coords = vector4(2928.34, 4272.49, 50.42, 349.57),
        model = "s_m_y_garbage",
        scene = "WORLD_HUMAN_AA_SMOKE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Zabir',
        product = {
            item = "refined_copper",
            amount = 4,
            removeitem = "copper",
            removeitemamount = 40,
        },
      
        
    },
    [7] = { -- glass
        coords = vector4(59.43, 6311.96, 31.38, 158.32),
        model = "s_m_m_pilot_01",
        scene = "WORLD_HUMAN_DRUG_DEALER",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Vabir',
        product = {
            item = "refined_glass",
            amount = 4,
            removeitem = "glass",
            removeitemamount = 40,
        },
      
        
    }, -- rubber
    [8] = { 
        coords = vector4(-1090.96, -2408.98, 13.95, 331.18),
        model = "csb_ramp_mex",
        scene = "WORLD_HUMAN_AA_SMOKE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Babir',
        product = {
            item = "refined_rubber",
            amount = 4,
            removeitem = "rubber",
            removeitemamount = 40,
        },
      
        
    },

    [9] = { -- purified water
        coords = vector4(-1996.1952, 3397.2236, 31.7219, 340.2658),
        model = "csb_ramp_mex",
        scene = "WORLD_HUMAN_AA_SMOKE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Fabir',
        citizenid = '11',
        product = {
            item = "purifiedwater",
            amount = 10,
            removeitem = "plastic",
            removeitemamount = 10,
        },
  
    
    },


   --[[ [10] = { -- purified water
        coords = vector4(-953.6766, -723.1390, 19.9055, 88.7234),
        model = "s_m_m_pilot_01",
        scene = "WORLD_HUMAN_DRUG_DEALER",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Vabir',
        product = {
            item = "01_monkeyman",
            amount = 1,
            removeitem = "01_monkeymansigned",
            removeitemamount = 1,
        },
  
    
    },]]


}






Config.Prop = true

Config.DropLocations = {

    vector3(62.99, -411.28, 39.92),
    vector3(-1191.59, 91.1, 57.67),
    vector3(609.26, 5629.44, 737.08),
    vector3(1756.18, 5629.4, 248.42),
    vector3(114.71, 6988.55, 8.41),
    vector3(-925.58, 6060.53, 7.48),
    vector3(-2150.25, 3032.42, 32.81),
    vector3(-1378.43, -3030.68, 14.08),
    vector3(1648.94, -1982.11, 107.31),
    vector3(-1472.23, -1156.83, 2.17),
    vector3(2345.57, 4839.63, 40.74),
    vector3(3699.38, 4488.3, 20.92),
    vector3(2935.33, 2834.02, 49.24),
    vector3(-1893.71, 2034.21, 140.74),
    vector3(-2217.99, 2605.6, -0.67),
    vector3(-478.56, -1708.35, 18.7),
    
}

Config.PlaneStarts = {

    vector3(-2821.87, 5124.65, 1.18),
    vector3(49.76, 7849.22, 0.19),
    vector3(3988.08, 2202.62, 0.17),
    vector3(-68.99, -3441.38, 23.85),
    
}

Config.AirDropItems = {

    'advancedlockpick', 'advancedlockpick', 'advancedlockpick',  'advancedlockpick', 'advancedlockpick', 'advancedlockpick',  'advancedlockpick', 'advancedlockpick', 'advancedlockpick',
    'weapon_hammer', 'weapon_hammer',
    'mg_ammo', 'mg_ammo',
    'weapon_microsmg3',
    'weapon_switchblade',
    'weapon_gusenberg',
    'weapon_molotov', 'weapon_molotov',
    'weapon_flare', 'weapon_flare', 'weapon_flare',
    'weapon_pipebomb',
    'weapon_pistol', 'weapon_pistol', 'weapon_pistol',
    'pistol_suppressor', 'pistol_suppressor', 'pistol_suppressor', 'pistol_suppressor',
    'gusenberg_extendedclip',
    'rolex', 'rolex',
    'weapon_katana',
    'matcoupon', 'matcoupon', 'matcoupon', 'matcoupon', 'matcoupon',  'matcoupon', 'matcoupon',
    'methkey',
    'weapon_pistol50', 'weapon_pistol50',
    'cokekey',
    'keepcompanionpoodle',
    'keepcompanionmtlion',
    'weapon_battleaxe',
    'weapon_pipebomb',
    'weapon_stickybomb',
    'washkey',
    'washkey',
    'weapon_groza',
    'rifle_ammo', 'rifle_ammo', 'rifle_ammo', 'rifle_ammo',
    'weapon_dp9',
    'weapon_dildo',
    'randombox',   'randombox',
    'randombag',  'randombag',  'randombag',
    'redruby', 'bluediamond', 'saphire',
    'funkopop_snape',
    'weapon_mp5',
    'weapon_sword', 
    'weapon_gepard', 
    'weapon_krambit', 
    'airdrop',
    'pistol50_luxuryfinish',
    'assaultrifle_drum',
    'thermite',  'thermite',
    'armor',   'armor',  'armor',  'armor',  'armor',  'armor',
    'parachute',  'parachute', 'parachute',
    'hacking_device', 'hacking_device',
    'wires', 'wires', 'wires', 'wires',
    'cutters',  'cutters',  'cutters',
    'datadrive', 'datadrive',
    'advancedrepairkit',  'advancedrepairkit',  'advancedrepairkit', 
    'weapon_fnx45',
    'weapon_shoe', 'weapon_shoe', 'weapon_shoe', 'weapon_shoe',
    'weapon_microsmg2',
    'rpg_ammo',
    'carbon', 'carbon', 'carbon', 'carbon',
}


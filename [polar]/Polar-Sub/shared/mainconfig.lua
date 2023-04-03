Config = {} 
Config.img = "qb-inventory/html/images/"
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
        coords = vector3(1277.91, -2059.55, 16.66),
        min = 16.3,
        max = 18.3,
        slots = 5,
        weight = 5,
        numba = '1',
    },
    --[[[2] = {--triads subway stash 1
        coords = vector3(-805.4885, -717.9180, -16.8630),
        min = -16.3,
        max = -18.3,
        slots = 100,
        weight = 2000,
        numba = 'container_large_5900',
    },]]
    









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



Config.Weapons = {
    'weapon_assaultrifle',
    'weapon_assaultrifle2',
    'weapon_uzi',
    'weapon_mac10',



}







Config.Prop = true

Config.DropLocations = {

    vector3(1213.44, 5660.95, 948.39),
   



}
Config.AirDropItems = {

    'lockpick',
    'weapon_gusenberg',
    'weapon_molotov',
    'weapon_molotov',
    'weapon_pistol',
    'pistol_suppressor',
    'pistol_suppressor',
    'gusenberg_extendedclip',
    'rifle_ammo',
    'rolex',
    'weapon_katana',
    'matcoupon',
    'methkey',
    'weapon_pistol50',
    'weapon_pistol50',
    'cokekey',
    'keepcompanionpoodle',
    'keepcompanionmtlion',
    'weapon_',
    'weapon_battleaxe',
    'weapon_pipebomb',
    'weapon_stickybomb',

}

Config.PlaneStarts = {

    vector3(-2821.87, 5124.65, 1.18),
   -- vector3(49.76, 7849.22, 0.19),
   -- vector3(3988.08, 2202.62, 0.17),
  --  vector3(-68.99, -3441.38, 23.85),
    
}


Config = {}
Config.CoreName = 'qb-core' -- The name of your core file
Config.LoopSpeed = 2700 -- How fast the loop to check weapons runs. Lower numbers are lest optimized.

Config.Placement = {
    ["Back"] = {
        bone = 24816,
        x = 0.2, -- up and down
        y = -0.165, -- in and out
        z = 0.06, -- left and right
        x_rotation = 0.0,
        y_rotation = 0.0,
        z_rotation = 0.0
    },
  
}
Config.PlacementSecond = {
    ["Back"] = {
        bone = 24816,
        x = 0.2, -- up and down
        y = -0.165, -- in and out
        z = -0.04, -- left and right
        x_rotation = 0.0,
        y_rotation = 0.0,
        z_rotation = 0.0
    },
   
}
Config.PlacementThird = {
    ["Back"] = {
        bone = 24816,
        x = 0.2, -- up and down
        y = -0.165, -- in and out
        z = -0.14, -- left and right
        x_rotation = 0.0,
        y_rotation = 0.0,
        z_rotation = 0.0
    },
  
}


Config.WeaponsOnBack = {

    -- ["weapon_ak47"] = { model = "w_ar_ak47", hash = GetHashKey("weapon_ak47")},
    -- ["weapon_m70"] = { model = "w_ar_m70", hash = GetHashKey("weapon_m70")},
     --["weapon_hk416"] = { model = "w_ar_hk416", hash = GetHashKey("weapon_hk416")},
     ["weapon_m4"] = { model = "w_ar_m4", hash = GetHashKey("weapon_m4")},
     ["weapon_mossberg"] = { model = "w_sg_mossberg", hash = GetHashKey("weapon_mossberg")},
     ["weapon_mk14"] = { model = "w_sr_mk14", hash = GetHashKey("weapon_mk14")},
     ["weapon_mp9"] = { model = "w_sb_mp9", hash = GetHashKey("weapon_mp9")},
     ["weapon_huntingrifle"] = { model = "w_sr_huntingrifle", hash = GetHashKey("weapon_huntingrifle")},
     ["weapon_m110"] = { model = "w_sr_m110", hash = GetHashKey("weapon_m110")},
     ["weapon_remington"] = { model = "w_sg_remington", hash = GetHashKey("weapon_remington")},
     ["weapon_ar15"] = { model = "w_ar_ar15", hash = GetHashKey("weapon_ar15")},
     ["weapon_scarh"] = { model = "w_ar_scarh", hash = GetHashKey("weapon_scarh")},
    -- ["weapon_mac10"] = { model = "w_sb_mac10", hash = GetHashKey("weapon_mac10")},
     ["weapon_rpg"] = { model = "w_lr_rpg", hash = GetHashKey("weapon_rpg")},
     --["weapon_uzi"] = { model = "w_sb_uzi", hash = GetHashKey("weapon_uzi")},
     ["weapon_assaultrifle"] = { model = "w_ar_assaultrifle", hash = GetHashKey("weapon_assaultrifle")},
     ["weapon_assaultrifle2"] = { model = "w_ar_assaultrifle2", hash = GetHashKey("weapon_assaultrifle2")},
     ["weapon_assaultrifle_mk2"] = { model = "w_ar_assaultrifle_mk2", hash = GetHashKey("weapon_assaultrifle_mk2")},
     ["weapon_advancedrifle"] = { model = "w_ar_advancedrifle", hash = GetHashKey("weapon_advancedrifle")},
     ["weapon_compactrifle"] = { model = "w_ar_assaultrifle_smg", hash = GetHashKey("weapon_compactrifle")},
     ["weapon_gusenberg"] = { model = "w_sb_gusenberg", hash = GetHashKey("weapon_gusenberg")},
     ["weapon_microsmg2"] = { model = "w_sb_microsmg2", hash = GetHashKey("weapon_microsmg2")},
     ["weapon_microsmg3"] = { model = "w_sb_microsmg3", hash = GetHashKey("weapon_microsmg3")},
    -- ["weapon_gusenberg"] = { model = "w_sb_gusenberg", hash = GetHashKey("weapon_gusenberg")},

}
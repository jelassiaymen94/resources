Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = false
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level

ConsumeablesEat = {
    ["maxbeefcooking"] = math.random(35, 50),
    ["medbeefcooking"] = math.random(35, 50),
    ["badbeefcooking"] = math.random(35, 50),
    ["bacalhaucozido"] = math.random(35, 50),
	["cavalacozida"] = math.random(35, 50),
	["salmaocozido"] = math.random(35, 50),
	["sardinhacozida"] = math.random(35, 50),
    ["sandwich"] = math.random(90, 95),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 50),
    ["snikkel_candy"] = math.random(40, 50),
    ["batatas"] = math.random(35, 50),
	    ["tomates"] = math.random(35, 50),
	    ["macas"] = math.random(35, 50),
	    ["morangos"] = math.random(35, 50),
	    ["laranjas"] = math.random(35, 50),
        ["apple"] = math.random(10, 20),
    ["beef"] = math.random(35, 50),
    ["slicedpie"] = math.random(10, 20),
    ["corncob"] = math.random(25, 40),
    ["canofcorn"] = math.random(35, 50),
    ["grapes"] = math.random(10, 20),
    ["greenpepper"] = math.random(10, 20),
    ["chillypepper"] = math.random(10, 20),
    ["tomato"] = math.random(10, 20),
    ["tomatopaste"] = math.random(25, 40),
    ["cooked_bacon"] = math.random(35, 50),
    ["cooked_sausage"] = math.random(35, 50),
    ["cooked_pork"] = math.random(35, 50),
    ["cooked_ham"] = math.random(35, 50),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(90, 95),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["sumodemaca"] = math.random(25, 45),
    	["sumodemorango"] = math.random(25, 45),
    	["sumodelaranja"] = math.random(10, 15),
    	["sumodelaranjaemorango"] = math.random(10, 15),
    	["leite"] = math.random(10, 15),
        ["apple_juice"] = math.random(25, 45),
        ["grapejuice"] = math.random(25, 45),
        ["hotsauce"] = math.random(10, 15),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = false,
    [`LUXOR`] = false,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = false,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = false,
    [`MULE`] = true,
    [`MAVERICK`] = false,
    [`BLIMP`] = true,
    [`frogger`] = false,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = false,
    [`technical`] = true,
    [`technical2`] = true,
    [`technical3`] = false,
    [`insurgent`] = true,
    [`insurgent3`] = true,
    [`apc`] = false,
    [`tampa3`] = false,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = false,
    [`caracara`] = true,
    [`blimp2`] = true,
    [`blimp3`] = false,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = false,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = false,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`toreador`] = true,
    [`avenger`] = true,
    [`molotok`] = true,
    [`volatol`] = true,
    [`ignus`] = true,
    [`zr380`] = true,
    [`zr3802`] = true,
    [`zr3803`] = true,
    [`brutus`] = true,
    [`brutus2`] = true,
    [`brutus3`] = true,
    [`imperator`] =  false,
    [`imperator2`] = true,
    [`imperator3`] = true,
    [`issi3`] = true,
    [`issi4`] = true,
    [`issi5`] = true,
    [`issi6`] = true,
    [`deathbike`] = true,
    [`deathbike2`] = true,
    [`deathbike3`] = true,
    [`monster`] = true,
    [`monster3`] = true,
    [`monster4`] = true,
    [`monster5`] = true,
    [`slamvan3`] = true,
    [`slamvan4`] = true,
    [`slamvan5`] = true,
    [`slamvan6`] = true,
    [`bruiser`] = true,
    [`bruiser2`] =  false,
    [`bruiser3`] = false,
    [`dominator4`] = false,
    [`dominator5`] =  false,
    [`dominator6`] = true,
    [`impaler2`] = false,
    [`impaler3`] =  false,
    [`impaler4`] = true,
    [`dinghy5`] = true,
    [`kosatka`] = true,
    [`seasparrow`] = false,
    [`seasparrow2`] = true,
    [`seasparrow3`] = true,
    [`patrolboat`] = true,
    [`alkonost`] = true,
    [`zhaba`] = true,
    [`jb700`] = false,
    [`jb7002`] = false,
    [`minitank`] = true,
    [`terbyte`] = false,
    [`thruster`] = false,
    [`stromberg`] = true,
    [`riot`] = true,
    [`riot2`] = true,
    [`chernobog`] = true,
    [`nokota`] = true,
    [`pyro`] = true,
    [`mogul`] = true,
    [`bombushka`] = true,
    [`tula`] = true,
    [`rogue`] = true,
    [`starling`] = true,
    [`ardent`] = true,
    [`nightshark`] = true,
    [`dune2`] = false,
    [`dune3`] =  false,
    [`dune4`] =  false,
    [`dune5`] = false,
    [`hauler2`] = true,
    [`boxville5`] = true,
    [`voltic3`] = true,
    [`phantom2`] = true,
    [`limo2`] = false,
    [`valkyrie`] = true,
    [`marshall`] = true,
    [`dukes2`] = false,
    [`seabreeze`] = true,
    [`microlight`] = false,
    [`besra`] = true,
    [`annihilator`] = false,
    [`blazer5`] = false,
    [`rcbandito`] = false,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    --[[[1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },]]
}

Config.CarWash = { -- carwash
    --[[[1] = {
       ["label"] = "Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }]]
}

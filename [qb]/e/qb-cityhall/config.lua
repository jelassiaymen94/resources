Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vector3(-551.9, -200.5, 37.23),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = "City Hall"
        },
        licenses = {
            ["id_card"] = {
                label = "Identification Card",
                cost = 10,
            },
            ["driver_license"] = {
                label = "Drivers License",
                cost = 10,
                metadata = "driver"
            },
            ["weaponlicense"] = {
                label = "Concealed Carry License",
                cost = 1250,
                metadata = "weapon"
            },
        }
        --jobs = {
        --    taxi
       -- }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(232.14, 365.31, 105.05),
        showBlip = true,
        blipData = {
            sprite = 380,
            display = 4,
            scale = 0.5,
            colour = 7,
            title = "Driving School"
        },
        instructors = {
            "DJD56142",
            "DXT09752",
            "SRI85140",
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_m_hasjew_01',
        coords = vector4(-552.9, -201.5, 38.23-1, 322.46),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = false
        }
    },
    -- Driving School Ped
    {
        model = 'a_m_m_eastsa_02',
        coords = vec4(232.14, 365.31, 105.05, 156.06),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }
}

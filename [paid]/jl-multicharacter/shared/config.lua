return {
    EnableBlur = true,

    WelcomeScreenTime = 5000,

    Data = {
        firstname_char = 3,
        lastname_char = 3,
        minimum_dob = "1970-01-01",
        max_dob = "2017-12-01",
        nationality_char = 3
    },

    -- Give apartment when starting?
    ApartmentStarting = true,

    DebugMode = false,

    -- Where you hide your original character
    HiddenCoords = vector4(-1464.56, -546.4, 70.41, 126.01),

    -- Default SpawnCoords
    DefaultCoords = vector4(296.44, -1076.0, 29.4, 270.54),

    DefaultPed = {
        'ig_tomcasino',
        "a_m_y_skater_02",
        "a_m_y_smartcaspat_01",
        "a_m_y_salton_01"
    },

    DefaultSlots = 5,

    WhitelistedSlots = {
        [1] = {
            license = "license:here",
            slots = 4
        },
    },

    Locations = {
        [1] = {
            location = vector4(-1468.85, -545.17, 73.24, 188.07),
            scenario = "WORLD_HUMAN_JOG_STANDING"
        },
        [2] = {
            location = vector4(-1466.52, -546.57, 73.28, 127.13),
            animDict = "timetable@ron@ig_3_couch",
            animation = "base",
        },
        [3] = {
            location = vector4(-1462.71, -549.55, 73.24, 32.99),
            animDict = "anim@heists@prison_heist",
            animation = "ped_b_loop_a",
        },
        [4] = {
            location = vector4(-1463.61, -550.18, 73.24, 22.95),
            scenario = "WORLD_HUMAN_SMOKING"
        },
        [5] = {
            location = vector4(-1464.93, -547.58, 73.24, 36.82),
            animDict = "timetable@ron@ig_3_couch",
            animation = "base",
        },
    },



    -- Disable delete button
    DisableDelete = false,

    -- Enable hint --
    --[[
        Sticky top right, that will show you what is wrong
        --example : You
    ]]
    EnableHint = true

    --[[
     TimeCycle = "hud_def_blur"
     CamExport = false -- Cam export to use it in loadin gscreen to diretly send u to multicharacter

    ]]
}

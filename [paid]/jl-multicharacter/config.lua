Config = Config or {}

Config.DebugMode = false

Config.Data = {
    firstname_char = 3,
    lastname_char = 3,
    minimum_dob = "1970-01-01",
    max_dob = "2017-12-01",
    nationality_char = 3
}

-- Give apartment when starting
Config.ApartmentStarting = true

-- Disable delete button
Config.DisableDelete = true

-- Enable hint --
--[[
    Sticky top right, that will show you what is wrong 
]]
Config.EnableHint = true

Config.UseFivemAppearance = false

-- Default SpawnCoords
Config.DefaultCoords = vector4(296.44, -1076.0, 29.4, 270.54)


-- Where you hide your original character
Config.HiddenCoords = vector4(-1464.56, -546.4, 70.41, 126.01)



Config.DefaultPed = 'ig_tomcasino'

Config.DefaultSlots = 5

Config.WhitelistedSlots = {
    [1] = {
        license = "license:here",
        slots = 5
    },
}

Config.Locations = {
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
}

Config.Scripts = {
    -- just export name lmao
    ["core"] = "qb-core",
    -- loadPlayerClothing event
    ["loadplayerclothing"] = "qb-clothing:client:loadPlayerClothing",
    ["CreateFirstCharacter"] = "qb-clothes:client:CreateFirstCharacter",
    -- just export name
    ["fivem-appearance"] = "fivem-appearance",
    -- weathersync
    ["enableSync"] = "qb-weathersync:client:EnableSync",
    ["disableSync"] = "qb-weathersync:client:DisableSync",
    -- qb garages
    ["housegarage"] = "qb-garages:client:houseGarageConfig",
    -- qb houses
    ["sethouseConfig"] = "qb-houses:client:setHouseConfig",
    -- qb log
    ["createLog"] = "qb-log:server:CreateLog",
    -- Server load / unload event
    ["ServerplayerLoaded"] = "QBCore:Server:PlayerLoaded",
    ["ServerplayerUnload"] = "QBCore:Server:OnPlayerUnload",
    ["ServerOnPlayerLoaded"] = "QBCore:Server:OnPlayerLoaded",
    ["ClientOnPlayerLoaded"] = "QBCore:Client:OnPlayerLoaded",
    -- Setup spawn
    ["SetupSpawn"] = "apartments:client:setupSpawnUI",
    -- Other
    ["HouseInsideMeta"] = "qb-houses:server:SetInsideMeta",
    ["ApartInsideMeta"] = 'qb-apartments:server:SetInsideMeta',
}

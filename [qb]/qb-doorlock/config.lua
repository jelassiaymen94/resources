Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)

Config.ChangeColor = true -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked

Config.Consumables = { ['paperclip'] = 1, } --['keycard'] = 1, } -- The items will get removed once used on a door that has the item on it

Config.DoorList = {
	















--K4MBI Lower -- // ID 212
{
    textCoords = vector3(256.3128, 229.2442, 101.69),
    authorizedJobs = { 'police' , 'bcso' , 'sast' },
    authorizedGangs = {},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    doors = {
        {
            objName = 'k4mb1_pac_door',
            objCoords = vector3(256.3128, 229.2442, 101.69)    
        },
    }
},
--K4MBI Lower -- // ID 213
{
    textCoords = vector3(262.5904, 258.4439, 101.70),
    authorizedJobs = { 'police' , 'bcso' , 'sast' },
    authorizedGangs = {},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    doors = {
        {
            objName = 'k4mb1_pac_door2',
            objYaw = 340.0,
            objCoords = vector3(262.5904, 258.4439, 101.70)    
        },
    }
},
-- // ID 85
{
    objName = 'v_ilev_cbankvaulgate01',
    objCoords  = vector3(-105.77, 6472.59, 31.81),
    textCoords = vector3(-105.77, 6472.59, 31.81),
    objYaw = 45.0,
    authorizedJobs = { 'police', 'bcso' , 'sast' },
    authorizedGangs = {},
    locking = false,
    locked = true,
    pickable = true,
    distance = 1.5,
    size = 2
},
-- // ID 86
{
    objName = 'v_ilev_cbankvaulgate02',
    objCoords  = vector3(-106.26, 6476.01, 31.98),
    textCoords = vector3(-105.5, 6475.08, 31.99),
    objYaw = -45.0,
    authorizedJobs = { 'police', 'bcso' , 'sast' },
    authorizedGangs = {},
    locking = false,
    locked = true,
    pickable = true,
    distance = 1.5,
    size = 2
},
-- // ID 78
{
    objName = 'hei_v_ilev_bk_safegate_pris',
    objCoords  = vector3(252.98, 220.65, 101.8),
    textCoords = vector3(252.98, 220.65, 101.8),
    authorizedJobs = { 'police', 'bcso' , 'sast' },
    authorizedGangs = {},
    objYaw = 160.0,
    locking = false,
    locked = true,
    pickable = true,
    distance = 1.5,
    size = 2
},
-- // ID 79
{
    objName = 'hei_v_ilev_bk_safegate_pris',
    objCoords  = vector3(261.68, 215.62, 101.81),
    textCoords = vector3(261.68, 215.62, 101.81),
    authorizedJobs = { 'police', 'bcso' , 'sast' },
    authorizedGangs = {},
    objYaw = -110.0,
    locking = false,
    locked = true,
    pickable = true,
    distance = 1.5,
    size = 2
},
-- // ID 75
{
    objName = 'hei_v_ilev_bk_gate_pris',			
    objCoords  = vector3(257.41, 220.25, 106.4),
    textCoords = vector3(257.41, 220.25, 106.4),
    authorizedJobs = { 'police', 'bcso' , 'sast' },
    authorizedGangs = {},
    objYaw = -20.0,
    locking = false,
    locked = true,
    pickable = true,
    distance = 1.5,
    size = 2
},
    { -- 76
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vector3(261.83, 221.39, 106.41),
		textCoords = vector3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police', 'bcso' , 'sast' },
		authorizedGangs = {},
		objYaw = -110.0,
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
}

-- Side Door created by Adkinsdd12
Config.DoorList['Side Door'] = {
    objCoords = vec3(-1179.220947, -891.500488, 14.093996),
    objName = -1300743830,
    authorizedJobs = { ['burgershot'] = 0 },
    doorType = 'door',
    locked = false,
    audioRemote = false,
    doorRate = 1.0,
    objYaw = 124.0,
    pickable = true,
    fixText = false,
    distance = 2,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
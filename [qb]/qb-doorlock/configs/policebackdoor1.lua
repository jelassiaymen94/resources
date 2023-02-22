

-- policebackdoor1 created by Blake
Config.DoorList['policebackdoor1'] = {
    doors = {
        {objName = -692649124, objYaw = 180.00001525879, objCoords = vec3(469.774261, -1014.406006, 26.483816)},
        {objName = -692649124, objYaw = 0.0, objCoords = vec3(467.368622, -1014.406006, 26.483816)}
    },
    authorizedJobs = { ['police'] = 0 },
    doorType = 'double',
    doorRate = 1.0,
    locked = true,
    audioRemote = false,
    pickable = true,
    distance = 3,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}


-- outsidecourt created by Blake
Config.DoorList['outsidecourt'] = {
    doorType = 'double',
    pickable = true,
    audioRemote = false,
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    locked = true,
    doors = {
        {objName = 297112647, objYaw = 299.99304199218, objCoords = vec3(-567.488220, -236.265336, 34.357502)},
        {objName = 830788581, objYaw = 119.99298858642, objCoords = vec3(-568.551086, -234.423874, 34.357502)}
    },
    distance = 2,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
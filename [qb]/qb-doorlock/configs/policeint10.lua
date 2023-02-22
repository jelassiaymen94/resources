

-- policeint10 created by Blake
Config.DoorList['policeint10'] = {
    pickable = true,
    locked = true,
    doorRate = 1.0,
    doorType = 'double',
    audioRemote = false,
    authorizedJobs = { ['police'] = 0 },
    distance = 1,
    doors = {
        {objName = 149284793, objYaw = 89.999977111816, objCoords = vec3(471.375824, -1010.197876, 26.405483)},
        {objName = 149284793, objYaw = 270.19003295898, objCoords = vec3(471.367859, -1007.793396, 26.405483)}
    },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}


-- policeinside1 created by Blake
Config.DoorList['policeinside1'] = {
    doors = {
        {objName = -288803980, objYaw = 89.999977111816, objCoords = vec3(469.440613, -987.437683, 30.823193)},
        {objName = -288803980, objYaw = 270.00003051758, objCoords = vec3(469.440613, -985.031311, 30.823193)}
    },
    authorizedJobs = { ['police'] = 0 },
    doorType = 'double',
    doorRate = 1.0,
    locked = true,
    audioRemote = false,
    pickable = true,
    distance = 4,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
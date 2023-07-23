

-- front created by Oldnewz
Config.DoorList['front'] = {
    items = { ['ranchkey'] = 1 },
    pickable = false,
    doors = {
        {objName = 159994461, objYaw = 291.00006103516, objCoords = vec3(-816.716003, 179.097961, 72.827377)},
        {objName = -1686014385, objYaw = 291.00006103516, objCoords = vec3(-816.106812, 177.510864, 72.827377)}
    },
    doorType = 'double',
    doorRate = 1.0,
    distance = 2,
    audioRemote = false,
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- garage created by Oldnewz
Config.DoorList['garage'] = {
    audioRemote = false,
    pickable = false,
    objName = 30769481,
    doorType = 'garage',
    locked = true,
    fixText = false,
    objCoords = vec3(-815.281616, 185.974991, 72.999931),
    objYaw = 291.00012207031,
    distance = 5,
    doorRate = 1.0,
    items = { ['ranchkey'] = 1 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- back1 created by Oldnewz
Config.DoorList['back1'] = {
    audioRemote = false,
    locked = true,
    doorType = 'double',
    pickable = false,
    items = { ['ranchkey'] = 1 },
    doors = {
        {objName = 1245831483, objYaw = 111.00005340576, objCoords = vec3(-794.185303, 182.568008, 73.040451)},
        {objName = -1454760130, objYaw = 111.00005340576, objCoords = vec3(-793.394348, 180.507462, 73.040451)}
    },
    doorRate = 1.0,
    distance = 2,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- back2 created by Oldnewz
Config.DoorList['back2'] = {
    audioRemote = false,
    locked = true,
    doorType = 'double',
    pickable = false,
    items = { ['ranchkey'] = 1 },
    doors = {
        {objName = 1245831483, objYaw = 21.000057220459, objCoords = vec3(-794.505127, 178.012375, 73.040451)},
        {objName = -1454760130, objYaw = 21.000057220459, objCoords = vec3(-796.565674, 177.221375, 73.040451)}
    },
    doorRate = 1.0,
    distance = 2,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- gate created by Oldnewz
Config.DoorList['gate'] = {
    audioRemote = false,
    pickable = false,
    objName = -2125423493,
    doorType = 'sliding',
    locked = false,
    fixText = false,
    objCoords = vec3(-844.051025, 155.961914, 66.032211),
    objYaw = 90.006217956543,
    distance = 10,
    doorRate = 1.0,
    items = { ['ranchkey'] = 1 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
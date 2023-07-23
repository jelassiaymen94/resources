

-- Front door created by Adkinsdd12
Config.DoorList['Front door'] = {
    pickable = true,
    doorType = 'double',
    distance = 2,
    doors = {
        {objName = -186646702, objYaw = 123.99998474121, objCoords = vec3(-1184.902100, -883.294312, 14.240462)},
        {objName = 1934064671, objYaw = 123.99998474121, objCoords = vec3(-1183.221191, -885.786316, 14.240462)}
    },
    authorizedJobs = { ['burgershot'] = 0 },
    audioRemote = false,
    doorRate = 1.0,
    locked = false,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- Back Door created by Adkinsdd12
Config.DoorList['Back Door'] = {
    audioRemote = false,
    doorType = 'door',
    authorizedJobs = { ['burgershot'] = 0 },
    objCoords = vec3(-1199.356567, -903.874084, 14.079839),
    objName = -1300743830,
    pickable = true,
    distance = 2,
    fixText = false,
    doorRate = 1.0,
    objYaw = 304.0,
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- Employee Entrance created by Adkinsdd12
Config.DoorList['Employee Entrance'] = {
    audioRemote = false,
    doorType = 'door',
    authorizedJobs = { ['burgershot'] = 0 },
    objCoords = vec3(-1201.111450, -892.965149, 14.244482),
    objName = -1448591934,
    pickable = true,
    distance = 2,
    fixText = false,
    doorRate = 1.0,
    objYaw = 34.000019073486,
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- Main Door Side created by Adkinsdd12
Config.DoorList['Main Door Side'] = {
    pickable = true,
    doorType = 'double',
    distance = 2,
    doors = {
        {objName = 1934064671, objYaw = 213.99998474121, objCoords = vec3(-1196.542603, -883.489136, 14.240462)},
        {objName = -186646702, objYaw = 213.99998474121, objCoords = vec3(-1199.029175, -885.166382, 14.240462)}
    },
    authorizedJobs = { ['burgershot'] = 0 },
    audioRemote = false,
    doorRate = 1.0,
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- Boss Door created by Adkinsdd12
Config.DoorList['Boss Door'] = {
    audioRemote = false,
    doorType = 'door',
    authorizedJobs = { ['burgershot'] = 0 },
    objCoords = vec3(-1182.097412, -895.497498, 14.138298),
    objName = 1042741067,
    pickable = true,
    distance = 2,
    fixText = false,
    doorRate = 1.0,
    objYaw = 213.99998474121,
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- DriveThrough created by Adkinsdd12
Config.DoorList['DriveThrough'] = {
    audioRemote = false,
    doorType = 'sliding',
    authorizedJobs = { ['burgershot'] = 0 },
    objCoords = vec3(-1193.198242, -906.828186, 12.982820),
    objName = -1518705307,
    pickable = true,
    distance = 4,
    fixText = false,
    doorRate = 1.0,
    objYaw = 171.00025939941,
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}


-- vault created by Oldnewz
Config.DoorList['vault'] = {
    objYaw = 340.00003051758,
    audioRemote = false,
    distance = 2,
    doorType = 'door',
    objName = 44561767,
    doorRate = 1.0,
    fixText = false,
    pickable = false,
    locked = true,
    objCoords = vec3(7.146570, -1101.125610, 29.897390),
    authorizedJobs = { ['maxdamage'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- craft created by Oldnewz
Config.DoorList['craft'] = {
    distance = 2,
    objName = 44561767,
    locked = true,
    doorType = 'door',
    objCoords = vec3(8.044436, -1098.658691, 29.897390),
    authorizedJobs = { ['maxdamage'] = 3 },
    doorRate = 1.0,
    objYaw = 340.00003051758,
    fixText = false,
    pickable = false,
    audioRemote = false,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- front created by Oldnewz
Config.DoorList['front'] = {
    doorType = 'double',
    audioRemote = false,
    objName = -8873588,
    authorizedJobs = { ['maxdamage'] = 0 },
    distance = 2,
    locked = true,
    doors = {
        {objName = 362975687, objYaw = 84.999938964844, objCoords = vec3(18.572010, -1115.494751, 29.946936)},
        {objName = 362975687, objYaw = 264.99993896484, objCoords = vec3(16.127869, -1114.605225, 29.946936)}
    },
    fixText = false,
    doorRate = 1.0,
    objYaw = 340.00003051758,
    pickable = false,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}




-- staffonlydoor created by Blake
Config.DoorList['staffonlydoor'] = {
    distance = 1,
    objYaw = 37.447757720947,
    locked = true,
    objName = -222270721,
    fixText = false,
    doorType = 'door',
    pickable = false,
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    objCoords = vec3(-1306.343506, -820.527588, 17.301504),
    audioRemote = false,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- kitchen created by Blake
Config.DoorList['kitchen'] = {
    objYaw = 127.96137237549,
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    locked = true,
    audioRemote = false,
    objName = 736699661,
    fixText = false,
    distance = 1,
    doorType = 'door',
    pickable = false,
    objCoords = vec3(-1298.353760, -822.695129, 17.318991),
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

-- officeback created by Blake
Config.DoorList['officeback'] = {
    audioRemote = false,
    authorizedJobs = { ['police'] = 0 },
    doorRate = 1.0,
    doors = {
        {objName = -1821777087, objYaw = 217.05627441406, objCoords = vec3(-1293.765503, -835.591919, 17.306374)},
        {objName = -1821777087, objYaw = 36.836532592773, objCoords = vec3(-1291.687744, -834.030518, 17.309853)}
    },
    locked = true,
    pickable = false,
    distance = 1,
    doorType = 'double',
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}


-- officeleft created by Blake
Config.DoorList['bayofficeleft'] = {
    distance = 1,
    locked = true,
    doors = {
        {objName = -1821777087, objYaw = 307.14263916016, objCoords = vec3(-1293.889160, -830.479431, 17.309853)},
        {objName = -1821777087, objYaw = 127.3868560791, objCoords = vec3(-1295.463989, -828.408936, 17.306374)}
    },
    pickable = false,
    audioRemote = false,
    doorRate = 1.0,
    doorType = 'double',
    authorizedJobs = { ['police'] = 0 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
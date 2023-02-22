

-- Church Entrance created by Oldnewz
Config.DoorList['Church Entrance 3'] = {
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['church'] = 0 },
    distance = 2,
    audioRemote = false,
    doorType = 'double',
    doors = {
        {objName = 1389563489, objYaw = 30.0, objCoords = vec3(-765.368591, -21.790220, 41.229736)},
        {objName = 1389563489, objYaw = 210.0, objCoords = vec3(-763.523621, -20.737621, 41.229736)}
    },
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
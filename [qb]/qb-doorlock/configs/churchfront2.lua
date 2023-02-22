

-- Church Entrance created by Oldnewz
Config.DoorList['Church Entrance 2'] = {
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['church'] = 0 },
    distance = 2,
    audioRemote = false,
    doorType = 'double',
    doors = {
        {objName = 1389563489, objYaw = 30.0, objCoords = vec3(-768.124268, -23.364777, 41.231190)},
        {objName = 1389563489, objYaw = 210.0, objCoords = vec3(-766.279114, -22.310287, 41.231190)}
    },
    locked = true,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}


-- policebackdoor2 created by Blake
Config.DoorList['policebackdoor2'] = {
    doors = {
        {objName = -288803980, objYaw = 180.00001525879, objCoords = vec3(469.927368, -1000.543701, 26.405483)},
        {objName = -288803980, objYaw = 0.0, objCoords = vec3(467.522217, -1000.543701, 26.405483)}
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
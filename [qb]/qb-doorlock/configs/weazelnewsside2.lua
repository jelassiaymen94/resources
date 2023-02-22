

-- weazelnewsside2 created by Oldnewz
Config.DoorList['weazelnewsside2'] = {
    locked = true,
    doorType = 'double',
    distance = 2,
    authorizedJobs = { ['weazelnews'] = 0 },
    doorRate = 1.0,
    pickable = true,
    audioRemote = false,
    doors = {
        {objName = 105027640, objYaw = 0.0, objCoords = vec3(-591.180359, -912.971985, 23.980709)},
        {objName = 970882927, objYaw = 180.00010681152, objCoords = vec3(-588.680481, -912.971680, 23.980709)}
    },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
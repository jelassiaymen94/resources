



-- Church Entrance created by Oldnewz
Config.DoorList['Church Entrance 1'] = {
    doors = {
        {objName = 1389563489, objYaw = 29.999996185303, objCoords = vec3(-770.917053, -24.939419, 41.227428)},
        {objName = 1389563489, objYaw = 210.00001525879, objCoords = vec3(-769.072632, -23.885445, 41.227428)}
    },
    locked = true,
    distance = 2,
    doorType = 'double',
    doorRate = 1.0,
    pickable = true,
    audioRemote = false,
    authorizedJobs = { ['church'] = 1, 2, 3, 4 },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
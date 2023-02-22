

-- weazelnewsfront3 created by Oldnewz
Config.DoorList['weazelnewsfront3'] = {
    locked = true,
    doorType = 'double',
    distance = 2,
    authorizedJobs = { ['weazelnews'] = 0 },
    doorRate = 1.0,
    pickable = true,
    audioRemote = false,
    doors = {
        {objName = 206447435, objYaw = 270.0, objCoords = vec3(-597.967468, -930.966736, 23.985744)},
        {objName = 1476344400, objYaw = 90.121597290039, objCoords = vec3(-597.965698, -932.766785, 23.985744)}
    },
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
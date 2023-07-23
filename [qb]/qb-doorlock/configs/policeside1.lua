

-- policeside1 created by Blake
Config.DoorList['policeside1'] = {
    doors = {
        {objName = -1547307588, objYaw = 0.0, objCoords = vec3(440.739197, -998.746216, 30.815304)},
        {objName = -1547307588, objYaw = 180.00001525879, objCoords = vec3(443.061768, -998.746216, 30.815304)}
    },
    authorizedJobs = { ['police'] = 0 },
    doorType = 'double',
    doorRate = 1.0,
    locked = true,
    audioRemote = false,
    pickable = true,
    distance = 4,
    --audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    --audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}
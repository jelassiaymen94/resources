local isRopeAttached = false
local ropeObject = nil

RegisterCommand('spawnrope', function(source, args, rawCommand)
    SpawnRope()
end)

function SpawnRope()
    if isRopeAttached then
        return
    end
    
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local ropePos = playerPos + vector3(0.0, 0.0, -1.0) -- Adjust the position as desired
    
    local ropeLength = 5.0 -- Adjust the length as desired
    ropeObject = CreateObject(GetHashKey("prop_mp_cone_01"), ropePos.x, ropePos.y, ropePos.z, true, true, true)
    AttachEntityToEntity(ropeObject, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    
    isRopeAttached = true
end

function DetachRope()
    if not isRopeAttached then
        return
    end
    
    DeleteEntity(ropeObject)
    
    isRopeAttached = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local playerPed = PlayerPedId()
        
        if IsControlJustPressed(0, 51) and isRopeAttached then -- Key: E
            DetachRope()
        end
    end
end)

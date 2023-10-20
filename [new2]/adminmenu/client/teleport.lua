local lastCoords

local function teleport(x, y, z)
    if cache.vehicle then
        return SetPedCoordsKeepVehicle(cache.ped, x, y, z)
    end

    SetEntityCoords(cache.ped, x, y, z, false, false, false, false)
end

-- Teleport to player
RegisterNetEvent('adminmenu:client:TeleportToPlayer', function(coords)

    lastCoords = GetEntityCoords(cache.ped)
    SetPedCoordsKeepVehicle(cache.ped, coords.x, coords.y, coords.z)
end)

-- Teleport to coords
RegisterNetEvent('adminmenu:client:TeleportToCoords', function(data, selectedData)
    if not CheckPerms(data.perms) then return end

    local coords = selectedData["Coords"].value

    local x, y, z = string.match(coords, "(%S+)%s+(%S+)%s+(%S+)")

    lastCoords = GetEntityCoords(cache.ped)
    SetPedCoordsKeepVehicle(cache.ped, x, y, z)
end)


-- Teleport to Locaton
RegisterNetEvent('adminmenu:client:TeleportToLocation', function(data, selectedData)
    if not CheckPerms(data.perms) then return end
    local coords = selectedData["Location"].value

    lastCoords = GetEntityCoords(cache.ped)
    SetPedCoordsKeepVehicle(cache.ped, coords.x, coords.y, coords.z)
end)

-- Teleport back
RegisterNetEvent('adminmenu:client:TeleportBack', function(data)
    if not CheckPerms(data.perms) then return end

    if lastCoords then
        local coords = GetEntityCoords(cache.ped)
        teleport(lastCoords.x, lastCoords.y, lastCoords.z)
        lastCoords = coords
    end
end)

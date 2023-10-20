-- Teleport To Player
RegisterNetEvent('adminmenu:server:TeleportToPlayer', function(data, selectedData)
    if not CheckPerms(data.perms) then return end

    local src = source
    local player = selectedData["Player"].value
    local targetPed = GetPlayerPed(player)
    local coords = GetEntityCoords(targetPed)

    CheckRoutingbucket(src, player)
    TriggerClientEvent('adminmenu:client:TeleportToPlayer', src, coords)
end)

-- Bring Player
RegisterNetEvent('adminmenu:server:BringPlayer', function(data, selectedData)
    if not CheckPerms(data.perms) then return end

    local src = source
    local targetPed = selectedData["Player"].value
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(admin)
    local target = GetPlayerPed(targetPed)

    CheckRoutingbucket(targetPed, src)
    SetEntityCoords(target, coords)
end)
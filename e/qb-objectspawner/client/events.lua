RegisterNetEvent('qb-objects:client:containers', function(data)
    local objectData = data
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "container_"..objectData.id, {maxweight = 4000000, slots = 250})
    TriggerEvent("inventory:client:SetCurrentStash", "container_"..objectData.id)
end)
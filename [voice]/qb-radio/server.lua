local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("radio", function(source, item)
    TriggerClientEvent('qb-radio:use', source)
end)

QBCore.Functions.CreateCallback('qb-radio:server:GetItem', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        local RadioItem = Player.Functions.GetItemByName(item)
        if RadioItem ~= nil and not Player.PlayerData.metadata["isdead"] and
            not Player.PlayerData.metadata["inlaststand"] then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local Player = QBCore.Functions.GetPlayer(source)
        return config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty
    end)
end

RegisterNetEvent('qb-radio:Server:BreakRadio', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if exports['ps-inventory']:RemoveItem(Player.PlayerData.source, "radio", 1, false) then -- item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["radio"], 'remove', 1)
    end


end)
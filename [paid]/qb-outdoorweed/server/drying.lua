local QBCore = exports[Config.CoreName]:GetCoreObject()

RegisterServerEvent('qb-outdoorweed:server:CheckWetAmount', function(ItemAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemAmount = tonumber(ItemAmount)
    local CanProcess = Player.Functions.GetItemByName(Config.WeedItem)
    if CanProcess ~= nil and CanProcess.amount >= ItemAmount then
        TriggerClientEvent("qb-outdoorweed:client:MakingWeedDry", src, ItemAmount)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_weed'), 'error')
    end
end)


RegisterServerEvent('qb-outdoorweed:client:DryingWeedDone', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(Config.WeedItem, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeedItem], 'remove')

    Wait(1000)
    Player.Functions.AddItem(Config.DryWeed, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DryWeed], 'add')
end)
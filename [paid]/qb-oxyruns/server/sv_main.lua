local QBCore = exports[Config.CoreExport]:GetCoreObject()

QBCore.Functions.CreateCallback('qb-oxyruns:server:checkWeight',function(source, cb)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local itemName = Config.SusPackItem
    local itemInfo = QBCore.Shared.Items[itemName]
    local totalWeight = QBCore.Player.GetTotalWeight(Player.PlayerData.items)
    local amount

    if not Player.Functions.GetItemByName(itemName) then 
        amount = 1
    else 
        amount = Player.Functions.GetItemByName(itemName).amount 
    end

    if (totalWeight + (itemInfo['weight'] * amount)) <= Config.MaxInvWeight then
        cb(true)
        Player.Functions.AddItem(itemName, 1)
        TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[item], 'add')
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-oxyruns:server:cashCheck',function(source, cb, money)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.money.cash >= money then
        cb(true)
        Player.Functions.RemoveMoney('cash', money)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-oxyruns:server:getSellSpot',function(source, cb)
    local spot = nil 

    for k, v in pairs(Config.SellZones) do
        if not v.busy then
            spot = k
            break
        end 
    end 

    if spot ~= nil then
        cb(spot)

        Config.SellZones[spot].busy = true
        TriggerClientEvent('qb-oxryuns:client:setState', -1, spot, true)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-oxyruns:server:deliverPackage', function(callback)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local oxyReward = Config.OxyReward
    local dirtyValue = Config.DirtyItemValue

    if callback then
        if Config.CleanMoney then 
            Player.Functions.RemoveItem(Config.SusPackItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.SusPackItem], 'remove')
            Player.Functions.AddItem(Config.OxyItem, oxyReward)
            TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.OxyItem], 'add')

            if Player.Functions.GetItemByName(Config.DirtyCashItem) ~= nil then 
                Player.Functions.RemoveItem(Config.DirtyCashItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.DirtyCashItem], 'remove')
                Player.Functions.AddMoney('cash', dirtyValue)
                TriggerClientEvent('QBCore:Notify', src, 'You cleaned 1 cash roll into $'.. dirtyValue, 'success', 5000)
            end
            TriggerClientEvent('QBCore:Notify', src, 'You have handed off a package and recieved ' .. oxyReward .. ' oxy. Wait for the next buyer.', 'success', 5000)
        else
            Player.Functions.RemoveItem(Config.SusPackItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.SusPackItem], 'remove')
            Player.Functions.AddItem(Config.OxyItem, oxyReward)
            TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.OxyItem], 'add')
            TriggerClientEvent('QBCore:Notify', src, 'You have handed off a package and recieved ' .. oxyReward .. ' oxy. ', 'success', 5000)
        end 
    end
end)

RegisterNetEvent('qb-oxyruns:server:finishJob', function(callback, total)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payout = total * Config.Payout
    local packages

    if Player.Functions.GetItemByName(Config.SusPackItem) ~= nil then 
        packages = Player.Functions.GetItemByName(Config.SusPackItem).amount
    end

    if callback then 
        Player.Functions.AddMoney('cash', payout)
        Player.Functions.RemoveItem(Config.SusPackItem, packages)
        TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.SusPackItem], 'remove', packages)
        TriggerClientEvent('QBCore:Notify', src, 'You made $' .. payout .. ' from ' .. total .. ' deliveries.', 'success', 5000)
    end
end)

CreateThread(function()
    while true do
        for k, v in pairs(Config.SellZones) do
            v.busy = false
        end 
        Wait(Config.ResetTime * 60000)
    end
end)

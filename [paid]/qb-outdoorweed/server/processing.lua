local QBCore = exports[Config.CoreName]:GetCoreObject()

RegisterServerEvent('qb-outdoorweed:server:CheckAmount', function(ItemAmount, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemAmount = tonumber(ItemAmount)
    local CanProcess = Player.Functions.GetItemByName(Config.Weed)
    if CanProcess ~= nil and CanProcess.amount >= ItemAmount then
        if item == "WeedBag" then
            local Itemsneeded = Player.Functions.GetItemByName(Config.WeedBag)
            if Itemsneeded ~= nil and Itemsneeded.amount >= ItemAmount then
                TriggerClientEvent("qb-outdoorweed:client:MakingWeed", src, ItemAmount)
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.missing_weedbag_item'), 'error')
            end
        elseif item == "Joints" then
            local Itemsneeded = Player.Functions.GetItemByName(Config.JointItem)
            if Itemsneeded ~= nil and Itemsneeded.amount >= ItemAmount then
                TriggerClientEvent("qb-outdoorweed:client:MakingJoint", src, ItemAmount)
            else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.missing_joint_item'), 'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_weed'), 'error')
    end
end)


RegisterServerEvent('qb-outdoorweed:client:MakingWeedDone', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(Config.WeedBag, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeedBag], 'remove')

    Player.Functions.RemoveItem(Config.Weed, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Weed], 'remove')

    Wait(1000)
    Player.Functions.AddItem(Config.WeedInBag, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeedInBag], 'add')
end)

RegisterServerEvent('qb-outdoorweed:client:MakingJointDone', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(Config.JointItem, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.JointItem], 'remove')

    Player.Functions.RemoveItem(Config.DryWeed, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DryWeed], 'remove')

    Wait(1000)
    Player.Functions.AddItem(Config.FinalJoint, amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FinalJoint], 'add')
end)
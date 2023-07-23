QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-fishing:server:RemoveBait', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if exports['ps-inventory']:RemoveItem(Player.PlayerData.source, 'fishbait', 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishbait'], 'remove', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local random = math.random(100) -- Random number from 1 to 100
    local item = nil

    if random >= 1 and random <= 30 then -- 30%
        item = 'cod'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 30 and random <= 40 then -- 10%
        item = 'catfish'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 40 and random <= 50 then -- 10%
        item = 'eel'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 50 and random <= 59 then -- 9%
        item = 'swordfish'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 60 and random <= 68 then -- 8%
        item = 'largemouthbass'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 68 and random <= 75 then -- 7%
        item = 'bluefish'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 75 and random <= 81 then -- 6%
        item = 'redfish'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 81 and random <= 86 then -- 5%
        item = 'goldfish'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 86 and random <= 90 then -- 4%
        item = 'salmon'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 91 and random <= 94 then -- 3%
        item = 'rainbowtrout'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 94 and random <= 97 then -- 2%
        item = 'tunafish'
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 98 and random <= 99 then -- 2%
        item = 'stingray' 
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    elseif random >= 99 and random <= 100 then -- 1%
        local chance = math.random(1,3)
        if chance == 1 then
            item = 'tigershark'
        elseif chance == 2 then
            item = 'killerwhale'
        elseif chance == 3 then
            item = 'ghol'
        end
        TriggerClientEvent('fishing:client:spawnFish', src, item)
    end
    
    if exports['ps-inventory']:AddItem(Player.PlayerData.source, item, 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item], 'add', 1)
        TriggerEvent('qb-log:server:CreateLog', 'fishing', 'Received Fish', 'blue', "**"..Player.PlayerData.name .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** received 1x "..QBCore.Shared.Items[item].label)
    else
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Your inventory is full already..', 'error', 2500)
    end
end)

QBCore.Functions.CreateUseableItem('fishingrod', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.Functions.GetItemByName('fishingrod') then return end
    TriggerClientEvent('qb-fishing:client:FishingRod', src)
end)

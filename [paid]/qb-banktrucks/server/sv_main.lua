local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-banktrucks:server:removeCard", function() 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    exports['qb-inventory']:RemoveItem(src, "hacking_device", 1) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hacking_device"], "remove", 1)  
end)

RegisterServerEvent("qb-banktrucks:server:removeThermite", function() 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    exports['qb-inventory']:RemoveItem(src, "thermite", 1) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["thermite"], "remove", 1)  
end)

RegisterServerEvent('qb-banktrucks:server:UpdatePlates', function(plate)
    Config.RobbedPlates[plate] = true
    TriggerClientEvent('qb-banktrucks:client:UpdatePlates', -1, plate)
end)

RegisterServerEvent('qb-banktrucks:server:RemoveDoors', function(truck)
    TriggerClientEvent('qb-banktrucks:client:RemoveDoors', -1, truck)
end)

RegisterServerEvent('qb-banktrucks:server:ThermitePtfx', function(coords)
    TriggerClientEvent('qb-banktrucks:client:ThermitePtfx', -1, coords)
end)

RegisterServerEvent('qb-banktrucks:server:receiveItem', function(netId)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end
    if GetEntityModel(entity) ~= `stockade` then
        exports['qb-core']:ExploitBan(src, "banktrucks-no-stockade")
        return
    end
    
    local plate = GetVehicleNumberPlateText(entity)
    if Config.LootedTrucks[plate] then return end
    Config.LootedTrucks[plate] = true
    TriggerClientEvent('qb-banktrucks:client:UpdateLooted', -1, plate)

    -- inked money bags
    reward()
end)

QBCore.Functions.CreateUseableItem("hacking_device", function(source, item)
	local src = source
	TriggerClientEvent("qb-banktrucks:client:UseBlackCard", src)
    TriggerEvent("qb-log:server:CreateLog", "useable", "USED hacking_device", "black", "**" .. src .. "**")
end)

QBCore.Functions.CreateCallback('qb-banktrucks:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

QBCore.Functions.CreateCallback('qb-banktrucks:server:getConfig', function(source, cb)
    cb(Config.RobbedPlates, Config.LootedTrucks)
end)





function reward()
    for i = 1, math.random(1,5) do
    local src = source

    local info = {worth = math.random(12000, 17000)}
    exports['qb-inventory']:AddItem(src, "markedbills", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add", 1) 
    TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."2".. ' x '.. "markedbills")

    
    -- Sped Rewards
    local tierChance = math.random(100)
    local tier = 1
    local duh = math.random(5,25)
    if tierChance < 30 then tier = 1 
    elseif tierChance >= 30 and tierChance < 45 then tier = 2 
    elseif tierChance >= 45 and tierChance < 60 then tier = 3
    elseif tierChance >= 60 and tierChance < 75 then tier = 4
    elseif tierChance >= 75 and tierChance < 90 then tier = 5
    else tier = 6 end

    if tier == 1 then
        exports['qb-inventory']:AddItem(src, "goldbar", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "markedbills")
    elseif tier == 2 then
        exports['qb-inventory']:AddItem(src, "diamond", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["diamond"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."3".. ' x '.. "markedbills")
    elseif tier == 3 then
        exports['qb-inventory']:AddItem(src, "emerald", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["emerald"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_03")
    elseif tier == 4 then
        exports['qb-inventory']:AddItem(src, "ruby", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ruby"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_04")
    elseif tier == 5 then
        exports['qb-inventory']:AddItem(src, "sapphire", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sapphire"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "green", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_01")
    elseif tier == 6 then
        exports['qb-inventory']:AddItem(src, "bluediamond", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["bluediamond"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "yellow", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_02")       
    end


    end
end
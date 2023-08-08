local QBCore = exports['qb-core']:GetCoreObject()


local src = source


RegisterNetEvent('Polar-BankTruck:Server:GiveRewards', function()
    local src = source

    local info = {worth = math.random(12000, 17000)}
    exports['inventory']:AddItem(src, "markedbills", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add", 2) 
    TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."2".. ' x '.. "markedbills")

    timeout(1000)

    local info = {worth = math.random(12000, 17000)}
    exports['inventory']:AddItem(src, "markedbills", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add", 2) 
    TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."2".. ' x '.. "markedbills")

    timeout(1000)

    local info = {worth = math.random(12000, 17000)}
    exports['inventory']:AddItem(src, "markedbills", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add", 2) 
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
        exports['inventory']:AddItem(src, "goldbar", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "markedbills")
    elseif tier == 2 then
        exports['inventory']:AddItem(src, "diamond", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["diamond"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."3".. ' x '.. "markedbills")
    elseif tier == 3 then
        exports['inventory']:AddItem(src, "emerald", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["emerald"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_03")
    elseif tier == 4 then
        exports['inventory']:AddItem(src, "ruby", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ruby"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_04")
    elseif tier == 5 then
        exports['inventory']:AddItem(src, "sapphire", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sapphire"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "green", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_01")
    elseif tier == 6 then
        exports['inventory']:AddItem(src, "bluediamond", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["bluediamond"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "yellow", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_02")       
    end



end)
local QBCore = exports['qb-core']:GetCoreObject()

local lootedtrucks = {}
local robbedplates = {}

RegisterServerEvent("Polar-ArmoredTrucks:server:removeCard", function() 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local chance = math.random(1,100)


    if chance < 26 then
    exports['inventory']:RemoveItem(src, "hacking_device", 1) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hacking_device"], "remove", 1)  
    else
        
    end
end)



RegisterServerEvent('Polar-ArmoredTrucks:server:UpdatePlates', function(plate)
    robbedplates[plate] = true
    TriggerClientEvent('Polar-ArmoredTrucks:client:UpdatePlates', -1, plate)
end)

RegisterServerEvent('Polar-ArmoredTrucks:server:RemoveDoors', function(truck)
    TriggerClientEvent('Polar-ArmoredTrucks:client:RemoveDoors', -1, truck)
end)

RegisterServerEvent('Polar-ArmoredTrucks:server:ThermitePtfx', function(coords)
    TriggerClientEvent('Polar-ArmoredTrucks:client:ThermitePtfx', -1, coords)
end)

RegisterServerEvent('Polar-ArmoredTrucks:server:receiveItem', function(netId)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end
    if GetEntityModel(entity) ~= 'stockade' then
        exports['qb-core']:ExploitBan(src, "banktrucks-no-stockade")
        return
    end
    
    local plate = GetVehicleNumberPlateText(entity)
    if lootedtrucks[plate] then return end
    lootedtrucks[plate] = true
    TriggerClientEvent('Polar-ArmoredTrucks:client:UpdateLooted', -1, plate)

    -- inked money bags
    reward()
end)


QBCore.Functions.CreateCallback('Polar-ArmoredTrucks:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

QBCore.Functions.CreateCallback('Polar-ArmoredTrucks:server:getConfig', function(source, cb)
    cb(robbedplates, lootedtrucks)
end)




function reward()
    local luck = math.random(1,100)

    if luck < 30 then
        
    else
        TriggerEvent('Polar-BankTruck:server:BankNotes')
    end

end

RegisterNetEvent('Polar-BankTruck:server:BankNotes', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
   
    local item = "markedbills"
    local amount = 1
    local info = {worth = math.random(10000, 30000)}
    Wait(50)
    exports['inventory']:AddItem(src, item, amount, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) 


end)

RegisterNetEvent('Polar-BankTruck:Server:SpecialReward', function()

    sped()

    Wait(150)

end)

function sped()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Sped Rewards
    local chance = math.random(1,100)
    local tier = 1
   
    if chance < 30 then tier = 1 
    elseif chance >= 30 and chance < 45 then tier = 2
        -- tier 2 
    elseif chance >= 45 and chance < 60 then tier = 3
        -- tier 3 
    elseif chance >= 60 and chance < 75 then tier = 4
        -- tier 4 
    elseif chance >= 75 and chance < 90 then tier = 5
        -- tier 5 
    elseif chance >= 90 and chance < 101 then tier = 6
        -- tier 6 

    end


    if tier == 1 then
        exports['inventory']:AddItem(src, "goldbar", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "markedbills")
    elseif tier == 2 then
        exports['inventory']:AddItem(src, "diamond", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["diamond"], "add", 1)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."3".. ' x '.. "markedbills")
    elseif tier == 3 then
        local item = 'emerald'
        local amount = math.random(1,1)
        exports['inventory']:AddItem(src, item, amount, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '..amount.. ' x '.. item "")
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



end



local CooldownCheck = false


QBCore.Functions.CreateCallback("Polar-ArmoredTrucks:Server:Cooldown", function(source, cb)
    cb(CooldownCheck)
end)
RegisterNetEvent('Polar-ArmoredTrucks:Server:UnCooldown', function()
    

  
    -- 10 mins
    Wait(600000)
    -- 10 mins
    Wait(600000)
    -- 10 mins
    Wait(600000)
    -- 10 mins
    Wait(600000)
    -- 10 mins
    Wait(600000)
    -- 10 mins
    Wait(600000)
    exports['Polar-Wade']:unarmoredtruck()
    CooldownCheck = false

end)
RegisterNetEvent('Polar-ArmoredTrucks:Server:Cooldown2', function()
    exports['Polar-Wade']:armoredtruck()
    CooldownCheck = true

end)
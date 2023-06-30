if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end

local bagamount = 0
local mix = true local temp = true local tray = true local bag = true local cooldown = true

RegisterNetEvent('Polar-Meth:Server:RemoveTarget', function(name)
    
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, name)

end)
RegisterNetEvent('Polar-Meth:Server:StopInteract', function(name)
    if name == 'mix' then mix = false
    elseif name == 'temp' then temp = false
    elseif name == 'tray' then tray = false
    elseif name == 'bag' then bag = false

    end
end)
RegisterNetEvent('Polar-Meth:Server:StartInteract', function(name)
    if name == 'mix' then mix = true
    elseif name == 'temp' then temp = true
    elseif name == 'tray' then tray = true
    elseif name == 'bag' then bag = true

    end
end)


Config.CreateCallBack('Polar-Meth:MixCheck', function(source, cb) cb(mix)   if Config.Debug then print(mix) end end) 
Config.CreateCallBack('Polar-Meth:TempCheck', function(source, cb) cb(temp) if Config.Debug then print(temp) end  end)
Config.CreateCallBack('Polar-Meth:TrayCheck', function(source, cb) cb(tray) if Config.Debug then print(tray) end  end)  
Config.CreateCallBack('Polar-Meth:BagCheck', function(source, cb) cb(bag) if Config.Debug then print(bag) end  end) 

RegisterNetEvent('Polar-Meth:Server:StartTargets', function() TriggerClientEvent('Polar-Meth:Client:StartTargets', -1) end)

Config.CreateCallBack('Polar-Meth:Cooldown', function(source, cb) cb(cooldown) end) 
local time = math.floor(Config.CooldownTime * 60000) RegisterNetEvent('Polar-Meth:Server:StartCooldown', function(door) cooldown = false SetTimeout(time, function() reset() end) end)
function reset() cooldown = true mix = true temp = true tray = true bag = true bagamount = 0 TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'tray') 
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'bag')  TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'mix')  TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'temp') 
    Wait(5000) TriggerClientEvent('Polar-Meth:Client:MixTarget', -1)

end



RegisterNetEvent('Polar-Meth:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, amount) 
    if Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(src, QBCore.Shared.Items[item], amount)
    else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) 
    end
end)
RegisterNetEvent('Polar-Meth:Server:TrayAdd', function()
    if temp then if Config.Debug then  print('tray add error') end
    else
        temp = false
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.TrayItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.TrayItem], 'add', 1)
       -- TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Tray")
    end
end)
RegisterNetEvent('Polar-Meth:Server:MethShardAdd', function()
    if tray then if Config.Debug then  print('meth add error') end
    else
        tray = false
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.MethShardItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.MethShardItem], 'add', 1)
       -- TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Shard")
    end
end)
RegisterNetEvent('Polar-Meth:Server:MethAdd', function()
    if bag then if Config.Debug then  print('meth add error') end
    else
        bag = false
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.MethItem, bagamount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.MethItem], 'add', bagamount)
        -- TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Bags " .. bagamount .. ' ')
    end
end)
RegisterNetEvent('Polar-Meth:Server:SetBagAmount', function(amount)
    bagamount = math.floor(amount * math.random(Config.MultiplierMin, Config.MultiplierMax))
end)
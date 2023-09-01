if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end

local bagamount = 0
local mix = true local temp = true local tray = true local bag = true local cooldown = true

local labs = {}

RegisterNetEvent('Polar-Meth:Server:SetupLab', function(labname)
    labs[labname] = {
        bagamount = 0,
        mix = true,
        temp = true,
        tray = true,
        bag = true,
        cooldown = true,
    }
end)

RegisterNetEvent('Polar-Meth:Server:RemoveTarget', function(name, labname)
    
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, name, labname)

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


Config.CreateCallBack('Polar-Meth:MixCheck', function(source, cb, labname)                  cb(labs[labname].mix)   if Config.Debug then print(mix) end end) 
Config.CreateCallBack('Polar-Meth:TempCheck', function(source, cb, labname)                 cb(labs[labname].temp) if Config.Debug then print(temp) end  end)
Config.CreateCallBack('Polar-Meth:TrayCheck', function(source, cb, labname)                 cb(labs[labname].tray) if Config.Debug then print(tray) end  end)  
Config.CreateCallBack('Polar-Meth:BagCheck', function(source, cb, labname)                  cb(labs[labname].bag) if Config.Debug then print(bag) end  end) 

RegisterNetEvent('Polar-Meth:Server:StartTargets', function(labname) TriggerClientEvent('Polar-Meth:Client:StartTargets', -1, labname) end)

Config.CreateCallBack('Polar-Meth:Cooldown', function(source, cb, labname) cb(labs[labname].cooldown) end) 
local time = math.floor(Config.CooldownTime * 60000) RegisterNetEvent('Polar-Meth:Server:StartCooldown', function(door, labname) print(labs[labname].cooldown) cooldown = false SetTimeout(time, function() reset(labname) end) end)
function reset(labname) 
    labs[labname].cooldown = true labs[labname].mix = true labs[labname].temp = true labs[labname].tray = true labs[labname].bag = true labs[labname].bagamount = 0 
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'tray', labname) 
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'bag', labname)  
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'mix', labname)  
    TriggerClientEvent('Polar-Meth:Client:RemoveTarget', -1, 'temp', labname) 
    Wait(5000) TriggerClientEvent('Polar-Meth:Client:MixTarget', -1, labname)

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
RegisterNetEvent('Polar-Meth:Server:TrayAdd', function(labname)
    if labs[labname].temp then if Config.Debug then  print('tray add error') end
    else
        labs[labname].temp = false
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.TrayItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.TrayItem], 'add', 1)
       -- TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Tray")
    end
end)
RegisterNetEvent('Polar-Meth:Server:MethShardAdd', function(labname)
    if labs[labname].tray then if Config.Debug then  print('meth add error') end
    else
        labs[labname].tray = false
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.MethShardItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.MethShardItem], 'add', 1)
       -- TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Shard")
    end
end)
RegisterNetEvent('Polar-Meth:Server:MethAdd', function(labname)
    if labs[labname].bag then if Config.Debug then  print('meth add error') end
    else
        labs[labname].bag = false
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(Config.MethItem, labs[labname].bagamount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.MethItem], 'add', labs[labname].bagamount)
        -- TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Bags " .. bagamount .. ' ')
    end
end)
RegisterNetEvent('Polar-Meth:Server:SetBagAmount', function(amount, labname)
    labs[labname].bagamount = math.floor(amount * math.random(Config.MultiplierMin, Config.MultiplierMax))
end)
if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end

local cooldown = true

local time = (Config.CooldownTime * 60000) 
RegisterNetEvent('Polar-Atms:Server:StartCooldown', function()
     cooldown = false 
     SetTimeout(time, function() 
        reset() 
    end) 
end)

Config.CallBack('Polar-Atms:CooldownCheck', function(source, cb)  cb(cooldown) end) 

function reset()
    cooldown = true


end

RegisterNetEvent('Polar-Atms:Server:RemoveItems', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Wait(150) if amount == nil then Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) else Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end end)

RegisterNetEvent('Polar-Atms:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, amount) 
    if oxinv then
        exports.ox_inventory:RemoveItem(src, QBCore.Shared.Items[item], amount)
    else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) 
    end
end)
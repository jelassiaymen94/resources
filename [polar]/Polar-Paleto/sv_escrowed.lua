if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end

local prop = nil local var = nil local item = nil local amount = nil
RegisterNetEvent('Polar-Paleto:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-Paleto:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-Paleto:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-Paleto:Server:Vault', function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-Paleto:Server:TargetRemove', function(door) TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-Paleto:Server:RemoveProp', function(door) TriggerClientEvent('Polar-Paleto:Client:RemoveProp', -1, door)   end)
RegisterNetEvent('Polar-Paleto:Server:StartTargets', function()   TriggerClientEvent('Polar-Paleto:Client:StartTargets', -1)   TriggerClientEvent('Polar-Paleto:Client:StartLoot', source)      end)
RegisterNetEvent('Polar-Paleto:Server:DestroyPad', function(name) TriggerClientEvent('Polar-Paleto:Client:DestroyPad', -1, name) end)
RegisterNetEvent('Polar-Paleto:Server:TrollyModelSync', function(name, loc) TriggerClientEvent('Polar-Paleto:Client:TrollyModelSync', -1, name, loc) end)


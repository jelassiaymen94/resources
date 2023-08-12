
local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('Polar-stores:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-stores:Server:TargetRemove', function(door) TriggerClientEvent('Polar-stores:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-stores:Server:RemoveProp', function(door) TriggerClientEvent('Polar-stores:Client:RemoveProp', -1, door)   end)
RegisterNetEvent('Polar-stores:Server:StartTargets', function(name)   TriggerClientEvent('Polar-stores:Client:StartTargets', -1, name)  TriggerClientEvent('Polar-stores:Client:GrabLoc', source, name) TriggerClientEvent('Polar-stores:Client:StartLoot', source, name)      end)


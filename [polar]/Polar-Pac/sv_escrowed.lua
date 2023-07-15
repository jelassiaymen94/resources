if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end

local prop = nil local var = nil local item = nil local amount = nil
Config.CallBack('Polar-Pacific:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-Pacific:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-Pacific:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-Pacific:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-Pacific:Server:Vault', function() TriggerClientEvent('Polar-Pacific:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-Pacific:Server:TargetRemove', function(door) TriggerClientEvent('Polar-Pacific:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-Pacific:Server:StartTargets', function()   TriggerClientEvent('Polar-Pacific:Client:StartTargets', -1)   TriggerClientEvent('Polar-Pacific:Client:StartLoot', source)      end)





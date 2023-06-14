if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end

local prop = nil local var = nil local item = nil local amount = nil
Config.CallBack('Polar-Paleto:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-Paleto:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-Paleto:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-Paleto:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-Paleto:Server:Vault', function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-Paleto:Server:TargetRemove', function(door) TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-Paleto:Server:StartTargets', function()   TriggerClientEvent('Polar-Paleto:Client:StartTargets', -1)   TriggerClientEvent('Polar-Paleto:Client:StartLoot', source)      end)





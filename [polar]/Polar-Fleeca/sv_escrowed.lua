local QBCore = exports[Config.Core]:GetCoreObject()

local prop = nil local var = nil local item = nil local amount = nil
QBCore.Functions.CreateCallback('Polar-fleeca:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-fleeca:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-fleeca:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-fleeca:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-fleeca:Server:Vault', function() TriggerClientEvent('Polar-fleeca:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-fleeca:Server:TargetRemove', function(door) TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-fleeca:Server:StartTargets', function()   TriggerClientEvent('Polar-fleeca:Client:StartTargets', -1)   TriggerClientEvent('Polar-fleeca:Client:StartLoot', source)      end)





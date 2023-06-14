local QBCore = exports[Config.Core]:GetCoreObject()

local prop = nil local var = nil local item = nil local amount = nil
QBCore.Functions.CreateCallback('Polar-Paleto:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-Paleto:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-Paleto:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-Paleto:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-Paleto:Server:Vault', function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-Paleto:Server:TargetRemove', function(door) TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-Paleto:Server:StartTargets', function()   TriggerClientEvent('Polar-Paleto:Client:StartTargets', -1)   TriggerClientEvent('Polar-Paleto:Client:StartLoot', source)      end)
RegisterNetEvent('Polar-Paleto:Server:RemoveItems', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Wait(150) if amount == nil then Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) else Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end end)





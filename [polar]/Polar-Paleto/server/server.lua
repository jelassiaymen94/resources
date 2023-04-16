local QBCore = exports[Config.Core]:GetCoreObject()

local prop = nil local var = nil local item = nil local amount = nil
QBCore.Functions.CreateCallback('Polar-Paleto:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-Paleto:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-Paleto:Client:ThermitePtfx', -1, coords) end)
local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-Paleto:Server:StartCooldown', function(door) SetTimeout(time, function() reset() end) end)
RegisterNetEvent('Polar-Paleto:Server:RemoveItem', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) end)
RegisterNetEvent('Polar-Paleto:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-Paleto:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'success') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, false) end) end) end) end) end)
RegisterNetEvent('Polar-Paleto:Server:Vault', function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-Paleto:Server:RemoveItems', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Wait(150) if amount == nil then Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) else Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end end)
RegisterNetEvent('Polar-Paleto:Server:TargetRemove', function(door) TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-Paleto:Server:StartTargets', function()   TriggerClientEvent('Polar-Paleto:Client:StartTargets', -1)     end)





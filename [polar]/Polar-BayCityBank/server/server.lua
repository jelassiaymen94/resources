local QBCore = exports[Config.Core]:GetCoreObject()


QBCore.Functions.CreateCallback('Polar-BayCityBank:Server:GetCops', function(source, cb) local amount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then amount = amount + 1 end end cb(amount) end)
RegisterNetEvent('Polar-BayCityBank:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-BayCityBank:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-BayCityBank:Server:StopInteract', function(door) TriggerClientEvent('Polar-BayCityBank:Client:StopInteract', -1, door) end)
RegisterNetEvent('Polar-BayCityBank:Server:StartInteract', function(door) TriggerClientEvent('Polar-BayCityBank:Client:StartInteract', -1, door) end)
local active = false QBCore.Functions.CreateCallback('Polar-BayCityBank:IsRobbery', function(source, cb) cb(active) end)
local time = (Config.CooldownTime * 1000) RegisterNetEvent('Polar-BayCityBank:StartRobbery', function() active = true end) RegisterNetEvent('Polar-BayCityBank:EndRobbery', function() SetTimeout(time, function() active = false end) end)
RegisterNetEvent('Polar-BayCityBank:Server:RemoveItem', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) end)
RegisterNetEvent('Polar-BayCityBank:Server:GiveRewards', function(item, amount)  local src = source exports['qb-core']:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
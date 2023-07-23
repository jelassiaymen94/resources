local QBCore = exports[Config.Core]:GetCoreObject()

local prop = nil local var = nil local item = nil local amount = nil
QBCore.Functions.CreateCallback('Polar-Pacific:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-Pacific:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-Pacific:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-Pacific:Server:RemoveItem', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) end)
RegisterNetEvent('Polar-Pacific:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-Pacific:Server:Vault', function() TriggerClientEvent('Polar-Pacific:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-Pacific:Server:RemoveItems', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Wait(150) if amount == nil then Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) else Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end end)
RegisterNetEvent('Polar-Pacific:Server:TargetRemove', function(door) TriggerClientEvent('Polar-Pacific:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-Pacific:Server:StartTargets', function()   TriggerClientEvent('Polar-Pacific:Client:StartTargets', -1)     end)



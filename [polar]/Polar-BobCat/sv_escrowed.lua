if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end

local prop = nil local var = nil local item = nil local amount = nil
Config.CallBack('Polar-BobCat:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-BobCat:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-BobCat:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-BobCat:Server:GiveRewards', function(item, amount)  local src = source exports[Config.Core]:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-BobCat:Server:Vault', function() TriggerClientEvent('Polar-BobCat:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-BobCat:Server:TargetRemove', function(door) TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door)   end)
RegisterNetEvent('Polar-BobCat:Server:StartTargets', function()   TriggerClientEvent('Polar-BobCat:Client:StartTargets', -1)   TriggerClientEvent('Polar-BobCat:Client:StartLoot', source)      end)





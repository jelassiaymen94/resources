local QBCore = exports[Config.Core]:GetCoreObject()



local prop = nil local var = nil local item = nil local amount = nil
QBCore.Functions.CreateCallback('Polar-BayCityBank:Server:GetCops', function(source, cb) local camount = 0 for k, v in pairs(QBCore.Functions.GetQBPlayers()) do if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then camount = camount + 1 end end cb(camount) end)
RegisterNetEvent('Polar-BayCityBank:Server:ThermitePtfx', function(coords) TriggerClientEvent('Polar-BayCityBank:Client:ThermitePtfx', -1, coords) end)
RegisterNetEvent('Polar-BayCityBank:Server:StopInteract', function(door) TriggerClientEvent('Polar-BayCityBank:Client:StopInteract', -1, door) end)
RegisterNetEvent('Polar-BayCityBank:Server:StartInteract', function(door) TriggerClientEvent('Polar-BayCityBank:Client:StartInteract', -1, door) end)
local active = false QBCore.Functions.CreateCallback('Polar-BayCityBank:IsRobbery', function(source, cb) cb(active) end)
local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-BayCityBank:Server:Cooldown', function(door) active = true TriggerEvent('Polar-BayCityBank:Server:StartCooldown', door) end) RegisterNetEvent('Polar-BayCityBank:Server:StartCooldown', function(door) SetTimeout(time, function() active = false reset() end) end)
RegisterNetEvent('Polar-BayCityBank:Server:RemoveItem', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) end)
RegisterNetEvent('Polar-BayCityBank:Server:GiveRewards', function(item, amount)  local src = source exports['qb-core']:ExploitBan(src, "HERES YOUR " .. amount .. " " .. item .. " S BITCH") end) -- modder bait lol
RegisterNetEvent('Polar-BayCityBank:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'success') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-BayCityBank:Client:Vault', -1, false) end) end) end) end) end)
RegisterNetEvent('Polar-BayCityBank:Server:Vault', function() TriggerClientEvent('Polar-BayCityBank:Client:Vault', -1, true) end)
RegisterNetEvent('Polar-BayCityBank:Server:RemoveItems', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Wait(150) if amount == nil then Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) else Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end end)





function reset1()
    print(Config.bayfusebox)
    Config.bayfusebox = true 
    Config.baykitcendhoor = false
    Config.bayofficeleft = false    Config.bayofficeback = false   Config.bayofficeright = false  Config.baykitchoor = false       Config.bayatmleft = false 
    Config.bayatmright = false     Config.baycomputerleft = false     Config.baycomputerright = false    Config.baycomputerback = false   Config.baybutton = false     Config.baybutton = false 
    Config.baybutton2 = false     Config.baybutton3 = false   Config.baybutton4 = false     Config.baybutton5 = false    Config.baybutton6 = false    Config.baybutton7 = false 
    Config.baybutton25 = false   Config.baybutton26 = false   Config.baybutton27 = false     Config.baybutton28 = false     Config.baybutton29 = false    Config.baybutton30 = false     Config.baybutton31 = false     Config.baybutton32 = false 
    Config.baybutton33 = false    Config.baybutton34 = false     Config.baybutton35 = false   Config.baybutton36 = false     Config.baybutton37 = false    Config.baybutton38 = false     Config.baybutton39 = false 
    Config.baybutton40 = false     Config.baybutton41 = false   Config.baybutton42 = false    Config.baybutton43 = false     Config.baybutton44 = false    Config.baybutton45 = false    Config.baycomputer1 = false     Config.baycomputer2 = false 
    Config.baybutton46 = false    Config.baybutton47 = false   Config.baybutton48 = false    Config.baybutton49 = false     Config.baybutton50 = false   Config.bayvaultgate = false    Config.baycomputer3 = false     Config.baycomputer4 = false 
    Config.baystaffonlydoor = false 
    Config.bayvaultdoor = false
    Config.Vault = false
    print(Config.bayfusebox)
end
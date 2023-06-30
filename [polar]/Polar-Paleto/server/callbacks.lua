if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
local oxinv = Config.OxIventory
RegisterNetEvent('Polar-Paleto:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'error') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, false) end) end) end) end) end)


RegisterNetEvent('Polar-Paleto:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, amount) 
    if oxinv then
        exports.ox_inventory:RemoveItem(src, QBCore.Shared.Items[item], amount)
    else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) 
    end
end)

RegisterNetEvent('Polar-Paleto:Server:RemoveItems', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) Wait(150) 
    if amount == nil then Player.Functions.AddItem(item, 1) 
        if oxinv then
            exports.ox_inventory:AddItem(src, QBCore.Shared.Items[item], amount)
        else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) 
        end
    else Player.Functions.AddItem(item, amount)
        if oxinv then
            exports.ox_inventory:AddItem(src, QBCore.Shared.Items[item], amount)
        else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) 
        end
    end 
end)




local paletostartname = 'paletostart'
local paletodoor1name = 'paletodoor1'
local paletodoor2name = 'paletodoor2'
local paletodoor3name = 'paletodoor3'
local paletodoorcard1name = 'paletodoorcard1'
local paletodoorcard2name = 'paletodoorcard2'




local paletopc1 = true
local paletopc2 = true
local paletopc3 = true


local paletostart = true 
local paletodoor1 = false
local paletodoor2 = false
local paletodoor3 = false
local paletodoorcard1 = false
local paletodoorcard2 = false



local paletoprop1 = false
Config.CallBack('Polar-Paleto:paletoprop1', function(source, cb) cb(paletoprop1) end) 
local paletoprop2 = false
Config.CallBack('Polar-Paleto:paletoprop2', function(source, cb) cb(paletoprop2) end) 
local paletoprop3 = false
Config.CallBack('Polar-Paleto:paletoprop3', function(source, cb) cb(paletoprop3) end) 
local paletoprop4 = false
Config.CallBack('Polar-Paleto:paletoprop4', function(source, cb) cb(paletoprop4) end) 
local paletoprop5 = false
Config.CallBack('Polar-Paleto:paletoprop5', function(source, cb) cb(paletoprop5) end) 

local paletoprop6 = false
Config.CallBack('Polar-Paleto:paletoprop6', function(source, cb) cb(paletoprop6) end) 
local paletoprop7 = false
Config.CallBack('Polar-Paleto:paletoprop7', function(source, cb) cb(paletoprop7) end) 
local paletoprop8 = false
Config.CallBack('Polar-Paleto:paletoprop8', function(source, cb) cb(paletoprop8) end) 
local paletoprop9 = false
Config.CallBack('Polar-Paleto:paletoprop9', function(source, cb) cb(paletoprop9) end) 
local paletoprop10 = false
Config.CallBack('Polar-Paleto:paletoprop10', function(source, cb) cb(paletoprop10) end) 

local paletoprop11 = false
Config.CallBack('Polar-Paleto:paletoprop11', function(source, cb) cb(paletoprop11) end) 
local paletoprop12 = false
Config.CallBack('Polar-Paleto:paletoprop12', function(source, cb) cb(paletoprop12) end) 
local paletoprop13 = false
Config.CallBack('Polar-Paleto:paletoprop13', function(source, cb) cb(paletoprop13) end) 
local paletoprop14 = false
Config.CallBack('Polar-Paleto:paletoprop14', function(source, cb) cb(paletoprop14) end) 
local paletoprop15 = false
Config.CallBack('Polar-Paleto:paletoprop15', function(source, cb) cb(paletoprop15) end) 

local paletoprop16 = false
Config.CallBack('Polar-Paleto:paletoprop16', function(source, cb) cb(paletoprop16) end) 
local paletoprop17 = false
Config.CallBack('Polar-Paleto:paletoprop17', function(source, cb) cb(paletoprop17) end) 
local paletoprop18 = false
Config.CallBack('Polar-Paleto:paletoprop18', function(source, cb) cb(paletoprop18) end) 
local paletoprop19 = false
Config.CallBack('Polar-Paleto:paletoprop19', function(source, cb) cb(paletoprop19) end) 
local paletoprop20 = false
Config.CallBack('Polar-Paleto:paletoprop20', function(source, cb) cb(paletoprop20) end) 

local paletoprop21 = false
Config.CallBack('Polar-Paleto:paletoprop21', function(source, cb) cb(paletoprop21) end) 
local paletoprop22 = false
Config.CallBack('Polar-Paleto:paletoprop22', function(source, cb) cb(paletoprop22) end) 
local paletoprop23 = false
Config.CallBack('Polar-Paleto:paletoprop23', function(source, cb) cb(paletoprop23) end) 
local paletoprop24 = false
Config.CallBack('Polar-Paleto:paletoprop24', function(source, cb) cb(paletoprop24) end) 
local paletoprop25 = false
Config.CallBack('Polar-Paleto:paletoprop25', function(source, cb) cb(paletoprop25) end) 

local paletoprop26 = false
Config.CallBack('Polar-Paleto:paletoprop26', function(source, cb) cb(paletoprop26) end) 
local paletoprop27 = false
Config.CallBack('Polar-Paleto:paletoprop27', function(source, cb) cb(paletoprop27) end) 
local paletoprop28 = false
Config.CallBack('Polar-Paleto:paletoprop28', function(source, cb) cb(paletoprop28) end) 
local paletoprop29 = false
Config.CallBack('Polar-Paleto:paletoprop29', function(source, cb) cb(paletoprop29) end) 
local paletoprop30 = false
Config.CallBack('Polar-Paleto:paletoprop30', function(source, cb) cb(paletoprop30) end) 

local paletoprop31 = false
Config.CallBack('Polar-Paleto:paletoprop31', function(source, cb) cb(paletoprop31) end) 
local paletoprop32 = false
Config.CallBack('Polar-Paleto:paletoprop32', function(source, cb) cb(paletoprop32) end) 
local paletoprop33 = false
Config.CallBack('Polar-Paleto:paletoprop33', function(source, cb) cb(paletoprop33) end) 
local paletoprop34 = false
Config.CallBack('Polar-Paleto:paletoprop34', function(source, cb) cb(paletoprop34) end) 
local paletoprop35 = false
Config.CallBack('Polar-Paleto:paletoprop35', function(source, cb) cb(paletoprop35) end) 

local paletoprop36 = false
Config.CallBack('Polar-Paleto:paletoprop36', function(source, cb) cb(paletoprop36) end) 
local paletoprop37 = false
Config.CallBack('Polar-Paleto:paletoprop37', function(source, cb) cb(paletoprop37) end) 
local paletoprop38 = false
Config.CallBack('Polar-Paleto:paletoprop38', function(source, cb) cb(paletoprop38) end) 
local paletoprop39 = false
Config.CallBack('Polar-Paleto:paletoprop39', function(source, cb) cb(paletoprop39) end) 
local paletoprop40 = false
Config.CallBack('Polar-Paleto:paletoprop40', function(source, cb) cb(paletoprop40) end) 

local paletodrill1 = true
Config.CallBack('Polar-Paleto:paletodrill1', function(source, cb) cb(paletodrill1) end) 
local paletodrill2 = true
Config.CallBack('Polar-Paleto:paletodrill2', function(source, cb) cb(paletodrill2) end) 

local paletovault = true
Config.CallBack('Polar-Paleto:VaultCheck', function(source, cb)  cb(paletovault) end) 

RegisterNetEvent('Polar-Paleto:Server:StopInteract', function(door)
    if door == paletostartname then paletostart = false end
    if door == paletodoor1name then paletodoor1 = false end
    if door == paletodoor2name then paletodoor2 = false end
    if door == paletodoor3name then paletodoor3 = false end
    if door == paletodoorcard1name then paletodoorcard1 = false end
    if door == paletodoorcard2name then paletodoorcard2 = false end

    if door == 'paletoprop1' then paletoprop1 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop2' then paletoprop2 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop3' then paletoprop3 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop4' then paletoprop4 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop5' then paletoprop5 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
   
    if door == 'paletoprop6' then paletoprop6 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop7' then paletoprop7 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop8' then paletoprop8 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop9' then paletoprop9 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop10' then paletoprop10 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletoprop11' then paletoprop11 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop12' then paletoprop12 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop13' then paletoprop13 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop14' then paletoprop14 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop15' then paletoprop15 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletoprop16' then paletoprop16 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop17' then paletoprop17 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop18' then paletoprop18 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop19' then paletoprop19 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop20' then paletoprop20 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletoprop21' then paletoprop21 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop22' then paletoprop22 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop23' then paletoprop23 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop24' then paletoprop24 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop25' then paletoprop25 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
   
    if door == 'paletoprop26' then paletoprop26 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop27' then paletoprop27 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop28' then paletoprop28 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop29' then paletoprop29 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop30' then paletoprop30 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletoprop31' then paletoprop31 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop32' then paletoprop32 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop33' then paletoprop33 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop34' then paletoprop34 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop35' then paletoprop35 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletoprop36' then paletoprop36 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop37' then paletoprop37 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop38' then paletoprop38 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop39' then paletoprop39 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletoprop40' then paletoprop40 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletopc1' then paletopc1 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletopc2' then paletopc2 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletopc3' then paletopc3 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletodrill1' then paletodrill1 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
    if door == 'paletodrill2' then paletodrill2 = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end

    if door == 'paletovault' then paletovault = false TriggerClientEvent('Polar-Paleto:Client:TargetRemove', -1, door) end
end)
RegisterNetEvent('Polar-Paleto:Server:StartInteract', function(door)
    if door == paletostartname then paletostart = true end
    if door == paletodoor1name then paletodoor1 = true end
    if door == paletodoor2name then paletodoor2 = true end
    if door == paletodoor3name then paletodoor3 = true end
    if door == paletodoorcard1name then paletodoorcard1 = true end
    if door == paletodoorcard2name then paletodoorcard2 = true end

    if door == 'paletoprop1' then paletoprop1 = true end
    if door == 'paletoprop2' then paletoprop2 = true end
    if door == 'paletoprop3' then paletoprop3 = true end
    if door == 'paletoprop4' then paletoprop4 = true end
    if door == 'paletoprop5' then paletoprop5 = true end

    if door == 'paletoprop6' then paletoprop6 = true end
    if door == 'paletoprop7' then paletoprop7 = true end
    if door == 'paletoprop8' then paletoprop8 = true end
    if door == 'paletoprop9' then paletoprop9 = true end
    if door == 'paletoprop10' then paletoprop10 = true end

    if door == 'paletoprop11' then paletoprop11 = true end
    if door == 'paletoprop12' then paletoprop12 = true end
    if door == 'paletoprop13' then paletoprop13 = true end
    if door == 'paletoprop14' then paletoprop14 = true end
    if door == 'paletoprop15' then paletoprop15 = true end

    if door == 'paletoprop16' then paletoprop16 = true end
    if door == 'paletoprop17' then paletoprop17 = true end
    if door == 'paletoprop18' then paletoprop18 = true end
    if door == 'paletoprop19' then paletoprop19 = true end
    if door == 'paletoprop20' then paletoprop20 = true end

    if door == 'paletoprop21' then paletoprop21 = true end
    if door == 'paletoprop22' then paletoprop22 = true end
    if door == 'paletoprop23' then paletoprop23 = true end
    if door == 'paletoprop24' then paletoprop24 = true end
    if door == 'paletoprop25' then paletoprop25 = true end
   
    if door == 'paletoprop26' then paletoprop26 = true end
    if door == 'paletoprop27' then paletoprop27 = true end
    if door == 'paletoprop28' then paletoprop28 = true end
    if door == 'paletoprop29' then paletoprop29 = true end
    if door == 'paletoprop30' then paletoprop30 = true end

    if door == 'paletoprop31' then paletoprop31 = true end
    if door == 'paletoprop32' then paletoprop32 = true end
    if door == 'paletoprop33' then paletoprop33 = true end
    if door == 'paletoprop34' then paletoprop34 = true end
    if door == 'paletoprop35' then paletoprop35 = true end

    if door == 'paletoprop36' then paletoprop36 = true end
    if door == 'paletoprop37' then paletoprop37 = true end
    if door == 'paletoprop38' then paletoprop38 = true end
    if door == 'paletoprop39' then paletoprop39 = true end
    if door == 'paletoprop40' then paletoprop40 = true end

    if door == 'paletopc1' then paletopc1 = true end
    if door == 'paletopc2' then paletopc2 = true end
    if door == 'paletopc3' then paletopc3 = true end

    if door == 'paletodrill1' then paletodrill1 = true end
    if door == 'paletodrill2' then paletodrill2 = true end

    if door == 'paletovault' then paletovault = true end
end)


Config.CallBack('Polar-Paleto:DoorCheckstart', function(source, cb) cb(paletostart) end) 

Config.CallBack('Polar-Paleto:Door1', function(source, cb) cb(paletodoor1) end) 

Config.CallBack('Polar-Paleto:Door2', function(source, cb)  cb(paletodoor2) end) 

Config.CallBack('Polar-Paleto:Door3', function(source, cb) cb(paletodoor3) end) 

Config.CallBack('Polar-Paleto:Doorcard1', function(source, cb) cb(paletodoorcard1) end) 

Config.CallBack('Polar-Paleto:Doorcard2', function(source, cb)  cb(paletodoorcard2) end) 

local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-Paleto:Server:StartCooldown', function(door) SetTimeout(time, function() reset() end) end)


function reset()
    paletostart = true
    paletodoor1 = false
    paletodoor2 = false
    paletodoor3 = false
    paletodoorcard1 = false
    paletodoorcard2 = false

    paletoprop1 = false
    paletoprop2 = false
    paletoprop3 = false
    paletoprop4 = false
    paletoprop5 = false

    paletoprop6 = false
    paletoprop7 = false
    paletoprop8 = false
    paletoprop9 = false
    paletoprop10 = false

    paletoprop11 = false
    paletoprop12 = false
    paletoprop13 = false
    paletoprop14 = false
    paletoprop15 = false

    paletoprop16 = false
    paletoprop17 = false
    paletoprop18 = false
    paletoprop19 = false
    paletoprop20 = false

    paletoprop21 = false
    paletoprop22 = false
    paletoprop23 = false
    paletoprop24 = false
    paletoprop25 = false

    paletoprop26 = false
    paletoprop27 = false
    paletoprop28 = false
    paletoprop29 = false
    paletoprop30 = false

    paletoprop31 = false
    paletoprop32 = false
    paletoprop33 = false
    paletoprop34 = false
    paletoprop35 = false

    paletoprop36 = false
    paletoprop37 = false
    paletoprop38 = false
    paletoprop39 = false
    paletoprop40 = false

    paletopc1 = true
    paletopc2 = true
    paletopc3 = true

    paletodrill1 = true
    paletodrill1 = true

    paletovault = true

    TriggerClientEvent('Polar-Paleto:Client:ResetProps', -1)

    TriggerClientEvent('Polar-Paleto:Client:ResetDoors', -1)

    TriggerClientEvent('Polar-Paleto:Client:ResetPropsKeypads', -1)
    
end

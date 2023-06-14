local QBCore = exports[Config.Core]:GetCoreObject()
local oxinv = Config.OxIventory
RegisterNetEvent('Polar-fleeca:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'error') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-fleeca:Client:Vault', -1, false) end) end) end) end) end)


RegisterNetEvent('Polar-fleeca:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, amount) 
    if oxinv then
        exports.ox_inventory:RemoveItem(src, QBCore.Shared.Items[item], amount)
    else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) 
    end
end)

RegisterNetEvent('Polar-fleeca:Server:RemoveItems', function(item, amount) 
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

local fleecastartname = 'fleecastart'
local fleecadoor1name = 'fleecadoor1'
local fleecadoor2name = 'fleecadoor2'
local fleecadoor3name = 'fleecadoor3'
local fleecadoorcard1name = 'fleecadoorcard1'
local fleecadoorcard2name = 'fleecadoorcard2'




local fleecapc1 = true
local fleecapc2 = true
local fleecapc3 = true


local fleecastart = true 
local fleecadoor1 = false
local fleecadoor2 = false
local fleecadoor3 = false
local fleecadoorcard1 = false
local fleecadoorcard2 = false



local fleecaprop1 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop1', function(source, cb) cb(fleecaprop1) end) 
local fleecaprop2 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop2', function(source, cb) cb(fleecaprop2) end) 
local fleecaprop3 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop3', function(source, cb) cb(fleecaprop3) end) 
local fleecaprop4 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop4', function(source, cb) cb(fleecaprop4) end) 
local fleecaprop5 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop5', function(source, cb) cb(fleecaprop5) end) 

local fleecaprop6 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop6', function(source, cb) cb(fleecaprop6) end) 
local fleecaprop7 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop7', function(source, cb) cb(fleecaprop7) end) 
local fleecaprop8 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop8', function(source, cb) cb(fleecaprop8) end) 
local fleecaprop9 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop9', function(source, cb) cb(fleecaprop9) end) 
local fleecaprop10 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop10', function(source, cb) cb(fleecaprop10) end) 

local fleecaprop11 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop11', function(source, cb) cb(fleecaprop11) end) 
local fleecaprop12 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop12', function(source, cb) cb(fleecaprop12) end) 
local fleecaprop13 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop13', function(source, cb) cb(fleecaprop13) end) 
local fleecaprop14 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop14', function(source, cb) cb(fleecaprop14) end) 
local fleecaprop15 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop15', function(source, cb) cb(fleecaprop15) end) 

local fleecaprop16 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop16', function(source, cb) cb(fleecaprop16) end) 
local fleecaprop17 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop17', function(source, cb) cb(fleecaprop17) end) 
local fleecaprop18 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop18', function(source, cb) cb(fleecaprop18) end) 
local fleecaprop19 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop19', function(source, cb) cb(fleecaprop19) end) 
local fleecaprop20 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop20', function(source, cb) cb(fleecaprop20) end) 

local fleecaprop21 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop21', function(source, cb) cb(fleecaprop21) end) 
local fleecaprop22 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop22', function(source, cb) cb(fleecaprop22) end) 
local fleecaprop23 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop23', function(source, cb) cb(fleecaprop23) end) 
local fleecaprop24 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop24', function(source, cb) cb(fleecaprop24) end) 
local fleecaprop25 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop25', function(source, cb) cb(fleecaprop25) end) 

local fleecaprop26 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop26', function(source, cb) cb(fleecaprop26) end) 
local fleecaprop27 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop27', function(source, cb) cb(fleecaprop27) end) 
local fleecaprop28 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop28', function(source, cb) cb(fleecaprop28) end) 
local fleecaprop29 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop29', function(source, cb) cb(fleecaprop29) end) 
local fleecaprop30 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop30', function(source, cb) cb(fleecaprop30) end) 

local fleecaprop31 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop31', function(source, cb) cb(fleecaprop31) end) 
local fleecaprop32 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop32', function(source, cb) cb(fleecaprop32) end) 
local fleecaprop33 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop33', function(source, cb) cb(fleecaprop33) end) 
local fleecaprop34 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop34', function(source, cb) cb(fleecaprop34) end) 
local fleecaprop35 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop35', function(source, cb) cb(fleecaprop35) end) 

local fleecaprop36 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop36', function(source, cb) cb(fleecaprop36) end) 
local fleecaprop37 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop37', function(source, cb) cb(fleecaprop37) end) 
local fleecaprop38 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop38', function(source, cb) cb(fleecaprop38) end) 
local fleecaprop39 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop39', function(source, cb) cb(fleecaprop39) end) 
local fleecaprop40 = false
QBCore.Functions.CreateCallback('Polar-fleeca:fleecaprop40', function(source, cb) cb(fleecaprop40) end) 

local fleecadrill1 = true
QBCore.Functions.CreateCallback('Polar-fleeca:fleecadrill1', function(source, cb) cb(fleecadrill1) end) 
local fleecadrill2 = true
QBCore.Functions.CreateCallback('Polar-fleeca:fleecadrill2', function(source, cb) cb(fleecadrill2) end) 

local fleecavault = true
QBCore.Functions.CreateCallback('Polar-fleeca:VaultCheck', function(source, cb)  cb(fleecavault) end) 

RegisterNetEvent('Polar-fleeca:Server:StopInteract', function(door)
    if door == fleecastartname then fleecastart = false end
    if door == fleecadoor1name then fleecadoor1 = false end
    if door == fleecadoor2name then fleecadoor2 = false end
    if door == fleecadoor3name then fleecadoor3 = false end
    if door == fleecadoorcard1name then fleecadoorcard1 = false end
    if door == fleecadoorcard2name then fleecadoorcard2 = false end

    if door == 'fleecaprop1' then fleecaprop1 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop2' then fleecaprop2 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop3' then fleecaprop3 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop4' then fleecaprop4 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop5' then fleecaprop5 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
   
    if door == 'fleecaprop6' then fleecaprop6 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop7' then fleecaprop7 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop8' then fleecaprop8 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop9' then fleecaprop9 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop10' then fleecaprop10 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecaprop11' then fleecaprop11 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop12' then fleecaprop12 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop13' then fleecaprop13 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop14' then fleecaprop14 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop15' then fleecaprop15 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecaprop16' then fleecaprop16 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop17' then fleecaprop17 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop18' then fleecaprop18 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop19' then fleecaprop19 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop20' then fleecaprop20 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecaprop21' then fleecaprop21 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop22' then fleecaprop22 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop23' then fleecaprop23 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop24' then fleecaprop24 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop25' then fleecaprop25 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
   
    if door == 'fleecaprop26' then fleecaprop26 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop27' then fleecaprop27 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop28' then fleecaprop28 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop29' then fleecaprop29 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop30' then fleecaprop30 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecaprop31' then fleecaprop31 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop32' then fleecaprop32 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop33' then fleecaprop33 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop34' then fleecaprop34 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop35' then fleecaprop35 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecaprop36' then fleecaprop36 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop37' then fleecaprop37 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop38' then fleecaprop38 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop39' then fleecaprop39 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecaprop40' then fleecaprop40 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecapc1' then fleecapc1 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecapc2' then fleecapc2 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecapc3' then fleecapc3 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecadrill1' then fleecadrill1 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
    if door == 'fleecadrill2' then fleecadrill2 = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end

    if door == 'fleecavault' then fleecavault = false TriggerClientEvent('Polar-fleeca:Client:TargetRemove', -1, door) end
end)
RegisterNetEvent('Polar-fleeca:Server:StartInteract', function(door)
    if door == fleecastartname then fleecastart = true end
    if door == fleecadoor1name then fleecadoor1 = true end
    if door == fleecadoor2name then fleecadoor2 = true end
    if door == fleecadoor3name then fleecadoor3 = true end
    if door == fleecadoorcard1name then fleecadoorcard1 = true end
    if door == fleecadoorcard2name then fleecadoorcard2 = true end

    if door == 'fleecaprop1' then fleecaprop1 = true end
    if door == 'fleecaprop2' then fleecaprop2 = true end
    if door == 'fleecaprop3' then fleecaprop3 = true end
    if door == 'fleecaprop4' then fleecaprop4 = true end
    if door == 'fleecaprop5' then fleecaprop5 = true end

    if door == 'fleecaprop6' then fleecaprop6 = true end
    if door == 'fleecaprop7' then fleecaprop7 = true end
    if door == 'fleecaprop8' then fleecaprop8 = true end
    if door == 'fleecaprop9' then fleecaprop9 = true end
    if door == 'fleecaprop10' then fleecaprop10 = true end

    if door == 'fleecaprop11' then fleecaprop11 = true end
    if door == 'fleecaprop12' then fleecaprop12 = true end
    if door == 'fleecaprop13' then fleecaprop13 = true end
    if door == 'fleecaprop14' then fleecaprop14 = true end
    if door == 'fleecaprop15' then fleecaprop15 = true end

    if door == 'fleecaprop16' then fleecaprop16 = true end
    if door == 'fleecaprop17' then fleecaprop17 = true end
    if door == 'fleecaprop18' then fleecaprop18 = true end
    if door == 'fleecaprop19' then fleecaprop19 = true end
    if door == 'fleecaprop20' then fleecaprop20 = true end

    if door == 'fleecaprop21' then fleecaprop21 = true end
    if door == 'fleecaprop22' then fleecaprop22 = true end
    if door == 'fleecaprop23' then fleecaprop23 = true end
    if door == 'fleecaprop24' then fleecaprop24 = true end
    if door == 'fleecaprop25' then fleecaprop25 = true end
   
    if door == 'fleecaprop26' then fleecaprop26 = true end
    if door == 'fleecaprop27' then fleecaprop27 = true end
    if door == 'fleecaprop28' then fleecaprop28 = true end
    if door == 'fleecaprop29' then fleecaprop29 = true end
    if door == 'fleecaprop30' then fleecaprop30 = true end

    if door == 'fleecaprop31' then fleecaprop31 = true end
    if door == 'fleecaprop32' then fleecaprop32 = true end
    if door == 'fleecaprop33' then fleecaprop33 = true end
    if door == 'fleecaprop34' then fleecaprop34 = true end
    if door == 'fleecaprop35' then fleecaprop35 = true end

    if door == 'fleecaprop36' then fleecaprop36 = true end
    if door == 'fleecaprop37' then fleecaprop37 = true end
    if door == 'fleecaprop38' then fleecaprop38 = true end
    if door == 'fleecaprop39' then fleecaprop39 = true end
    if door == 'fleecaprop40' then fleecaprop40 = true end

    if door == 'fleecapc1' then fleecapc1 = true end
    if door == 'fleecapc2' then fleecapc2 = true end
    if door == 'fleecapc3' then fleecapc3 = true end

    if door == 'fleecadrill1' then fleecadrill1 = true end
    if door == 'fleecadrill2' then fleecadrill2 = true end

    if door == 'fleecavault' then fleecavault = true end
end)


QBCore.Functions.CreateCallback('Polar-fleeca:DoorCheckstart', function(source, cb) cb(fleecastart) end) 

QBCore.Functions.CreateCallback('Polar-fleeca:Door1', function(source, cb) cb(fleecadoor1) end) 

QBCore.Functions.CreateCallback('Polar-fleeca:Door2', function(source, cb)  cb(fleecadoor2) end) 

QBCore.Functions.CreateCallback('Polar-fleeca:Door3', function(source, cb) cb(fleecadoor3) end) 

QBCore.Functions.CreateCallback('Polar-fleeca:Doorcard1', function(source, cb) cb(fleecadoorcard1) end) 

QBCore.Functions.CreateCallback('Polar-fleeca:Doorcard2', function(source, cb)  cb(fleecadoorcard2) end) 

local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-fleeca:Server:StartCooldown', function(door) SetTimeout(time, function() reset() end) end)


function reset()
    fleecastart = true
    fleecadoor1 = false
    fleecadoor2 = false
    fleecadoor3 = false
    fleecadoorcard1 = false
    fleecadoorcard2 = false

    fleecaprop1 = false
    fleecaprop2 = false
    fleecaprop3 = false
    fleecaprop4 = false
    fleecaprop5 = false

    fleecaprop6 = false
    fleecaprop7 = false
    fleecaprop8 = false
    fleecaprop9 = false
    fleecaprop10 = false

    fleecaprop11 = false
    fleecaprop12 = false
    fleecaprop13 = false
    fleecaprop14 = false
    fleecaprop15 = false

    fleecaprop16 = false
    fleecaprop17 = false
    fleecaprop18 = false
    fleecaprop19 = false
    fleecaprop20 = false

    fleecaprop21 = false
    fleecaprop22 = false
    fleecaprop23 = false
    fleecaprop24 = false
    fleecaprop25 = false

    fleecaprop26 = false
    fleecaprop27 = false
    fleecaprop28 = false
    fleecaprop29 = false
    fleecaprop30 = false

    fleecaprop31 = false
    fleecaprop32 = false
    fleecaprop33 = false
    fleecaprop34 = false
    fleecaprop35 = false

    fleecaprop36 = false
    fleecaprop37 = false
    fleecaprop38 = false
    fleecaprop39 = false
    fleecaprop40 = false

    fleecapc1 = true
    fleecapc2 = true
    fleecapc3 = true

    fleecadrill1 = true
    fleecadrill1 = true

    fleecavault = true

    TriggerClientEvent('Polar-fleeca:Client:ResetProps', -1)

    TriggerClientEvent('Polar-fleeca:Client:ResetDoors', -1)

    TriggerClientEvent('Polar-fleeca:Client:ResetPropsKeypads', -1)
    
end

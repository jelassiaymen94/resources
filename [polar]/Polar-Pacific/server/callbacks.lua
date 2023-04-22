local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent('Polar-Pacific:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'error') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-Pacific:Client:Vault', -1, false) end) end) end) end) end)


local Pacificstartname = 'Pacificstart'
local Pacificdoor1name = 'Pacificdoor1'
local Pacificdoor2name = 'Pacificdoor2'
local Pacificdoor3name = 'Pacificdoor3'
local Pacificdoorcard1name = 'Pacificdoorcard1'
local Pacificdoorcard2name = 'Pacificdoorcard2'




local Pacificpc1 = true
local Pacificpc2 = true
local Pacificpc3 = true


local Pacificstart = true 
local Pacificdoor1 = false
local Pacificdoor2 = false
local Pacificdoor3 = false
local Pacificdoorcard1 = false
local Pacificdoorcard2 = false



local Pacificprop1 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop1', function(source, cb) cb(Pacificprop1) end) 
local Pacificprop2 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop2', function(source, cb) cb(Pacificprop2) end) 
local Pacificprop3 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop3', function(source, cb) cb(Pacificprop3) end) 
local Pacificprop4 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop4', function(source, cb) cb(Pacificprop4) end) 
local Pacificprop5 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop5', function(source, cb) cb(Pacificprop5) end) 

local Pacificprop6 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop6', function(source, cb) cb(Pacificprop6) end) 
local Pacificprop7 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop7', function(source, cb) cb(Pacificprop7) end) 
local Pacificprop8 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop8', function(source, cb) cb(Pacificprop8) end) 
local Pacificprop9 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop9', function(source, cb) cb(Pacificprop9) end) 
local Pacificprop10 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop10', function(source, cb) cb(Pacificprop10) end) 

local Pacificprop11 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop11', function(source, cb) cb(Pacificprop11) end) 
local Pacificprop12 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop12', function(source, cb) cb(Pacificprop12) end) 
local Pacificprop13 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop13', function(source, cb) cb(Pacificprop13) end) 
local Pacificprop14 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop14', function(source, cb) cb(Pacificprop14) end) 
local Pacificprop15 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop15', function(source, cb) cb(Pacificprop15) end) 

local Pacificprop16 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop16', function(source, cb) cb(Pacificprop16) end) 
local Pacificprop17 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop17', function(source, cb) cb(Pacificprop17) end) 
local Pacificprop18 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop18', function(source, cb) cb(Pacificprop18) end) 
local Pacificprop19 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop19', function(source, cb) cb(Pacificprop19) end) 
local Pacificprop20 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop20', function(source, cb) cb(Pacificprop20) end) 

local Pacificprop21 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop21', function(source, cb) cb(Pacificprop21) end) 
local Pacificprop22 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop22', function(source, cb) cb(Pacificprop22) end) 
local Pacificprop23 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop23', function(source, cb) cb(Pacificprop23) end) 
local Pacificprop24 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop24', function(source, cb) cb(Pacificprop24) end) 
local Pacificprop25 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop25', function(source, cb) cb(Pacificprop25) end) 

local Pacificprop26 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop26', function(source, cb) cb(Pacificprop26) end) 
local Pacificprop27 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop27', function(source, cb) cb(Pacificprop27) end) 
local Pacificprop28 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop28', function(source, cb) cb(Pacificprop28) end) 
local Pacificprop29 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop29', function(source, cb) cb(Pacificprop29) end) 
local Pacificprop30 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop30', function(source, cb) cb(Pacificprop30) end) 

local Pacificprop31 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop31', function(source, cb) cb(Pacificprop31) end) 
local Pacificprop32 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop32', function(source, cb) cb(Pacificprop32) end) 
local Pacificprop33 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop33', function(source, cb) cb(Pacificprop33) end) 
local Pacificprop34 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop34', function(source, cb) cb(Pacificprop34) end) 
local Pacificprop35 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop35', function(source, cb) cb(Pacificprop35) end) 

local Pacificprop36 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop36', function(source, cb) cb(Pacificprop36) end) 
local Pacificprop37 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop37', function(source, cb) cb(Pacificprop37) end) 
local Pacificprop38 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop38', function(source, cb) cb(Pacificprop38) end) 
local Pacificprop39 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop39', function(source, cb) cb(Pacificprop39) end) 
local Pacificprop40 = false
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificprop40', function(source, cb) cb(Pacificprop40) end) 

local Pacificdrill1 = true
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificdrill1', function(source, cb) cb(Pacificdrill1) end) 
local Pacificdrill2 = true
QBCore.Functions.CreateCallback('Polar-Pacific:Pacificdrill2', function(source, cb) cb(Pacificdrill2) end) 

local Pacificvault = true
QBCore.Functions.CreateCallback('Polar-Pacific:VaultCheck', function(source, cb)  cb(Pacificvault) end) 

RegisterNetEvent('Polar-Pacific:Server:StopInteract', function(door)
    if door == Pacificstartname then Pacificstart = false end
    if door == Pacificdoor1name then Pacificdoor1 = false end
    if door == Pacificdoor2name then Pacificdoor2 = false end
    if door == Pacificdoor3name then Pacificdoor3 = false end
    if door == Pacificdoorcard1name then Pacificdoorcard1 = false end
    if door == Pacificdoorcard2name then Pacificdoorcard2 = false end

    if door == 'Pacificprop1' then Pacificprop1 = false end
    if door == 'Pacificprop2' then Pacificprop2 = false end
    if door == 'Pacificprop3' then Pacificprop3 = false end
    if door == 'Pacificprop4' then Pacificprop4 = false end
    if door == 'Pacificprop5' then Pacificprop5 = false end
   
    if door == 'Pacificprop6' then Pacificprop6 = false end
    if door == 'Pacificprop7' then Pacificprop7 = false end
    if door == 'Pacificprop8' then Pacificprop8 = false end
    if door == 'Pacificprop9' then Pacificprop9 = false end
    if door == 'Pacificprop10' then Pacificprop10 = false end

    if door == 'Pacificprop11' then Pacificprop11 = false end
    if door == 'Pacificprop12' then Pacificprop12 = false end
    if door == 'Pacificprop13' then Pacificprop13 = false end
    if door == 'Pacificprop14' then Pacificprop14 = false end
    if door == 'Pacificprop15' then Pacificprop15 = false end

    if door == 'Pacificprop16' then Pacificprop16 = false end
    if door == 'Pacificprop17' then Pacificprop17 = false end
    if door == 'Pacificprop18' then Pacificprop18 = false end
    if door == 'Pacificprop19' then Pacificprop19 = false end
    if door == 'Pacificprop20' then Pacificprop20 = false end

    if door == 'Pacificprop21' then Pacificprop21 = false end
    if door == 'Pacificprop22' then Pacificprop22 = false end
    if door == 'Pacificprop23' then Pacificprop23 = false end
    if door == 'Pacificprop24' then Pacificprop24 = false end
    if door == 'Pacificprop25' then Pacificprop25 = false end
   
    if door == 'Pacificprop26' then Pacificprop26 = false end
    if door == 'Pacificprop27' then Pacificprop27 = false end
    if door == 'Pacificprop28' then Pacificprop28 = false end
    if door == 'Pacificprop29' then Pacificprop29 = false end
    if door == 'Pacificprop30' then Pacificprop30 = false end

    if door == 'Pacificprop31' then Pacificprop31 = false end
    if door == 'Pacificprop32' then Pacificprop32 = false end
    if door == 'Pacificprop33' then Pacificprop33 = false end
    if door == 'Pacificprop34' then Pacificprop34 = false end
    if door == 'Pacificprop35' then Pacificprop35 = false end

    if door == 'Pacificprop36' then Pacificprop36 = false end
    if door == 'Pacificprop37' then Pacificprop37 = false end
    if door == 'Pacificprop38' then Pacificprop38 = false end
    if door == 'Pacificprop39' then Pacificprop39 = false end
    if door == 'Pacificprop40' then Pacificprop40 = false end

    if door == 'Pacificpc1' then Pacificpc1 = false end
    if door == 'Pacificpc2' then Pacificpc2 = false end
    if door == 'Pacificpc3' then Pacificpc3 = false end

    if door == 'Pacificdrill1' then Pacificdrill1 = false end
    if door == 'Pacificdrill2' then Pacificdrill2 = false end

    if door == 'Pacificvault' then Pacificvault = false end
end)
RegisterNetEvent('Polar-Pacific:Server:StartInteract', function(door)
    if door == Pacificstartname then Pacificstart = true end
    if door == Pacificdoor1name then Pacificdoor1 = true end
    if door == Pacificdoor2name then Pacificdoor2 = true end
    if door == Pacificdoor3name then Pacificdoor3 = true end
    if door == Pacificdoorcard1name then Pacificdoorcard1 = true end
    if door == Pacificdoorcard2name then Pacificdoorcard2 = true end

    if door == 'Pacificprop1' then Pacificprop1 = true end
    if door == 'Pacificprop2' then Pacificprop2 = true end
    if door == 'Pacificprop3' then Pacificprop3 = true end
    if door == 'Pacificprop4' then Pacificprop4 = true end
    if door == 'Pacificprop5' then Pacificprop5 = true end

    if door == 'Pacificprop6' then Pacificprop6 = true end
    if door == 'Pacificprop7' then Pacificprop7 = true end
    if door == 'Pacificprop8' then Pacificprop8 = true end
    if door == 'Pacificprop9' then Pacificprop9 = true end
    if door == 'Pacificprop10' then Pacificprop10 = true end

    if door == 'Pacificprop11' then Pacificprop11 = true end
    if door == 'Pacificprop12' then Pacificprop12 = true end
    if door == 'Pacificprop13' then Pacificprop13 = true end
    if door == 'Pacificprop14' then Pacificprop14 = true end
    if door == 'Pacificprop15' then Pacificprop15 = true end

    if door == 'Pacificprop16' then Pacificprop16 = true end
    if door == 'Pacificprop17' then Pacificprop17 = true end
    if door == 'Pacificprop18' then Pacificprop18 = true end
    if door == 'Pacificprop19' then Pacificprop19 = true end
    if door == 'Pacificprop20' then Pacificprop20 = true end

    if door == 'Pacificprop21' then Pacificprop21 = true end
    if door == 'Pacificprop22' then Pacificprop22 = true end
    if door == 'Pacificprop23' then Pacificprop23 = true end
    if door == 'Pacificprop24' then Pacificprop24 = true end
    if door == 'Pacificprop25' then Pacificprop25 = true end
   
    if door == 'Pacificprop26' then Pacificprop26 = true end
    if door == 'Pacificprop27' then Pacificprop27 = true end
    if door == 'Pacificprop28' then Pacificprop28 = true end
    if door == 'Pacificprop29' then Pacificprop29 = true end
    if door == 'Pacificprop30' then Pacificprop30 = true end

    if door == 'Pacificprop31' then Pacificprop31 = true end
    if door == 'Pacificprop32' then Pacificprop32 = true end
    if door == 'Pacificprop33' then Pacificprop33 = true end
    if door == 'Pacificprop34' then Pacificprop34 = true end
    if door == 'Pacificprop35' then Pacificprop35 = true end

    if door == 'Pacificprop36' then Pacificprop36 = true end
    if door == 'Pacificprop37' then Pacificprop37 = true end
    if door == 'Pacificprop38' then Pacificprop38 = true end
    if door == 'Pacificprop39' then Pacificprop39 = true end
    if door == 'Pacificprop40' then Pacificprop40 = true end

    if door == 'Pacificpc1' then Pacificpc1 = true end
    if door == 'Pacificpc2' then Pacificpc2 = true end
    if door == 'Pacificpc3' then Pacificpc3 = true end

    if door == 'Pacificdrill1' then Pacificdrill1 = true end
    if door == 'Pacificdrill2' then Pacificdrill2 = true end

    if door == 'Pacificvault' then Pacificvault = true end
end)


QBCore.Functions.CreateCallback('Polar-Pacific:DoorCheckstart', function(source, cb) cb(Pacificstart) end) 

QBCore.Functions.CreateCallback('Polar-Pacific:Door1', function(source, cb) cb(Pacificdoor1) end) 

QBCore.Functions.CreateCallback('Polar-Pacific:Door2', function(source, cb)  cb(Pacificdoor2) end) 

QBCore.Functions.CreateCallback('Polar-Pacific:Door3', function(source, cb) cb(Pacificdoor3) end) 

QBCore.Functions.CreateCallback('Polar-Pacific:Doorcard1', function(source, cb) cb(Pacificdoorcard1) end) 

QBCore.Functions.CreateCallback('Polar-Pacific:Doorcard2', function(source, cb)  cb(Pacificdoorcard2) end) 

local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-Pacific:Server:StartCooldown', function(door) SetTimeout(time, function() reset() end) end)


function reset()
    Pacificstart = true
    Pacificdoor1 = false
    Pacificdoor2 = false
    Pacificdoor3 = false
    Pacificdoorcard1 = false
    Pacificdoorcard2 = false

    Pacificprop1 = false
    Pacificprop2 = false
    Pacificprop3 = false
    Pacificprop4 = false
    Pacificprop5 = false

    Pacificprop6 = false
    Pacificprop7 = false
    Pacificprop8 = false
    Pacificprop9 = false
    Pacificprop10 = false

    Pacificprop11 = false
    Pacificprop12 = false
    Pacificprop13 = false
    Pacificprop14 = false
    Pacificprop15 = false

    Pacificprop16 = false
    Pacificprop17 = false
    Pacificprop18 = false
    Pacificprop19 = false
    Pacificprop20 = false

    Pacificprop21 = false
    Pacificprop22 = false
    Pacificprop23 = false
    Pacificprop24 = false
    Pacificprop25 = false

    Pacificprop26 = false
    Pacificprop27 = false
    Pacificprop28 = false
    Pacificprop29 = false
    Pacificprop30 = false

    Pacificprop31 = false
    Pacificprop32 = false
    Pacificprop33 = false
    Pacificprop34 = false
    Pacificprop35 = false

    Pacificprop36 = false
    Pacificprop37 = false
    Pacificprop38 = false
    Pacificprop39 = false
    Pacificprop40 = false

    Pacificpc1 = true
    Pacificpc2 = true
    Pacificpc3 = true

    Pacificdrill1 = true
    Pacificdrill1 = true

    Pacificvault = true

    TriggerClientEvent('Polar-Pacific:Client:ResetProps', -1)

    TriggerClientEvent('Polar-Pacific:Client:ResetDoors', -1)

    TriggerClientEvent('Polar-Pacific:Client:ResetPropsKeypads', -1)
    
end

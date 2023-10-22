
if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
  
elseif Config.Framework == 'esx' then
    ESX = nil
 
end

local oxinv = Config.OxIventory

RegisterNetEvent('Polar-Pacific:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 6 Minutes", 'error') SetTimeout(300000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(60000, function()  TriggerClientEvent('Polar-Pacific:Client:Vault', -1, true) end) end) end)
RegisterNetEvent('Polar-Pacific:Server:Restart', function()  if Config.PolarWade then exports["Polar-Wade"]:Pacific(false) end  end)

RegisterNetEvent('Polar-Pacific:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if Config.Framework == 'qb' then
        Player.Functions.RemoveItem(item, amount) 
    elseif Config.Framework == 'esx' then
        Player.removeInventoryItem(item, 1)
    end
    if oxinv then
        exports.ox_inventory:RemoveItem(src, item, amount)
    elseif Config.Framework == 'qb' then
      --  TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)      
    end
end)

local startdoorname = Config.StartDoor
local door1name = Config.Door1
local door2name = Config.Door2
local door3name = Config.Door3
local doorcard1name = Config.doorcard1
local doorcard2name = Config.doorcard2

local Pacificpc1 = true
local Pacificpc2 = true
local Pacificpc3 = true

local Pacificstart = true 
local Pacificdoor1 = false
local Pacificdoor2 = false
local Pacificdoor3 = false
local Pacificdoorcard1 = false
local Pacificdoorcard2 = false



local Pacificdrill1 = true
Config.CallBack('Polar-Pacific:Pacificdrill1', function(source, cb) cb(Pacificdrill1) end) 
local Pacificdrill2 = true
Config.CallBack('Polar-Pacific:Pacificdrill2', function(source, cb) cb(Pacificdrill2) end) 
local Pacificdrill3 = true
Config.CallBack('Polar-Pacific:Pacificdrill3', function(source, cb) cb(Pacificdrill3) end) 
local Pacificdrill4 = true
Config.CallBack('Polar-Pacific:Pacificdrill4', function(source, cb) cb(Pacificdrill4) end) 
local Pacificdrill5 = true
Config.CallBack('Polar-Pacific:Pacificdrill5', function(source, cb) cb(Pacificdrill5) end) 
local Pacificdrill6 = true
Config.CallBack('Polar-Pacific:Pacificdrill6', function(source, cb) cb(Pacificdrill6) end) 
local Pacificdrill7 = true
Config.CallBack('Polar-Pacific:Pacificdrill7', function(source, cb) cb(Pacificdrill7) end) 
local Pacificdrill8 = true
Config.CallBack('Polar-Pacific:Pacificdrill8', function(source, cb) cb(Pacificdrill8) end) 

local Pacificvault = true
Config.CallBack('Polar-Pacific:VaultCheck', function(source, cb)  cb(Pacificvault) end) 
local Pacificfingerdoor = true
Config.CallBack('Polar-Pacific:FingerCheck', function(source, cb)  cb(Pacificfingerdoor) end) 

RegisterNetEvent('Polar-Pacific:Server:StopInteract', function(door)
    if door == nil then return end
    if door == startdoorname then Pacificstart = false end
    if door == door1name then Pacificdoor1 = false end
    if door == door2name then Pacificdoor2 = false end
    if door == door3name then Pacificdoor3 = false end
    if door == doorcard1name then Pacificdoorcard1 = false end
    if door == doorcard2name then Pacificdoorcard2 = false end
    if door == Config.Pc1name then Pacificpc1 = false end
    if door == Config.Pc2name then Pacificpc2 = false end
    if door == Config.Pc3name then Pacificpc3 = false end

    if door == 'Pacificdrill1' then Pacificdrill1 = false end
    if door == 'Pacificdrill2' then Pacificdrill2 = false end
    if door == 'Pacificdrill3' then Pacificdrill3 = false end
    if door == 'Pacificdrill4' then Pacificdrill4 = false end
    if door == 'Pacificdrill5' then Pacificdrill5 = false end
    if door == 'Pacificdrill6' then Pacificdrill6 = false end
    if door == 'Pacificdrill7' then Pacificdrill7 = false end
    if door == 'Pacificdrill8' then Pacificdrill8 = false end

    if door == Config.FingerDoorName then Pacificfingerdoor = false end
    if door == 'Pacificvault' then Pacificvault = false end
end)
RegisterNetEvent('Polar-Pacific:Server:StartInteract', function(door)
    if door == startdoorname then Pacificstart = true end
    if door == door1name then Pacificdoor1 = true end
    if door == door2name then Pacificdoor2 = true end
    if door == door3name then Pacificdoor3 = true end
    if door == doorcard1name then Pacificdoorcard1 = true end
    if door == doorcard2name then Pacificdoorcard2 = true end

    if door == Config.Pc1name then Pacificpc1 = true end
    if door == Config.Pc2name then Pacificpc2 = true end
    if door == Config.Pc3name then Pacificpc3 = true end

    if door == 'Pacificdrill1' then Pacificdrill1 = true end
    if door == 'Pacificdrill2' then Pacificdrill2 = true end
    if door == 'Pacificdrill3' then Pacificdrill3 = true end
    if door == 'Pacificdrill4' then Pacificdrill4 = true end
    if door == 'Pacificdrill5' then Pacificdrill5 = true end
    if door == 'Pacificdrill6' then Pacificdrill6 = true end
    if door == 'Pacificdrill7' then Pacificdrill7 = true end
    if door == 'Pacificdrill8' then Pacificdrill8 = true end

    if door == Config.FingerDoorName then Pacificfingerdoor = true end
    if door == 'Pacificvault' then Pacificvault = true end
end)


Config.CallBack('Polar-Pacific:DoorCheckstart', function(source, cb) cb(Pacificstart) end) 

Config.CallBack('Polar-Pacific:Door' .. door1name, function(source, cb) cb(Pacificdoor1) end) 
Config.CallBack('Polar-Pacific:Door' .. door2name, function(source, cb)  cb(Pacificdoor2) end) 
Config.CallBack('Polar-Pacific:Door' .. door3name, function(source, cb) cb(Pacificdoor3) end) 
Config.CallBack('Polar-Pacific:Door' .. Config.Pc1name, function(source, cb) cb(Pacificpc1) end) 
Config.CallBack('Polar-Pacific:Door' .. Config.Pc2name, function(source, cb)  cb(Pacificpc2) end) 
Config.CallBack('Polar-Pacific:Door' .. Config.Pc3name, function(source, cb) cb(Pacificpc3) end) 
Config.CallBack('Polar-Pacific:Door' .. doorcard1name, function(source, cb) cb(Pacificdoorcard1) end) 
Config.CallBack('Polar-Pacific:Door' .. doorcard2name, function(source, cb)  cb(Pacificdoorcard2) end) 

local time = (Config.CooldownTime * 60000) 
RegisterNetEvent('Polar-Pacific:Server:StartCooldown', function(door)
    if Config.PolarWade then exports["Polar-Wade"]:Pacific(true) end
    SetTimeout(time, function() 
        reset() 
        if Config.PolarWade then exports["Polar-Wade"]:Pacific(false) end 
    end) 
end)

function reset()
    Pacificstart = true
    Pacificdoor1 = false
    Pacificdoor2 = false
    Pacificdoor3 = false
    Pacificdoorcard1 = false
    Pacificdoorcard2 = false

    Pacificpc1 = true
    Pacificpc2 = true
    Pacificpc3 = true

    Pacificdrill1 = true
    Pacificdrill1 = true

    Pacificvault = true
    Pacificfingerdoor = true
    
    TriggerClientEvent('Polar-Pacific:Client:ResetProps', -1)

    TriggerClientEvent('Polar-Pacific:Client:ResetDoors', -1)

    TriggerClientEvent('Polar-Pacific:Client:ResetPropsKeypads', -1)
    
end


RegisterNetEvent('Polar-Pacific:Doorlock', function(doorid, id)
    local door = exports.ox_doorlock:getDoorFromName(doorid)
    if door == nil then return end
    TriggerEvent('ox_doorlock:setState', door.id, id)
   
end)

RegisterNetEvent('Polar-Pacific:Server:LockDown', function()
    Pacificstart = false
    Pacificdoor1 = false
    Pacificdoor2 = false
    Pacificdoor3 = false

    Pacificpc1 = false
    Pacificpc2 = false
    Pacificpc3 = false

    Pacificdrill1 = false
    Pacificdrill1 = false

    Pacificfingerdoor = false
    Pacificvault = false
end)
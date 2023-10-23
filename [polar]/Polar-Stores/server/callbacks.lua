

local QBCore = exports['qb-core']:GetCoreObject()
  

local store = nil
RegisterNetEvent('Polar-stores:Server:SetStore', function(stores)
    store = stores
    
  
end)



local oxinv = Config.OxIventory

RegisterNetEvent('Polar-stores:Server:Restart', function()  if Config.PolarWade then exports["Polar-Wade"]:Stores(false) end  end)

RegisterNetEvent('Polar-stores:Server:RemoveItem', function(item, amount) 
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
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)      
    end
end)

local storespc = true
local register = true
local cooldown = true
local door1 = true
local door2 = true
local safe = true

RegisterNetEvent('Polar-stores:Server:StopInteract', function(door)
    if door == nil then return end
    if door == Config.ComputerName then storespc = false end
    if door == Config.RegisterName then register = false end
    if door == Config.Names[store]["Door1Name"] then door1 = false end
    if door == Config.Names[store]["Door2Name"] then door2 = false end
    if door == Config.SafeName then safe = false end
end)
RegisterNetEvent('Polar-stores:Server:StartInteract', function(door)
    if door == nil then return end
    if door == Config.ComputerName then storespc = true end
    if door == Config.RegisterName then register = true end
    if door == Config.Names[store]["Door1Name"] then door1 = true end
    if door == Config.Names[store]["Door2Name"] then door2 = true end
    if door == Config.SafeName then safe = true end
end)

Config.CallBack('Polar-stores:Cooldown', function(source, cb) cb(cooldown) end) 
Config.CallBack('Polar-stores:Door' .. Config.ComputerName, function(source, cb) cb(storespc) end) 
Config.CallBack('Polar-stores:Door' .. Config.RegisterName, function(source, cb)  cb(register) end) 
Config.CallBack('Polar-stores:Door1', function(source, cb) cb(door1) end) 
Config.CallBack('Polar-stores:Door2', function(source, cb)  cb(door2) end) 
Config.CallBack('Polar-stores:Safe', function(source, cb)  cb(safe) end) 

local time = (Config.CooldownTime * 60000) 
RegisterNetEvent('Polar-stores:Server:StartCooldown', function()
    cooldown = false
    if Config.PolarWade then exports["Polar-Wade"]:Stores(true) end
    SetTimeout(time, function() 
        reset() 
        if Config.PolarWade then exports["Polar-Wade"]:Stores(false) end 
    end) 
end)

function reset()
    cooldown = true
    storespc = true
    register = true
    safe = true
    
    TriggerClientEvent('Polar-stores:Client:ResetProps', -1, store)

    TriggerClientEvent('Polar-stores:Client:ResetDoors', -1, store)

    
end


RegisterNetEvent('Polar-stores:Doorlock', function(doorid, id)
    local door = exports.ox_doorlock:getDoorFromName(doorid)
    if door == nil then return end
    TriggerEvent('ox_doorlock:setState', door.id, id)
   
end)


if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
  
elseif Config.Framework == 'esx' then
    ESX = nil
 
end

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

RegisterNetEvent('Polar-stores:Server:StopInteract', function(door)
    if door == nil then return end
    if door == Config.ComputerName then storespc = false end
    if door == Config.RegisterName then register = false end
end)
RegisterNetEvent('Polar-stores:Server:StartInteract', function(door)
    if door == nil then return end
    if door == Config.ComputerName then storespc = true end
    if door == Config.RegisterName then register = true end
end)


Config.CallBack('Polar-stores:Cooldown', function(source, cb) cb(cooldown) end) 
Config.CallBack('Polar-stores:Door' .. Config.ComputerName, function(source, cb) cb(storespc) end) 
Config.CallBack('Polar-stores:Door' .. Config.RegisterName, function(source, cb)  cb(register) end) 


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
    
    TriggerClientEvent('Polar-stores:Client:ResetProps', -1)

    TriggerClientEvent('Polar-stores:Client:ResetDoors', -1)

    
end


RegisterNetEvent('Polar-stores:Doorlock', function(doorid, id)
    local door = exports.ox_doorlock:getDoorFromName(doorid)
    if door == nil then return end
    TriggerEvent('ox_doorlock:setState', door.id, id)
   
end)

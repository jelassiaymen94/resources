local getplayer = nil
if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
    getplayer = QBCore.Functions.GetPlayer(source)
elseif Config.Framework == 'esx' then
    ESX = nil
    getplayer = ESX.GetPlayerFromId(source)
end

local oxinv = Config.OxIventory

RegisterNetEvent('Polar-Paleto:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'error') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-Paleto:Client:Vault', -1, false) end) end) end) end) end)


RegisterNetEvent('Polar-Paleto:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = getplayer

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


RegisterNetEvent('Polar-Doorlock', function(doorid, id)
    local door = exports.ox_doorlock:getDoorFromName(doorid)
    TriggerEvent('ox_doorlock:setState', door, id)
    print(doorid .. ' ' .. id)
   
end)
AddEventHandler('ox_doorlock:stateChanged', function(source, doorId, state)
    print('fuck you ' .. doorId)
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



local paletodrill1 = true
Config.CallBack('Polar-Paleto:paletodrill1', function(source, cb) cb(paletodrill1) end) 
local paletodrill2 = true
Config.CallBack('Polar-Paleto:paletodrill2', function(source, cb) cb(paletodrill2) end) 

local paletovault = true
Config.CallBack('Polar-Paleto:VaultCheck', function(source, cb)  cb(paletovault) end) 

RegisterNetEvent('Polar-Paleto:Server:StopInteract', function(door)
    if door == nil then return end
    if door == paletostartname then paletostart = false end
    if door == paletodoor1name then paletodoor1 = false end
    if door == paletodoor2name then paletodoor2 = false end
    if door == paletodoor3name then paletodoor3 = false end
    if door == paletodoorcard1name then paletodoorcard1 = false end
    if door == paletodoorcard2name then paletodoorcard2 = false end
    if door == Config.Pc1name then paletopc1 = false end
    if door == Config.Pc2name then paletopc2 = false end
    if door == Config.Pc3name then paletopc3 = false end

    if door == 'paletodrill1' then paletodrill1 = false end
    if door == 'paletodrill2' then paletodrill2 = false end

    if door == 'paletovault' then paletovault = false end
end)
RegisterNetEvent('Polar-Paleto:Server:StartInteract', function(door)
    if door == paletostartname then paletostart = true end
    if door == paletodoor1name then paletodoor1 = true end
    if door == paletodoor2name then paletodoor2 = true end
    if door == paletodoor3name then paletodoor3 = true end
    if door == paletodoorcard1name then paletodoorcard1 = true end
    if door == paletodoorcard2name then paletodoorcard2 = true end

    if door == Config.Pc1name then paletopc1 = true end
    if door == Config.Pc2name then paletopc2 = true end
    if door == Config.Pc3name then paletopc3 = true end

    if door == 'paletodrill1' then paletodrill1 = true end
    if door == 'paletodrill2' then paletodrill2 = true end

    if door == 'paletovault' then paletovault = true end
end)


Config.CallBack('Polar-Paleto:DoorCheckstart', function(source, cb) cb(paletostart) end) 

Config.CallBack('Polar-Paleto:Door' .. paletodoor1name, function(source, cb) cb(paletodoor1) end) 
Config.CallBack('Polar-Paleto:Door' .. paletodoor2name, function(source, cb)  cb(paletodoor2) end) 
Config.CallBack('Polar-Paleto:Door' .. paletodoor3name, function(source, cb) cb(paletodoor3) end) 
Config.CallBack('Polar-Paleto:Door' .. Config.Pc1name, function(source, cb) cb(paletopc1) end) 
Config.CallBack('Polar-Paleto:Door' .. Config.Pc2name, function(source, cb)  cb(paletopc2) end) 
Config.CallBack('Polar-Paleto:Door' .. Config.Pc3name, function(source, cb) cb(paletopc3) end) 
Config.CallBack('Polar-Paleto:Door' .. paletodoorcard1name, function(source, cb) cb(paletodoorcard1) end) 
Config.CallBack('Polar-Paleto:Door' .. paletodoorcard2name, function(source, cb)  cb(paletodoorcard2) end) 

local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-Paleto:Server:StartCooldown', function(door) SetTimeout(time, function() reset() end) end)


function reset()
    paletostart = true
    paletodoor1 = false
    paletodoor2 = false
    paletodoor3 = false
    paletodoorcard1 = false
    paletodoorcard2 = false

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


RegisterNetEvent('Polar-Paleto:Server:LockDown', function()
    paletostart = false
    paletodoor1 = false
    paletodoor2 = false
    paletodoor3 = false

    paletopc1 = false
    paletopc2 = false
    paletopc3 = false

    paletodrill1 = false
    paletodrill1 = false

    paletovault = false
end)
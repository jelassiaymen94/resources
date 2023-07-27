if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
local oxinv = Config.OxIventory
RegisterNetEvent('Polar-BobCat:Server:VaultClose', function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 2 Minutes", 'error') SetTimeout(60000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 1 Minutes", 'error') SetTimeout(30000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 30 Seconds", 'error') SetTimeout(20000, function() TriggerClientEvent('QBCore:Notify', -1, "Vault Closes in 10 Seconds", 'error') SetTimeout(10000, function() TriggerClientEvent('Polar-BobCat:Client:Vault', -1, false) end) end) end) end) end)


RegisterNetEvent('Polar-BobCat:Server:RemoveItem', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, amount) 
    if oxinv then
        exports.ox_inventory:RemoveItem(src, QBCore.Shared.Items[item], amount)
    else
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount) 
    end
end)

RegisterNetEvent('Polar-BobCat:Server:RemoveItems', function(item, amount) 
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

RegisterNetEvent('Polar-BobCat:Doorlock', function(doorid, id)
    local door = exports.ox_doorlock:getDoorFromName(doorid)
    TriggerEvent('ox_doorlock:setState', door.id, id)

end)


local BobCatstartname = 'BobCatstart'
local BobCatdoor1name = 'BobCatdoor1'
local BobCatdoor2name = 'BobCatdoor2'
local BobCatdoor3name = 'BobCatdoor3'
local BobCatdoorcard1name = 'BobCatdoorcard1'
local BobCatdoorcard2name = 'BobCatdoorcard2'




local BobCatpc1 = true
local BobCatpc2 = true
local BobCatpc3 = true


local BobCatstart = true 
local BobCatdoor1 = false
local BobCatdoor2 = false
local BobCatdoor3 = false
local BobCatdoorcard1 = false
local BobCatdoorcard2 = false



local BobCatprop1 = false
Config.CallBack('Polar-BobCat:BobCatprop1', function(source, cb) cb(BobCatprop1) end) 
local BobCatprop2 = false
Config.CallBack('Polar-BobCat:BobCatprop2', function(source, cb) cb(BobCatprop2) end) 
local BobCatprop3 = false
Config.CallBack('Polar-BobCat:BobCatprop3', function(source, cb) cb(BobCatprop3) end) 
local BobCatprop4 = false
Config.CallBack('Polar-BobCat:BobCatprop4', function(source, cb) cb(BobCatprop4) end) 
local BobCatprop5 = false
Config.CallBack('Polar-BobCat:BobCatprop5', function(source, cb) cb(BobCatprop5) end) 

local BobCatprop6 = false
Config.CallBack('Polar-BobCat:BobCatprop6', function(source, cb) cb(BobCatprop6) end) 
local BobCatprop7 = false
Config.CallBack('Polar-BobCat:BobCatprop7', function(source, cb) cb(BobCatprop7) end) 
local BobCatprop8 = false
Config.CallBack('Polar-BobCat:BobCatprop8', function(source, cb) cb(BobCatprop8) end) 
local BobCatprop9 = false
Config.CallBack('Polar-BobCat:BobCatprop9', function(source, cb) cb(BobCatprop9) end) 
local BobCatprop10 = false
Config.CallBack('Polar-BobCat:BobCatprop10', function(source, cb) cb(BobCatprop10) end) 

local BobCatprop11 = false
Config.CallBack('Polar-BobCat:BobCatprop11', function(source, cb) cb(BobCatprop11) end) 
local BobCatprop12 = false
Config.CallBack('Polar-BobCat:BobCatprop12', function(source, cb) cb(BobCatprop12) end) 
local BobCatprop13 = false
Config.CallBack('Polar-BobCat:BobCatprop13', function(source, cb) cb(BobCatprop13) end) 
local BobCatprop14 = false
Config.CallBack('Polar-BobCat:BobCatprop14', function(source, cb) cb(BobCatprop14) end) 
local BobCatprop15 = false
Config.CallBack('Polar-BobCat:BobCatprop15', function(source, cb) cb(BobCatprop15) end) 

local BobCatprop16 = false
Config.CallBack('Polar-BobCat:BobCatprop16', function(source, cb) cb(BobCatprop16) end) 
local BobCatprop17 = false
Config.CallBack('Polar-BobCat:BobCatprop17', function(source, cb) cb(BobCatprop17) end) 
local BobCatprop18 = false
Config.CallBack('Polar-BobCat:BobCatprop18', function(source, cb) cb(BobCatprop18) end) 
local BobCatprop19 = false
Config.CallBack('Polar-BobCat:BobCatprop19', function(source, cb) cb(BobCatprop19) end) 
local BobCatprop20 = false
Config.CallBack('Polar-BobCat:BobCatprop20', function(source, cb) cb(BobCatprop20) end) 

local BobCatprop21 = false
Config.CallBack('Polar-BobCat:BobCatprop21', function(source, cb) cb(BobCatprop21) end) 
local BobCatprop22 = false
Config.CallBack('Polar-BobCat:BobCatprop22', function(source, cb) cb(BobCatprop22) end) 
local BobCatprop23 = false
Config.CallBack('Polar-BobCat:BobCatprop23', function(source, cb) cb(BobCatprop23) end) 
local BobCatprop24 = false
Config.CallBack('Polar-BobCat:BobCatprop24', function(source, cb) cb(BobCatprop24) end) 
local BobCatprop25 = false
Config.CallBack('Polar-BobCat:BobCatprop25', function(source, cb) cb(BobCatprop25) end) 

local BobCatprop26 = false
Config.CallBack('Polar-BobCat:BobCatprop26', function(source, cb) cb(BobCatprop26) end) 
local BobCatprop27 = false
Config.CallBack('Polar-BobCat:BobCatprop27', function(source, cb) cb(BobCatprop27) end) 
local BobCatprop28 = false
Config.CallBack('Polar-BobCat:BobCatprop28', function(source, cb) cb(BobCatprop28) end) 
local BobCatprop29 = false
Config.CallBack('Polar-BobCat:BobCatprop29', function(source, cb) cb(BobCatprop29) end) 
local BobCatprop30 = false
Config.CallBack('Polar-BobCat:BobCatprop30', function(source, cb) cb(BobCatprop30) end) 

local BobCatprop31 = false
Config.CallBack('Polar-BobCat:BobCatprop31', function(source, cb) cb(BobCatprop31) end) 
local BobCatprop32 = false
Config.CallBack('Polar-BobCat:BobCatprop32', function(source, cb) cb(BobCatprop32) end) 
local BobCatprop33 = false
Config.CallBack('Polar-BobCat:BobCatprop33', function(source, cb) cb(BobCatprop33) end) 
local BobCatprop34 = false
Config.CallBack('Polar-BobCat:BobCatprop34', function(source, cb) cb(BobCatprop34) end) 
local BobCatprop35 = false
Config.CallBack('Polar-BobCat:BobCatprop35', function(source, cb) cb(BobCatprop35) end) 

local BobCatprop36 = false
Config.CallBack('Polar-BobCat:BobCatprop36', function(source, cb) cb(BobCatprop36) end) 
local BobCatprop37 = false
Config.CallBack('Polar-BobCat:BobCatprop37', function(source, cb) cb(BobCatprop37) end) 
local BobCatprop38 = false
Config.CallBack('Polar-BobCat:BobCatprop38', function(source, cb) cb(BobCatprop38) end) 
local BobCatprop39 = false
Config.CallBack('Polar-BobCat:BobCatprop39', function(source, cb) cb(BobCatprop39) end) 
local BobCatprop40 = false
Config.CallBack('Polar-BobCat:BobCatprop40', function(source, cb) cb(BobCatprop40) end) 

local BobCatdrill1 = true
Config.CallBack('Polar-BobCat:BobCatdrill1', function(source, cb) cb(BobCatdrill1) end) 
local BobCatdrill2 = true
Config.CallBack('Polar-BobCat:BobCatdrill2', function(source, cb) cb(BobCatdrill2) end) 

local BobCatvault = true
Config.CallBack('Polar-BobCat:VaultCheck', function(source, cb)  cb(BobCatvault) end) 

RegisterNetEvent('Polar-BobCat:Server:StopInteract', function(door)
    if door == BobCatstartname then BobCatstart = false end
    if door == BobCatdoor1name then BobCatdoor1 = false end
    if door == BobCatdoor2name then BobCatdoor2 = false end
    if door == BobCatdoor3name then BobCatdoor3 = false end
    if door == BobCatdoorcard1name then BobCatdoorcard1 = false end
    if door == BobCatdoorcard2name then BobCatdoorcard2 = false end

    if door == 'BobCatprop1' then BobCatprop1 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop2' then BobCatprop2 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop3' then BobCatprop3 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop4' then BobCatprop4 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop5' then BobCatprop5 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
   
    if door == 'BobCatprop6' then BobCatprop6 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop7' then BobCatprop7 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop8' then BobCatprop8 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop9' then BobCatprop9 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop10' then BobCatprop10 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatprop11' then BobCatprop11 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop12' then BobCatprop12 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop13' then BobCatprop13 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop14' then BobCatprop14 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop15' then BobCatprop15 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatprop16' then BobCatprop16 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop17' then BobCatprop17 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop18' then BobCatprop18 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop19' then BobCatprop19 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop20' then BobCatprop20 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatprop21' then BobCatprop21 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop22' then BobCatprop22 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop23' then BobCatprop23 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop24' then BobCatprop24 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop25' then BobCatprop25 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
   
    if door == 'BobCatprop26' then BobCatprop26 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop27' then BobCatprop27 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop28' then BobCatprop28 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop29' then BobCatprop29 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop30' then BobCatprop30 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatprop31' then BobCatprop31 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop32' then BobCatprop32 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop33' then BobCatprop33 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop34' then BobCatprop34 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop35' then BobCatprop35 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatprop36' then BobCatprop36 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop37' then BobCatprop37 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop38' then BobCatprop38 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop39' then BobCatprop39 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatprop40' then BobCatprop40 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatpc1' then BobCatpc1 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatpc2' then BobCatpc2 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatpc3' then BobCatpc3 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatdrill1' then BobCatdrill1 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
    if door == 'BobCatdrill2' then BobCatdrill2 = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end

    if door == 'BobCatvault' then BobCatvault = false TriggerClientEvent('Polar-BobCat:Client:TargetRemove', -1, door) end
end)
RegisterNetEvent('Polar-BobCat:Server:StartInteract', function(door)
    if door == BobCatstartname then BobCatstart = true end
    if door == BobCatdoor1name then BobCatdoor1 = true end
    if door == BobCatdoor2name then BobCatdoor2 = true end
    if door == BobCatdoor3name then BobCatdoor3 = true end
    if door == BobCatdoorcard1name then BobCatdoorcard1 = true end
    if door == BobCatdoorcard2name then BobCatdoorcard2 = true end

    if door == 'BobCatprop1' then BobCatprop1 = true end
    if door == 'BobCatprop2' then BobCatprop2 = true end
    if door == 'BobCatprop3' then BobCatprop3 = true end
    if door == 'BobCatprop4' then BobCatprop4 = true end
    if door == 'BobCatprop5' then BobCatprop5 = true end

    if door == 'BobCatprop6' then BobCatprop6 = true end
    if door == 'BobCatprop7' then BobCatprop7 = true end
    if door == 'BobCatprop8' then BobCatprop8 = true end
    if door == 'BobCatprop9' then BobCatprop9 = true end
    if door == 'BobCatprop10' then BobCatprop10 = true end

    if door == 'BobCatprop11' then BobCatprop11 = true end
    if door == 'BobCatprop12' then BobCatprop12 = true end
    if door == 'BobCatprop13' then BobCatprop13 = true end
    if door == 'BobCatprop14' then BobCatprop14 = true end
    if door == 'BobCatprop15' then BobCatprop15 = true end

    if door == 'BobCatprop16' then BobCatprop16 = true end
    if door == 'BobCatprop17' then BobCatprop17 = true end
    if door == 'BobCatprop18' then BobCatprop18 = true end
    if door == 'BobCatprop19' then BobCatprop19 = true end
    if door == 'BobCatprop20' then BobCatprop20 = true end

    if door == 'BobCatprop21' then BobCatprop21 = true end
    if door == 'BobCatprop22' then BobCatprop22 = true end
    if door == 'BobCatprop23' then BobCatprop23 = true end
    if door == 'BobCatprop24' then BobCatprop24 = true end
    if door == 'BobCatprop25' then BobCatprop25 = true end
   
    if door == 'BobCatprop26' then BobCatprop26 = true end
    if door == 'BobCatprop27' then BobCatprop27 = true end
    if door == 'BobCatprop28' then BobCatprop28 = true end
    if door == 'BobCatprop29' then BobCatprop29 = true end
    if door == 'BobCatprop30' then BobCatprop30 = true end

    if door == 'BobCatprop31' then BobCatprop31 = true end
    if door == 'BobCatprop32' then BobCatprop32 = true end
    if door == 'BobCatprop33' then BobCatprop33 = true end
    if door == 'BobCatprop34' then BobCatprop34 = true end
    if door == 'BobCatprop35' then BobCatprop35 = true end

    if door == 'BobCatprop36' then BobCatprop36 = true end
    if door == 'BobCatprop37' then BobCatprop37 = true end
    if door == 'BobCatprop38' then BobCatprop38 = true end
    if door == 'BobCatprop39' then BobCatprop39 = true end
    if door == 'BobCatprop40' then BobCatprop40 = true end

    if door == 'BobCatpc1' then BobCatpc1 = true end
    if door == 'BobCatpc2' then BobCatpc2 = true end
    if door == 'BobCatpc3' then BobCatpc3 = true end

    if door == 'BobCatdrill1' then BobCatdrill1 = true end
    if door == 'BobCatdrill2' then BobCatdrill2 = true end

    if door == 'BobCatvault' then BobCatvault = true end
end)


Config.CallBack('Polar-BobCat:DoorCheckstart', function(source, cb) cb(BobCatstart) end) 

Config.CallBack('Polar-BobCat:Door1', function(source, cb) cb(BobCatdoor1) end) 

Config.CallBack('Polar-BobCat:Door2', function(source, cb)  cb(BobCatdoor2) end) 

Config.CallBack('Polar-BobCat:Door3', function(source, cb) cb(BobCatdoor3) end) 

Config.CallBack('Polar-BobCat:Doorcard1', function(source, cb) cb(BobCatdoorcard1) end) 

Config.CallBack('Polar-BobCat:Doorcard2', function(source, cb)  cb(BobCatdoorcard2) end) 

local time = (Config.CooldownTime * 60000) RegisterNetEvent('Polar-BobCat:Server:StartCooldown', function(door) SetTimeout(time, function() reset() end) end)


function reset()
    BobCatstart = true
    BobCatdoor1 = false
    BobCatdoor2 = false
    BobCatdoor3 = false
    BobCatdoorcard1 = false
    BobCatdoorcard2 = false

    BobCatprop1 = false
    BobCatprop2 = false
    BobCatprop3 = false
    BobCatprop4 = false
    BobCatprop5 = false

    BobCatprop6 = false
    BobCatprop7 = false
    BobCatprop8 = false
    BobCatprop9 = false
    BobCatprop10 = false

    BobCatprop11 = false
    BobCatprop12 = false
    BobCatprop13 = false
    BobCatprop14 = false
    BobCatprop15 = false

    BobCatprop16 = false
    BobCatprop17 = false
    BobCatprop18 = false
    BobCatprop19 = false
    BobCatprop20 = false

    BobCatprop21 = false
    BobCatprop22 = false
    BobCatprop23 = false
    BobCatprop24 = false
    BobCatprop25 = false

    BobCatprop26 = false
    BobCatprop27 = false
    BobCatprop28 = false
    BobCatprop29 = false
    BobCatprop30 = false

    BobCatprop31 = false
    BobCatprop32 = false
    BobCatprop33 = false
    BobCatprop34 = false
    BobCatprop35 = false

    BobCatprop36 = false
    BobCatprop37 = false
    BobCatprop38 = false
    BobCatprop39 = false
    BobCatprop40 = false

    BobCatpc1 = true
    BobCatpc2 = true
    BobCatpc3 = true

    BobCatdrill1 = true
    BobCatdrill1 = true

    BobCatvault = true

    TriggerClientEvent('Polar-BobCat:Client:ResetProps', -1)

    TriggerClientEvent('Polar-BobCat:Client:ResetDoors', -1)

    TriggerClientEvent('Polar-BobCat:Client:ResetPropsKeypads', -1)
    
end





RegisterServerEvent('Polar-BobCat:Server:UpdateInterior', function(what)
    TriggerClientEvent('Polar-BobCat:Client:UpdateInterior', -1, what)
end)
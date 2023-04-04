local QBCore = exports['qb-core']:GetCoreObject()

local dest = Config.DropLocations[math.random(1, #Config.DropLocations )]
local planepos = Config.PlaneStarts[math.random(1, #Config.PlaneStarts )]
local dropped1 = false
local dropped2 = false
local dropped3 = false
local dropped4 = false
local dropped5 = false
local dropped6 = false
local dropped7 = false
local dropped8 = false
--[[CreateThread(function()
   -- while true do
        Wait(1000)
    --    if not dropped then
    --        if math.random(1,1000) < 500 then
           -- dropped = true

           
            TriggerClientEvent('Polar-Sub:Client:StartDrop', -1, planepos, dest)
    --    end
    --    end
   -- end
end)]]

RegisterNetEvent('Polar-Sub:Server:Crate1', function()
    if not dropped1 then
        dropped1 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate2', function()
    if not dropped2 then
        dropped2 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate3', function()
    if not dropped3 then
        dropped3 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate4', function()
    if not dropped4 then
        dropped4 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate5', function()
    if not dropped5 then
        dropped5 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate6', function()
    if not dropped6 then
        dropped6 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate7', function()
    if not dropped7 then
        dropped7 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 
RegisterNetEvent('Polar-Sub:Server:Crate8', function()
    if not dropped8 then
        dropped8 = true
        local amount = math.random(1,1)
        local Player = QBCore.Functions.GetPlayer(source)
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    else TriggerClientEvent('QBCore:Notify', source, "This Crate Was Looted Already", 'error') end
end) 

QBCore.Functions.CreateUseableItem("airdrop", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meth'], "remove", 1)
            TriggerClientEvent('Polar-Sub:Client:StartDrop', source, planepos, dest)
          





        end
    
end)










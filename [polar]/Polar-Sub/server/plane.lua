local QBCore = exports['qb-core']:GetCoreObject()

local dest = Config.DropLocations[math.random(1, #Config.DropLocations )]
local planepos = Config.PlaneStarts[math.random(1, #Config.PlaneStarts )]
local dropped = false
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
RegisterNetEvent('Polar-Sub:Server:Crate', function()
    if not dropped then
        dropped = true
        local amount = math.random(1,1)

        local Player = QBCore.Functions.GetPlayer(source)
    
        local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    
       -- local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    
       -- local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    
       -- local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
    
       -- local item = Config.AirDropItems[math.random(1, #Config.AirDropItems )] if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add',  amount) end
        
    else


    end
  
end) 




local Airplanes = {}
local drop = GetHashKey('cargoplane')

QBCore.Functions.CreateUseableItem("meth", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meth'], "remove", 1)
            TriggerClientEvent('Polar-Sub:Client:StartDrop', source, planepos, dest)
      


        end
    
end)







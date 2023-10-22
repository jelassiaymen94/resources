local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-HouseRobbery:Server:RemoveTarget', function(name)   TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, name)    end)
RegisterNetEvent('Polar-HouseRobbery:Server:CreateTarget', function(name, loc)   TriggerClientEvent('Polar-HouseRobbery:Client:CreateTarget', -1, name, loc)    end)


local cooldown = true
QBCore.Functions.CreateCallback("Polar-HouseRobbery:Server:Cooldown", function(source, cb)
    cb('1')
end)

local time = (Config.CooldownTime * 60000) 
RegisterNetEvent('Polar-stores:Server:StartCooldown', function()
    cooldown = false
    exports["Polar-Wade"]:House(true) 
    SetTimeout(time, function() 
        reset() 
        exports["Polar-Wade"]:House(false) 
    end) 
end)

function reset()
    cooldown = true

    
end






RegisterNetEvent("robbery:loot")
AddEventHandler("robbery:loot", function()
    local src = source
    local winNumber = math.random( 0, 100)
    if winNumber >= 30 then
      
        addNormal(src)

    elseif winNumber < 30 and winNumber > 2 then
      
        addRare(src)
    else
      
        addVeryRare(src)
    end
end)

function addNormal(src)
    TriggerClientEvent('QBCore:Notify', src, 'Normal item found!', 'success')
  
    local item = Config.Items.normalItems[math.random(#Config.Items.normalItems)]
   
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
end

function addRare(src)
    TriggerClientEvent('QBCore:Notify', src, 'Rare item found!', 'success')
   
    local item = Config.Items.rareItems[math.random(#Config.Items.rareItems)]
   
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
end

function addVeryRare(src)
    TriggerClientEvent('QBCore:Notify', src, 'Very Rare item found!', 'success')
  
    local item = Config.Items.veryRareItems[math.random(#Config.Items.veryRareItems)]
   
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
end

RegisterServerEvent('Polar-HouseRobbery:server:takeitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    Player.Functions.RemoveItem(Config.PickItem, 1)
end)

RegisterServerEvent('Polar-HouseRobbery:server:takeitem2', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    Player.Functions.RemoveItem(Config.StartItem, 1)
end)
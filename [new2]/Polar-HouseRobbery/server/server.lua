local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-HouseRobbery:Server:RemoveTarget', function(name)   TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, name)    end)
RegisterNetEvent('Polar-HouseRobbery:Server:CreateTarget', function(name, loc)   TriggerClientEvent('Polar-HouseRobbery:Client:CreateTarget', -1, name, loc)    end)


local cooldown = true
QBCore.Functions.CreateCallback("Polar-HouseRobbery:Server:Cooldown", function(source, cb)
    cb('1')
end)

local time = (15 * 60000) 
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






RegisterNetEvent("Polar-HouseRobbery:Server:FindShit", function(house)
    if house == nil then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local winNumber = math.random( 0, 100)
    if winNumber >= 30 then
        TriggerClientEvent('QBCore:Notify', src, 'Normal item found!', 'success')
        local item = Config.Items.normalItems[math.random(#Config.Items.normalItems)]
        Player.Functions.AddItem(item, 1)

    elseif winNumber < 30 and winNumber > 2 then
        TriggerClientEvent('QBCore:Notify', src, 'Rare item found!', 'success')
        local item = Config.Items.rareItems[math.random(#Config.Items.rareItems)]
        Player.Functions.AddItem(item, 1)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Very Rare item found!', 'success')
        local item = Config.Items.veryRareItems[math.random(#Config.Items.veryRareItems)]
        Player.Functions.AddItem(item, 1)
    end
end)






RegisterServerEvent('Polar-HouseRobbery:Server:Removeitem', function(item)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    if math.random(1,100) < 50 then Player.Functions.RemoveItem(item, 1)  end
end)
RegisterServerEvent('Polar-HouseRobbery:Server:RemoveitemF', function(item)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1)
end)
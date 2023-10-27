local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-HouseRobbery:Server:RemoveTarget', function(name)   TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, name)    end)
RegisterNetEvent('Polar-HouseRobbery:Server:CreateTarget', function(name, loc)   TriggerClientEvent('Polar-HouseRobbery:Client:CreateTarget', -1, name, loc)    end)

RegisterNetEvent('Polar-HouseRobbery:Server:RemoveProp', function(door) TriggerClientEvent('Polar-HouseRobbery:Client:RemoveProp', -1, door)   end)
RegisterNetEvent('Polar-HouseRobbery:Server:StartTargets', function(house)   TriggerClientEvent('Polar-HouseRobbery:Client:StartTargets', -1, house)  TriggerClientEvent('Polar-HouseRobbery:Client:StartLoot', source, house)      end)

RegisterNetEvent('Polar-HouseRobbery:Server:Reset', function() reset() end)

local cooldown = true
local open = false
QBCore.Functions.CreateCallback("Polar-HouseRobbery:Server:Cooldown", function(source, cb)  cb(cooldown) end)
QBCore.Functions.CreateCallback("Polar-HouseRobbery:Server:HouseOpen", function(source, cb) cb(open) end)


RegisterNetEvent('Polar-HouseRobbery:Server:StartHouseOpen', function(house) open = true end)

local time = (15 * 60000) 
RegisterNetEvent('Polar-HouseRobbery:Server:StartCooldown', function()
    cooldown = false
    exports["Polar-Wade"]:House(true) 
    SetTimeout(time, function() 
        reset() 
        exports["Polar-Wade"]:House(false) 
    end) 
end)

function reset()
    cooldown = true
    open = false

    TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, 'polar_hr_entry')
    TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, 'polar_hr_exit')

    TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, 'polar_hr_1')
    TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, 'polar_hr_2')
    TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, 'polar_hr_3')
    TriggerClientEvent('Polar-HouseRobbery:Client:RemoveTarget', -1, 'polar_hr_4')
    
    TriggerClientEvent('Polar-HouseRobbery:Client:ResetProps', -1)
end






RegisterNetEvent("Polar-HouseRobbery:Server:FindShit", function(house, times)
    if house == nil then return end
    for i = 1, times do
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local winNumber = math.random(1, 100)
        if winNumber <= 80 then
            local item = Config.Cash[math.random(1, #Config.Cash)]
            Player.Functions.AddItem(item, 1)
        elseif winNumber <= 95 then
            local item = Config.Gold[math.random(1, #Config.Gold)]
            Player.Functions.AddItem(item, 1)
        else
            local item = Config.Special[math.random(1, #Config.Special)]
            Player.Functions.AddItem(item, 1)
        end
    Wait(250)
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
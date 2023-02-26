local QBCore = exports['qb-core']:GetCoreObject()
local full = false
QBCore.Functions.CreateCallback("Polar-Sub:Server:MIssionCheck", function(source, cb)
    cb(full)
end)
RegisterNetEvent('Polar-Sub:Server:getMoneyamount', function(typeas, amounts)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if typeas == 'cash' then amount = Player.Functions.GetMoney('cash')
    elseif typeas == 'bank' then amount = Player.Functions.GetMoney('bank')
    else amount = exports['qb-phone']:hasEnough(src, typeas, amounts)
    end
    if amount >= amounts then
        TriggerClientEvent('Polar-Sub:Client:StartupS')
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have " .. amounts .. " " .. typeas .. " ", 'error', 3500)
    end
end)
RegisterNetEvent('Polar-Sub:Server:MissionFull', function()
   full = true
   SetTimeout(480000, function()
        full = false
   end)
end)
RegisterNetEvent('Polar-Sub:Server:MissionEmpty', function()
    full = false
end)




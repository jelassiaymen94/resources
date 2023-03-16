
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("Polar-Weed:Server:addLowGradeMarijuana", function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
    local seedamount = math.random(1, 2)
	if (10 >= math.random(1, 100)) then
        if Player.Functions.AddItem("weed_seeds", seedamount, nil, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_seeds"], "add", seedamount)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
	end
    if Player.Functions.AddItem('croplow', quantity, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["croplow"], "add", quantity)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
    end
end)

RegisterServerEvent('Polar-Weed:Server:addMidGradeMarijuana', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
    local seedamount = math.random(1, 2)
	if (25 >= math.random(1, 100)) then
        if Player.Functions.AddItem("weed_seeds", seedamount, nil, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_seeds"], "add", 1)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
	end
    if Player.Functions.AddItem('cropmid', quantity, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cropmid"], "add", quantity)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
    end
end)

RegisterNetEvent("Polar-Weed:Server:addHighGradeMarijuana",function(seed, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
   -- local amount = 3 * tonumber(info.stage) / 100
   -- amount = math.floor(amount + 0.5)
   -- if info.stage < 20 then
   --     amount = 0
   -- end
    local quantity = math.random(1, 2)
    local seedamount = math.random(1, 2)
    if (50 >= math.random(1, 100)) then
        Player.Functions.AddItem('weed_seeds', seedamount, nil, {["quality"] = 100}) 
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_seeds'], "add", 1) 
    end
    if Player.Functions.AddItem('crophigh', quantity, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["crophigh"], "add", quantity)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
    end 
end)

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("Polar-Sub:Server:GetCars", function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', { plate }, function(result)
        if result[1] then cb(true)
        else cb(false) end
	end)
end)

RegisterNetEvent('Polar-Sub:Server:Sell', function(money, vehicle, plate)
    local plates = plate
    local car = vehicle
    local dealership = 'cardealer'
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= dealership then return end
   -- if Player.PlayerData.job.grade.level < Shared.Dealerships[dealership].bossMenuThreshold then return end
    
    
   
   
    local result = exports['qb-management']:GetAccount(dealership)
    local bank = math.floor(result)

        if car == GetHashKey('r32') then
            model = 'r32'
            amount = 1000000
        elseif car == GetHashKey('gtr') then
            model = 'gtr'
            amount = 700000
        elseif car == GetHashKey('rmodgt63') then
            model = 'rmodgt63'
            amount = 500000
        elseif car == GetHashKey('rr14') then
            model = 'rr14'
            amount = 100000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
        elseif car == GetHashKey('adder') then
            model = 'adder'
            amount = 5000
            
        end
    
    if model == nil then return end
    if bank >= amount then
        -- Add to stock orders
        MySQL.insert('INSERT INTO dealerships_orders (dealership, vehicle) VALUES (?, ?)', {'cardealer', model})
        MySQL.update('DELETE FROM player_vehicles WHERE plate = ?', {plates})
        -- Remove money from dealership
        exports['qb-management']:RemoveMoney(dealership, amount)
        Player.Functions.AddMoney('cash', amount)
        -- Log
       -- TriggerEvent("qb-log:server:CreateLog", "importstock", "Order "..dealership, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Ordered a "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"].." for **"..price.."**")
        if Shared.Debug then
            print("^3[qb-dealerships] ^5"..Player.PlayerData.name.." ordered "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"].." for "..price.." ("..dealership..")".."^7")
        end
    else 

    end
    
   
end)

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("Polar-Dealership:Server:GetCars", function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', { plate }, function(result)
        if result[1] then cb(true)
        else cb(false) end
	end)
end)

RegisterNetEvent('Polar-Dealership:Server:Sell', function(money, vehicle, plate)
    local plates = plate
    local car = vehicle
    local dealership = 'cardealer'
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= dealership then return end
   -- if Player.PlayerData.job.grade.level < Config.Dealership[dealership].bossMenuThreshold then return end
    
    
   
   
    local result = exports['qb-management']:GetAccount(dealership)
    local bank = math.floor(result)

        if car == GetHashKey('r32') then
            model = 'r32'
            amount = 875000
        elseif car == GetHashKey('gtr') then
            model = 'gtr'
            amount = 525000
        elseif car == GetHashKey('rmodgt63') then
            model = 'rmodgt63'
            amount = 875000
        elseif car == GetHashKey('rr14') then
            model = 'rr14'
            amount = 315000
        elseif car == GetHashKey('mgt') then
            model = 'mgt'
            amount = 291200
        elseif car == GetHashKey('subwrx') then
            model = 'subwrx'
            amount = 273700
        elseif car == GetHashKey('evo9') then
            model = 'evo9'
            amount = 233100
        elseif car == GetHashKey('lc100') then
            model = 'lc100'
            amount = 192500
        elseif car == GetHashKey('488misha') then
            model = '488misha'
            amount = 525000
        elseif car == GetHashKey('fnfrx7') then
            model = 'fnfrx7'
            amount = 385000
        elseif car == GetHashKey('bt62r') then
            model = 'bt62r'
            amount = 1190000
        elseif car == GetHashKey('r8h') then
            model = 'r8h'
            amount = 770000
        elseif car == GetHashKey('audirs6tk') then
            model = 'audirs6tk'
            amount = 350000
        elseif car == GetHashKey('m4') then
            model = 'm4'
            amount = 525000
        elseif car == GetHashKey('trhawk') then
            model = 'trhawk'
            amount = 280000
        elseif car == GetHashKey('s15rb') then
            model = 's15rb'
            amount = 396200
            
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
       -- TriggerEvent("qb-log:Server:CreateLog", "importstock", "Order "..dealership, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Ordered a "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"].." for **"..price.."**")
        if Config.Debug then
            print("^3[qb-dealerships] ^5"..Player.PlayerData.name.." ordered "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"].." for "..price.." ("..dealership..")".."^7")
        end
    else 

    end
    
   
end)

RegisterNetEvent('Polar-Dealership:Server:StoreCar', function(vehicle)
    local car = vehicle
    local dealership = 'cardealer'
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= dealership then return end
 


    if car == nil then return end
  
    MySQL.insert('INSERT INTO dealerships_orders (dealership, vehicle) VALUES (?, ?)', {'cardealer', car})
      
       
    
   
end)
local QBCore = exports['qb-core']:GetCoreObject()

local GeneratePlate = function()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

CheckOrders = function()
    MySQL.Async.fetchAll('SELECT * FROM dealerships_orders WHERE deliverydate <= date(NOW())', {}, function(result)
        for i=1, #result do
            -- ADD TO STOCK
            MySQL.update('UPDATE dealerships_stock SET stock = stock + 1 WHERE vehicle = ? AND dealership = ?', {result[i].vehicle, result[i].dealership})
            -- DELETE FROM ORDERS
            MySQL.query('DELETE FROM dealerships_orders WHERE id = ?', {result[i].id})
        end
        if #result > 0 and Config.Debug then
            print("^3[Polar-Dealership] ^5"..#result.." vehicles added to stock^7")
        end
    end)
    SetTimeout(60*60*1000, CheckOrders) -- 60 min interval
end

RegisterServerEvent('Polar-Dealership:server:withdrawBank', function(amount, society)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= society then return end
    if Player.PlayerData.job.grade.level < Config.Dealership[society].moneyMenuThreshold then return end

    local job = Player.PlayerData.job.name
    if job == society then
        local result = exports['qb-management']:GetAccount(job)
        local bank = math.floor(result)
        if amount <= bank then
            -- Give bank money
            Player.Functions.AddMoney('bank', amount, "dealership bank")

            -- Update cached
            exports['qb-management']:RemoveMoney(job, amount)
            local newBalance = exports['qb-management']:GetAccount(job)

            -- Notify client
            TriggerClientEvent('QBCore:Notify', src, "You withdrew "..amount, "success", 2500)

            -- Log
            TriggerEvent("qb-log:server:CreateLog", "importmoney", "Withdraw "..society, "red", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Withdrew **" .. amount .. "**. New balance: "..newBalance)
            if Config.Debug then
                print("^3[Polar-Dealership] ^5"..Player.PlayerData.name.." withdrew "..amount..". New balance: "..newBalance.." ("..society..")".."^7")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "There is not enough money on the bank account.", "error", 2500)
        end
    end
end)

RegisterServerEvent('Polar-Dealership:server:depositBank', function(amount, society)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= society then return end
    if Player.PlayerData.job.grade.level < Config.Dealership[society].moneyMenuThreshold then return end

    local job = Player.PlayerData.job.name
    if job == society then
        local sourceBank = Player.PlayerData.money.bank
        if amount <= sourceBank then
            -- Take bank money
            Player.Functions.RemoveMoney('bank', amount, "dealership bank")

            -- Update cached
            exports['qb-management']:AddMoney(job, amount)
            local newBalance = exports['qb-management']:GetAccount(job)

            -- Notify client
            TriggerClientEvent('QBCore:Notify', src, "You deposited "..amount, "success", 2500)

            -- Log
            TriggerEvent("qb-log:server:CreateLog", "importmoney", "Deposit "..job, "green", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Deposited **" .. amount .. "**. New balance: "..newBalance)
            if Config.Debug then
                print("^3[Polar-Dealership] ^5"..Player.PlayerData.name.." deposit "..amount..". New balance: "..newBalance.." ("..society..")".."^7")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "There is not enough money on your bank account.", "error", 2500)
        end
    end
end)

RegisterNetEvent('Polar-Dealership:server:SetJob', function(citizenid, job, type)
    local src = source
    local sourcePlayer = QBCore.Functions.GetPlayer(src)
    if not sourcePlayer then return end
    if sourcePlayer.PlayerData.job.name ~= job then return end
    if sourcePlayer.PlayerData.job.grade.level < Config.Dealership[job].bossMenuThreshold then return end

    local job = sourcePlayer.PlayerData.job.name
    local citizenid = employee.citizenid
    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    if Player then -- Online
        if action == "promote" then
            if grade <= 4 then
                Player.Functions.SetJob(job, grade)
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully promoted "..employee.name, "success", 3500)
                TriggerEvent("qb-log:server:CreateLog", "importmoney", "Promoted "..job, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Has been promoted to "..job.." "..grade)
            else
                -- MAX GRADE
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You can't promote this person (Max Grade).", "error", 3500)
            end
        elseif action == "demote" then
            if grade >= 0 then
                Player.Functions.SetJob(job, grade)
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully demoted "..employee.name, "success", 3500)
                TriggerEvent("qb-log:server:CreateLog", "importmoney", "Demoted "..job, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Has been demoted to "..job.." "..grade)
            else
                -- LOWEST GRADE
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You can't demote this person (Min Grade).", "error", 3500)
            end
        elseif action == "fire" then
            Player.Functions.SetJob("unemployed", 0)
            TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully fired "..employee.name, "success", 3500)
            TriggerEvent("qb-log:server:CreateLog", "importmoney", "Fired "..job, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Has been fired from "..job)
        elseif action == "hire" then
            Player.Functions.SetJob(job, 0)
            TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully hired "..employee.name, "success", 3500)
            TriggerEvent("qb-log:server:CreateLog", "importmoney", "Hired "..job, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Has been hired for "..job)
        end
    else -- Offline
        if action == "promote" then
            if grade <= 4 then
                local jobInfo = QBCore.Shared.Jobs[job]
                local temp = {
                    name = job,
                    label = jobInfo.label,
                    onduty = true,
                    payment = jobInfo.grades[tostring(grade)].payment,
                    isboss = false,
                    grade = {
                        name = jobInfo.grades[tostring(grade)].name,
                        level = grade
                    }
                }
                MySQL.update('UPDATE players SET job = ? WHERE citizenid = ?', {json.encode(temp), citizenid})
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully promoted "..employee.name, "success", 3500)
                TriggerEvent("qb-log:server:CreateLog", "importmoney", "Offline Promoted "..job, "blue", "**"..employee.name.."** (citizenid: *"..citizenid.."*): Has been promoted to "..job.." "..grade)
            else
                -- MAX GRADE
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You can't promote this person (Max Grade).", "error", 3500)
            end
        elseif action == "demote" then
            if grade >= 0 then
                local jobInfo = QBCore.Shared.Jobs[job]
                local temp = {
                    name = job,
                    label = jobInfo.label,
                    onduty = true,
                    type = jobInfo.type,
                    payment = jobInfo.grades[tostring(grade)].payment,
                    isboss = false,
                    grade = {
                        name = jobInfo.grades[tostring(grade)].name,
                        level = grade
                    }
                }
                MySQL.update('UPDATE players SET job = ? WHERE citizenid = ?', {json.encode(temp), citizenid})
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully demoted "..employee.name, "success", 3500)
                TriggerEvent("qb-log:server:CreateLog", "importmoney", "Offline Demoted "..job, "blue", "**"..employee.name.."** (citizenid: *"..citizenid.."*): Has been demoted to "..job.." "..grade)
            else
                -- LOWEST GRADE
                TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You can't demote this person (Min Grade).", "error", 3500)
            end
        elseif action == "fire" then
            local jobInfo = QBCore.Shared.Jobs['unemployed']
            local temp = {
                name = 'unemployed',
                label = jobInfo.label,
                onduty = true,
                payment = jobInfo.grades['0'].payment,
                isboss = false,
                grade = {
                    name = jobInfo.grades['0'].name,
                    level = 0
                }
            }
            MySQL.update('UPDATE players SET job = ? WHERE citizenid = ?', {json.encode(temp), citizenid})
            TriggerClientEvent('QBCore:Notify', sourcePlayer.PlayerData.source, "You successfully fired "..employee.name, "success", 3500)
            TriggerEvent("qb-log:server:CreateLog", "importmoney", "Offline Fired "..job, "blue", "**"..employee.name.."** (citizenid: *"..citizenid.."*): Has been fired from "..job)
        end
    end
end)

RegisterNetEvent('Polar-Dealership:server:setOwner', function(vehmodel, hash, target, dealership)
    local src = source
    local buyer = QBCore.Functions.GetPlayer(target)
    if not buyer then return end
    local seller = QBCore.Functions.GetPlayer(src)
    if not seller then return end

    if dealership ~= seller.PlayerData.job.name then return end
    if not Config.Dealership[seller.PlayerData.job.name] then return end

    local stock = MySQL.scalar.await('SELECT stock FROM dealerships_stock WHERE vehicle = ? AND dealership = ?', {vehmodel, dealership})
    if stock > 0 then
        local newplate = GeneratePlate()
        TriggerClientEvent("vehiclekeys:client:SetOwner", target, newplate)
        TriggerClientEvent('Polar-Dealership:client:setOwner', src, newplate)
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            buyer.PlayerData.license,
            buyer.PlayerData.citizenid,
            vehmodel,
            hash,
            '{}',
            newplate,
            'pillboxgarage',
            0
        })
        -- UPDATE STOCK -1
        MySQL.update('UPDATE dealerships_stock SET stock = stock - 1 WHERE vehicle = ? AND dealership = ?', {vehmodel, dealership})

        -- LOG
        if Config.Debug then
            print("^3[Polar-Dealership] ^5"..seller.PlayerData.name.." sold "..QBCore.Shared.Vehicles[vehmodel]["brand"].." "..QBCore.Shared.Vehicles[vehmodel]["name"].." to "..buyer.PlayerData.name.." ("..dealership..")".."^7")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Vehicle not in stock.", "error", 2500)
    end
end)

QBCore.Functions.CreateCallback('Polar-Dealership:server:getStockPrice', function(source, cb, dealership)
    local stock = MySQL.query.await('SELECT * FROM dealerships_stock WHERE dealership = ?', {dealership})
    cb(stock)
end)

QBCore.Functions.CreateCallback('Polar-Dealership:server:GetDealershipData', function(source, cb, dealership)
    -- Bank
    local balance = exports['qb-management']:GetAccount(dealership)

    -- Employees
    local employees = {}
    local players = MySQL.query.await("SELECT * FROM `players` WHERE `job` LIKE '%"..dealership.."%'", {})
    for k, v in pairs(players) do
        local isOnline = QBCore.Functions.GetPlayerByCitizenId(v.citizenid)
        if isOnline then
            employees[#employees+1] = {
                citizenid = isOnline.PlayerData.citizenid,
                grade = isOnline.PlayerData.job.grade,
                name = '🟢 '..isOnline.PlayerData.charinfo.firstname..' '..isOnline.PlayerData.charinfo.lastname
            }
        else
            employees[#employees+1] = {
                citizenid = v.citizenid,
                grade =  json.decode(v.job).grade,
                name = '🔴 '..json.decode(v.charinfo).firstname..' '..json.decode(v.charinfo).lastname
            }
        end
        table.sort(employees, function(a, b)
            return a.grade.level > b.grade.level
        end)
    end

    -- Unemployed
    local unemployed = {}
    local online = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(online) do
        if Player.PlayerData.job.name == "unemployed" then
            unemployed[#unemployed+1] = {
                citizenid = Player.PlayerData.citizenid,
                name = Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname
            }
        end
    end

    -- Stock table
    local stock =  MySQL.query.await('SELECT * FROM dealerships_stock WHERE dealership = ?', {dealership})

    -- Order table
    local orders =  MySQL.query.await('SELECT * FROM dealerships_orders WHERE dealership = ?', {dealership})
    for key, order in pairs(orders) do 
        orders[key].date = os.date('%x', math.floor(order.deliverydate/1000))
    end

    cb({
        bank = balance,
        employees = employees,
        unemployed = unemployed,
        stock = stock,
        orders = orders
    })
end)

QBCore.Functions.CreateCallback('Polar-Dealership:server:BuyStock', function(source, cb, dealership, model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= dealership then return end
    if Player.PlayerData.job.grade.level < Config.Dealership[dealership].bossMenuThreshold then return end

    local price = MySQL.scalar.await('SELECT price FROM dealerships_stock WHERE vehicle = ? AND dealership = ?', {model, dealership})
    if not price then return end
    local result = exports['qb-management']:GetAccount(dealership)
    local bank = math.floor(result)
    if price <= bank then
        -- Add to stock orders
        MySQL.insert('INSERT INTO dealerships_orders (dealership, vehicle) VALUES (?, ?)', {dealership, model})

        -- Remove money from dealership
        exports['qb-management']:RemoveMoney(dealership, price)

        -- Log
        TriggerEvent("qb-log:server:CreateLog", "importstock", "Order "..dealership, "blue", "**" .. Player.PlayerData.name .. "** (citizenid: *" .. Player.PlayerData.citizenid .. "* | id: *" .. Player.PlayerData.source .. ")*: Ordered a "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"].." for **"..price.."**")
        if Config.Debug then
            print("^3[Polar-Dealership] ^5"..Player.PlayerData.name.." ordered "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"].." for "..price.." ("..dealership..")".."^7")
        end

        cb(true)
    else
        cb(false)
    end
end)

QBCore.Commands.Add("sellcar", "Sell a car from the showroom (Dealerships only)", {{name = "ID", help = "Player ID"}} , true, function(source, args)
    local src = source
    local sourcePlayer = QBCore.Functions.GetPlayer(src)
    if not sourcePlayer then return end
    local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if not targetPlayer then return end

    if Config.Dealership[sourcePlayer.PlayerData.job.name] then
        local target = targetPlayer.PlayerData.source
        local targetName = targetPlayer.PlayerData.name
        local job = sourcePlayer.PlayerData.job.name
        TriggerClientEvent('Polar-Dealership:client:sellConfirm', src, target, targetName, job)
    end
end)

QBCore.Commands.Add("Testdrive", "Testdrive a car (Dealerships only)", {} , false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Config.Dealership[Player.PlayerData.job.name] then
        TriggerClientEvent("Polar-Dealership:client:testdrive", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not allowed to use this command", "error", 2500)
    end
end)

RegisterCommand('dealer_debug', function(source)
    Config.Debug = not Config.Debug
    print("^3[Polar-Dealership] ^5".."Debug mode: "..tostring(Config.Debug).."^7")
end, true)

CreateThread(function() 
    -- Check Shared for vehicles
    for dealership, v in pairs(Config.Dealership) do
        for brand, vehicles in pairs(v.vehicles) do
            for i=1, #vehicles do
                if not QBCore.Shared.Vehicles[vehicles[i]] then
                    print("^3[Polar-Dealership] ^5"..vehicles[i].."("..dealership..") is not in Shared Vehicles!^7")
                end
            end
        end
    end

    if Config.Debug then
        print("^3[Polar-Dealership] ^5Done checking vehicles in config.^7")
    end
    
    -- Check orders loop
    CheckOrders()
end)

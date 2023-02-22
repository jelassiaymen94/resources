local QBCore = exports['qb-core']:GetCoreObject()
local timeOut = false

-- Callback

QBCore.Functions.CreateCallback('qb-jewellery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Events
RegisterNetEvent('qb-jewellery:server:ThermitePtfx', function()
    TriggerClientEvent('qb-jewellery:client:ThermitePtfx', -1)
end)

RegisterNetEvent('qb-jewellery:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, stateType, state, k)
end)

RegisterNetEvent('qb-jewellery:server:vitrineReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    


    local luck = math.random(1, 100)


    if luck <= 10 then
        local blake = math.random(1,3)

        if blake == 1 then
        local item = math.random(1, #Config.SpecialRewards)
        local amount = math.random(Config.SpecialRewards[item]["amount"]["min"], Config.SpecialRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.SpecialRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SpecialRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
        Wait(200)
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
        Wait(200)
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
        else
            local item = math.random(1, #Config.SpecialRewards)
            local amount = math.random(Config.SpecialRewards[item]["amount"]["min"], Config.SpecialRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.SpecialRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SpecialRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
        end
    elseif luck > 10 then
        local present = math.random(1,5)

        if present == 1 then 

        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end

        

        elseif present == 2 then 

            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
        elseif present == 3 then 

            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
        elseif present == 4 then 

            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
        elseif present == 5 then 

            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end
            Wait(200)
            local item = math.random(1, #Config.VitrineRewards)
            local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
            if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
            end

        end
    end
end)

RegisterNetEvent('qb-jewellery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        exports['Polar-Wade']:jewellery()
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('qb-jewellery:client:setAlertState', -1, false)
                exports['Polar-Wade']:jewellery()
            end
            timeOut = false
        end)
    end
end)
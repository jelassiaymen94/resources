QBCore = exports['qb-core']:GetCoreObject()
local WeedPlants = {}

--- Functions

--- Method to calculate the growth percentage for a given WeedPlants index
--- @param k number - WeedPlants table index
--- @return retval number - growth index [0-100]
local calcGrowth = function(k)
    if not WeedPlants[k] then return false end
    local current_time = os.time()
    local TimeToGrow = Config.TimeToGrow * 60
    local progress = os.difftime(current_time, WeedPlants[k].time)
    local growth = QBCore.Shared.Round(progress * 100 / TimeToGrow, 2)
    local retval = math.min(growth, 100.00)
    return retval
end

--- Method to calculate the growth stage of a weedplant for a given growth index
--- @param growth number - growth index [0-100]
--- @return stage number - growth stage number [1-5]
local calcStage = function(growth)
    local stage = math.floor(growth / 20)
    if stage == 0 then stage += 1 end
    return stage
end

--- Method to calculate the current fertilizer percentage for a given WeedPlants index
--- @param k number - WeedPlants table index
--- @return retval number - fertilizer index [0-100]
local calcFertilizer = function(k)
    if not WeedPlants[k] then return false end
    local current_time = os.time()

    if #WeedPlants[k].fertilizer == 0 then
        return 0
    else
        local last_fertilizer = WeedPlants[k].fertilizer[#WeedPlants[k].fertilizer]
        local time_elapsed = os.difftime(current_time, last_fertilizer)
        local fertilizer = QBCore.Shared.Round(100 - (time_elapsed / 60 * Config.FertTime), 2)
        local retval = math.max(fertilizer, 0.00)
        return retval
    end
end

--- Method to calculate the current water percentage for a given WeedPlants index
--- @param k number - WeedPlants table index
--- @return retval number - water index [0-100]
local calcWater = function(k)
    if not WeedPlants[k] then return false end
    local current_time = os.time()

    if #WeedPlants[k].water == 0 then
        return 0
    else
        local last_water = WeedPlants[k].water[#WeedPlants[k].water]
        local time_elapsed = os.difftime(current_time, last_water)
        local water = QBCore.Shared.Round(100 - (time_elapsed / 60 * Config.WaterTime), 2)
        local retval = math.max(water, 0.00)
        return retval
    end
end

--- Method to calculate the health percentage for a given WeedPlants index
--- @param k number - WeedPlants table index
--- @return health number - health index [0-100]
local calcHealth = function(k)
    if not WeedPlants[k] then return false end
    local health = 100
    local current_time = os.time()
    local planted_time = WeedPlants[k].time
    local elapsed_time = os.difftime(current_time, planted_time)
    local intervals = math.floor(elapsed_time / 60 / Config.Updates)
    if intervals == 0 then return 100 end

    for i=1, intervals, 1 do
        -- check current water and fertilizer levels at every interval timestamp, if below thresholds, remove some health
        local interval_time = planted_time + (i * Config.Updates * 60)

        -- fertilizer at interval_time amount:
        local fertilizer_amount
        if #WeedPlants[k].fertilizer == 0 then
            fertilizer_amount = 0
            health -= math.random(Config.HealthRemoved[1], Config.HealthRemoved[2])
        else
            local last_fertilizer = math.huge
            for i=1, #WeedPlants[k].fertilizer, 1 do
                last_fertilizer = last_fertilizer < WeedPlants[k].fertilizer[i] and last_fertilizer or WeedPlants[k].fertilizer[i]
            end
            local time_since_fertilizer = os.difftime(interval_time, last_fertilizer)

            fertilizer_amount = math.max(QBCore.Shared.Round(100 - (time_since_fertilizer / 60 * Config.FertTime), 2), 0.00)
            if fertilizer_amount < Config.FertMin then
                health -= math.random(Config.HealthRemoved[1], Config.HealthRemoved[2])
            end
        end

        -- water at interval_time amount:
        local water_amount
        if #WeedPlants[k].water == 0 then
            water_amount = 0
            health -= math.random(Config.HealthRemoved[1], Config.HealthRemoved[2])
        else
            local last_water = math.huge
            for i=1, #WeedPlants[k].water, 1 do
                last_water = last_water < WeedPlants[k].water[i] and last_water or WeedPlants[k].water[i]
            end
            local time_since_water = os.difftime(interval_time, last_water)

            water_amount = math.max(QBCore.Shared.Round(100 - (time_since_water / 60 * Config.WaterTime), 2), 0.00)
            if water_amount < Config.WaterMin then
                health -= math.random(Config.HealthRemoved[1], Config.HealthRemoved[2])
            end
        end
    end

    return math.max(health, 0.0)
end

--- Method to setup all the weedplants, fetched from the database
--- @return nil
local setupPlants = function()
    local result = MySQL.Sync.fetchAll('SELECT * FROM polar_weedplants')
    local current_time = os.time()
    local TimeToGrow = Config.TimeToGrow * 60

    for k, v in pairs(result) do
        local progress = os.difftime(current_time, v.time)
        local growth = math.min(QBCore.Shared.Round(progress * 100 / TimeToGrow, 2), 100.00)
        local stage = calcStage(growth)
        local ModelHash = Config.Props[stage]
        local coords = json.decode(v.coords)
        local plant = CreateObjectNoOffset(ModelHash, coords.x, coords.y, coords.z + -0.5, true, true, false)
        FreezeEntityPosition(plant, true)
        WeedPlants[plant] = {
            id = v.id,
            coords = vector3(coords.x, coords.y, coords.z),
            time = v.time,
            fertilizer = json.decode(v.fertilizer),
            water = json.decode(v.water),
            gender = v.gender
        }
    end
end

--- Method to delete all cached weed plants and their entities
--- @return nil
local destroyAllPlants = function()    
    for k, v in pairs(WeedPlants) do
        if DoesEntityExist(k) then
            DeleteEntity(k)
            WeedPlants[k] = nil
        end
    end
end

--- Method to update a plant object, removing the existing one and placing a new object
--- @param k number - WeedPlants table index
--- @param stage number - Stage number
--- @return nil
local updatePlantProp = function(k, stage)
    if not WeedPlants[k] then return end
    if not DoesEntityExist(k) then return end
    local ModelHash = Config.Props[stage]
    DeleteEntity(k)
    local plant = CreateObjectNoOffset(ModelHash, WeedPlants[k].coords.x, WeedPlants[k].coords.y, WeedPlants[k].coords.z + -0.5, true, true, false)
    FreezeEntityPosition(plant, true)
    WeedPlants[plant] = WeedPlants[k]
    WeedPlants[k] = nil
end

--- Method to perform an update on every weedplant, updating their prop if needed, repeats every Config.Updates minutes
--- @return nil
updatePlants = function()
    for k, v in pairs(WeedPlants) do
        local growth = calcGrowth(k)
        local stage = calcStage(growth)
        if stage ~= v.stage then
            WeedPlants[k].stage = stage
            updatePlantProp(k, stage)
        end
    end

    SetTimeout(Config.Updates * 60 * 1000, updatePlants)
end

--- Resource start/stop events

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    setupPlants()
    if Config.RestartPlantRemoval then
        Wait(5000) -- Wait 5 seconds to allow all functions to be executed on startup
        for k, v in pairs(WeedPlants) do
            if calcHealth(k) == 0 then
                DeleteEntity(k)
                MySQL.query('DELETE from polar_weedplants WHERE id = :id', {
                    ['id'] = WeedPlants[k].id
                })
                WeedPlants[k] = nil
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    destroyAllPlants()
end)

--- Events

RegisterNetEvent('Polar-Weed:Server:ClearPlant', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then return end
    if #(GetEntityCoords(GetPlayerPed(source)) - WeedPlants[entity].coords) > 10 then return end
    if calcHealth(entity) ~= 0 then return end

    if DoesEntityExist(entity) then
        DeleteEntity(entity)
        MySQL.query('DELETE from weedplants WHERE id = :id', {
            ['id'] = WeedPlants[entity].id
        })
        WeedPlants[entity] = nil
    end
end)

RegisterNetEvent('Polar-Weed:Server:HarvestPlant', function(netId)
   
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - WeedPlants[entity].coords) > 10 then return end
    if calcGrowth(entity) ~= 100 then return end
    
    if DoesEntityExist(entity) then
        local health = calcHealth(entity)

        if WeedPlants[entity].gender == 'female' then

            if health <= Config.WetBudLow then
                if Player.Functions.AddItem(Config.WeedPlantItemLow, Config.WeedPlantItemAmount, false, nil) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeedPlantItemLow], 'add', Config.WeedPlantItemAmount) else TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500) end
            elseif health <= Config.WetBudMid then  
                if Player.Functions.AddItem(Config.WeedPlantItemMid, Config.WeedPlantItemAmount, false, nil) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeedPlantItemMid], 'add', Config.WeedPlantItemAmount) else TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500) end
            else
                if Player.Functions.AddItem(Config.WeedPlantItemGood, Config.WeedPlantItemAmount, false, nil) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeedPlantItemGood], 'add', Config.WeedPlantItemAmount) else TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500) end
            end

            if Config.FemaleWeedTreasure then
                local chance = math.random(1,100)
                if chance <= Config.TreasureChance then
                    local pp = Config.TreasureItemAmount
                    local titem = Config.TreasureItem[math.random(1, #Config.TreasureItem- 1 )]
                if Player.Functions.AddItem(titem, pp, false, info) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[titem], 'add', pp)
                    else
                        TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500)
                    end
                end
            end
           
        else -- male seed added

            if Config.MaleWeedTreasure then
                local chance = math.random(1,100)
                if chance <= Config.TreasureChance then
                    local pp = Config.TreasureItemAmount
                    local titem = Config.TreasureItem[math.random(1, #Config.TreasureItem- 1 )]
                if Player.Functions.AddItem(titem, pp, false, info) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[titem], 'add', pp)
                    else
                        TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500)
                    end
                end
            end

            if Config.GiveMaleSeed then
                if Config.GiveMaleSeedOverHealth then
                local mSeeds = math.floor(health / Config.HealthMaleRateSeed)
                if Player.Functions.AddItem(Config.MaleSeed, mSeeds, false) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MaleSeed], 'add', mSeeds)
                else
                    TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500)
                end
                else
                    if Player.Functions.AddItem(Config.MaleSeed, Config.GiveMaleSeedAmount, false) then
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MaleSeed], 'add', Config.GiveMaleSeedAmount)
                    else
                        TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500)
                    end
                end
            end

            if Config.GiveFemaleSeedOverHealth then
            local fSeeds = math.floor(health / Config.HealthFemaleRateSeed)
            if Player.Functions.AddItem(Config.FemaleSeed, fSeeds, false) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FemaleSeed], 'add', fSeeds)
            else
                TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500)
            end
            else
                if Player.Functions.AddItem(Config.FemaleSeed, Config.GiveFemaleSeedAmount, false) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FemaleSeed], 'add', Config.GiveFemaleSeedAmount)
                else
                    TriggerClientEvent('QBCore:Notify', src, text('errorfull'), 'error', 2500)
                end
            end
        end
        
        DeleteEntity(entity)
        MySQL.query('DELETE from polar_weedplants WHERE id = :id', {
            ['id'] = WeedPlants[entity].id
        })
        WeedPlants[entity] = nil
    end
end)

RegisterNetEvent('Polar-Weed:Server:PoliceDestroy', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.type ~= Config.PoliceJob then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - WeedPlants[entity].coords) > 10 then return end

    if DoesEntityExist(entity) then
        MySQL.query('DELETE from polar_weedplants WHERE id = :id', {
            ['id'] = WeedPlants[entity].id
        })
        WeedPlants[entity] = nil

        TriggerClientEvent('Polar-Weed:Client:FireGoBrrrrrrr', -1, WeedPlants[entity].coords)
        Wait(10000)
        DeleteEntity(entity)
    end
end)

RegisterNetEvent('Polar-Weed:Server:GiveWater', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - WeedPlants[entity].coords) > 10 then return end

    if Player.Functions.RemoveItem(Config.WaterItem, 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WaterItem], 'remove', 1)
        TriggerClientEvent('QBCore:Notify', src, text('watered_plant'), 'success', 2500)
        
        WeedPlants[entity].water[#WeedPlants[entity].water + 1] = os.time()
        MySQL.update('UPDATE polar_weedplants SET water = (:water) WHERE id = (:id)', {
            ['water'] = json.encode(WeedPlants[entity].water),
            ['id'] = WeedPlants[entity].id,
        })
    end
end)

RegisterNetEvent('Polar-Weed:Server:GiveFertilizer', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - WeedPlants[entity].coords) > 10 then return end

    if Player.Functions.RemoveItem(Config.FertilizerItem, 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FertilizerItem], 'remove', 1)
        TriggerClientEvent('QBCore:Notify', src, text('fertilizer_added'), 'success', 2500)
        
        WeedPlants[entity].fertilizer[#WeedPlants[entity].fertilizer + 1] = os.time()
        MySQL.update('UPDATE polar_weedplants SET fertilizer = (:fertilizer) WHERE id = (:id)', {
            ['fertilizer'] = json.encode(WeedPlants[entity].fertilizer),
            ['id'] = WeedPlants[entity].id,
        })
    end
end)

RegisterNetEvent('Polar-Weed:Server:AddMaleSeed', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - WeedPlants[entity].coords) > 10 then return end

    if Player.Functions.RemoveItem(Config.MaleSeed, 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MaleSeed], 'remove', 1)
        TriggerClientEvent('QBCore:Notify', src, text('male_seed_added'), 'success', 2500)
        
        WeedPlants[entity].gender = 'male'
        MySQL.update('UPDATE polar_weedplants SET gender = (:gender) WHERE id = (:id)', {
            ['gender'] = WeedPlants[entity].gender,
            ['id'] = WeedPlants[entity].id,
        })
    end
end)

RegisterNetEvent('Polar-Weed:Server:CreateNewPlant', function(coords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - coords) > Config.Distance + 10 then return end
    if Player.Functions.RemoveItem(Config.FemaleSeed, 1) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FemaleSeed], 'remove', 1)
        local ModelHash = Config.Props[1]
        local plant = CreateObjectNoOffset(ModelHash, coords.x, coords.y, coords.z + -0.5, true, true, false)
        FreezeEntityPosition(plant, true)
        local time = os.time()
        MySQL.insert('INSERT into polar_weedplants (coords, time, fertilizer, water, gender) VALUES (:coords, :time, :fertilizer, :water, :gender)', {
            ['coords'] = json.encode(coords),
            ['time'] = time,
            ['fertilizer'] = json.encode({}),
            ['water'] = json.encode({}),
            ['gender'] = 'female'
        }, function(data)
            WeedPlants[plant] = {
                id = data,
                coords = coords,
                time = time,
                fertilizer = {},
                water = {},
                gender = 'female'
            }
        end)
    end
end)

--- Callbacks

QBCore.Functions.CreateCallback('Polar-Weed:Server:GetPlantData', function(source, cb, netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not WeedPlants[entity] then cb(nil) return end
    local temp = {
        id = WeedPlants[entity].id,
        coords = WeedPlants[entity].coords,
        time = WeedPlants[entity].time,
        fertilizer = calcFertilizer(entity),
        water = calcWater(entity),
        gender = WeedPlants[entity].gender,
        stage = calcStage(calcGrowth(entity)),
        health = calcHealth(entity),
        growth = calcGrowth(entity)
    }
    cb(temp)
end)



CreateThread(function()
    Wait(Config.Updates * 60 * 1000)
    updatePlants()
end)

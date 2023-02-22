local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    updatePlants()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if not resourceName == GetCurrentResourceName() then
      
        return end

    
end)

function updatePlants()
    SetTimeout(Config.GrowRate * 1000, function()
        updatePlants()
    end)
    --DEAD PLANTS
    MySQL.query("SELECT id FROM polar_weedplants WHERE (water <= 2 OR food <= 2)",{},function(id)
        for _, v in ipairs(id) do
            MySQL.update('DELETE FROM polar_weedplants WHERE id = ?', {v.id}, function()
                --TriggerClientEvent("Polar-Weed:Client:DeleteEntity", -1)  
                
            end)
        end
    end)
    MySQL.query("SELECT stage FROM polar_weedplants WHERE (stage >= 100)",{},function(stage)
        for _, v in ipairs(stage) do
            MySQL.update('UPDATE `polar_weedplants` SET `stage`= 100', {v.stage}, function()
                
            end)
        end
    end)
    MySQL.query("SELECT rate FROM polar_weedplants WHERE (rate >= 100)",{},function(rate)
        for _, v in ipairs(rate) do
            MySQL.update('UPDATE `polar_weedplants` SET `rate`= 100', {v.rate}, function()
                
            end)
        end
    end)
    -- ALIVE PLANT REDUCTION

    MySQL.update("UPDATE `polar_weedplants` SET `stage`=`stage` + (0.01 * `rate`) , `rate` = `rate` + (0.01 * `stage`), `food` = `food` - (0.02 * `rate`), `water` = `water` -  (0.02 * `rate`) WHERE water >= 2 OR food >= 2",{},
    function()
        TriggerClientEvent("Polar-Weed:Client:growthUpdate", -1)
    end)
    -- GROW PLANTS
    MySQL.query("SELECT id, stage FROM polar_weedplants WHERE (stage >= 1 AND stage <= 100)",{},
    function(info)
        for _, v in ipairs(info) do
            TriggerClientEvent("Polar-Weed:Client:growPlant", -1, v.id, v.stage)
        end
    end)
end

function addPlant(seed, coords, id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local zone = nil
    MySQL.insert('INSERT INTO polar_weedplants (coords, seed, stage, rate, water, food) VALUES (?, ?, ?, ?, ?, ?)',{
        json.encode({x = coords[1], y = coords[2], z = coords[3]}),
        seed,
        0,
        10,
        10,
        10
    },function(id)
        TriggerClientEvent("Polar-Weed:Client:addPlant", src, seed, coords, id)
    end)
end

RegisterNetEvent("Polar-Weed:Server:addPlantToDatabase",function(seed, coords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    addPlant(seed, coords, src)
    Player.Functions.RemoveItem(seed, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[seed], "remove", 1)
end)

RegisterNetEvent("Polar-Weed:Server:deletePlant",function(id)
    MySQL.update('DELETE FROM polar_weedplants WHERE id = ?', {id})
end)

RegisterNetEvent("Polar-Weed:Server:updatePlant",function(id, info)
    MySQL.update('UPDATE polar_weedplants SET stage = ?, rate = ?, food = ?, water = ? WHERE id = ?',{info.stage, info.rate, info.food, info.water, id})
end)

QBCore.Functions.CreateCallback("Polar-Weed:Server:getInfo",function(source, cb)
    MySQL.query('SELECT * FROM polar_weedplants WHERE 1',{}, function(infoPlants)
        local plants = {}
        for _, v in ipairs(infoPlants) do
            local coords = json.decode(v.coords) or {x = 0, y = 0, z = 0}
            local data = {stage = v.stage, rate = v.rate, water = v.water, food = v.food} 
            coords = vector3(coords.x, coords.y, coords.z)
            plants[v.id] = {seed = v.seed, coords = coords, info = data}
        end
        cb(plants)
    end)
end)

QBCore.Functions.CreateCallback("Polar-Weed:Server:getPlant",function(source, cb, id)
    MySQL.query("SELECT stage,rate,food,water FROM polar_weedplants WHERE id = @id LIMIT 1",{["@id"] = id},function(info)
        local data = {stage = info[1].stage, rate = info[1].rate, water = info[1].water, food = info[1].food}
        cb(data)
    end)
end)

RegisterNetEvent('Polar-Weed:Server:RemoveWater', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.WaterItem, Config.WaterItemAmount, false) then --  item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WaterItem], 'remove', Config.WaterItemAmount)
    end


end)


RegisterNetEvent('Polar-Weed:Server:RemoveFertilizer', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.FertilizerItem, Config.FertilizerItemAmount, false) then --  item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FertilizerItem], 'remove', Config.FertilizerItemAmount)
    end

end)
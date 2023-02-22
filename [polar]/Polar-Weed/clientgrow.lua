local QBCore = exports['qb-core']:GetCoreObject()


local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)


crop_type = {
    ["crop_stage"] = {

        stage_1 = {"bkr_prop_weed_bud_pruned_01a", -1.05},
        stage_2 = {"bkr_prop_weed_bud_02b", -1.05},
        stage_3 = {"bkr_prop_weed_bud_02a", -1.05},
        stage_4 = {"bkr_prop_weed_01_small_01c", -1.65},
        stage_5 = {"bkr_prop_weed_01_small_01a", -1.65},
        stage_6 = {"bkr_prop_weed_01_small_01b", -1.65},
        stage_7 = {"bkr_prop_weed_med_01a", -4.2},
        stage_8 = {"bkr_prop_weed_med_01b", -4.2},
        stage_9 = {"bkr_prop_weed_lrg_01b", -4.0},
        stage_10 = {"bkr_prop_weed_lrg_01a", -4.0},
        
    }
}

Plants = {}
SpawnedPlants = {}
local CurrentPlant = nil
local CurrentPlantInfo = nil

local nearPlant = true
local shown = false



--======================================================================= Threads

CreateThread(function()
    while true do 
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId() 
            local nPlant = nearPlant(ped)
            if nPlant ~= false then
               
                if not shown then
                    shown = true
                    QBCore.Functions.TriggerCallback("Polar-Weed:Server:getPlant",function(info)
                        CurrentPlant = nPlant
                        CurrentPlantInfo = info
                        
                        
                        
                        
                    end,nPlant)
                end
            else
                if shown then
                    CurrentPlant = nil
                    CurrentPlantInfo = nil
                    exports['qb-menu']:closeMenu() 
                    shown = false
                end
            end
          
            if nPlant == false then
                Wait(1000)
            else
                Wait(1)
            end
        end
        Wait(100)
    end
end)
RegisterNetEvent('Polar-Weed:Client:Check', function()
  
        
    PlantMenuStacic()
    

    
end)
--======================================================================= Callbacks

QBCore.Functions.TriggerCallback("Polar-Weed:Server:getInfo",function(plants)
    Plants = plants
    for k, v in pairs(Plants) do
        spawnPlant(v.seed, v.coords, v.info.stage, k)
    end
end)

--======================================================================= Events

RegisterNetEvent("Polar-Weed:Client:DeleteEntity",function()
    exports['qb-menu']:closeMenu() 
    Wait(2000)
    if SpawnedPlants[CurrentPlant] ~= nil then
        DeleteEntity(SpawnedPlants[CurrentPlant])
    end
    Plants[CurrentPlant] = nil
    SpawnedPlants[CurrentPlant] = nil
    CurrentPlant = nil
    CurrentPlantInfo = nil
    ClearPedTasks(ped)
    Wait(4000)
    action = false
    ClearPedTasksImmediately(ped)
end)

RegisterNetEvent("Polar-Weed:Client:growPlant",function(id, percent)
    if Plants[id] ~= nil and SpawnedPlants[id] ~= nil then
        DeleteEntity(SpawnedPlants[id])
        Wait(5)
        setPlant(id, percent)
    end
end)

RegisterNetEvent("Polar-Weed:Client:growthUpdate",function()
    if CurrentPlantInfo ~= nil then
        CurrentPlantInfo.water = CurrentPlantInfo.water - (Config.WaterDecrease * CurrentPlantInfo.rate)
        CurrentPlantInfo.food = CurrentPlantInfo.food - (Config.FertDecrease * CurrentPlantInfo.rate) -- 0.02
        
        if CurrentPlantInfo.food < 1 then
           
        elseif CurrentPlantInfo.water < 1 then
            
        
        elseif CurrentPlantInfo.stage == 100 then
            CurrentPlantInfo.stage = 100
        else
        CurrentPlantInfo.stage = CurrentPlantInfo.stage + (0.01 * CurrentPlantInfo.rate) 
        end
    end
end)

RegisterNetEvent("Polar-Weed:Client:startPlanting",function(plant)
    
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
    if GetGroundHash(ped) == Config.Ground1 or GetGroundHash(ped) == Config.Ground2 or GetGroundHash(ped) == Config.Ground3 or GetGroundHash(ped) == Config.Ground4 then
        local canPlant = true
        for k, v in pairs(Plants) do
            if #(coords - v.coords) < 4.5 then
                canPlant = false
            end
        end

        if canPlant then
            TriggerServerEvent("Polar-Weed:Server:addPlantToDatabase", plant, coords)
        else
            QBCore.Functions.Notify('You are to close to another plant', red)
        end
    else
        QBCore.Functions.Notify('You Can only Plant up North', red)
    end
    else
        QBCore.Functions.Notify('You need a ' .. Config.PlowItemName .. ' ', red)
    end
    end, Config.PlowItem)
end)

RegisterNetEvent("Polar-Weed:Client:addPlant",function(seed, coords, id)
    local entity = 'crop_stage'
    local ped = PlayerPedId()
    Plants[id] = {seed = seed, coords = coords}
    QBCore.Functions.Notify("Planting...", "success", 6000)
    TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
    Wait(100)
    ClearPedTasks(ped)
    SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_1[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_1[2],true,true,1)
    SetEntityAsMissionEntity(SpawnedPlants[id], true, true)  
end)

RegisterNetEvent('Polar-Weed:Client:cropOptions', function(args, data)
    
    local args = tonumber(args)
	if args == 1 then
        local percent = math.random(Config.FertPecentMin,Config.FertPecentMax)
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Notify(""..percent.."% fertilizer Added",  green, alerttime)
                if percent > 0 then
                    CurrentPlantInfo.food = CurrentPlantInfo.food + percent
                    if CurrentPlantInfo.food > 100 then
                        CurrentPlantInfo.food = 100
                    end
                    TriggerServerEvent('Polar-Weed:Server:RemoveFertilizer')
                    TriggerEvent('animations:client:EmoteCommandStart', {"parkingmeter"})
                    QBCore.Functions.Progressbar("searcing", "Fertilizing Plant...", 3500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        PlantMenuStacic()
                        TriggerServerEvent("Polar-Weed:Server:updatePlant", CurrentPlant, CurrentPlantInfo)
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    end, function() -- Cancel
                        
                        QBCore.Functions.Notify("Canceled", red, alerttime)
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        PlantMenuStacic()
                    end)
                    
                end
            else
                PlantMenuAlive()
                QBCore.Functions.Notify("You dont have any fertilizer", "error")
            end
        end, Config.FertilizerItem)
    elseif args == 2 then
        local percent = math.random(Config.WaterPecentMin,Config.WaterPecentMax)
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Notify(""..percent.."% Water Added",  green, alerttime)
                if percent > 0 then
                    CurrentPlantInfo.water = CurrentPlantInfo.water + percent
                    if CurrentPlantInfo.water > 100 then
                        CurrentPlantInfo.water = 100
                    end
                    TriggerServerEvent('Polar-Weed:Server:RemoveWater')
                    TriggerEvent('animations:client:EmoteCommandStart', {"parkingmeter"})
                    QBCore.Functions.Progressbar("searcing", "Watering Plant...", 3500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        PlantMenuStacic()
                        TriggerServerEvent("Polar-Weed:Server:updatePlant", CurrentPlant, CurrentPlantInfo)
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    end, function() -- Cancel
                        
                        QBCore.Functions.Notify("Canceled", red, alerttime)
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        PlantMenuStacic()
                    end)
                end
            else
                PlantMenuAlive()
                QBCore.Functions.Notify("You dont have any water", "error")
            end
        end, Config.WaterItem)
    elseif args == 3 then
        local ped = PlayerPedId()
        if CurrentPlantInfo.stage >= Config.MinHarvest then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                if HasItem then
        TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
        exports['qb-menu']:closeMenu() 
        Wait(3000)
        if SpawnedPlants[CurrentPlant] ~= nil then
            DeleteEntity(SpawnedPlants[CurrentPlant])
        end
        TriggerServerEvent("Polar-Weed:Server:deletePlant", CurrentPlant)
        local math = math.random(1,100)
        if math < 15 then
        TriggerServerEvent("Polar-Weed:Server:addHighGradeMarijuana", Plants[CurrentPlant].seed, CurrentPlantInfo) 
        elseif math < 90 then
        TriggerServerEvent("Polar-Weed:Server:addMidGradeMarijuana", Plants[CurrentPlant].seed, CurrentPlantInfo) 
        else
        TriggerServerEvent("Polar-Weed:Server:addLowGradeMarijuana", Plants[CurrentPlant].seed, CurrentPlantInfo) 
        end
        Plants[CurrentPlant] = nil
        SpawnedPlants[CurrentPlant] = nil
        CurrentPlant = nil
        CurrentPlantInfo = nil
        ClearPedTasks(ped)
        Wait(4000)
        ClearPedTasksImmediately(ped)
        
        else
        QBCore.Functions.Notify('You need a' .. Config.PlowItem .. ' ', red)
        end
        
        end, Config.PlowItem)
        
        else
            QBCore.Functions.Notify('You Have to wait for the Plant to finish Growing', red)
        end
        
    elseif args == 4 then
        local ped = PlayerPedId()
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
        TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
        exports['qb-menu']:closeMenu() 
        Wait(2000)
        if SpawnedPlants[CurrentPlant] ~= nil then
            DeleteEntity(SpawnedPlants[CurrentPlant])
        end
        Plants[CurrentPlant] = nil
        SpawnedPlants[CurrentPlant] = nil
        TriggerServerEvent("Polar-Weed:Server:deletePlant", CurrentPlant)
        QBCore.Functions.Notify(""..CurrentPlant.."Plant Destroyed",  red, alerttime)
        CurrentPlant = nil
        CurrentPlantInfo = nil
        ClearPedTasks(ped)
        Wait(4000)
        ClearPedTasksImmediately(ped)
        if Config.SendMail then

           TriggerClientEvent('Polar-Weed:Client:DeathMail')

        end
            else
                QBCore.Functions.Notify('You need a' .. Config.PlowItem .. ' ', red)
            end
        end, Config.PlowItem)
    else
        exports['qb-menu']:closeMenu() 
        
        
    end
    
end)

--======================================================================= Functions

function spawnPlant(plant, coords, percent, id)
    local entity = 'crop_stage'
    if percent < 10 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_1[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_1[2],true,true,1)
    elseif percent < 15 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_2[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_2[2],true,true,1)
    elseif percent < 20 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_3[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_3[2],true,true,1)
    elseif percent < 30 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_4[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_4[2],true,true,1)
    elseif percent < 40 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_5[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_5[2],true,true,1)
    elseif percent <= 50 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_6[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_6[2],true,true,1)
    elseif percent <= 60 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_7[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_7[2],true,true,1)
    elseif percent <= 70 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_8[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_8[2],true,true,1)
    elseif percent <= 85 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_9[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_9[2],true,true,1)
    elseif percent <= 100 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_10[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_10[2],true,true,1)
    end
    SetEntityAsMissionEntity(SpawnedPlants[id], true, true)
end

function setPlant(id, percent)
    local plant = Plants[id].type
    local entity = 'crop_stage'
    if SpawnedPlants[id] ~= nil then
        local coords = Plants[id].coords
        DeleteEntity(SpawnedPlants[id])
        if percent < 10 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_1[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_1[2],true,true,1)
        elseif percent < 15 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_2[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_2[2],true,true,1)
        elseif percent < 20 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_3[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_3[2],true,true,1)
        elseif percent < 30 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_4[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_4[2],true,true,1)
        elseif percent < 40 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_5[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_5[2],true,true,1)
        elseif percent <= 50 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_6[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_6[2],true,true,1)
        elseif percent <= 60 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_7[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_7[2],true,true,1)
        elseif percent <= 70 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_8[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_8[2],true,true,1)
        elseif percent <= 85 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_9[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_9[2],true,true,1)
        elseif percent <= 100 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_10[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_10[2],true,true,1)
        end
        SetEntityAsMissionEntity(SpawnedPlants[id], true, true)
    else
        print("There was an error loading a plant!")
    end
end

function GetGroundHash(ped)
    local posped = GetEntityCoords(ped)
    local num = StartShapeTestCapsule(posped.x, posped.y, posped.z + 4, posped.x, posped.y, posped.z - 2.0, 2, 1, ped, 7)
    local arg1, arg2, arg3, arg4, arg5 = GetShapeTestResultEx(num)
    return arg5
end

function nearPlant(ped)
    for k, v in pairs(Plants) do
        if #(v.coords - GetEntityCoords(ped)) < 2.5 then
            return k
        end
    end
    return false
end


function PlantMenuStacic()
    if Config.SeeRate then
    exports['qb-menu']:openMenu({
        { 
            header = Config.PlantName,
            txt = "Growth: "..math.floor(CurrentPlantInfo.stage).."%<p>Rate: "..math.floor(CurrentPlantInfo.rate).."%<p>Fertilizer "..math.floor(CurrentPlantInfo.food).."%<p>Water "..math.floor(CurrentPlantInfo.water).."%",
            isMenuHeader = true
        },
        {
            header = "Add Fertilizer",
            txt = "Fertilize the Soil for Higher Quality",
            params = {
                event = "Polar-Weed:Client:cropOptions",
                args = 1
            }
        },
        {
            header = "Add Water",
            txt = "You need Water for the Plant to Grow!",
            params = {
                event = "Polar-Weed:Client:cropOptions",
                args = 2
            }
        },
        {
            header = "Harvest Plant",
            txt = "",
            params = {
                event = "Polar-Weed:Client:cropOptions",
                args = 3
            }
        },
        
        {
            header = "Close",
            params = {
                event = "Polar-Weed:Client:cropOptions",
                args = 5
            }
        },
    })
    else
        exports['qb-menu']:openMenu({
            { 
                header = Config.PlantName,
                txt = "Growth: "..math.floor(CurrentPlantInfo.stage).."%<p>Fertilizer "..math.floor(CurrentPlantInfo.food).."%<p>Water "..math.floor(CurrentPlantInfo.water).."%",
                isMenuHeader = true
            },
            {
                header = "Add Fertilizer",
                txt = "Fertilize the Soil for Higher Quality",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 1
                }
            },
            {
                header = "Add Water",
                txt = "You need Water for the Plant to Grow!",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 2
                }
            },
            {
                header = "Harvest Plant",
                txt = "",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 3
                }
            },
            
            {
                header = "Close",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 5
                }
            },
        })
    end
end

function PlantMenuAlive()
    if Config.SeeRate then
        exports['qb-menu']:openMenu({
            { 
                header = Config.PlantName ..CurrentPlant,
                txt = "Growth: "..math.floor(CurrentPlantInfo.stage).."%<p>Rate: "..math.floor(CurrentPlantInfo.rate).."%<p>Fertilizer "..math.floor(CurrentPlantInfo.food).."%<p>Water "..math.floor(CurrentPlantInfo.water).."%",
                isMenuHeader = true
            },
            {
                header = "Add Fertilizer",
                txt = "Fertilize the Soil for Higher Quality",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 1
                }
            },
            {
                header = "Add Water",
                txt = "You need Water for the Plant to Grow!",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 2
                }
            },
            {
                header = "Harvest Plant",
                txt = "",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 3
                }
            },
            
            {
                header = "Close",
                params = {
                    event = "Polar-Weed:Client:cropOptions",
                    args = 5
                }
            },
        })
        else
            exports['qb-menu']:openMenu({
                { 
                    header = Config.PlantName ..CurrentPlant,
                    txt = "Growth: "..math.floor(CurrentPlantInfo.stage).."%<p>Fertilizer "..math.floor(CurrentPlantInfo.food).."%<p>Water "..math.floor(CurrentPlantInfo.water).."%",
                    isMenuHeader = true
                },
                {
                    header = "Add Fertilizer",
                    txt = "Fertilize the Soil for Higher Quality",
                    params = {
                        event = "Polar-Weed:Client:cropOptions",
                        args = 1
                    }
                },
                {
                    header = "Add Water",
                    txt = "You need Water for the Plant to Grow!",
                    params = {
                        event = "Polar-Weed:Client:cropOptions",
                        args = 2
                    }
                },
                {
                    header = "Harvest Plant",
                    txt = "",
                    params = {
                        event = "Polar-Weed:Client:cropOptions",
                        args = 3
                    }
                },
                
                {
                    header = "Close",
                    params = {
                        event = "Polar-Weed:Client:cropOptions",
                        args = 5
                    }
                },
            })
        end
end



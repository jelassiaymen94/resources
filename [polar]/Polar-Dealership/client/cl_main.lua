local QBCore = exports['qb-core']:GetCoreObject()




local spawns = {
    jdmtable = { -- jdm
        inside = vector4(-1072.78, -62.94, -94.6, 179.18),
        car = vector4(843.14, -2432.53, 27.85, 177.6),
        person = vector4(853.4, -2433.96, 28.04, 173.59),
        target = vector3(853.36, -2432.69, 28.07),
        targete = vector3(-1072.8, -62.62, -94.6),
    },
    biketable = { -- bikes
        inside = vector4(231.15, -1006.59, -99.0, 3.97),
        car = vector4(-1470.45, -925.04, 10.1, 325.51),
        person = vector4(-1469.15, -928.48, 10.16, 320.05),
        target = vector3(-1469.86, -928.98, 10.19),
        targete = vector3(231.4, -1006.68, -99.0),
    },
    cartable = { -- car
        inside = vector4(-1266.85, -3049.56, -48.49, 7.42),
        car = vector4(-1141.45, -3413.93, 13.95, 333.48),
        person = vector4(-1152.64, -3410.74, 13.95, 328.2),
        target = vector3(-1153.45, -3412.07, 13.95),
        targete = vector3(-1267.1, -3049.9, -48.49),
    },
}







function SetupGarageTargets()
    CreateTarget("jdmtable", spawns["jdmtable"].target, "Polar-Dealership:Client:Garage", "Enter JDM Garage", "fas fa-bolt", false, {"cardealer, jdmdealer, bikedealer"})
    CreateTarget("biketable", spawns["biketable"].target, "Polar-Dealership:Client:Garage", "Enter Bike Garage", "fas fa-bolt", false, {"cardealer, jdmdealer, bikedealer"})
    CreateTarget("cartable", spawns["cartable"].target, "Polar-Dealership:Client:Garage", "Enter Car Garage", "fas fa-bolt", false, {"cardealer, jdmdealer, bikedealer"})
  
   
end 


  

function setupexittarget(name)
    CreateTarget(name, spawns[name].targete, "Polar-Dealership:Client:ExitGarage", "Exit Garage", "fas fa-bolt", false)
end


RegisterNetEvent('Polar-Dealership:Client:ExitGarage', function(data)
    local name = data.id
    outsidespawnp(spawns[name].person)
    clearcars()
end)




local isLoggedIn = false

local DealershipBossMenu = nil
local DealershipShowroom = nil
local radialmenuOption = nil
local inZone = false

PlayerJob = QBCore.Functions.GetPlayerData().job

bank = 0
employees = {}
unemployed = {}
stockPriceTable = {}
orderTable = {}

--- Fetches dealership data and opens boss menu

--- @return nil
local openBossMenu = function()
    if not Config.Dealership[PlayerJob.name] then return end  
    QBCore.Functions.Progressbar("Opening laptop", "Booting systems..", 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        QBCore.Functions.TriggerCallback('Polar-Dealership:server:GetDealershipData', function(result)
            bank = result.bank
            employees = result.employees
            unemployed = result.unemployed
            stockPriceTable = result.stock
            orderTable = result.orders
            TriggerEvent("Polar-Dealership:client:menu:OpenBossMenu")
        end, PlayerJob.name)
    end, function() -- Cancel
        QBCore.Functions.Notify("Canceled..", "error", 2500)
    end)
end
RegisterNetEvent('Polar-Dealership:Client:BossMenu', function()
    Wait(100)
    openBossMenu()
    
end)

--- Fetches dealership data and opens showroom menu
--- @return nil
local openShowroom = function()
    if not Config.Dealership[PlayerJob.name] then return end
    QBCore.Functions.Progressbar("Opening laptop", "Booting systems...", 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        QBCore.Functions.TriggerCallback('Polar-Dealership:server:getStockPrice', function(result)
            stockPriceTable = result
            TriggerEvent("Polar-Dealership:client:menu:OpenShowroomMenu")
        end, PlayerJob.name)
    end, function() -- Cancel
        QBCore.Functions.Notify("Canceled..", "error", 2500)
    end)
end
RegisterNetEvent('Polar-Dealership:Client:ShowRoom', function()
    Wait(100)
    openShowroom()
    
end)

--- This function removes existing boss menu boxzone and adds a new one for the current player job
--- @return nil
local SetupPoly = function()
    if not Config.Dealership[PlayerJob.name] then return end

    -- Showroom PolyZone
    DealershipShowroom = PolyZone:Create(Config.Dealership[PlayerJob.name].showroom, {
        name = "DealershipShowroom",
        minZ = Config.Dealership[PlayerJob.name].minZ,
        maxZ = Config.Dealership[PlayerJob.name].maxZ,
        debugGrid = false
    })

    DealershipShowroom:onPlayerInOut(function(isPointInside)
        if isPointInside then
            radialmenuOption = exports['qb-radialmenu']:AddOption({
                id = 'showroom',
                title = 'Open Showroom',
                icon = 'car',
                type = 'client',
                event = 'Polar-Dealership:client:OpenShowroom',
                shouldClose = true
            })
        else
            exports['qb-radialmenu']:RemoveOption(radialmenuOption)
            radialmenuOption = nil
        end
    end)
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    SetupPoly()
    SetupGarageTargets()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerJob = {}
    bank = 0
    employees = {}
    unemployed = {}
    stockPriceTable = {}
    orderTable = {}

    if DealershipShowroom then DealershipShowroom:destroy() end
    if DealershipBossMenu then DealershipBossMenu:destroy() end

    if radialmenuOption then
        exports['qb-radialmenu']:RemoveOption(radialmenuOption)
        radialmenuOption = nil
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

AddEventHandler('onResourceStop', function (resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    if DealershipShowroom then DealershipShowroom:destroy() end
    if DealershipBossMenu then DealershipBossMenu:destroy() end

    if radialmenuOption then
        exports['qb-radialmenu']:RemoveOption(radialmenuOption)
        radialmenuOption = nil
    end

    clearcars()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    PlayerJob = QBCore.Functions.GetPlayerData().job
    SetupPoly()
    isLoggedIn = true
end)

AddStateBagChangeHandler('isLoggedIn', nil, function(bagName, key, value)
    isLoggedIn = value
end)


RegisterNetEvent('Polar-Dealership:client:OpenShowroom', function()
    if DealershipShowroom:isPointInside(GetEntityCoords(PlayerPedId())) then
        openShowroom()
    end
end)


RegisterNetEvent('Polar-Dealership:client:sellConfirm',function(target, targetName, job, money, amount)
    if Config.Dealership[PlayerJob.name] then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId())
            local props = QBCore.Functions.GetVehicleProperties(veh)
            local hash = props.model
            local plate = GetVehicleNumberPlateText(veh)
            local vehmodel = nil
            if plate == "FORSALE1" or plate == "TESTCAR1" then
                for k, v in pairs(Config.Dealership[PlayerJob.name]["vehicles"]) do
                    for i=1, #v, 1 do
                        local model = v[i]
                        if hash == GetHashKey(model) then
                            vehmodel = v[i]
                            break
                        end
                    end
                end
               
                if vehmodel ~= nil then
                    -- SET OWNER
                    QBCore.Functions.TriggerCallback('Polar-Dealership:SellCar', function(result) 
                    if result then
                    TriggerServerEvent('Polar-Dealership:server:setOwner', vehmodel, hash, target, job)

                  
                    TriggerServerEvent("qb-log:server:CreateLog", "vehicleshop", "Vehicle purchased ("..PlayerJob.name..")", "red", "**"..targetName.."**: bought a **" .. QBCore.Shared.Vehicles[vehmodel]["brand"].." "..QBCore.Shared.Vehicles[vehmodel]["name"].. "** from "..GetPlayerName(PlayerId()))

                    
                    Wait(2000)
                    TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))  
                    else
                        print('no bank')
                    end end, target, amount)
                else
                    QBCore.Functions.Notify("You cannot do this!","error")
                end
            else 
                QBCore.Functions.Notify("This vehicle is not for sale","error")
            end
        end
    end
end)

RegisterNetEvent('Polar-Dealership:client:setOwner',function(plate)
    local veh = GetVehiclePedIsIn(PlayerPedId())
    SetVehicleNumberPlateText(veh, plate:gsub("%s+", ""))
    exports[Config.Fuel]:SetFuel(veh, 100.00)
    FreezeEntityPosition(veh, false)
end)


RegisterNetEvent('Polar-Dealership:client:testdrive',function()
    local veh = GetVehiclePedIsIn(PlayerPedId())
    local plate = GetVehicleNumberPlateText(veh)
    if plate == "FORSALE1" then
        local props = QBCore.Functions.GetVehicleProperties(veh)
        local hash = props.model
        local vehmodel = nil
        for k, v in pairs(Config.Dealership[PlayerJob.name]["vehicles"]) do
            for i=1, #v, 1 do
                local model = v[i]
                if hash == GetHashKey(model) then
                    vehmodel = v[i]
                    break
                end
            end
        end

       
        if vehmodel then
            SetVehicleNumberPlateText(veh, "TESTCAR1")
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
            exports[Config.Fuel]:SetFuel(veh, 100.00)
            FreezeEntityPosition(veh, false)
            TriggerServerEvent("qb-log:server:CreateLog", "testcar", PlayerJob.name, "blue", "**" .. GetPlayerName(PlayerId()).. "**: Testdriving: **" .. QBCore.Shared.Vehicles[vehmodel]["brand"].." "..QBCore.Shared.Vehicles[vehmodel]["name"] .. "**")
        else
            QBCore.Functions.Notify("You can't do that with this vehicle", "error")
        end
    else
        QBCore.Functions.Notify("You can't do that with this vehicle","error")
    end
end)

CreateThread(function() 
   --[[local tunerblip = AddBlipForCoord(139.34, -3028.73, 7.04)
	SetBlipSprite(tunerblip, 488)
	SetBlipDisplay(tunerblip, 4)
	SetBlipScale(tunerblip, 0.8)
	SetBlipAsShortRange(tunerblip, true)
	SetBlipColour(tunerblip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Tuner Shop")
	EndTextCommandSetBlipName(tunerblip)
]]
end)
--- Method to find all vehicles within 1 meter radius of a given location
--- @param coords vec3 - location
--- @return vehinarea array - array with all vehicle entities
local getVehiclesInAreas = function(coords)
    local vehinarea = {}
    local vehicles = GetGamePool('CVehicle')
    for i=1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)
        if distance < 1 then
            vehinarea[#vehinarea+1] = vehicles[i]
        end
    end
    return vehinarea
end


CreateThread(function()
    SetupGarageTargets()


end)


local garagetable = {}
local despawntable = {}

local sound = Config.Sound

function CreateTarget(names, coords1, handler, labels, icons, his, jobs)

    exports['qb-target']:AddBoxZone(names,  coords1, 1.5, 1.5, { name =  names, heading = 28.69, debug = his, minZ = coords1.z-0.5, maxZ =  coords1.z+0.5,}, 
    { options = {{ event = handler, icon = icons, label = labels, id = names, job = jobs }}, distance = 2 }) 

end




RegisterNetEvent('Polar-Dealership:Client:Garage', function(data) 
    local tab = data.id
    QBCore.Functions.TriggerCallback('Polar-Dealership:' .. tab, function(result) 
    if result then 

        
        garagetable[tab] = result
            
           
        enterwarehouse(spawns[tab].inside)
        setupexittarget(tab)
        for _, v in ipairs(result) do
           
           
            
            print(json.encode(v))
            print(json.encode(v[1]))
            print(json.encode(v[2]))
            print(json.encode(v[3]))
            getspot(tab, json.encode(v[2]))
            
        end
        
    
    end end)
   
end)

function clearcars()
    clearcars2("biketable")
    clearcars2("cartable")
    clearcars2("jdmtable")
end


function clearcars2(table)
    for k, v in pairs(Config.GarageSpots[table]) do
        vehinarea = getVehiclesInAreas(vector3(v.x, v.y, v.z))
        for i=1, #vehinarea do
            QBCore.Functions.DeleteVehicle(vehinarea[i])
        end
    end
end

function checkprice(table, model)
    for k, v in ipairs(garagetable[table]) do
        if json.encode(v[2]):gsub('"', '') == model then 
            local price = nil
            Wait(100)
            price = json.encode(v[3])
            openmenu(model, price, table, k)
        else
     
        end
    end
end

function getspot(table, model)
    local spot = Config.GarageSpots[table][math.random(1, #Config.GarageSpots[table])]
    local vehinarea = getVehiclesInAreas(vec3(spot.x, spot.y, spot.z))
    if #vehinarea ~= 0 then 
        Wait(100)
        getspot(table, model)
    else
        
        spawncar(model, spot, table)
    end
end

function spawncar(model, loc, table)
    local car = nil
    local p = model:gsub('"', '')
    QBCore.Functions.SpawnVehicle(p, function(veh)
        SetEntityHeading(loc.w)
        SetVehicleNumberPlateText(veh, "FORSALE")
        FreezeEntityPosition(veh, true)
        SetModelAsNoLongerNeeded(model)
        despawntable[p] = veh
        car = veh
       -- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    end, vector3(loc.x, loc.y, loc.z), true)
    exports['qb-target']:AddTargetEntity(car, {
        options = {
            {
                type = "client",
                event = "Polar-Dealership:client:CheckPrice",
                icon = "fas fa-car",
                label = "Check Price",
                cars = car,
                tables = table,
                model = p,
            },
        },
        distance = 3.0
    })
end

function outsidespawn(model, loc)

    QBCore.Functions.SpawnVehicle(model, function(veh)
        SetEntityHeading(loc.w)
        SetVehicleNumberPlateText(veh, "DELIVERY")
       -- FreezeEntityPosition(veh, true)
        SetModelAsNoLongerNeeded(model)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    end, vector3(loc.x, loc.y, loc.z), true)

end
function outsidespawnp(coord)
    SetupGarageTargets()

    Wait(100) if sound then TriggerServerEvent("InteractSound_SV:PlayOnSource", "LockerOpen", 0.1) end 
    DoScreenFadeOut(800) Wait(1850) SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0) SetEntityHeading(PlayerPedId(), coord.w) DoScreenFadeIn(900) ClearPedTasks(PlayerPedId())

    QBCore.Functions.Notify('Take the Vehicle to the Dealership!', 'success', 2500)
end
function enterwarehouse(coord)
    Wait(100) if sound then TriggerServerEvent("InteractSound_SV:PlayOnSource", "LockerOpen", 0.1) end 
    DoScreenFadeOut(800) Wait(1850) SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0) SetEntityHeading(PlayerPedId(), coord.w) DoScreenFadeIn(900) ClearPedTasks(PlayerPedId())
end
RegisterNetEvent('Polar-Dealership:client:CheckPrice', function(data)
    local p = data.cars
    local table = data.tables
    local model = data.model
    if table == nil then return end
    if model == nil then return end
    checkprice(table, model)
end)


function openmenu(model, price, table, number)
    local title = QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"]
    exports['qb-menu']:openMenu({
    {
        header = title .. " <p> ",
        icon = "fa-solid fa-clipboard",
        isMenuHeader = true
    },
    {
        header = "Spawn Code: " .. model,
        text = "Save This for Delivery",
        icon = "fa-solid fa-clipboard",
        isMenuHeader = true
    },
    {
        header = price,
        icon = "fa-solid fa-dollar-sign",
        text = '',
        isMenuHeader = true
    },
    {
        header = "Buy Vehicle",
        icon = "fa-solid fa-car",
        params = {
            event = "Polar-Dealerships:Client:BuyVehicle",
            args = {
                [1] = price,
                [2] = model,
                [3] = table,
                [4] = number,
            },
        }
    },
    {
        header = 'Close Menu',
        icon = "fa-solid fa-angle-left",
        params = {
            event = 'Polar-Dealerships:Client:Close'
        }
    },
    })
end

RegisterNetEvent('Polar-Dealerships:Client:BuyVehicle', function(args)
    local price = args[1]
    local model = args[2]
    local table = args[3]
    local number = args[4]
    QBCore.Functions.TriggerCallback('Polar-Dealership:RemoveMoney', function(result) 
       if result then 
        
        QBCore.Functions.Notify('Vehicle Purchased!', 'success', 2500)
       -- print(table)
       -- print(model)
      
        
        TriggerServerEvent('Polar-Dealership:Server:RemoveCar', model, table, number)
       
        outsidespawn(model, spawns[table].car)

        outsidespawnp(spawns[table].person)

        clearcars()

       else
            QBCore.Functions.Notify('Not Enough Money!', 'error', 2500)
        
       end
    end, price)
   
    
    
end)
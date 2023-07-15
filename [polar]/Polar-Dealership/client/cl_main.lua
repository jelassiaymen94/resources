local QBCore = exports['qb-core']:GetCoreObject()
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

    -- Boss Menu
    if PlayerJob.grade.level < Config.Dealership[PlayerJob.name].bossMenuThreshold then return end
    DealershipBossMenu = BoxZone:Create(Config.Dealership[PlayerJob.name].bossmenu, 1.0, 1.0, {
        name = 'DealershipBossMenu',
        heading = 0.00,
        minZ = Config.Dealership[PlayerJob.name].bossmenu.z - 1.0,
        maxZ = Config.Dealership[PlayerJob.name].bossmenu.z + 1.0,
        debugPoly = false
    })
    
    DealershipBossMenu:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inZone = true
            exports['qb-core']:DrawText('[E] - Manage '..PlayerJob.label, 'left')
            CreateThread(function()
                while inZone do
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed(38)
                        openBossMenu()
                    end
                    Wait(3)
                end
            end)
        else
            inZone = false
            exports['qb-core']:HideText()
        end
    end)
end

-- (Re)start events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    SetupPoly()
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

-- Radialmenu Event
RegisterNetEvent('Polar-Dealership:client:OpenShowroom', function()
    if DealershipShowroom:isPointInside(GetEntityCoords(PlayerPedId())) then
        openShowroom()
    end
end)

-- Sale related events
RegisterNetEvent('Polar-Dealership:client:sellConfirm',function(target, targetName, job)
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
                -- THIS LIMITS DEALERSHIPS TO THEIR OWN VEHICLES
                if vehmodel ~= nil then
                    -- SET OWNER
                    TriggerServerEvent('Polar-Dealership:server:setOwner', vehmodel, hash, target, job)

                    -- LOG
                    TriggerServerEvent("qb-log:server:CreateLog", "vehicleshop", "Vehicle purchased ("..PlayerJob.name..")", "red", "**"..targetName.."**: bought a **" .. QBCore.Shared.Vehicles[vehmodel]["brand"].." "..QBCore.Shared.Vehicles[vehmodel]["name"].. "** from "..GetPlayerName(PlayerId()))

                    -- Save properties
                    Wait(2000)
                    TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
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

-- Testdrive related event
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

        -- THIS LIMITS DEALERSHIPS TO THEIR OWN VEHICLES
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

CreateThread(function() -- Main thread for garage menus
    while true do
        Wait(3)
        local inRange = false
        if isLoggedIn and PlayerJob and Config.Dealership[PlayerJob.name] then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist = #(pos - Config.Dealership[PlayerJob.name].garage.xyz)
            if dist < 9 then
                inRange = true
                DrawMarker(39, Config.Dealership[PlayerJob.name].garage.xyz, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 242, 148, 41, 255, false, false, false, 1, false, false, false)
                if dist < 3 then
                    if IsPedOnFoot(ped) then
                        QBCore.Functions.DrawText3D(Config.Dealership[PlayerJob.name].garage.x, Config.Dealership[PlayerJob.name].garage.y, Config.Dealership[PlayerJob.name].garage.z, "~g~[E]~w~ - Open Garage Menu")
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent('Polar-Dealership:client:menu:OpenGarageMenu')
                        end
                    else
                        QBCore.Functions.DrawText3D(Config.Dealership[PlayerJob.name].garage.x, Config.Dealership[PlayerJob.name].garage.y, Config.Dealership[PlayerJob.name].garage.z, "~g~[E]~w~ - Store Vehicle")
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent('Polar-Dealership:client:menu:DeleteVehicleMenu')
                        end
                    end
                end
            end
        else
            Wait(2000)
        end
        if not inRange then Wait(2000) end
    end
end)

CreateThread(function() -- Blips
   --[[local tunerblip = AddBlipForCoord(139.34, -3028.73, 7.04)
	SetBlipSprite(tunerblip, 488)
	SetBlipDisplay(tunerblip, 4)
	SetBlipScale(tunerblip, 0.8)
	SetBlipAsShortRange(tunerblip, true)
	SetBlipColour(tunerblip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Tuner Shop")
	EndTextCommandSetBlipName(tunerblip)

    local redline = AddBlipForCoord(-566.0908, -933.0880, 23.8866)
	SetBlipSprite(redline, 488)
	SetBlipDisplay(redline, 4)
	SetBlipScale(redline, 0.6)
	SetBlipAsShortRange(redline, true)
	SetBlipColour(redline, 45)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Redline Performance")
	EndTextCommandSetBlipName(redline) -- -566.0908, -933.0880, 23.8866, 108.3232

 local luxuryblip = AddBlipForCoord(-566.0908, -933.0880, 23.8866)
	SetBlipSprite(luxuryblip, 488)
	SetBlipDisplay(luxuryblip, 4)
	SetBlipScale(luxuryblip, 0.7)
	SetBlipAsShortRange(luxuryblip, true)
	SetBlipColour(luxuryblip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Redline Performance")
	EndTextCommandSetBlipName(luxuryblip)]]
end)

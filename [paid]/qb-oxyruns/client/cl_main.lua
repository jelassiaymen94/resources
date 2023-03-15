local QBCore = exports[Config.CoreExport]:GetCoreObject()

local blip, packagePed, model, location, pedLocation, driverPed, buyerVeh, inZone
local task, canSpawnVehicle, collectedPackage, sellSpot = nil, true, Config.Deliveries, nil
local first, total, deliveries, canSell = true, 0, Config.Deliveries, false

-- ## Functions

local function ResetVar()
    task, mode, location, canSpawnVehicle, pedLocation, collectedPackage = nil, nil, nil, true, nil, Config.Deliveries
    deliveries, sellSpot, first, total, canSell, returned = Config.Deliveries, nil, true, 0, false, false
end

local function CreateBlip(x, y, z, id, text)
	blip = AddBlipForCoord(x, y, z)    
    SetBlipSprite(blip, id)
    SetBlipScale(blip, Config.BlipScale)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

local function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

local function DeletePed()
    if packagePed ~= nil then
        SetEntityAsNoLongerNeeded(packagePed)
    else 
        Citizen.Wait(10)
    end
end 

local function sendLocation()
    Citizen.Wait(Config.JobVehicleWait)
    CreateBlip(Config.VehicleLocations[location].vehiclePos.x, Config.VehicleLocations[location].vehiclePos.y, Config.VehicleLocations[location].vehiclePos.z, Config.PickupCarBlipSprite, Config.PickupCarBlipLabel)
    OxyStartEmail()
end 

local function SendSellLocation()
    Citizen.Wait(1250)
    QBCore.Functions.Notify('You will recieve an Email momentarily.', 'primary', Config.SellLocationWait - 1000)
    Citizen.Wait(Config.SellLocationWait)
    OxySellEmail()
    CreateBlip(Config.SellZones[sellSpot].waypoint.x, Config.SellZones[sellSpot].waypoint.y, Config.SellZones[sellSpot].waypoint.z, Config.SellAreaBlipSprite, Config.SellAreaBlipLabel)
end 

local function CreateOxyPed()
    local packagePedHash = GetHashKey(Config.PackagePed)
    pedLocation = math.random(1, #Config.PackagePedLocations)
    QBCore.Functions.LoadModel(packagePedHash)
    packagePed = CreatePed(28, packagePedHash, Config.PackagePedLocations[pedLocation].x, Config.PackagePedLocations[pedLocation].y, Config.PackagePedLocations[pedLocation].z - 1, Config.PackagePedLocations[pedLocation].w, false, false)
    SetEntityInvincible(packagePed, true)
    FreezeEntityPosition(packagePed, true)
    SetBlockingOfNonTemporaryEvents(packagePed, true)		
end

local function SpawnJobVehicle(model, x, y, z, w)
    local coords = vector4(x, y, z, w)
    QBCore.Functions.SpawnVehicle(model, function(veh)
        SetEntityHeading(veh, coords.w)
        SetEntityAsMissionEntity(veh, true, true)
        SetVehicleDoorsLocked(veh, 2)
        TriggerEvent(Config.VehicleKeysTrigger, GetVehicleNumberPlateText(veh))
        exports[Config.FuelExport]:SetFuel(veh, 100)
        LicensePlate = GetVehicleNumberPlateText(veh)
        jobvehicle = veh
        canSpawnVehicle = false
    end, coords, true)
end

local function SpawnBuyer()
    if task == 'sellToBuyer' then 
        Citizen.Wait(Config.BuyerSpawnWait)
        canSell = true
        local sellZone = Config.SellZones
        local x = sellZone[sellSpot].buyerSpawn.x
        local y = sellZone[sellSpot].buyerSpawn.y
        local z = sellZone[sellSpot].buyerSpawn.z
        local w = sellZone[sellSpot].buyerSpawn.w
        local pedHash = GetHashKey(Config.BuyerPeds[math.random(1, #Config.BuyerPeds)])
        local vehHash = GetHashKey(Config.BuyerVehicles[math.random(1, #Config.BuyerVehicles)])

        QBCore.Functions.LoadModel(vehHash)
        QBCore.Functions.LoadModel(pedHash)

        driverPed = CreatePed(28, pedHash, x, y, z, 0, true, false)
        buyerVeh = CreateVehicle(vehHash, x, y, z, w, true, true)
        TaskWarpPedIntoVehicle(driverPed, buyerVeh, -1)
        Citizen.Wait(100)
        TaskVehicleDriveToCoord(driverPed, buyerVeh, sellZone[sellSpot].buyerEndpoint.x, sellZone[sellSpot].buyerEndpoint.y, sellZone[sellSpot].buyerEndpoint.z, 10.0, false, vehHash, 8388614, 2.0, 0)
		exports[Config.TargetExport]:AddTargetEntity(buyerVeh, {
            options = {
                {
                    type = 'client',
                    event = 'qb-oxyruns:client:deliverPackage',
                    icon = 'fas fa-box',
                    label = 'Handoff Package'
                }
            },
		  distance = 2.5,
        })
    end
end 

local function UnloadBuyer()
    if DoesEntityExist(driverPed) and DoesEntityExist(buyerVeh) then
        TaskVehicleDriveWander(driverPed, buyerVeh, 12.0, 1074528293)
        SetPedAsNoLongerNeeded(driverPed)
        SetEntityAsNoLongerNeeded(buyerVeh)
    end

    SetModelAsNoLongerNeeded(pedHash)
    SetModelAsNoLongerNeeded(vehHash)
end

local function DeletePed()
    if packagePed ~= nil then
        SetEntityAsNoLongerNeeded(packagePed)
    else 
        Citizen.Wait(10)
    end
end 

local function HandleJobFinish()
    TriggerServerEvent('qb-oxyruns:server:finishJob', true, total)
    UnloadBuyer()
    DeletePed()
    DeleteBlip()
    ResetVar()
end

local function ToggleDoor(vehicle, door)
    if GetVehicleDoorLockStatus(vehicle) ~= 2 then
        if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
            SetVehicleDoorShut(vehicle, door, false)
        else
            SetVehicleDoorOpen(vehicle, door, false)
        end
    end
end

local function destroyProp(entity)
    SetEntityAsMissionEntity(entity)
    Citizen.Wait(5)
    DetachEntity(entity, true, true)
    Citizen.Wait(5)
    DeleteObject(entity)
end

local function startBox()
    local pos = GetEntityCoords(PlayerPedId(), true)
    RequestAnimDict('anim@heists@box_carry@')
    while (not HasAnimDictLoaded('anim@heists@box_carry@')) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 5.0, -1, -1, 50, 0, false, false, false)
    RequestModel('prop_cs_cardbox_01')
    while not HasModelLoaded('prop_cs_cardbox_01') do
        Citizen.Wait(0)
    end
    boxProp = CreateObject('prop_cs_cardbox_01', pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(boxProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
end

local function stopBox()
    if DoesEntityExist(boxProp) then 
        ClearPedTasks(PlayerPedId())
        destroyProp(boxProp)
    end
end

local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

local function pPedAnim()
    if DoesEntityExist(packagePed) then 
        loadAnimDict('mp_safehouselost@')
        if (IsEntityPlayingAnim(packagePed, 'mp_safehouselost@', 'package_dropoff', 3)) then 
            TaskPlayAnim(packagePed, 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        else
            TaskPlayAnim(packagePed, 'mp_safehouselost@', 'package_dropoff', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        end     
    end
end

-- ## Exports

local function GetOxyTask()
    return task
end
exports('GetTask', GetOxyTask)

local function OxyCanSell()
    return canSell
end
exports('CanSell', OxyCanSell)

local function OxyLocation()
    return location
end
exports('GetLocation', OxyLocation)

-- ## Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    task = nil
    Citizen.Wait(2000)
    if QBCore.Functions.HasItem(Config.SusPackItem) then 
        startBox()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    task = nil
    DeletePed()
    DeleteBlip()
    ResetVar()
end)

RegisterNetEvent('qb-oxyruns:client:jobMenu', function(data)
    exports[Config.MenuExport]:openMenu({
        {
            header = Config.JobMenuHeader,
            isMenuHeader = true,
        },
        {
            id = 1,
            header = 'Start Oxy Run',
            txt = '$'..Config.JobStartPrice,
            params = {
                event = 'qb-oxyruns:client:buyInfo',
                args = {
                    money = Config.JobStartPrice,
                }
            }
        },
    })
end)

RegisterNetEvent('qb-oxyruns:client:buyInfo', function(data)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local dist = #(pos - vector3(Config.JobStartPedLocation.x, Config.JobStartPedLocation.y, Config.JobStartPedLocation.z))
    if dist < 4.5 then
        QBCore.Functions.TriggerCallback('qb-oxyruns:server:getSellSpot', function(spotCB)
            if spotCB ~= false then
                sellSpot = spotCB
                location = math.random(1, #Config.VehicleLocations)
                local inWay = IsAnyVehicleNearPoint(Config.VehicleLocations[location].vehiclePos.x, Config.VehicleLocations[location].vehiclePos.y, Config.VehicleLocations[location].vehiclePos.z, 2.0)
                local hasItem = QBCore.Functions.HasItem(Config.PhoneItem)
                if hasItem then
                    if not inWay then 
                        if canSpawnVehicle then 
                            QBCore.Functions.TriggerCallback('qb-oxyruns:server:cashCheck', function(money)
                                if money then 
                                    QBCore.Functions.Progressbar('oxy_pay', 'Talking to Jimmy', Config.BuyInfoWait, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                        animDict = 'misscarsteal4@actor',
                                        anim = 'actor_berating_loop',
                                        flags = 49,
                                    }, {}, {}, function()
                                        local money = data.money
                                        task = 'pickupVehicle'
                                        SpawnJobVehicle(Config.VehicleLocations[location].vehicle, Config.VehicleLocations[location].vehiclePos.x, Config.VehicleLocations[location].vehiclePos.y, Config.VehicleLocations[location].vehiclePos.z, Config.VehicleLocations[location].vehiclePos.w)
                                        sendLocation()
                                        QBCore.Functions.Notify('Please wait momentarily for an email regarding job instructions.', 'success', 7500)
                                    end, function()
                                        QBCore.Functions.Notify('You cancelled the action.', 'error', 7500)
                                    end)
                                else 
                                    QBCore.Functions.Notify('You do not have enough money.', 'error', 5000)
                                end         
                            end, data.money)
                        else 
                            QBCore.Functions.Notify('You have a vehicle out already.', 'error', 7500)
                        end
                    else 
                        QBCore.Functions.Notify('Theres a vehicle in the way.', 'error')
                    end
                else
                    QBCore.Functions.Notify('You need a phone.', 'error')
                end
            else
                QBCore.Functions.Notify('I dont have any jobs available at the moment.', 'error', 4500)
            end
        end)
    end
end)

RegisterNetEvent('qb-oxyruns:client:startBoxAnim', function()
    local hasItem = QBCore.Functions.HasItem(Config.SusPackItem)
    if hasItem then 
        stopBox()
        Citizen.Wait(500)
        startBox()
    else
        stopBox()
    end
end)

RegisterNetEvent('qb-oxyruns:client:takePackages', function()
    if task == 'pickupPackage' and collectedPackage > 0 then
        local hasItem = QBCore.Functions.HasItem(Config.SusPackItem)
        if not hasItem then
            pPedAnim()
            QBCore.Functions.Progressbar('oxy_pay', 'Taking Package', Config.PackageGrabTime, false, true, { 
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'mini@repair',
                anim = 'fixing_a_ped',
                flags = 49,
            }, {}, {}, function() 
                QBCore.Functions.TriggerCallback('qb-oxyruns:server:checkWeight', function(cb)
                    if cb then
                        if collectedPackage == 1 then
                            task = 'sendToBuyer'
                            collectedPackage = collectedPackage - 1
                            startBox()
                            DeleteBlip()
                            QBCore.Functions.Notify('You collected all available packages.', 'success', 4500)
                        else
                            startBox()
                            collectedPackage = collectedPackage - 1
                            QBCore.Functions.Notify('You collected a package, '..collectedPackage..' more to collect.', 'success', 1500)
                        end
                    else 
                        QBCore.Functions.Notify('Your inventory is too heavy.', 'error', 5000) 
                    end
                end)
            end, function() 
                QBCore.Functions.Notify('You canceled the action.', 'error', 5000)
            end)
        else
            QBCore.Functions.Notify('You already have a heavy box.', 'error', 7500)
        end
    else 
        QBCore.Functions.Notify('You already collected your packages.', 'error', 5000) 
    end
end) 

RegisterNetEvent('qb-oxryuns:client:returnVehicle', function()
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true, false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
    returned = true
end)

RegisterNetEvent('qb-oxryuns:client:handleJobFinish', function()
    if task == 'jobDone' and returned then 
        HandleJobFinish()
    end
end)

RegisterNetEvent('qb-oxryuns:client:setState', function(Spotters, state)
    Config.SellZones[Spotters].busy = state
end)

RegisterNetEvent('qb-oxyruns:client:deliverPackage', function()
    canSell = false
    if not QBCore.Functions.HasItem(Config.SusPackItem) then QBCore.Functions.Notify('You do not have a package.', 'error', 7500) return end
    exports[Config.TargetExport]:RemoveTargetEntity(buyerVeh, 'Handoff Package')
    if task == 'sellToBuyer' and inZone then
        stopBox()
        ToggleDoor(QBCore.Functions.GetClosestVehicle(), 5)
        QBCore.Functions.Progressbar('oxy_deliver', 'Delivering Package', Config.DeliverTime, false, false, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 49,
        }, {}, {}, function() -- Play When Done
            if deliveries == 1 then 
                task = 'jobDone'
                deliveries = deliveries - 1
                total = total + 1
                TriggerServerEvent('qb-oxyruns:server:deliverPackage', true)
                UnloadBuyer()
                OxyPoliceCall()
                DeleteBlip()
                OxyReturnVehEmail() 
                CreateBlip(Config.JobEndLocation.x, Config.JobEndLocation.y, Config.JobEndLocation.z, Config.JobEndBlipSprite, Config.JobEndBlipLabel)
                QBCore.Functions.Notify('You have completed your deliveries, please wait for an email.', 'success', 20000)
            else 
                deliveries = deliveries - 1
                total = total + 1
                TriggerServerEvent('qb-oxyruns:server:deliverPackage', true)
                UnloadBuyer()
                OxyPoliceCall()
                SpawnBuyer()
            end
        end, function() -- Play When Cancel
            QBCore.Functions.Notify('You cancelled the action.', 'error', 7500)
        end)
        Citizen.Wait(Config.DeliverTime + 600)
        ToggleDoor(QBCore.Functions.GetClosestVehicle(), 5)
    end
end)

Citizen.CreateThread(function()
    while true do 
        if task == 'pickupVehicle' then 
            local Ped = PlayerPedId()
            if GetVehicleNumberPlateText(jobvehicle) == LicensePlate and IsPedInVehicle(Ped, jobvehicle, false) then
                task = 'pickupPackage'
                DeleteBlip()
                QBCore.Functions.Notify('Please wait momentarily for an Email.', 'primary', Config.PackagePedWaitTime - 1000)
                Citizen.Wait(Config.PackagePedWaitTime)
                CreateOxyPed()
                CreateBlip(Config.PackagePedLocations[pedLocation].x, Config.PackagePedLocations[pedLocation].y, Config.PackagePedLocations[pedLocation].z, Config.PickupPackagesBlipSprite, Config.PickupPackagesBlipLabel)
                OxyPickupEmail()
            end
        elseif task == 'sendToBuyer' then
            task = 'sellToBuyer'
            SendSellLocation()
	    end
        Citizen.Wait(1000)
    end 
end)

Citizen.CreateThread(function() 
    for k, v in pairs(Config.SellZones) do
        local SellZone = PolyZone:Create(v.zones, {
            name = v.label,
            minZ = v.minZ,
            maxZ = v.maxZ,
            debugPoly = Config.Debug
        })
        SellZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                if task == 'sellToBuyer' then 
                    inZone = true
                    QBCore.Functions.Notify('You are at the correct location, stay here. Buyer is on their way.', 'success', 15000) 
                    if first then 
                        first = false
                        SpawnBuyer()
                    end
                end
            else
                if task == 'sellToBuyer' then 
                    inZone = false
                    DeleteBlip()
                    QBCore.Functions.Notify('You left the area, the buyer will leave if you do not return.', 'error', 15000) 
                end
            end
        end)
    end
end)
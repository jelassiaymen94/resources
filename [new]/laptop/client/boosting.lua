local QBCore = exports['qb-core']:GetCoreObject()
local Contracts = {}
local CZone = nil
local CZone2 = nil
local NetID = nil
local missionBlip = nil
local inZone = false
local inVin = false
local dropoffBlip = nil

local inQueue = false

local currentCops = 0

RegisterNetEvent('Polar-Laptop:Client:UpdatePhone', function(amount, totalamount)
    TriggerEvent('qb-phone:client:CustomNotification',
    Lang:t('boosting.info.phonenotify'),
    "Hacking - " .. amount .. "/" .. totalamount,
    "fas fa-user-secret",
    "#4cf5e4",
    2000000
)
end)
---- Notify functions ----

local function Notify(text, type, time)
  
        TriggerEvent('qb-phone:client:CustomNotification',
            Lang:t('boosting.info.phonenotify'),
            text,
            "fas fa-user-secret",
            "#4cf5e4",
            time
        )
  
end

-- ALL THE BLIP FUNCTIONS --
local function DelayDelivery()
    SetTimeout(math.random(10, 30 * 1000), function()
        TriggerServerEvent('laptop:server:FinalDestination')
    end)
end

function UpdateBlips()
    local car = NetworkGetEntityFromNetworkId(NetID)
    local State = Entity(car).state.Boosting
    if State and State.boostHacks then
        CreateThread(function()
        while true do
            if State.boostHacks <  State.TotalBoosts  then

                local checks = 0
                if DoesEntityExist(car) then
                    local pos = GetEntityCoords(car)
                    TriggerServerEvent('laptop:server:SyncBlips', pos, NetID)
                else
                    checks = checks + 1
                    if checks >= 3 and not DoesEntityExist(car) then
                        TriggerServerEvent('laptop:server:CancelBoost', NetID, Plate)
                    end 
                end


                Wait((math.floor(Config.Boosting.Frequency * 1000) / (State.boostHacks + 1)))
                State = Entity(car).state.Boosting  
                print('1')    
                print(State.boostHacks)
                print(State.TotalBoosts)  
            else

                if DoesEntityExist(car) then
                    TriggerServerEvent('laptop:server:SyncBlips', nil, NetID)
                --Notify(Lang:t("boosting.success.disable_tracker"), 'success', 7500)
                
                    print(State.boostHacks)
                    print(State.TotalBoosts)  
                    DelayDelivery()

                end

            end
        end
        end)
    end
end

local function CheckVin(NetworkID)
    if IsCheckingVin then return end
    IsCheckingVin = true
    local entity = NetworkGetEntityFromNetworkId(NetworkID)
    if DoesEntityExist(entity) then
        QBCore.Functions.Progressbar('checking_vin', 'Checking VIN', 10000, false, true,
            { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = '"anim@amb@clubhouse@tutorial@bkr_tut_ig3@"@',
                anim = 'machinic_loop_mechandplayer',
                flags = 1,
            }, {}, {}, function() -- Play When Done
                local reply

                if not Entity(entity).state.vinchecked then
                    local res = promise:new()
                    QBCore.Functions.TriggerCallback('laptop:server:checkVin', function(cb)
                        res:resolve(cb)
                    end, NetworkID)
                    reply = Citizen.Await(res)
                else
                    reply = Entity(entity).state.vinchecked.reply
                end
                Wait(100)
                if reply == "failed" then
                    QBCore.Functions.Notify("The vin number is " ..
                        Entity(entity).state.vinchecked.vinnumber)
                elseif reply == "found" then
                    QBCore.Functions.Notify("The vin number is scratched!", "error")
                end
                IsCheckingVin = false
                ClearPedTasks(cache.ped)
            end, function() -- Play When Cancel
                ClearPedTasks(cache.ped)
                IsCheckingVin = false
            end)
    end
end

local AntiSpam = false -- Just a true / false boolean to not spam the shit out of the server.
local carCoords = nil
-- sends information from server to client that we found the car and we started lockpicking
RegisterNetEvent('lockpicks:UseLockpick', function()
   -- if type == 'special' then
    if AntiSpam then return end
    if not NetID then return end
    local car = NetworkGetEntityFromNetworkId(NetID)
    if DoesEntityExist(car) then
        local dist = #(GetEntityCoords(car) - GetEntityCoords(cache.ped))
        if dist <= 3.5 then -- 2.5 is the distance in qbcore vehiclekeys if you use more or less then please edit this.
            if #(vector3(carCoords.x, carCoords.y, carCoords.z) - GetEntityCoords(car)) <= 6.9 then
                AntiSpam = true
                TriggerServerEvent('laptop:server:SpawnPed')
                RemoveBlip(missionBlip)
                UpdateBlips()
                SendNUIMessage({
                    action = "boosting/setcancel",
                    data = {
                        status = false
                    }
                })
                exports['qb-dispatch']:CarBoosting(vehicle)
            else
                TriggerServerEvent('laptop:server:CancelBoost', NetID, Plate)
            end
        end
    end
   -- end 
end)

-- MISSION STARTER --

-- Sends information from server to client that it will start now
RegisterNetEvent('Polar-Laptop:Client:DestroyCar', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local currentHealth = GetEntityHealth(vehicle)
    print(vehicle)
    print(currentHealth)
    if currentHealth > 20 then
        SetEntityHealth(vehicle, currentHealth - 20)
    end
end)
RegisterNetEvent('laptop:client:MissionStarted',
    function(netID, coords, plate) -- Pretty much just resets every boolean to make sure no issues will occour.
        NetID = netID
        carCoords = coords
        AntiSpam = false
        inZone = false

        -- send plate number
        SendNUIMessage({
            action = "boosting/horseboosting",
            data = {
                plate = plate or "Unknown?"
            }
        })
        --print(coords)

        if CZone then
            CZone:remove()
            CZone = nil
        end

        if missionBlip then RemoveBlip(missionBlip) end

        if coords then
            if Config.Boosting.Debug then SetNewWaypoint(coords.x, coords.y) end

            missionBlip = AddBlipForRadius(coords.x + math.random(-100, 100), coords.y + math.random(-100, 100), coords
                .z
                , 250.0)
            SetBlipAlpha(missionBlip, 150)
            SetBlipHighDetail(missionBlip, true)
            SetBlipColour(missionBlip, 1)
            SetBlipAsShortRange(missionBlip, true)
        end
    end)

RegisterNUICallback('boosting/start', function(data, cb)
    QBCore.Functions.TriggerCallback('laptop:server:CanStartBoosting', function(result)
     --   print(result)
        if result == "success" then
            --TriggerServerEvent('laptop:server:StartBoosting', data.id, currentCops)
            cb({
                status = 'success',
                message = Lang:t('boosting.laptop.boosting.success')
            })
        elseif result == "cops" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.boosting.cops')
            })
        elseif result == "running" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.boosting.running')
            })
        elseif result == "notfound" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.boosting.notfound')
            })
        elseif result == "notenough" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.boosting.notenough')
            })
        elseif result == "busy" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.boosting.busy')
            })
        elseif result == "error" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.boosting.error')
            })
        end
    end, currentCops, data.id)
end)








-- DELIVERING VEHICLE --
local function DeliverCar()
    QBCore.Functions.Notify(Lang:t('boosting.error.get_away'), 'error', 2500)
    local car = NetworkGetEntityFromNetworkId(NetID)
    FreezeEntityPosition(car, true)
    SetVehicleDoorsLocked(car, 2)
    if CZone then
        CZone:remove()
        CZone = nil
    end

    Wait(7500)
    Notify(Lang:t('boosting.success.youllbepaid'), 'success', 7500)
    while #QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(car), 100.0) > 0 do
        Wait(7500)
    end
    TriggerServerEvent('laptop:server:finishBoost', NetID)
    RemoveBlip(dropoffBlip)
end

local function StartVin()
    QBCore.Functions.Progressbar('vin_scratching', 'Scratching VIN', 7000, false, true,
        { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = '"anim@amb@clubhouse@tutorial@bkr_tut_ig3@"@',
            anim = 'machinic_loop_mechandplayer',
            flags = 1,
        }, {}, {}, function() -- Play When Done
            local car = NetworkGetEntityFromNetworkId(NetID)
            local model = GetDisplayNameFromVehicleModel(GetEntityModel(car)):lower()
            local mods = QBCore.Functions.GetVehicleProperties(car)
            TriggerServerEvent("laptop:server:fuckvin", NetID, model, mods)
            TriggerServerEvent('laptop:server:finishBoost', NetID, true)
            Entity(car).state.isvinCar = false
            exports['qb-target']:RemoveTargetEntity(car, "Scratch Vin")
            ClearPedTasks(cache.ped)
        end, function() -- Play When Cancel
            ClearPedTasks(cache.ped)
        end)
end

local function MeVinYeah()
    local car = NetworkGetEntityFromNetworkId(NetID)
    if not DoesEntityExist(car) then return end

    local state = Entity(car).state
    if state.isvinCar then
        exports['qb-target']:AddTargetEntity(car, {
            options = {
                {
                    action = function()
                        StartVin()
                    end,
                    canInteract = function()
                        return inVin and state.isvinCar
                    end,
                    label = "Scratch Vin",
                    icon = "fas fa-mask"
                },
            },
            distance = 2.0
        })
    else
        TriggerServerEvent('laptop:server:finishBoost', NetID, true)
    end
end

local function VehicleCheck(isvin)
    local car = cache.vehicle
    if car and NetID and car == NetworkGetEntityFromNetworkId(NetID) then
        if not GetIsVehicleEngineRunning(cache.vehicle) then
            if isvin then
                MeVinYeah()
            else
                DeliverCar()
            end
        end
    end
end

RegisterNetEvent('laptop:client:ReturnCar', function(coords)
    -- CZone = CircleZone:Create(coords, 15, {
    --     name = "NewReturnWhoDis",
    --     debugPoly = Config.Boosting.Debug,
    -- })

    local function InSide()
        VehicleCheck()
    end

    CZone = lib.zones.sphere({
        coords = coords,
        radius = 15,
        inside = InSide,
        debug = Config.Boosting.Debug
    })

    local info = {
        ['blip'] = {
            ['Text'] = Lang:t('boosting.blip.dropoff'),
            ['Coords'] = coords
        },
    }

    -- CZone:onPlayerInOut(function(isPointInside)
    --     if isPointInside then
    --         inZone = true
    --         VehicleCheck()
    --     else
    --         inZone = false
    --     end
    -- end)

    Notify(Lang:t('boosting.success.gps_dropoff'), 'success', 7500)

    dropoffBlip = AddBlipForCoord(info['blip'].Coords.x, info['blip'].Coords.y, info['blip'].Coords.z)
    SetBlipSprite(dropoffBlip, 326)
    SetBlipScale(dropoffBlip, 1.0)
    SetBlipColour(dropoffBlip, 40)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info['blip'].Text)
    EndTextCommandSetBlipName(dropoffBlip)
    SetBlipFlashTimer(dropoffBlip, 5000)
end)

RegisterNetEvent("laptop:client:ToVinScratch", function(coords)
    local function Inside()
        VehicleCheck(true)
    end
    CZone = lib.zones.sphere({
        coords = coords,
        radius = 15,
        inside = Inside,
        onEnter = function()
            inVin = true
        end,
        onExit = function()
            inVin = false
        end,
        debug = Config.Boosting.Debug
    })
    local info = {
        blip = {
            text = Lang:t('boosting.blip.vinscratch'),
            coords = coords
        }
    }
    Notify(Lang:t('boosting.success.vin_dropoff'), "success", 7000)
    dropoffBlip = AddBlipForCoord(info.blip.coords.x, info.blip.coords.y, info.blip.coords.z)
    SetBlipSprite(dropoffBlip, 326)
    SetBlipScale(dropoffBlip, 1.0)
    SetBlipColour(dropoffBlip, 40)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.blip.text)
    EndTextCommandSetBlipName(dropoffBlip)
    SetBlipFlashTimer(dropoffBlip, 5000)
end)

-- Just a netevent that retracts all the booleans and properly resets the client --
RegisterNetEvent('laptop:client:finishContract', function(table)
    if CZone then
        CZone:remove()
        CZone = nil
    end
    if CZone2 then
        CZone2:remove()
        CZone2 = nil
    end
    NetID = nil
    if missionBlip then
        RemoveBlip(missionBlip)
        missionBlip = nil
    end
    if dropoffBlip then
        RemoveBlip(dropoffBlip)
        dropoffBlip = nil
    end
    inZone = false

    Contracts = table

    SendNUIMessage({ action = 'booting/delivered' })
end)


-- ** HACKING THE VEHICLE ** --
local ui = {
    "numeric",
    "alphabet",
    "alphanumeric",
    "greek",
    "braille",
    "runes"
}

local currentHacking = false

RegisterNetEvent('laptop:client:HackCar', function()
    -- Makes it so if they are doing hacking or whatever it will not let them do it again, as people could hard spam before the delay was added --
    if currentHacking then return end
    currentHacking = true
    local ped = cache.ped
    if haveItem(Config.Boosting.HackingDevice) then
        if cache.vehicle then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if GetPedInVehicleSeat(vehicle, 0) then
               
                local car = cache.vehicle
                local State = Entity(car).state.Boosting

            if State and State.boostHacks < State.TotalBoosts and not State.boostCooldown then

                exports['Polar-UI']:Scrambler(function(success)
                    if success then
                        TriggerServerEvent('laptop:server:SyncPlates', true)
                        currentHacking = false
                    else
                        TriggerServerEvent('laptop:server:SyncPlates', false)
                        currentHacking = false
                    end
                end, ui[math.random(1, #ui)], 30, 0)
            else
                --QBCore.Functions.Notify("You Cannot Hack Right now", 'error', 2500)
                currentHacking = false
            end
           
            else
                QBCore.Functions.Notify("You need to be in the front passenger seat", 'error', 2500)
            end
        else
            currentHacking = false
        end
    else
        currentHacking = false
    end
end)


if Config.Boosting.Debug then
    RegisterCommand('hackcar', function()
        if not Config.Boosting.Debug then return end

        TriggerEvent('laptop:client:HackCar')
    end, false)
end





-- ** EVERYTHING TO DO WITH PEDS ATTACKING YOU ** --

-- Gets the ped from the server side and then gives them tasks and weapons on the client side.
RegisterNetEvent('laptop:client:SpawnPeds', function(netIds, Location)
    for i = 1, #netIds do
        -- Get the Ped --
        local APed = NetworkGetEntityFromNetworkId(netIds[i])

        -- health and armor --
        SetEntityMaxHealth(APed, Location.peds[i].health)
        SetEntityHealth(APed, Location.peds[i].health)
        SetPedArmour(APed, Location.peds[i].armor)

        -- Relationship --
        SetPedAsCop(APed, true)
        SetPedRelationshipGroupHash(APed, joaat("HATES_PLAYER"))

        -- Weapon Stuff --
        GiveWeaponToPed(APed, joaat(Location.peds[i].weapon), 250, false, true)

        -- combat stuff --
        SetCanAttackFriendly(APed, false, true)
        SetPedCombatMovement(APed, 3)
        SetPedCombatRange(APed, 2)
        SetPedCombatAttributes(APed, 46, true)
        SetPedCombatAttributes(APed, 0, false)
        SetPedAccuracy(APed, 60)
        SetPedCombatAbility(APed, 100)
        TaskCombatPed(APed, cache.ped, 0, 16)
        SetPedKeepTask(APed, true)
        SetPedSeeingRange(APed, 150.0)
        SetPedHearingRange(APed, 150.0)
        SetPedAlertness(APed, 3)


        -- other shit --
        SetPedDropsWeaponsWhenDead(APed, false)
        SetPedFleeAttributes(APed, 0, 0)
        TaskGoStraightToCoord(APed, Location.carCoords.x, Location.carCoords.y, Location.carCoords.z, 1, -1, 0.0, 0.0)
    end
end)


---- ALL THE BLIP SYNCS ----
local blips = {} -- Stores all the blips in a table so that PD can see multiple blips at the same time

-- The event that does everything for the blips, checks if the client is police then checks if the blip is active and if it is then remove it and spawn a new
RegisterNetEvent('laptop:client:SyncBlips', function(coords, newNet)
    if not Config.Boosting.Debug and not isPolice() then
      --  print("Not police")
        return
    end
   -- print(coords, newNet)
    if blips[newNet] then RemoveBlip(blips[newNet]) end

    if coords then
        blips[newNet] = AddBlipForRadius(coords.x + math.random(-5, 5), coords.y + math.random(-5, 5), coords.z, 35.0)
        SetBlipHighDetail(blips[newNet], true)
        SetBlipColour(blips[newNet], 1)
        SetBlipAsShortRange(blips[newNet], true)
    end
end)







-- ** CONTRACT HANDLER ** --

-- Sends the information to client when their contracts update
RegisterNetEvent('laptop:client:ContractHandler', function(table, currentdate)
    if not table then return end
    Contracts = table
    if not display then return end

    SendNUIMessage({
        action = 'receivecontracts',
        contracts = table,
        serverdate = currentdate
    })
end)

-- Handles state right when the player selects their character and location.
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('laptop:server:GetContracts', function(result)
        Contracts = result
        if Contracts and #Contracts > 0 then
            SendNUIMessage({
                action = 'receivecontracts',
                contracts = result
            })
        end
    end)
end)

RegisterNUICallback('boosting/getcontract', function(_, cb)
    cb({
        contracts = Contracts,
    })
end)




-- ** DENY CONTRACTS ** --
local canDeny = true

local function DelayRQ()
    SetTimeout(10000, function()
        canDeny = true
    end)
end

RegisterNUICallback('boosting/deny', function(data, cb)
    local contract = data.contractID
    if not canDeny then
        cb({
            status = 'error',
            message = Lang:t('boosting.laptop.must_wait')
        })
        return
    end

    QBCore.Functions.TriggerCallback('laptop:server:DeclineContract', function(result)
        if result == "success" then
            cb({
                status = 'success',
                message = Lang:t('boosting.laptop.declinedboost')
            })
        else
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.try_again')
            })
        end
        canDeny = false
        DelayRQ()
    end, contract)
end)


-- ** TRANSFER CONTRACTS ** --

-- Transfer Boosts between players --
RegisterNUICallback('boosting/transfer', function(data, cb)
    local id = data.playerid
    local contract = data.contractID
    QBCore.Functions.TriggerCallback('laptop:server:TransferContracts', function(result)
        if result == "success" then
            cb({
                status = 'success',
                message = Lang:t('boosting.laptop.transfer.success', { id = id })
            })
        elseif result == "self" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.transfer.self')
            })
        elseif result == "notfound" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.transfer.notfound')
            })
        elseif result == "full" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.transfer.full')
            })
        elseif result == "error" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.transfer.error')
            })
        end
    end, id, contract)
end)

-- Cancel Contract --
-- Todo: add the logic, Zoo's work 🙂 --
RegisterNUICallback("boosting/cancel", function(data, cb)
    TriggerServerEvent('laptop:server:CancelBoost', NetID, nil, true)
    cb("success")
end)


-- Queue Functions --
RegisterNUICallback('boosting/queue', function(data, cb)
    QBCore.Functions.TriggerCallback('laptop:server:joinQueue', function(result)
        if result == "success" then
            if data.status then
                cb({
                    status = 'success',
                    message = Lang:t('boosting.laptop.queue.success')
                })
            else
                cb({
                    status = 'success',
                    message = Lang:t('boosting.laptop.queue.successquit')
                })
            end
        elseif result == "running" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.queue.running')
            })
        elseif result == "inqueue" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.queue.inqueue')
            })
        elseif result == "error" then
            cb({
                status = 'error',
                message = Lang:t('boosting.laptop.queue.error')
            })
        end
    end, data.status)
end)

RegisterNetEvent('laptop:client:QueueHandler', function(value)
    inQueue = value
end)




RegisterNUICallback("boosting/getqueue", function(_, cb)
    cb(inQueue)
end)

-- Gets all the reps --
-- Getters for when you open the boost app --
RegisterNUICallback("boosting/getrep", function(_, cb)
    local data = {
        rep = PlayerData.metadata['carboostrep'] or 0,
        repconfig = Config.Boosting.TiersPerRep
    }
    cb(data)
end)



RegisterNUICallback("boosting/expire", function(data, cb)
  --  print(data["id"])
    cb("ok")
end)

CreateThread(function()
    exports['qb-target']:AddGlobalVehicle({
        options = {
            {
                label = "Check Vin",
                icon = "fas fa-car-rear",
                action = function(entity)
                    CheckVin(NetworkGetNetworkIdFromEntity(entity))
                end,
                canInteract = function(entity)
                    return isPolice() and IsThisModelACar(GetEntityModel(entity))
                end
            }
        },
        distance = 1.5
    })
end)

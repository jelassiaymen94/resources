local QBCore = exports['qb-core']:GetCoreObject()

local copsCalled = false

local lootedtrucks = {}
local robbedplates = {}

--- Method to send an alert to cops and set a 5 minute cooldown for alerting cops
--- @return nil
local AlertCops = function()
    if copsCalled then return end
    copsCalled = true
    exports['qb-dispatch']:BankTruckRobbery(camId)
    --TriggerServerEvent('police:server:policeAlert', 'Banktruck Robbery') -- Regular QBCore

    CreateThread(function()
        Wait(1*60*1000)
        copsCalled = false
    end)
end



--- Method to spawn guards inside the truck and set it lootable
--- @param veh number - Vehicle entity
--- @return nil
local robTruck = function(veh)
    local chance = math.random(1,100)

    local blake = 'mp_s_m_armoured_01' -- back 2
    RequestModel(blake)
    while not HasModelLoaded(blake) do Wait(0) end
    local guard4 = CreatePedInsideVehicle(veh, 4, blake, -1, 1, 0.0)  -- back 2
    GiveWeaponToPed(guard4, 'weapon_heavypistol', 420, 0, 1)
    SetPedMaxHealth(guard4, 2000)
    SetPedAccuracy(guard4, 50)
    SetPedDropsWeaponsWhenDead(guard4, false)
    SetPedRelationshipGroupDefaultHash(guard4, 'COP')
    SetPedRelationshipGroupHash(guard4, 'COP')
    SetPedAsCop(guard4, true)
    SetCanAttackFriendly(guard4, false, true)
    TaskCombatPed(guard4, PlayerPedId(), 0, 16)
    
    local blake = 's_m_m_armoured_02' -- back 2
    RequestModel(blake)
    while not HasModelLoaded(blake) do Wait(0) end
    local guard4 = CreatePedInsideVehicle(veh, 4, blake, 0, 1, 0.0)  -- back 2
    GiveWeaponToPed(guard4, 'weapon_heavypistol', 420, 0, 1)
    SetPedMaxHealth(guard4, 2000)
    SetPedAccuracy(guard4, 50)
    SetPedDropsWeaponsWhenDead(guard4, false)
    SetPedRelationshipGroupDefaultHash(guard4, 'COP')
    SetPedRelationshipGroupHash(guard4, 'COP')
    SetPedAsCop(guard4, true)
    SetCanAttackFriendly(guard4, false, true)
    TaskCombatPed(guard4, PlayerPedId(), 0, 16)

    local blake = 'ig_casey' -- back 2
    RequestModel(blake)
    while not HasModelLoaded(blake) do Wait(0) end
    local guard4 = CreatePedInsideVehicle(veh, 4, blake, 1, 1, 0.0)  -- back 2
    GiveWeaponToPed(guard4, 'weapon_heavypistol', 420, 0, 1)
    SetPedMaxHealth(guard4, 2000)
    SetPedAccuracy(guard4, 50)
    SetPedDropsWeaponsWhenDead(guard4, false)
    SetPedRelationshipGroupDefaultHash(guard4, 'COP')
    SetPedRelationshipGroupHash(guard4, 'COP')
    SetPedAsCop(guard4, true)
    SetCanAttackFriendly(guard4, false, true)
    TaskCombatPed(guard4, PlayerPedId(), 0, 16)

    local blake = 'mp_s_m_armoured_01' -- back 2
    RequestModel(blake)
    while not HasModelLoaded(blake) do Wait(0) end
    local guard4 = CreatePedInsideVehicle(veh, 4, blake, 2, 1, 0.0)  -- back 2
    GiveWeaponToPed(guard4, 'weapon_heavypistol', 420, 0, 1)
    SetPedMaxHealth(guard4, 2000)
    SetPedAccuracy(guard4, 50)
    SetPedDropsWeaponsWhenDead(guard4, false)
    SetPedRelationshipGroupDefaultHash(guard4, 'COP')
    SetPedRelationshipGroupHash(guard4, 'COP')
    SetPedAsCop(guard4, true)
    SetCanAttackFriendly(guard4, false, true)
    TaskCombatPed(guard4, PlayerPedId(), 0, 16)

    if chance < 50 then
        -- Remove doors
        TriggerServerEvent('Polar-ArmoredTrucks:server:RemoveDoors', veh)
    else
        -- Open doors
        SetVehicleDoorOpen(veh, -1, 0, 0)
        SetVehicleDoorOpen(veh, 0, 0, 0)
        SetVehicleDoorOpen(veh, 1, 0, 0)
        SetVehicleDoorOpen(veh, 2, 0, 0)

    end
    Wait(10000)
    local blake = 'ig_casey' -- back 2
    RequestModel(blake)
    while not HasModelLoaded(blake) do Wait(0) end
    local guard4 = CreatePedInsideVehicle(veh, 4, blake, 1, 1, 0.0)  -- back 2
    GiveWeaponToPed(guard4, 'weapon_mg', 420, 0, 1)
    SetPedMaxHealth(guard4, 2000)
    SetPedAccuracy(guard4, 50)
    SetPedDropsWeaponsWhenDead(guard4, false)
    SetPedRelationshipGroupDefaultHash(guard4, 'COP')
    SetPedRelationshipGroupHash(guard4, 'COP')
    SetPedAsCop(guard4, true)
    SetCanAttackFriendly(guard4, false, true)
    TaskCombatPed(guard4, PlayerPedId(), 0, 16)

    local blake = 'mp_s_m_armoured_01' -- back 2
    RequestModel(blake)
    while not HasModelLoaded(blake) do Wait(0) end
    local guard4 = CreatePedInsideVehicle(veh, 4, blake, 2, 1, 0.0)  -- back 2
    GiveWeaponToPed(guard4, 'weapon_mg', 420, 0, 1)
    SetPedMaxHealth(guard4, 2000)
    SetPedAccuracy(guard4, 50)
    SetPedDropsWeaponsWhenDead(guard4, false)
    SetPedRelationshipGroupDefaultHash(guard4, 'COP')
    SetPedRelationshipGroupHash(guard4, 'COP')
    SetPedAsCop(guard4, true)
    SetCanAttackFriendly(guard4, false, true)
    TaskCombatPed(guard4, PlayerPedId(), 0, 16)


    -- Update robbed plate config
    local plate = GetVehicleNumberPlateText(veh)
    TriggerServerEvent('Polar-ArmoredTrucks:server:UpdatePlates', plate)
end

local cooldown = false
--- Method to rob a specific banktruck with a black security card
--- @param veh number - Vehicle entity
--- @return nil
local useCard = function(veh)
    QBCore.Functions.TriggerCallback('Polar-ArmoredTrucks:Server:Cooldown', function(CooldownCheck)
        cooldown = CooldownCheck
        end)
        if not cooldown then 
            TriggerServerEvent('Polar-ArmoredTrucks:Server:Cooldown2')
            TriggerServerEvent('Polar-ArmoredTrucks:Server:UnCooldown')
    QBCore.Functions.TriggerCallback('Polar-ArmoredTrucks:server:getCops', function(cops)
        local plate = GetVehicleNumberPlateText(veh)
        if not robbedplates[plate] then
            if cops >= 0 then
                -- Enough cops
                SetEntityAsMissionEntity(veh, true, true)
                local pedCo = GetEntityCoords(PlayerPedId())
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                
                AlertCops()
                minigame(veh)
                




            else
                QBCore.Functions.Notify('Not enough cops', "error", 2000)
            end
        else
            QBCore.Functions.Notify('This truck has recently been robbed',"error", 2000)
        end
    end)
    else
        QBCore.Functions.Notify("The security alarm is active", "error")
    end
end
function start(veh)

    TriggerServerEvent("Polar-ArmoredTrucks:server:removeCard")
    QBCore.Functions.Notify('RUN!', "error", 4000)
    TriggerEvent('Polar-ArmoredTrucks:Client:Startup', veh)


end
RegisterNetEvent('Polar-ArmoredTrucks:Client:Startup', function(veh)

    QBCore.Functions.Progressbar("crafting", "Unlocking Truck...  ", 60000, false, true, 
    {disableMovement = false, disableCarMovement = true, disableMouse = false, disableCombat = false, },
    {}, {}, {}, 
    function() -- Done

     
    
    robTruck(veh)
    end, function()

    -- cancel notification


    end)  
end)
function fail(veh)

    --robTruck(veh)
    TriggerServerEvent("Polar-ArmoredTrucks:server:removeCard")

end

function minigame(veh)
    local chance = math.random(1,100)

    QBCore.Functions.Progressbar("crafting", "Connecting...  ", 10000, false, true, 
    {disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
    { animDict = "mini@repair", anim = "fixing_a_ped", flags = 0, }, {}, {}, 
    function() -- Done

       
    


  
       
      


    if chance < 101 then
        local thermiteinfo = { time = 30, squares = 4, errors = 4}
        
        exports['Polar-UI']:Thermite(function(success) 
            if success then

                Wait(1000)

                exports['Polar-UI']:Thermite(function(success) 
                    if success then
                        
                        Wait(1000)

                        exports['Polar-UI']:Thermite(function(success) 
                            if success then

                                Wait(1000)

                                exports['Polar-UI']:VarHack(function(success)  
                            if success then  

                            start(veh) 

            else
                fail(veh)
            end  
        end, 5, 5)
            else 
                fail(veh)
            end
        end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
            else 
                fail(veh)
            end 
        end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
            else 
                fail(veh)
            end
        end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
    end


    end, function()

    end)  
end

function Animation()

    local animDict = "anim@heists@ornate_bank@grab_cash_heels"
    local anim = "grab"
    local flags = 16
    local inspeed = 8.0
    local outspeed = 8.0
    local playbackrate = -1
    local duration = -1

    while not HasAnimDictLoaded(animDict) do
        RequestAnimDict(animDict)
        Wait(100)
        TaskPlayAnim(PlayerPedId(), animDict, anim, inspeed, outspeed, duration, flags, playbackrate, false, false, false)
    end
end
function prop()

    local bone = 57005
    local coords = { x = -0.005, y = 0.00, z = -0.16 }
    local rotation = { x = 250.0, y = -30.0, z = 0.0 }

    local ped = PlayerPedId()
    RequestModel('prop_cs_heist_bag_02')

    while not HasModelLoaded(GetHashKey('prop_cs_heist_bag_02')) do
        Wait(0)
    end

    local pCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
    local modelSpawn = CreateObject(GetHashKey('prop_cs_heist_bag_02'), pCoords.x, pCoords.y, pCoords.z, true, true, true)
   

    local netid = ObjToNet(modelSpawn)
    SetNetworkIdExistsOnAllMachines(netid, true)
    NetworkSetNetworkIdDynamic(netid, true)
    SetNetworkIdCanMigrate(netid, false)
    if bone == nil then
        bone = 60309
    end

    if coords == nil then
        coords = { x = 0.0, y = 0.0, z = 0.0 }
    end

    if rotation == nil then
        rotation = { x = 0.0, y = 0.0, z = 0.0 }
    end

    AttachEntityToEntity(modelSpawn, ped, GetPedBoneIndex(ped, bone), coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, 1, 1, 0, 1, 0, 1)
    prop_net = netid

   

end
--- Method to loot a specific banktruck and receive a reward
--- @param veh number - Vehicle entity
--- @return nil
local lootTruck = function(veh)
    --print('pp')
    local plate = GetVehicleNumberPlateText(veh)
    if lootedtrucks[plate] then 
        QBCore.Functions.Notify('Truck already looted', "error", 2000)
        return 
    end
   -- print('pp')
    local netId = NetworkGetNetworkIdFromEntity(veh)
    
    prop()
    Animation()

    Wait(5000)

    local time = math.random(2500,12500)
    Wait(150)
    Wait(time)

    local time = math.random(2500,12500)
    TriggerServerEvent('Polar-ArmoredTrucks:server:receiveItem', netId)
    Wait(150)
    Wait(time)
    
    local time = math.random(2500,12500)
    TriggerServerEvent('Polar-BankTruck:server:BankNotes')
    Wait(150)
    Wait(time)

    local time = math.random(2500,12500)
    TriggerServerEvent('Polar-BankTruck:server:BankNotes')
    Wait(150)
    Wait(time)

    local time = math.random(2500,12500)
     TriggerServerEvent('Polar-BankTruck:server:BankNotes')
    Wait(150)
    Wait(time)

    local time = math.random(2500,12500)
     TriggerServerEvent('Polar-BankTruck:server:BankNotes')
    Wait(150)
    Wait(time)

    
    Wait(150)
   
     


    
    -- clear tasks
    ClearPedTasks(PlayerPedId())
    -- bag on back
	SetPedComponentVariation((PlayerPedId()), 5, 47, 0, 0)

  
    
        
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('Polar-ArmoredTrucks:server:getConfig', function(robbed, looted)
        robbedplates = robbed
        lootedtrucks = looted
    end)
end)


RegisterNetEvent('Polar-ArmoredTrucks:client:RemoveDoors', function(truck)
    SetVehicleDoorBroken(truck, -1, false)
    SetVehicleDoorBroken(truck, 0, false)
    SetVehicleDoorBroken(truck, 1, false)
    SetVehicleDoorBroken(truck, 2, false)
end)

RegisterNetEvent('Polar-ArmoredTrucks:client:UpdatePlates', function(plate)
    robbedplates[plate] = true
end)

RegisterNetEvent('Polar-ArmoredTrucks:client:UpdateLooted', function(plate)
    lootedtrucks[plate] = true
end)

CreateThread(function()
    local models = {'stockade'}
    exports['qb-target']:AddTargetModel(models, {
        options = {
            
            {
                icon = 'fas fa-user-secret',
                label = 'Unlock',
                item = 'hacking_device',
                action = function(entity)
                    useCard(entity)
                end,
                canInteract = function(entity, distance, data)
                    if robbedplates[GetVehicleNumberPlateText(entity)] then return false end
                    return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
                end,
            },
            {
                icon = 'fas fa-coins',
                label = 'Loot',
                action = function(entity)
                    lootTruck(entity)
                end,
                canInteract = function(entity, distance, data)
                    if lootedtrucks[GetVehicleNumberPlateText(entity)] or not robbedplates[GetVehicleNumberPlateText(entity)] then return false end
                    return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
                end,
            },
        },
        distance = 2.5,
    })
end)




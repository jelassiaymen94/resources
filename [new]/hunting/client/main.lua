


local QBCore = exports['qb-core']:GetCoreObject()


----------------------Notify------------------------------------------

function notify(message,type) 
    QBCore.Functions.Notify(message,type)
end

----------------------------Inventory Animation--------------------------------
local carryCarcass = 0
local heaviestCarcass = 0
local animals = {}
local listItemCarcass= {}
local CarcassByItem= {}

for key, value in pairs(Config.carcass) do
    table.insert(animals, key)
    table.insert(listItemCarcass, value)
    CarcassByItem[value] = key
end

function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end
function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end


local PlayerData = nil
function playeritem(items, amount)
      
        PlayerData = QBCore.Functions.GetPlayerData()
       
        local isTable = type(items) == 'table'
        local isArray = isTable and table.type(items) == 'array' or false
        local totalItems = #items
        local count = 0
        local kvIndex = 2
        if isTable and not isArray then
            totalItems = 0
            for _ in pairs(items) do 
                local totalItems2 = totalItems + 1 
                totalItems = totalItems2
            end
            kvIndex = 1
        end
        for _, itemData in pairs(PlayerData.items) do
            if isTable then
                for k, v in pairs(items) do
                    local itemKV = {k, v}
                    if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                        local count2 = count + 1 
                        count = count2
                    end
                end
                if count == totalItems then
                    return true
                end
            else -- Single item as string
                if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
                    return true
                end
            end
        end
        return false
end

Citizen.CreateThread(function ()
    Wait(60000)
        while true do
            Wait(1000)
            FreezeEntityPosition(playerPed, false)
            heaviestCarcass = 0
            for key, value in pairs(listItemCarcass) do
                if playeritem(value..'1') or playeritem(value..'2') or playeritem(value..'3') then
                    heaviestCarcass = CarcassByItem[value]
                    break
                end
            end
            if heaviestCarcass ~= 0 then
                if carryCarcass==0 then
                loadModel(heaviestCarcass)
                DeleteEntity(carryCarcass)
                carryCarcass = CreatePed(1, heaviestCarcass, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
                SetEntityInvincible(carryCarcass, true)
                SetEntityHealth(carryCarcass, 0)
                local pos = Config.carcassPos[heaviestCarcass]
                AttachEntityToEntity(carryCarcass, PlayerPedId(),11816, pos.xPos, pos.yPos, pos.zPos, pos.xRot, pos.yRot, pos.zRot, false, false, false, true, 2, true)
                PlayCarryAnim()
                elseif GetEntityModel(carryCarcass)~=heaviestCarcass then
                    DeleteEntity(carryCarcass)
                    carryCarcass = 0
                    ClearPedSecondaryTask(PlayerPedId())
                    Wait(100)
                    loadModel(heaviestCarcass)
                    DeleteEntity(carryCarcass)
                    carryCarcass = CreatePed(1, heaviestCarcass, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
                    SetEntityInvincible(carryCarcass, true)
                    SetEntityHealth(carryCarcass, 0)
                    local pos = Config.carcassPos[heaviestCarcass]
                    AttachEntityToEntity(carryCarcass, PlayerPedId(),11816, pos.xPos, pos.yPos, pos.zPos, pos.xRot, pos.yRot, pos.zRot, false, false, false, true, 2, true)
                    PlayCarryAnim()
                end
            else
                DeleteEntity(carryCarcass)
                carryCarcass = 0
                ClearPedSecondaryTask(PlayerPedId())
            end
        
    end
end)

IsPlayCarryAnim =false
function PlayCarryAnim()
    if carryCarcass ~= 0 and not IsPlayCarryAnim then
        if Config.carcassPos[heaviestCarcass].drag then
            loadAnimDict('combat@drag_ped@')
            TaskPlayAnim(PlayerPedId(), 'combat@drag_ped@', 'injured_drag_plyr', 2.0, 2.0, 100000, 1, 0, false, false, false)
            CustomControl()

            Citizen.CreateThread(function ()
            IsPlayCarryAnim=true
            while carryCarcass ~= 0 do
                while not IsEntityPlayingAnim(PlayerPedId(), 'combat@drag_ped@', 'injured_drag_plyr', 1) do
                    TaskPlayAnim(PlayerPedId(), 'combat@drag_ped@', 'injured_drag_plyr', 2.0, 2.0, 100000, 1, 0, false, false, false)
                    Wait(0)
                end
                Wait(500)
            end
            IsPlayCarryAnim=false
            end)
        else
            loadAnimDict('missfinale_c2mcs_1')
            TaskPlayAnim(PlayerPedId(), 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, 100000, 49, 0, false, false, false)
            Citizen.CreateThread(function ()
            IsPlayCarryAnim=true
            while carryCarcass ~= 0 do
                while not IsEntityPlayingAnim(PlayerPedId(), 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 49) do
                    TaskPlayAnim(PlayerPedId(), 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, 100000, 49, 0, false, false, false)
                    Wait(0)
                end
                Wait(500)
            end
            IsPlayCarryAnim=false
            end)
        end
    else
        ClearPedSecondaryTask(PlayerPedId())
    end
end

isCustomControl= false
function CustomControl()
    if isCustomControl then return end
    Citizen.CreateThread(function ()
        local playerPed = PlayerPedId()
        local enable = true
        isCustomControl = true
        while enable do
            if IsControlPressed(0, 35) then -- Right
                FreezeEntityPosition(playerPed, false)
                SetEntityHeading(playerPed, GetEntityHeading(playerPed)+0.5)
            elseif IsControlPressed(0, 34) then -- Left
                FreezeEntityPosition(playerPed, false)
                SetEntityHeading(playerPed, GetEntityHeading(playerPed)-0.5)
            elseif IsControlPressed(0, 32) or IsControlPressed(0, 33) then
                FreezeEntityPosition(playerPed, false)
            else
                FreezeEntityPosition(playerPed, true)
                TaskPlayAnim(PlayerPedId(), 'combat@drag_ped@', 'injured_drag_plyr', 0.0, 0.0, 1, 2, 7, false, false, false)
            end
            Wait(7)
            if heaviestCarcass ~= 0 then
                enable = Config.carcassPos[heaviestCarcass].drag
            else
                enable = false
            end
        end
        isCustomControl = false
        FreezeEntityPosition(playerPed, false)
        ClearPedSecondaryTask(playerPed)
        ClearPedTasksImmediately(playerPed)
    end)
end


--------------------- SELL -----------------------------------

Citizen.CreateThread(function ()
    blip = AddBlipForCoord(963.34, -2115.39)
	SetBlipSprite(blip, 141)
	SetBlipScale(blip, 0.8)
	SetBlipColour(blip, 43)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Hunter')
	EndTextCommandSetBlipName(blip)
end)

--------------------- BAIT -----------------------------------

local baitLocation = nil
local baitLastPlaced = 0

local baitDistanceInUnits = 40
local spawnDistanceRadius = 30
local validHuntingZones = { ---------Hunting Zone
    ["Paleto Forest"] = true,
    ["Raton Canyon"] = true,
    ["Mount Chiliad"] = true,
    ["Cassidy Creek"] = true
}

local HuntingAnimals = {
    'a_c_boar',
    --'a_c_cat_01',
    'a_c_chickenhawk',
    -- 'a_c_chimp',
    --'a_c_chop',
    'a_c_cormorant',
    --'a_c_cow',
    'a_c_coyote',
    --'a_c_crow',
    'a_c_deer',
    --'a_c_hen',
    --'a_c_husky',
    'a_c_mtlion',
    -- 'a_c_pig',
    --'a_c_pigeon',
    --'a_c_poodle',
    --'a_c_pug',
    'a_c_rabbit_01',
    --'a_c_rat',
    --'a_c_retriever',
    --'a_c_rhesus',
    --'a_c_rottweiler',
    --'a_c_seagull',
    --'a_c_shepherd',
    --'a_c_westy',
    -- 'a_c_panther' 
}

-- local animals = {
--     {model = "a_c_deer", hash = -664053099, item = "meatdeer", id = 35},
--     {model = "a_c_pig", hash = -1323586730, item = "meatpig", id = 36},
--     {model = "a_c_boar", hash = -832573324, item = "meatboar", id = 37},
--     {model = "a_c_mtlion", hash = 307287994, item = "meatlion",id = 38},
--     {model = "a_c_cow", hash = -50684386, item = "meatcow", id = 39},
--     {model = "a_c_coyote", hash = 1682622302, item = "meatcoyote", id = 40},
--     {model = "a_c_rabbit_01", hash = -541762431, item = "meatrabbit", id = 41},
--     {model = "a_c_pigeon", hash = 111281960, item = "meatbird", id = 42},
--     {model = "a_c_seagull", hash = -745300483, item = "meatseagull", id = 43},
-- 	{model = "a_c_cormorant", hash = 1457690978, item = "meatcormorant", id = 44},
-- 	{model = "a_c_chickenhawk", hash = -1430839454, item = "meatchickenhawk", id = 45},
-- 	{model = "a_c_crow", hash = 402729631, item = "meatcrow", id = 46},
	
-- }

exports("huntingArea", function()
    return validHuntingZones
end)

DecorRegister("HuntingMySpawn", 2)

function GetEntityPlayerIsLookingAt(pDistance, pRadius, pFlag, pIgnore)
    local distance = pDistance or 3.0
    local originCoords = GetPedBoneCoords(PlayerPedId(), 31086)
    local forwardVectors = GetForwardVector(GetGameplayCamRot(2))
    local forwardCoords = originCoords + (forwardVectors * (IsInVehicle and distance + 1.5 or distance))

    if not forwardVectors then return end

    local _, hit, targetCoords, _, targetEntity = RayCast(originCoords, forwardCoords, pFlag or 286, pIgnore, pRadius or 0.2)

    if not hit and targetEntity == 0 then return end

    local entityType = GetEntityType(targetEntity)

    return targetEntity, entityType, targetCoords
end

function GetForwardVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.sin(rot.z) * math.abs(math.cos(rot.x)), math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function RayCast(origin, target, options, ignoreEntity, radius)
    local handle = StartShapeTestSweptSphere(origin.x, origin.y, origin.z, target.x, target.y, target.z, radius, options, ignoreEntity, 0)
    return GetShapeTestResult(handle)
end


function isValidZone()
    return validHuntingZones[GetLabelText(GetNameOfZone(GetEntityCoords(PlayerPedId())))] == true
end

local function getSpawnLoc()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local spawnCoords = nil
    while spawnCoords == nil do
        local spawnX = math.random(-spawnDistanceRadius, spawnDistanceRadius)
        local spawnY = math.random(-spawnDistanceRadius, spawnDistanceRadius)
        local spawnZ = baitLocation.z
        local vec = vector3(baitLocation.x + spawnX, baitLocation.y + spawnY, spawnZ)
        if #(playerCoords - vec) > spawnDistanceRadius then
            spawnCoords = vec
        end
    end
    local worked, groundZ, normal = GetGroundZAndNormalFor_3dCoord(spawnCoords.x, spawnCoords.y, 1023.9)
    spawnCoords = vector3(spawnCoords.x, spawnCoords.y, groundZ)
    return spawnCoords
end 

local function spawnAnimal(loc) 
    local foundAnimal = false  
    local animal = HuntingAnimals[math.random(#HuntingAnimals)]
    local hash = GetHashKey(animal)
    RequestModel(hash)
    while not HasModelLoaded(hash) do 
        Citizen.Wait(0)
    end
    local spawnLoc = getSpawnLoc()
    local spawnedAnimal = CreatePed(28, animal, spawnLoc, true, true, true)
    DecorSetBool(spawnedAnimal, "HuntingMySpawn", true)
    SetModelAsNoLongerNeeded(modelName)
    TaskGoStraightToCoord(spawnedAnimal, loc, 1.0, -1, 0.0, 0.0)
    Citizen.CreateThread(function()
        local finished = false
        while not IsPedDeadOrDying(spawnedAnimal) and not finished do
            local spawnedAnimalCoords = GetEntityCoords(spawnedAnimal)
            if #(loc - spawnedAnimalCoords) < 0.5 then
                ClearPedTasks(spawnedAnimal)
                Citizen.Wait(1500)
                TaskStartScenarioInPlace(spawnedAnimal, "WORLD_DEER_GRAZING", 0, true)
                Citizen.SetTimeout(7500, function()
                    finished = true
                end)
            end
            if #(spawnedAnimalCoords - GetEntityCoords(PlayerPedId())) < 15.0 then
                ClearPedTasks(spawnedAnimal)
                TaskSmartFleePed(spawnedAnimal, PlayerPedId(), 600.0, -1)
                finished = true
            end
            Citizen.Wait(1000)
        end
        if not IsPedDeadOrDying(spawnedAnimal) then
            TaskSmartFleePed(spawnedAnimal, PlayerPedId(), 600.0, -1)
        end
    end)
end

local function baitDown()
    Citizen.CreateThread(function()
        while baitLocation ~= nil do
            if #(baitLocation - GetEntityCoords(PlayerPedId())) > baitDistanceInUnits then
                if math.random() < 0.15 then
                    spawnAnimal(baitLocation)
                    baitLocation = nil
                end
            end
            Citizen.Wait(5000)
        end
    end)
end
local bussy = true
local lastTime = GetGameTimer() + 3000
local lastAnimals = {}

function removeEntity(entity)
    local delidx = 0

    for i = 1, #lastAnimals do
        if (lastAnimals[i].entity == entity) then delidx = i end
    end

    if (delidx > 0) then table.remove(lastAnimals, delidx) end
end

function lastAnimalExists(entity)
    for _, v in pairs(lastAnimals) do
        if (v.entity == entity) then return true end
    end
end


RegisterNetEvent('loyal-hunting:use-item')
AddEventHandler('loyal-hunting:use-item', function(item)
    if GetGameTimer() > lastTime then
        lastTime = GetGameTimer() + 3000
        if item == "huntingbait" then
            if not isValidZone() then
                notify(text('cant_hun'), "error")
                return
            end
            if baitLastPlaced ~= 0 and GetGameTimer() < (baitLastPlaced + Config.CoolDownBait * 1000) then 
                notify(text('cooldown_bait')..Config.CoolDownBait..'seconds!', "error")
                return
            end
            if bussy then
                bussy = false
                baitLocation = nil
                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
				TriggerServerEvent("loyal-hunting:removeItem", item)

                LocalPlayer.state:set('inv_busy', true, true) 
                QBCore.Functions.Progressbar("1", text('bait'), 15000, false, true, {
                disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
                }, {}, {}, {}, function() 
                    ClearPedTasksImmediately(PlayerPedId())
                    baitLastPlaced = GetGameTimer()
                    baitLocation = GetEntityCoords(PlayerPedId())
                    notify(text('baited'))
                    
                    baitDown()
                    bussy = true
                    LocalPlayer.state:set('inv_busy', false, true) 
                   
                end, function() 
                    bussy = true
                    LocalPlayer.state:set('inv_busy', false, true) 
                end)

                
            end
        end
    else
        notify(text('cooldown_bait')..Config.CoolDownBait..'seconds!', "error")
    end
end)

function GetClosestPlayerMenu()
   
	    local player, distance = QBCore.Functions.GetClosestPlayer()
        if distance ~= -1 and distance <= 5.0 then
	    	return true, GetPlayerServerId(player)
	    else
	    	return false
	    end
  
end 





----------------------block fire human----------------------------
local hasHuntingRifle = false
local isFreeAiming = false
local function processScope(freeAiming)
    if not isFreeAiming and freeAiming then
        isFreeAiming = true
        SendNUIMessage({
            display = true,
        })
    elseif isFreeAiming and not freeAiming then
        isFreeAiming = false
        SendNUIMessage({
            display = false,
        })
    end
end

local blockShotActive = false
local function blockShooting()
    if blockShotActive then return end
    blockShotActive = true
    Citizen.CreateThread(function()
        while hasHuntingRifle do
            local ply = PlayerId()
            local ped = PlayerPedId()
            local ent = nil
            local aiming, ent = GetEntityPlayerIsFreeAimingAt(ply)
            local freeAiming = IsPlayerFreeAiming(ply)
            processScope(freeAiming)
            local et = GetEntityType(ent)
            if not freeAiming
                or IsPedAPlayer(ent)
                or et == 2
                or (et == 1 and IsPedInAnyVehicle(ent))
            then
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 47, true)
                DisableControlAction(0, 58, true)
                DisablePlayerFiring(ped, true)
            end
            Citizen.Wait(0)
        end
        blockShotActive = false
        processScope(false)
    end)
end

Citizen.CreateThread(function()
    local huntingRifleHash = `weapon_sniperrifle` -- -646649097

    while true do
        if GetSelectedPedWeapon(PlayerPedId()) == huntingRifleHash then
            hasHuntingRifle = true
            blockShooting()
        else
            hasHuntingRifle = false
        end
        Citizen.Wait(1000)
    end
end)

---------------------Target-------------------------------------------


    exports['qb-target']:AddTargetModel(animals, {
        options = {
        {   icon = "fa-solid fa-paw",
            label = text('pickup_carcass'),
            item = 'huntingknife',
            action = function (entity)
                local retval, bone = GetPedLastDamageBone(entity)
                TaskTurnPedToFaceEntity(PlayerPedId(), entity, -1)
                Wait(500)
                local found, player = GetClosestPlayerMenu()
                if not isValidZone() then
                    notify(text('cant_hun'), "error")
                    return
                end
                if found then
                    notify(text('near_human'), "error")
                    return
                end

                LocalPlayer.state:set('inv_busy', true, true) 
                QBCore.Functions.Progressbar("1", text('pickup_carcass'), 3000, false, true, {
                disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
                }, { animDict = 'amb@medic@standing@kneel@idle_a', anim = "idle_a", flags = 16,
                }, {}, {}, function() 

                    LocalPlayer.state:set('inv_busy', false, true) 
                    TriggerServerEvent('loyal-hunting:harvestCarcass',NetworkGetNetworkIdFromEntity(entity),bone)
                end, function() 

                    LocalPlayer.state:set('inv_busy', false, true) 
                end)

               
            end,
            canInteract = function (entity)
                return IsEntityDead(entity) 
                -- return IsEntityDead(entity) and not IsEntityAMissionEntity(entity)
            end,
        } },
        distance = 2.0
    })

    exports['qb-target']:AddBoxZone('loyal-hunting_sell', vector3(963.34, -2115.79, 31.47), 6.8, 2, {
        name="loyal-hunting_sell",
        heading=355,
        --debugPoly=true,
        minZ=30.27,
        maxZ=34.67
    	}, {
    		options = {
    			{   icon = "fa-solid fa-sack-dollar",
                    label = text('sell_carcass'),
    				action = function ()

                        LocalPlayer.state:set('inv_busy', true, true) 
                        QBCore.Functions.Progressbar("1", text('sell_in_progress'), 3000, false, true, {
                        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
                        }, { animDict = 'anim@amb@machinery@speed_drill@', anim = "look_around_left_02_amy_skater_01", flags = 16,
                        }, {}, {}, function() 
        
                            LocalPlayer.state:set('inv_busy', false, true) 
                            TriggerServerEvent('loyal-hunting:SellCarcass', Config.carcass[heaviestCarcass])
                        end, function() 
        
                            LocalPlayer.state:set('inv_busy', false, true) 
                        end)

                      
                    end,
                    canInteract= function ()
                        return heaviestCarcass ~= 0
                    end
    			},
    		},
    		distance = 2.0
    })

    Citizen.CreateThread(function()
        exports['qb-target']:AddTargetModel("ig_hunter", {
            options = {
                {
                    type = "client",
                    event = "loyal-hunting:shop",
                    icon = "fas fa-leaf",
                    label = "Shop",
                },
            },
            distance = 4.0
        })
    end)

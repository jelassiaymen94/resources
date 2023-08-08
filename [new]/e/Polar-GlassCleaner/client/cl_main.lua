local QBCore = exports['qb-core']:GetCoreObject()

local oxt = Config.OxTarget


local cranes = nil
local onjob = false

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end TriggerEvent('Polar-GlassCleaner:Client:RemoveCraneProp', cranes)  end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) starttarget()  end)


RegisterNetEvent('Polar-GlassCleaner:Client:CraneProp', function(prop, var, max, min) 
    loadModel(prop) 
   
    cranes =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) 
    SetEntityHeading(cranes, var.w) 
   
    cranetarget(cranes, max, min)

    addblip(cranes)
end)

function addblip(entity)
    local blip = AddBlipForEntity(entity) SetBlipSprite(blip, 304) SetBlipDisplay(blip, 6) SetBlipScale(blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 5) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Lift") EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('Polar-GlassCleaner:Client:RemoveCraneProp', function(entity) if DoesEntityExist(entity) then DeleteEntity(entity) end end)


function cranetarget(entity, maxs, mins)
    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                type = "Client",
                event = "Polar-GlassCleaner:Client:MoveUp",
                icon = "fas fa-bolt",
                label = "Move Up",
                cranes = entity,
                max = maxs,
            },
            {
                type = "Client",
                event = "Polar-GlassCleaner:Client:Stop",
                icon = "fas fa-bolt",
                label = "Stop",
                cranes = entity,
            },
            {
                type = "Client",
                event = "Polar-GlassCleaner:Client:MoveDown",
                icon = "fas fa-bolt",
                label = "Move Down",
                cranes = entity,
                min = mins,
            },
        },
        distance = 1.0
    })
end
RegisterNetEvent('Polar-GlassCleaner:Client:Timer', function()
    CreateThread(function()
        local time = Config.JobTime * 1000 * 60
        Wait(time)
        TriggerEvent('Polar-GlassCleaner:Client:RemoveCraneProp', cranes)
        onjob = false
    end)
end)
RegisterNetEvent('Polar-GlassCleaner:Client:StartJob', function()
    if onjob then QBCore.Functions.Notify("You Need to Wait for the Job to Finish", 'error', 2500) return end
    onjob = true

    TriggerEvent('Polar-GlassCleaner:Client:Timer')

    local prop = 'sf_prop_sf_hydro_platform_01a'
    local loc = vector4(-254.49, -692.15, 31.67, 167.75)
    local max = 110.0
    TriggerEvent('Polar-GlassCleaner:Client:CraneProp', prop, loc, max, loc.z)
    



    local target = 'spot1'
    local loc = vector3(-254.89, -692.78, 109.26)
    Wait(50)
    TriggerServerEvent('Polar-GlassCleaner:Server:TargetAdd', target, loc)


    local target = 'spot2'
    local loc = vector3(-254.89, -692.78, 106.26)
    Wait(50)
    TriggerServerEvent('Polar-GlassCleaner:Server:TargetAdd', target, loc)

    
end)
RegisterNetEvent('Polar-GlassCleaner:Client:FinishJob', function()
    TriggerEvent('Polar-GlassCleaner:Client:RemoveCraneProp', cranes)


end)

function starttarget()
    exports['qb-target']:SpawnPed({
        model = 'a_m_m_genfat_01',
        coords = vector4(-258.35, -684.24, 33.39, 170.63),
        minusOne = true,
        freeze = true,
        invincible = false,
        blockevents = true,
        scenario = 'PROP_HUMAN_SEAT_CHAIR',
        target = {
            options = {
            {
                type = "Client",
                icon = 'fa-solid fa-bolt',
                label = 'Start Job',
               -- job = "cardealer",
               -- action = function()
               --     TriggerEvent('Polar-Dealership:Client:CryptoPartMenu')
               -- end,
               -- event = 'Polar-Dealership:Client:CryptoPartMenu',
               event = 'Polar-GlassCleaner:Client:StartJob',
            }
            },
            distance = 1.5,
        },
    })

    blip(vector4(-258.35, -684.24, 33.39, 170.63))
end



































---================ CRANE ========================
local moving = false


RegisterNetEvent('Polar-GlassCleaner:Client:MoveUp', function(data)
    moving = false
    Wait(1)
    moving = true
    Wait(50)
    local ent = data.entity
    FreezeEntityPosition(ent, true)
    while moving do 
    local loc = GetEntityCoords(data.cranes)
    if loc.z < data.max then
    SetEntityCoords(ent, vec3(loc.x, loc.y, loc.z+0.101))
    Wait(10)
    else moving = false end
    end
end)
RegisterNetEvent('Polar-GlassCleaner:Client:MoveDown', function(data)
    moving = false
    Wait(1)
    moving = true
    Wait(50)
    local ent = data.entity
    FreezeEntityPosition(ent, true)
    while moving do 
    local loc = GetEntityCoords(data.cranes)
    if loc.z > data.min then
    SetEntityCoords(ent, vec3(loc.x, loc.y, loc.z-0.01))
    Wait(10)
    else moving = false end
    end
end)
RegisterNetEvent('Polar-GlassCleaner:Client:Stop', function(data)
    local loc = GetEntityCoords(data.cranes)
    moving = false
    local ent = data.entity
    FreezeEntityPosition(ent, true)
end)

---================ ========================




RegisterNetEvent('Polar-GlassCleaner:Client:TargetRemove', function(target) exports['qb-target']:RemoveZone(target) end)


RegisterNetEvent('Polar-GlassCleaner:Client:Clean', function(data)
    local target = data.id
    TriggerServerEvent('Polar-GlassCleaner:Server:TargetRemove', target)
    
    TriggerEvent('animations:client:EmoteCommandStart', {"clean2"})

    QBCore.Functions.Progressbar('window', 'Cleaning Window', math.random(6000,8000), false, true, {
        disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = true,
        }, {}, {}, {}, function()
        TriggerServerEvent('Polar-GlassCleaner:Server:Pay', target)
        emptyHands(PlayerPedId(), true)
    end, function() 
           
        emptyHands(PlayerPedId(), true)
    end)
end)

RegisterNetEvent('Polar-GlassCleaner:Client:TargetAdd', function(target, loc) 
    
    CreateTarget(target, loc, "Polar-GlassCleaner:Client:Clean", "Clean", 'fas fa-bolt', false) 

end)


function CreateTarget(names, coords1, handler, labels, icons, his)
    if oxt then
        targets[names] = exports.ox_target:addBoxZone({ coords = coords1, size = vec3(1, 1, 1), rotation = 1, debug = his,
        options = {{  event = handler,  icon = icons, label = labels, id = names, canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
    else
        exports['qb-target']:AddBoxZone(names,  coords1, 0.5, 0.5, { name =  names, heading = 28.69, debug = his, minZ = coords1.z-0.5, maxZ =  coords1.z+0.5,}, 
        { options = {{ event = handler, icon = icons, label = labels, id = names }}, distance = 1 }) 
    end
end



function emptyHands(playerPed, dpemote)
	if dpemote then TriggerEvent('animations:client:EmoteCommandStart', {"c"}) ClearPedTasks(playerPed)
	else ClearPedTasks(playerPed) end
end


function blip(loc)
    local blip = AddBlipForCoord(vec3(loc.x, loc.y, loc.z)) SetBlipSprite(blip, Config.BlipSprite) SetBlipDisplay(blip, 6) SetBlipScale(blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, Config.BlipColor) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName(Config.BlipName) EndTextCommandSetBlipName(blip)
end


function loadModel(hash)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
    
        while not HasModelLoaded(hash) do
            Wait(1)
        end
    end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

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

function notify(what, color)
    QBCore.Functions.Notify(what, color)
end
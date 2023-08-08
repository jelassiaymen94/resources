local QBCore = exports['qb-core']:GetCoreObject()

local oxt = Config.OxTarget


local cranes = nil


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) starttarget()  end)


RegisterNetEvent('Polar-GlassCleaner:Client:CraneProp', function(prop, var) 
    loadModel(prop) 
   
    cranes =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) 
    SetEntityHeading(cranes, var.w) 
    cranetarget(cranes)
end)


RegisterNetEvent('Polar-GlassCleaner:Client:RemoveCraneProp', function(entity) if DoesEntityExist(entity) then DeleteEntity(entity) end end)


function cranetarget(entity)
    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                type = "Client",
                event = "Polar-GlassCleaner:Client:MoveUp",
                icon = "fas fa-bolt",
                label = "Move Up",
                cranes = entity,
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
            },
        },
        distance = 1.0
    })
end

RegisterNetEvent('Polar-GlassCleaner:Client:StartJob', function()
    local prop = 'bkr_int_w04_tread_platform'
    local loc = vec3(1,2,3)
    TriggerEvent('Polar-GlassCleaner:Client:CraneProp', prop, loc)
   
    local target = 'spot1'
    local loc = vec3(1,2,3)
    TriggerServerEvent('Polar-GlassCleaner:Server:TargetAdd', target, loc)

    local target = 'spot2'
    local loc = vec3(1,2,3)
    TriggerServerEvent('Polar-GlassCleaner:Server:TargetAdd', target, loc)

end)
RegisterNetEvent('Polar-GlassCleaner:Client:FinishJob', function()
    TriggerEvent('Polar-GlassCleaner:Client:RemoveCraneProp', cranes)


end)

function starttarget()
    exports['qb-target']:SpawnPed({
        model = 'a_m_m_genfat_01',
        coords = vector4(-1287.84, -3040.71, -48.78, 264.96),
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
end



































---================ CRANE ========================
local moving = false


RegisterNetEvent('Polar-GlassCleaner:Client:MoveUp', function(data)
    moving = true
    Wait(50)
    FreezeEntityPosition(data.entity, false)
    while moving do 
    local loc = GetEntityCoords(data.cranes)
    SetEntityCoords(vec3(loc.x, loc.y, loc.z+0.1))
    Wait(100)
    end
end)


RegisterNetEvent('Polar-GlassCleaner:Client:MoveDown', function(data)
    moving = true
    Wait(50)
    FreezeEntityPosition(data.entity, false)
    while moving do 
    local loc = GetEntityCoords(data.cranes)
    SetEntityCoords(vec3(loc.x, loc.y, loc.z-0.1))
    Wait(100)
    end
end)


RegisterNetEvent('Polar-GlassCleaner:Client:Stop', function(data)
    local loc = GetEntityCoords(data.cranes)
    moving = false
    FreezeEntityPosition(data.entity, true)

end)
---================ ========================







RegisterNetEvent('Polar-GlassCleaner:Client:Clean', function(data)
    local target = data.id
    TriggerServerEvent('Polar-GlassCleaner:Server:TargetRemove', target)
    print('removed ' .. target)
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






function blip(loc)
    local blip = AddBlipForCoord(vec3(loc.x, loc.y, loc.z)) SetBlipSprite (blip, Config.BlipSprite) SetBlipDisplay(blip, 6) SetBlipScale (blip, 0.6) SetBlipAsShortRange(blip, true)
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
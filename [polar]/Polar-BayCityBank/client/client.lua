local QBCore = exports['qb-core']:GetCoreObject()

local staffonlydoor = false
local officeback = false
local bayofficeleft = false
local officeright = false
local kitchen = false
local fusebox = true
local robatm = false

local door = nil
local pp = nil
local coords = nil

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
    if Config.Debug then print('Stopping Polar-BayCityBank') end
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Targets') end
    targets()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100) if Config.Debug then print('Player Loaded Targets Starting') end
    targets()
end)




function CallPolice()


end

RegisterNetEvent('Polar-BayCityBank:Client:StopInteract', function(door)
    if door == 'staffonlydoor' then staffonlydoor = false end
    if door == 'bayofficeleft' then bayofficeleft = false end
    if door == 'officeback' then officeback = false end
    if door == 'officeright' then officeright = false end
    if door == 'kitchen' then kitchen = false end
    if door == 'fusebox' then fusebox = false end
    if door == 'robatm' then robatm = false end
end)
RegisterNetEvent('Polar-BayCityBank:Client:StartInteract', function(door)
    if door == 'staffonlydoor' then staffonlydoor = true end
    if door == 'bayofficeleft' then bayofficeleft = true end
    if door == 'officeright' then officeright = true end
    if door == 'officeback' then officeback = true end
    if door == 'kitchen' then kitchen = true end
    if door == 'fusebox' then fusebox = true end
    if door == 'robatm' then robatm = true end
end)

function targets()
    exports['qb-target']:AddBoxZone("staffdoor", vector3(-1305.36, -819.76, 17.25), 1, 1, { name = "staffdoor", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:staffdoor", canInteract = function() if staffonlydoor then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police'}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("kitchendoor", vector3(-1299.18, -821.76, 17.25), 1, 1, { name = "kitchendoor", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:kitchendoor", canInteract = function() if kitchen then return true end end, icon = "fas fa-bolt", label = "Lockpick Door", excludejob = 'police'}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("fusebox", vector3(-1286.16, -834.58, 17.26), 1, 1, { name = "fusebox", heading = 130.73, debug = Config.Debug, minZ = 16.5, maxZ =  18.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:fusebox", canInteract = function() if fusebox then return true end end, icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("officeback", vector3(-1294.27, -835.41, 17.15), 1, 1, { name = "officeback", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:officeback", canInteract = function() if officeback then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police'}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayofficeleft", vector3(-1297.04, -826.44, 17.15), 1, 1, { name = "bayofficeleft", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeleft", canInteract = function() if bayofficeleft then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police'}}, distance = 2.5 }) 
   -- exports['qb-target']:AddBoxZone("officeright", vector3(-1305.36, -819.76, 17.25), 1, 1, { name = "officeright", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
   -- { options = {{ event = "Polar-BayCityBank:client:officeright", canInteract = function() if officeright then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police'}}, distance = 1.5 }) 
    exports['qb-target']:AddTargetModel('prop_atm_03', { options = {{ event = "Polar-BayCityBank:client:robatm", canInteract = function() if robatm then return true end end, icon = "fas fa-bolt", label = "Rob ATM",}}, distance = 2.5 })

end  
function turnon()
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'staffonlydoor')
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'officeback')
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeleft')
end
function unlockdoor(door)
    TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)
    turnon()
end
function lockpick(door) CallPolice() TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    exports['Polar-UI']:Circle(function(success) if success then unlockdoor(door) else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) end
    end, 6, 20) -- NumberOfCircles, MS
end

RegisterNetEvent('Polar-BayCityBank:client:kitchendoor', function() door = 'kitchen' lockpick(door) end)
RegisterNetEvent('Polar-BayCityBank:client:staffdoor', function() pp = vector4(-1305.32, -819.82, 17.30, 33.45) door = 'staffonlydoor' coords = vector3(-1305.32, -818.82, 17.20) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
RegisterNetEvent('Polar-BayCityBank:client:fusebox', function() pp = vector4(-1286.11, -834.72, 17.3, 124.14) door = 'fusebox' coords = vector3(-1286.16, -833.69, 17.2) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
RegisterNetEvent('Polar-BayCityBank:client:officeback', function() pp = vector4(-1294.26, -835.35, 17.25, 128.07) door = 'officeback' coords = vector3(-1294.21, -834.42, 17.15) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
--RegisterNetEvent('Polar-BayCityBank:client:officeright', function() pp = vector4(-1297.39, -826.63, 17.15, 306.08) door = 'officeright' coords = vector3(-1297.19, -827.01, 17.15) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
RegisterNetEvent('Polar-BayCityBank:client:bayofficeleft', function() pp = vector4(-1297.05, -826.5, 17.25, 306.08) door = 'bayofficeleft' coords = vector3(-1297.05, -825.48, 17.15) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)

RegisterNetEvent('Polar-BayCityBank:client:robatm', function() pp = vector4(-1297.05, -826.5, 17.25, 306.08) door = 'robatm' coords = vector3(-1297.05, -825.48, 17.15) TriggerEvent('Polar-BayCityBank:client:AtmRob', pp, door, coords) end)





RegisterNetEvent('Polar-BayCityBank:client:AtmRob', function(pp, door, coords)


end)
RegisterNetEvent('Polar-BayCityBank:client:Thermite', function(pp, door, coords)
    local hi = false
    if hi then ThermiteEffect(door, coords) else
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    if math.random(1, 100) <= 85 and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)

    exports['Polar-UI']:Thermite(function(success)
    if success then ThermiteEffect(door, coords) else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) QBCore.Functions.Notify("Thermite Failed..", "error") end
    end, 30, 4, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks

    else QBCore.Functions.Notify("You are missing something..", "error", 2500) end end, {"thermite"}) end
end)


RegisterNetEvent('Polar-BayCityBank:client:ThermiteStart', function(pp, door, coords)
    QBCore.Functions.TriggerCallback('Polar-BayCityBank:IsRobbery', function(result) if result then return end end)
    local hi = false
    if hi then
    ThermiteEffect(door, coords)
    else
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 
            if math.random(1, 100) <= 85 and not gloves() then
                TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId()))
            end
            QBCore.Functions.TriggerCallback('Polar-BayCityBank:Server:GetCops', function(cops)
                if cops >= Config.RequiredCops then
                    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
                    PlantThermite(pp, door)
                    exports['Polar-UI']:Thermite(function(success) if success then
                    ThermiteEffect(door, coords)
                    else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
                    QBCore.Functions.Notify("Thermite Failed..", "error") end
                    end, 30, 6, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
                        
                    
                else
                    QBCore.Functions.Notify("Not enough police..", "error")
                end
            end)
        else
            QBCore.Functions.Notify("You are missing something..", "error", 2500)
        end
    end, {"thermite"})
    end
end)

































RegisterNetEvent("Polar-BayCityBank:Client:ThermitePtfx", function(coords)
    if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then 
        RequestNamedPtfxAsset("scr_ornate_heist") 
    end
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(20000)
    StopParticleFxLooped(effect, 0)
end)


function gloves()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == 'mp_m_freemode_01' then
        if Config.MaleGloves[armIndex] ~= nil and Config.MaleGloves[armIndex] then
            retval = false
        end
    else
        if Config.FemaleGloves[armIndex] ~= nil and Config.FemaleGloves[armIndex] then
            retval = false
        end
    end
    return retval
end




function ThermiteEffect(door, coords)
   
    local ped = PlayerPedId()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end
    Wait(1500)
    TriggerServerEvent("Polar-BayCityBank:Server:ThermitePtfx", coords)
    Wait(500)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(25000)
    ClearPedTasks(ped)
    Wait(2000)
    if door == 'fusebox' then
        TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'kitchen')
    end
    TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)
    
end

function PlantThermite(pp, door)
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["thermite"], "remove")
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") or not HasModelLoaded("hei_p_m_bag_var22_arm_s") or not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    local ped = PlayerPedId()
    local pos = pp
    SetEntityHeading(ped, pos.w)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vector3(GetEntityRotation(PlayerPedId())))
    local netscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject('hei_p_m_bag_var22_arm_s', pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local thermite = CreateObject('hei_prop_heist_thermite', x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(thermite, false, true)
    AttachEntityToEntity(thermite, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    NetworkAddPedToSynchronisedScene(ped, netscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(netscene)
    Wait(5000)
    DetachEntity(thermite, 1, 1)
    FreezeEntityPosition(thermite, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(netscene)
    CreateThread(function()
        Wait(15000)
        DeleteEntity(thermite)
    end)
end
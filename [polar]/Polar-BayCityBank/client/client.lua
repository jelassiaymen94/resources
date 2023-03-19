local QBCore = exports['qb-core']:GetCoreObject()

local hi = false

local bayfusebox = true


local bayatmright = false
local bayatmleft = false
local baystaffonlydoor = false
local bayofficeback = false
local bayofficeleft = false
local bayofficeright = false
local baykitchendoor = true
local baycomputerleft = false
local baycomputerright = false
local baylever = false
local bayvaultgate = false

local var = nil
local drillpos = nil
local drillrot = nil
local door = nil
local pp = nil
local coords = nil
local rot = nil
local position = nil
local item = nil
local itemchance = nil

--- LOCKPICK DOOR
local kitcheddooritem = 'advancedlockpick'
local circleexport = 'Polar-UI'
local circleinfo = { circles = 3, time = 10}

--- THERMITE
local thermiteexport = 'Polar-UI'
local thermiteinfo = { time = 30, squares = 4, errors = 3}
local thermiteitem = "thermite"
local thermitetime = 20000 -- thermite burn time


local drillitem = 'drill' 
local carditem = 'thermite'
local computeritem = 'thermite'

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end if Config.Debug then print('Stopping Polar-BayCityBank') end end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Targets') end targets() blips() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if Config.Debug then print('Player Loaded Targets Starting') end targets() blips() end)
RegisterNetEvent('Polar-BayCityBank:Client:StopInteract', function(door)
    if door == 'baystaffonlydoor' then baystaffonlydoor = false end
    if door == 'bayofficeleft' then bayofficeleft = false end
    if door == 'bayofficeback' then bayofficeback = false end
    if door == 'bayofficeright' then bayofficeright = false end
    if door == 'baykitchendoor' then baykitchendoor = false end
    if door == 'bayfusebox' then bayfusebox = false end
    if door == 'bayatmleft' then bayatmleft = false end
    if door == 'bayatmright' then bayatmright = false end
    if door == 'baycomputerleft' then baycomputerleft = false end
    if door == 'baycomputerright' then baycomputerright = false end
    if door == 'baylever' then baylever = false end
    if door == 'bayvaultgate' then baylever = false end
end)
RegisterNetEvent('Polar-BayCityBank:Client:StartInteract', function(door)
    if door == 'baystaffonlydoor' then baystaffonlydoor = true end
    if door == 'bayofficeleft' then bayofficeleft = true end
    if door == 'bayofficeright' then bayofficeright = true end
    if door == 'bayofficeback' then bayofficeback = true end
    if door == 'baykitchendoor' then baykitchendoor = true end
    if door == 'bayfusebox' then bayfusebox = true end
    if door == 'bayatmleft' then bayatmleft = true end
    if door == 'bayatmright' then bayatmright = true end
    if door == 'baycomputerleft' then baycomputerleft = true end
    if door == 'baycomputerright' then baycomputerright = true end
    if door == 'baylever' then baylever = true end
    if door == 'bayvaultgate' then baylever = true end
end)
function targets()
    ------ BOX THERMITE
    exports['qb-target']:AddBoxZone("bayfusebox", vector3(-1286.16, -834.58, 17.26), 1, 1, { name = "bayfusebox", heading = 130.73, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayfusebox", canInteract = function() if bayfusebox then return true end end, icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    ---- DOOR LOCKPICK
    exports['qb-target']:AddBoxZone("baykitchendoor", vector3(-1299.18, -821.76, 17.25), 1, 1, { name = "baykitchendoor", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baykitchendoor", canInteract = function() if baykitchendoor then return true end end, icon = "fas fa-bolt", label = "Lockpick Door", excludejob = 'police', item = kitcheddooritem}}, distance = 2.5 }) 
    ------ DOOR THERMITE
    exports['qb-target']:AddBoxZone("baystaffonlydoor", vector3(-1305.36, -819.76, 17.25), 1, 1, { name = "baystaffonlydoor", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baystaffonlydoor", canInteract = function() if baystaffonlydoor then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayofficeback", vector3(-1294.27, -835.41, 17.15), 1, 1, { name = "bayofficeback", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeback", canInteract = function() if bayofficeback then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayofficeleft", vector3(-1297.04, -826.44, 17.15), 1, 1, { name = "bayofficeleft", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeleft", canInteract = function() if bayofficeleft then return true end end, icon = "fas fa-fire", label = "Thermite Door", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    ------ CARD INSERT
    exports['qb-target']:AddBoxZone("bayofficeright", vector3(-1299.6, -828.34, 17.35), 1, 1, { name = "bayofficeright", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeright", canInteract = function() if bayofficeright then return true end end, icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police', item = carditem}}, distance = 2.5 }) 
    ---- DRILL SPOTS
    exports['qb-target']:AddBoxZone("bayatmleft",  vector3(-1319.11, -824.78, 17.25), 2, 2, { name = "bayatmleft", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayatmleft", canInteract = function() if bayatmleft then return true end end, icon = "fas fa-bolt", label = "Rob Atm", excludejob = 'police', item = drillitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayatmright",  vector3(-1317.07, -823.18, 17.25), 2, 2, { name = "bayatmright", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayatmright", canInteract = function() if bayatmright then return true end end, icon = "fas fa-bolt", label = "Rob Atm", excludejob = 'police', item = drillitem}}, distance = 2.5 }) 
   ----- COMPUTERS 
    exports['qb-target']:AddBoxZone("baycomputerright", vector3(-1297.79, -834.82, 16.97), 2, 2, { name = "baycomputerright", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baycomputerright", canInteract = function() if baycomputerright then return true end end, icon = "fas fa-bolt", label = "Hack Computer", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("baycomputerleft", vector3(-1290.3, -828.9, 16.97), 2, 2, { name = "baycomputerleft", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baycomputerleft", canInteract = function() if baycomputerleft then return true end end, icon = "fas fa-bolt", label = "Hack Computer", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    
   
end  
function turnon()
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baystaffonlydoor')
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeback')
   
end

function lever()
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baylever')
    local chance = math.random(1,100)
    if chance<=10 then
        var = vector3(-1297.69, -820.39, 17.15)
    --elseif chance<=20 then
      --  var = vector3(-1297.69, -820.39, 17.15)
    --elseif chance<=30 then
       -- var = vector3(-1297.69, -820.39, 17.15)
   -- elseif chance<=40 then
      --  var = vector3(-1297.69, -820.39, 17.15)
    --elseif chance<=50 then
      --  var = vector3(-1297.69, -820.39, 17.15)
    elseif chance<=60 then
        var = vector3(-1301.34, -817.36, 17.25)  -- d
    elseif chance<=70 then
        var = vector3(-1299.4, -814.44, 17.25)  -- d
    elseif chance<=80 then
        var = vector3(-1295.58, -816.95, 17.25)  -- d
    elseif chance<=90 then
        var = vector3(-1297.09, -823.58, 17.25) -- d
    elseif chance<=100 then
        var = vector3(-1293.38, -821.2, 17.25)  -- d
    end
    ----- LEVER
    exports['qb-target']:AddBoxZone("baylever", var, 2, 2, { name = "baylever", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baylever", canInteract = function() if baylever then return true end end, icon = "fas fa-bolt", label = "Flip Lever", excludejob = 'police'}}, distance = 2.5 }) 

end
RegisterNetEvent('Polar-BayCityBank:client:baylever', function() TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', 'baylever') turnrighton() QBCore.Functions.Notify("Lever Flipped", "success", 2500) end) 
function turnlefton() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeleft') TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputerleft') end
function turnrighton() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeright') TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputerright') end
function unlockdoor(door) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) QBCore.Functions.Notify("Door Unlocked", "success", 2500) lever() end
function lockpick(door) TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) local ped = PlayerPedId() local chance = math.random(1,100) QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then loadAnimDict("veh@break_in@0h@p_m_one@") TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0) 
    exports[circleexport]:Circle(function(success) if success then if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', kitcheddooritem, 1) end CallPolice() unlockdoor(door) else if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', 'lockpick') end QBCore.Functions.Notify("You Failed the Lockpick", "error", 2500) TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) end
    end, circleinfo.circles, circleinfo.time) else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'goldbar', 10) end end, {kitcheddooritem})  -- lockpick finish 
end 
------ BOX THERMITE
RegisterNetEvent('Polar-BayCityBank:client:bayfusebox', function() pp = vector4(-1286.11, -834.72, 17.3, 124.14) door = 'bayfusebox' coords = vector3(-1286.16, -833.69, 17.2) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
---- DOOR LOCKPICK
RegisterNetEvent('Polar-BayCityBank:client:baykitchendoor', function() door = 'baykitchendoor' lockpick(door) end)
------ DOOR THERMITE
RegisterNetEvent('Polar-BayCityBank:client:baystaffonlydoor', function() pp = vector4(-1305.32, -819.82, 17.30, 33.45) door = 'baystaffonlydoor' coords = vector3(-1305.32, -818.82, 17.20) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
RegisterNetEvent('Polar-BayCityBank:client:bayofficeback', function() pp = vector4(-1294.26, -835.35, 17.25, 128.07) door = 'bayofficeback' coords = vector3(-1294.21, -834.42, 17.15) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
RegisterNetEvent('Polar-BayCityBank:client:bayofficeleft', function() pp = vector4(-1297.05, -826.5, 17.25, 306.08) door = 'bayofficeleft' coords = vector3(-1297.05, -825.48, 17.15) TriggerEvent('Polar-BayCityBank:client:Thermite', pp, door, coords) end)
----- CARD INSERT
RegisterNetEvent('Polar-BayCityBank:client:bayofficeright', function() item = carditem itemchance = 100 rot = vector3(0.0, 0.0, 37.0) position = vector3(-1297.29, -828.96, 17.15) door = 'bayofficeright' TriggerEvent('Polar-BayCityBank:client:keycard', door, position, rot, item, itemchance) end)
---- DRILL SPOTS
RegisterNetEvent('Polar-BayCityBank:client:bayatmleft', function() door = bayatmleft TriggerEvent('Polar-BayCityBank:client:AtmRob', vector3(-1319.11, -824.78, 17.25), vector3(0.0, 0.0, 37.0), door) end)
RegisterNetEvent('Polar-BayCityBank:client:bayatmright', function() door = bayatmright TriggerEvent('Polar-BayCityBank:client:AtmRob', vector3(-1317.02, -823.33, 17.25), vector3(0.0, 0.0, 37.0), door) end)
----- COMPUTERS
RegisterNetEvent('Polar-BayCityBank:client:baycomputerright', function()  door = baycomputerright TriggerEvent('Polar-BayCityBank:client:HackComputer', 1, 2, door) end)



RegisterNetEvent('Polar-BayCityBank:client:HackComputer', function(type, door)
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    if type == 1 then 
        local success = exports['memory']:MiniGame(5, 10)
        if success then print('yes') end
    elseif type == 2 then


    else TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'markedbills', 1) end
end)







RegisterNetEvent('Polar-BayCityBank:client:keycard', function(door, position, rot, item, itemchance) TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    local ped = PlayerPedId() local chance = math.random(1,100) local pos = GetEntityCoords(ped) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(ped, true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(ped, 131.12) SetEntityCoords(ped, vector3(-1299.13, -828.04, 16.15)) if chance <= itemchance then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(ped, animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(ped, animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(ped, animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(ped, animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(ped, false) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) QBCore.Functions.Notify("Door Unlocked", "success", 2500)
end)

RegisterNetEvent('Polar-BayCityBank:client:AtmRob', function(drillpos, drillrot, door)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    drill(drillpos, drillrot, drillitem, 50, door)

    else  TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'weapon_assaultrifle', 1) end end, {drillitem}) -- hiest finish
end)
RegisterNetEvent('Polar-BayCityBank:client:Thermite', function(pp, door, coords)
    if hi then ThermiteEffect(door, coords) else
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    if math.random(1, 100) <= 85 and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)

    exports[thermiteexport]:Thermite(function(success)
    if success then ThermiteEffect(door, coords) else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) QBCore.Functions.Notify("Thermite Failed..", "error") end
    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks

    else  TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'markedbills', 3) end end, {"thermite"}) end  -- thermite finish
end)


RegisterNetEvent('Polar-BayCityBank:client:ThermiteStart', function(pp, door, coords)
    QBCore.Functions.TriggerCallback('Polar-BayCityBank:IsRobbery', function(result) if result then return end end)
    if hi then
    ThermiteEffect(door, coords)
    else
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then if math.random(1, 100) <= 85 and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end
    QBCore.Functions.TriggerCallback('Polar-BayCityBank:Server:GetCops', function(cops) if cops >= Config.RequiredCops then
                    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
                    PlantThermite(pp, door)
                    exports['Polar-UI']:Thermite(function(success) 
                    if success then
                    ThermiteEffect(door, coords)
                    else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
                    QBCore.Functions.Notify("Thermite Failed..", "error") end
                     end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
                        
                    
                else QBCore.Functions.Notify("Not enough police..", "error") end
            end)
        else TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'markedbills', math.random(2,4)) end  -- cart finish
    end, {"thermite"})
    end
end)









RegisterNetEvent("Polar-BayCityBank:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)
function gloves()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3) local model = GetEntityModel(PlayerPedId()) local retval = true if model == 'mp_m_freemode_01' then if Config.MaleGloves[armIndex] ~= nil 
    and Config.MaleGloves[armIndex] then retval = false end else if Config.FemaleGloves[armIndex] ~= nil and Config.FemaleGloves[armIndex] then retval = false end end return retval
end
function ThermiteEffect(door, coords)
    local ped = PlayerPedId() RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-BayCityBank:Server:ThermitePtfx", coords) Wait(500) TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) Wait(25000) ClearPedTasks(ped) Wait(2000)
    if door == 'bayfusebox' then TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baykitchendoor') TriggerServerEvent('qb-doorlock:server:updateState', 'bayfrondoor1', false, false, false, true, false, false) TriggerServerEvent('qb-doorlock:server:updateState', 'bayfrondoor2', false, false, false, true, false, false) end TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)  QBCore.Functions.Notify("Door Unlocked", "success", 2500)
end
function PlantThermite(pp, door)
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) TriggerServerEvent("QBCore:Server:RemoveItem", thermiteitem, 1)  TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[thermiteitem], "remove") RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") or not HasModelLoaded("hei_p_m_bag_var22_arm_s") or not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    local ped = PlayerPedId() local pos = pp SetEntityHeading(ped, pos.w) Wait(100) local rotx, roty, rotz = table.unpack(vector3(GetEntityRotation(PlayerPedId()))) local netscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3) local bag = CreateObject('hei_p_m_bag_var22_arm_s', pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true) local x, y, z = table.unpack(GetEntityCoords(ped)) local thermite = CreateObject('hei_prop_heist_thermite', x, y, z + 0.2,  true,  true, true) SetEntityCollision(thermite, false, true) AttachEntityToEntity(thermite, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true) NetworkAddPedToSynchronisedScene(ped, netscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1) SetPedComponentVariation(ped, 5, 0, 0, 0) NetworkStartSynchronisedScene(netscene) Wait(5000) DetachEntity(thermite, 1, 1) FreezeEntityPosition(thermite, true) DeleteObject(bag) NetworkStopSynchronisedScene(netscene) CreateThread(function() Wait(15000) DeleteEntity(thermite) end)
end
function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end
function drill(drillpos, drillrot, item, itemchance) local ped = PlayerPedId() local pedCo = GetEntityCoords(ped) LocalPlayer.state:set('inv_busy', true, true) local coords, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped) local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@' loadAnimDict(animDict) local bagModel = 'hei_p_m_bag_var22_arm_s' loadModel(bagModel) local laserDrillModel = 'hei_prop_heist_drill' loadModel(laserDrillModel) RequestAmbientAudioBank('DLC_HEIST_FLEECA_SOUNDSET', 0) RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL', 0) RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL_2', 0) soundId = GetSoundId() cam = CreateCam('DEFAULT_ANIMATED_CAMERA', true) SetCamActive(cam, true) RenderScriptCams(true, 0, 3000, 1, 0) bag = CreateObject(GetHashKey(bagModel), coords, 1, 0, 0) laserDrill = CreateObject(GetHashKey(laserDrillModel), coords, 1, 0, 0)
    scene1 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'intro', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene1, animDict, 'intro_drill_bit', 1.0, -1.0, 1148846080) scene2 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'drill_straight_start', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_drill_straight_start', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene2, animDict, 'drill_straight_start_drill_bit', 1.0, -1.0, 1148846080) scene3 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'drill_straight_end_idle', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_drill_straight_end_idle', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene3, animDict, 'drill_straight_end_idle_drill_bit', 1.0, -1.0, 1148846080) scene4 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene4, animDict, 'drill_straight_fail', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene4, animDict, 'bag_drill_straight_fail', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene4, animDict, 'drill_straight_fail_drill_bit', 1.0, -1.0, 1148846080) scene5 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, scene5, animDict, 'drill_straight_end', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene5, animDict, 'bag_drill_straight_end', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene5, animDict, 'drill_straight_end_drill_bit', 1.0, -1.0, 1148846080) scene6 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, scene6, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene6, animDict, 'bag_exit', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene6, animDict, 'exit_drill_bit', 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene1) PlayCamAnim(cam, 'intro_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'intro') * 1000) NetworkStartSynchronisedScene(scene2) PlayCamAnim(cam, 'drill_straight_start_cam', animDict, drillpos, drillrot, 0, 2) NetworkStartSynchronisedScene(scene3) PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, drillpos, drillrot, 0, 2) PlaySoundFromEntity(soundId, 'Drill', laserDrill, 'DLC_HEIST_FLEECA_SOUNDSET', 1, 0)
    TriggerEvent('Drilling:Start',function(success) if success then                             
    StopSound(soundId) NetworkStartSynchronisedScene(scene5) PlayCamAnim(cam, 'drill_straight_end_cam', animDict, drillpos, drillrot, 0, 2)
    Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000) NetworkStartSynchronisedScene(scene6) PlayCamAnim(cam, 'exit_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'exit') * 1000)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(ped) DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- success

    local chance = math.random(1,100)
    if chance <= itemchance then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', item, 1) end
    else
    StopSound(soundId) NetworkStartSynchronisedScene(scene4) PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(ped)  DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- fail 
  
    local chance = math.random(1,100) TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
    if chance <= itemchance then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', item, 1) end
    end
    end)
end
function blips()
    if Config.UseBlip then
    local blip = AddBlipForCoord(Config.BlipLocation) SetBlipSprite (blip, Config.BlipSprite) SetBlipDisplay(blip, 6) SetBlipScale (blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, Config.BlipColor) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName(Config.BlipName) EndTextCommandSetBlipName(blip)
    else return end
end










--------- NOT USED
function drilling() local ped = PlayerPedId() local pos = GetEntityCoords(ped) loadAnimDict("anim@heists@fleeca_bank@drilling") TaskPlayAnim(ped, 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle' , 3.0, 3.0, -1, 1, 0, false, false, false)
    local DrillObject = CreateObject('hei_prop_heist_drill', pos.x, pos.y, pos.z, true, true, true) AttachEntityToEntity(DrillObject, ped, GetPedBoneIndex(ped, 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
    -- stufff goes here
    StopAnimTask(ped, "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0) DetachEntity(DrillObject, true, true) DeleteObject(DrillObject)
end



function alarm()

end
function zone()
    local coords = vec3() 
    local zones = BoxZone:Create(vec3(coords.x, coords.y, coords.z), 1.0, 1.0, {
    name = '1', heading = 0, minZ = 18, maxZ = 17, debugPoly = false })
    zones:onPlayerInOut(function(inside) if inside then alarm() end end)
end




function hotwiring()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("open_locker", "Breaking open the safe ..", math.random(27000, 37000), false, true, {
    disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
    }, {}, {}, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        

       
    end, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)


    end)
end

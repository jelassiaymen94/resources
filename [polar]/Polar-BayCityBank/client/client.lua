local QBCore = exports['qb-core']:GetCoreObject()

local hi = false

local bayfusebox = true
local baykitchendoor = false
local ped = PlayerPedId()

local prop36 = nil -- cart
local prop37 = nil
local prop38 = nil
local prop49 = nil
local prop50 = nil

local buttonprop = nil local buttonprop2 = nil local buttonprop3 = nil local buttonprop4 = nil local buttonprop5 = nil local buttonprop6 = nil local buttonprop7 = nil local buttonprop25 = nil
local buttonprop26 = nil local buttonprop27 = nil local buttonprop28 = nil local buttonprop29 = nil local buttonprop30 = nil local buttonprop31 = nil local buttonprop32 = nil local buttonprop33 = nil local buttonprop34 = nil local buttonprop35 = nil
local buttonprop36 = nil local buttonprop37 = nil local buttonprop38 = nil local buttonprop39 = nil local buttonprop40 = nil local buttonprop41 = nil local buttonprop42 = nil local buttonprop43 = nil
local buttonprop44 = nil local buttonprop45 = nil local buttonprop46 = nil local buttonprop47 = nil local buttonprop48 = nil local buttonprop49 = nil local buttonprop50 = nil
local bayatmright = false local bayatmleft = false local baystaffonlydoor = false local bayofficeback = false local bayofficeleft = false local bayofficeright = false local baycomputerleft = false local baycomputerright = false  local baycomputerback = false
local baybutton = false local baybutton2 = false local baybutton3 = false local baybutton4 = false
local baybutton5 = false local baybutton6 = false local baybutton7 = false local baybutton25 = false local baybutton26 = false local baybutton27 = false local baybutton28 = false
local baybutton29 = false local baybutton30 = false local baybutton31 = false local baybutton32 = false local baybutton33 = false local baybutton34 = false local baybutton35 = false
local baybutton36 = false local baybutton37 = false local baybutton38 = false local baybutton39 = false local baybutton40 = false local baybutton41 = false local baybutton42 = false local baybutton43 = false
local baybutton44 = false local baybutton45 = false local baybutton46 = false local baybutton47 = false local baybutton48 = false local baybutton49 = false local baybutton50 = false
local animDict = nil local model = nil local prop = nil local var = nil local drillpos = nil local drillrot = nil local door = nil local pp = nil local coords = nil local rot = nil local position = nil local item = nil local itemchance = nil local CurrentCops = 0
local bayvaultdoor = false local bayvaultgate = false
local baycomputer1 = false local baycomputer4 = false local baycomputer3= false local baycomputer2 = false
--- LOCKPICK DOOR
local circleinfo = { circles = 3, time = 10}
local amount = nil
--- THERMITE
local thermiteinfo = { time = 30, squares = 4, errors = 3}
local thermitetime = 20000 -- thermite burn time

local hackname = 'hacking' -- https://github.com/Jesper-Hustad/NoPixel-minigame
local circleexport = 'Polar-UI' -- https://github.com/Project-Sloth/ps-ui
local thermiteexport = 'Polar-UI' -- https://github.com/Project-Sloth/ps-ui
local fingerhack = 'utk_fingerprint' -- https://github.com/utkuali/Finger-Print-Hacking-Game
local memorygame = 'memory' 
local voltgame = 'ultra-voltlab' -- https://forum.cfx.re/t/release-voltlab-hacking-minigame-cayo-perico-mission/3933171

-- what you get from atm
function goodies()  local chance = math.random(1,100) if chance <= 25 then amount = 3 elseif chance <= 50 then amount = 2 elseif chance <=100 then amount = 1 end end
---- ITEMS
local atmitem = 'band'
local kitcheddooritem = 'advancedlockpick'
local pcitem = 'band' -- crypto or sum
local thermiteitem = "thermite"
local vaultitem = 'thermite' -- bluelaptop
local drillitem = 'drill' 
local carditem = 'thermite' -- vaultkeycard
local computeritem = 'thermite' -- hacking_device
AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  if Config.Debug then print('Stopping Polar-BayCityBank') end end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Targets')  end targets() blips() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if Config.Debug then print('Player Loaded Targets Starting') end targets() blips()  end)
RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)
RegisterNetEvent('Polar-BayCityBank:Client:StopInteract', function(door)
    if door == 'baystaffonlydoor' then Config.baystaffonlydoor = false end if door == 'bayofficeleft' then Config.bayofficeleft = false end if door == 'bayofficeback' then Config.bayofficeback = false end if door == 'bayofficeright' then Config.bayofficeright = false end if door == 'baykitchendoor' then Config.baykitchendoor = false end if door == 'bayfusebox' then Config.bayfusebox = false end if door == 'bayatmleft' then Config.bayatmleft = false end
    if door == 'bayatmright' then Config.bayatmright = false end if door == 'baycomputerleft' then Config.baycomputerleft = false end if door == 'baycomputerright' then Config.baycomputerright = false end if door == 'baycomputerback' then Config.baycomputerback = false end if door == 'bayvaultgate' then Config.baybutton = false end if door == 'baybutton' then Config.baybutton = false end
    if door == 'baybutton2' then Config.baybutton2 = false end if door == 'baybutton3' then Config.baybutton3 = false end if door == 'baybutton4' then Config.baybutton4 = false end if door == 'baybutton5' then Config.baybutton5 = false end if door == 'baybutton6' then Config.baybutton6 = false end if door == 'baybutton7' then Config.baybutton7 = false end
    if door == 'baybutton25' then Config.baybutton25 = false end if door == 'baybutton26' then Config.baybutton26 = false end if door == 'baybutton27' then Config.baybutton27 = false end if door == 'baybutton28' then Config.baybutton28 = false end if door == 'baybutton29' then Config.baybutton29 = false end if door == 'baybutton30' then Config.baybutton30 = false end if door == 'baybutton31' then Config.baybutton31 = false end if door == 'baybutton32' then Config.baybutton32 = false end
    if door == 'baybutton33' then Config.baybutton33 = false end if door == 'baybutton34' then Config.baybutton34 = false end if door == 'baybutton35' then Config.baybutton35 = false end if door == 'baybutton36' then Config.baybutton36 = false end if door == 'baybutton37' then Config.baybutton37 = false end if door == 'baybutton38' then Config.baybutton38 = false end if door == 'baybutton39' then Config.baybutton39 = false end
    if door == 'baybutton40' then Config.baybutton40 = false end if door == 'baybutton41' then Config.baybutton41 = false end if door == 'baybutton42' then Config.baybutton42 = false end if door == 'baybutton43' then Config.baybutton43 = false end if door == 'baybutton44' then Config.baybutton44 = false end if door == 'baybutton45' then Config.baybutton45 = false end if door == 'baycomputer1' then Config.baycomputer1 = false end if door == 'baycomputer2' then Config.baycomputer2 = false end
    if door == 'baybutton46' then Config.baybutton46 = false end if door == 'baybutton47' then Config.baybutton47 = false end if door == 'baybutton48' then Config.baybutton48 = false end if door == 'baybutton49' then Config.baybutton49 = false end if door == 'baybutton50' then Config.baybutton50 = false end if door == 'bayvaultgate' then Config.bayvaultgate = false end if door == 'baycomputer3' then Config.baycomputer3 = false end if door == 'baycomputer4' then Config.baycomputer4 = false end
end)
RegisterNetEvent('Polar-BayCityBank:Client:StartInteract', function(door)
    if door == 'baystaffonlydoor' then Config.baystaffonlydoor = true end if door == 'bayofficeleft' then Config.bayofficeleft = true end if door == 'bayofficeback' then Config.bayofficeback = true end if door == 'bayofficeright' then Config.bayofficeright = true end if door == 'baykitchendoor' then Config.baykitchendoor = true end if door == 'bayfusebox' then bayfusebox = true end if door == 'bayatmleft' then bayatmleft = true end
    if door == 'bayatmright' then Config.bayatmright = true end if door == 'baycomputerleft' then Config.baycomputerleft = true end if door == 'baycomputerright' then Config.baycomputerright = true end if door == 'baycomputerback' then Config.baycomputerback = true end if door == 'bayvaultgate' then baybutton = true end if door == 'baybutton' then baybutton = true end
    if door == 'baybutton2' then Config.baybutton2 = true end if door == 'baybutton3' then Config.baybutton3 = true end if door == 'baybutton4' then Config.baybutton4 = true end if door == 'baybutton5' then Config.baybutton5 = true end if door == 'baybutton6' then Config.baybutton6 = true end if door == 'baybutton7' then Config.baybutton7 = true end
    if door == 'baybutton25' then Config.baybutton25 = true end if door == 'baybutton26' then Config.baybutton26 = true end if door == 'baybutton27' then Config.baybutton27 = true end if door == 'baybutton28' then Config.baybutton28 = true end if door == 'baybutton29' then Config.baybutton29 = true end if door == 'baybutton30' then Config.baybutton30 = true end if door == 'baybutton31' then Config.baybutton31 = true end if door == 'baybutton32' then Config.baybutton32 = true end
    if door == 'baybutton33' then Config.baybutton33 = true end if door == 'baybutton34' then Config.baybutton34 = true end if door == 'baybutton35' then Config.baybutton35 = true end if door == 'baybutton36' then Config.baybutton36 = true end if door == 'baybutton37' then Config.baybutton37 = true end if door == 'baybutton38' then Config.baybutton38 = true end if door == 'baybutton39' then Config.baybutton39 = true end if door == 'baycomputer4' then Config.baycomputer4 = true end
    if door == 'baybutton40' then Config.baybutton40 = true end if door == 'baybutton41' then Config.baybutton41 = true end if door == 'baybutton42' then Config.baybutton42 = true end if door == 'baybutton43' then Config.baybutton43 = true end if door == 'baybutton44' then Config.baybutton44 = true end if door == 'baybutton45' then Config.baybutton45 = true end if door == 'baycomputer1' then Config.baycomputer1 = true end if door == 'baycomputer3' then Config.baycomputer3 = true end
    if door == 'baybutton46' then Config.baybutton46 = true end if door == 'baybutton47' then Config.baybutton47 = true end if door == 'baybutton48' then Config.baybutton48 = true end if door == 'baybutton49' then Config.baybutton49 = true end if door == 'baybutton50' then Config.baybutton50 = true end if door == 'bayvaultgate' then Config.bayvaultgate = true end if door == 'baycomputer2' then Config.baycomputer2 = true end
    end)
function targets()
    ------ BOX THERMITE
    exports['qb-target']:AddBoxZone("bayfusebox", vector3(-1286.16, -834.58, 17.26), 1, 1, { name = "bayfusebox", heading = 130.73, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayfusebox", canInteract = function() if Config.bayfusebox then return true end end, icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    ---- DOOR LOCKPICK
    exports['qb-target']:AddBoxZone("baykitchendoor", vector3(-1299.18, -821.76, 17.25), 1, 1, { name = "baykitchendoor", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baykitchendoor", canInteract = function() if Config.baykitchendoor then return true end end, icon = "fas fa-bolt", label = "Lockpick", excludejob = 'police', item = kitcheddooritem}}, distance = 2.5 }) 
    ------ DOOR THERMITE
    exports['qb-target']:AddBoxZone("baystaffonlydoor", vector3(-1305.36, -819.76, 17.25), 1, 1, { name = "baystaffonlydoor", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:baystaffonlydoor", canInteract = function() if Config.baystaffonlydoor then return true end end, icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayofficeback", vector3(-1294.27, -835.41, 17.15), 1, 1, { name = "bayofficeback", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeback", canInteract = function() if Config.bayofficeback then return true end end, icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayofficeleft", vector3(-1297.04, -826.44, 17.15), 1, 1, { name = "bayofficeleft", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeleft", canInteract = function() if Config.bayofficeleft then return true end end, icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    ------ CARD INSERT
    exports['qb-target']:AddBoxZone("bayofficeright", vector3(-1299.6, -828.34, 17.35), 1, 1, { name = "bayofficeright", heading = 28.69, debug = Config.Debug, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayofficeright", canInteract = function() if Config.bayofficeright then return true end end, icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police', item = carditem}}, distance = 2.5 }) 
    ----- COMPUTERS 
    exports['qb-target']:AddBoxZone("baycomputerright", vector3(-1297.79, -834.82, 16.97), 2, 2, { name = "baycomputerright", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputerRight", canInteract = function() if Config.baycomputerright then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("baycomputerleft", vector3(-1290.3, -828.9, 16.97), 2, 2, { name = "baycomputerleft", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputerLeft", canInteract = function() if Config.baycomputerleft then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("baycomputerback", vector3(-1296.31, -839.05, 16.97), 2, 2, { name = "baycomputerback", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputerBack", canInteract = function() if Config.baycomputerback then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    --- vault hack
    exports['qb-target']:AddBoxZone("bayvaultdoor",  vector3(-1303.8, -815.62, 17.73), 2, 2, { name = "bayvaultdoor", heading = 28.69, debug = true, minZ = 17.5, maxZ =  19.0,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayvaultdoor", canInteract = function() if Config.bayvaultdoor then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = vaultitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("bayvaultgate",  vector3(-1308.7, -815.46, 17.73), 2, 2, { name = "bayvaultgate", heading = 28.69, debug = true, minZ = 17.5, maxZ =  19.0,}, 
    { options = {{ event = "Polar-BayCityBank:client:bayvaultgate", canInteract = function() if Config.bayvaultgate then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = vaultitem}}, distance = 2.5 }) 
    
    --- crypto pcs
    exports['qb-target']:AddBoxZone("baycomputer1", vector3(-1311.86, -823.91, 17.21), 2, 2, { name = "baycomputer1", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputer", door = "baycomputer1", canInteract = function() if Config.baycomputer1 then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("baycomputer2", vector3(-1310.53, -822.88, 17.21), 2, 2, { name = "baycomputer2", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputer", door = "baycomputer2", canInteract = function() if Config.baycomputer2 then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("baycomputer3", vector3(-1309.32, -821.96, 17.21), 2, 2, { name = "baycomputer3", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputer", door = "baycomputer3", canInteract = function() if Config.baycomputer3 then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone("baycomputer4", vector3(-1308.1, -821.02, 17.21), 2, 2, { name = "baycomputer4", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
    { options = {{ event = "Polar-BayCityBank:client:HackComputer", door = "baycomputer4", canInteract = function() if Config.baycomputer4 then return true end end, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
   
     ---- DRILL SPOTS
     exports['qb-target']:AddBoxZone("bayatmleft",  vector3(-1319.11, -824.78, 17.25), 2, 2, { name = "bayatmleft", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
     { options = {{ event = "Polar-BayCityBank:client:bayatmleft", canInteract = function() if Config.bayatmleft then return true end end, icon = "fas fa-bolt", label = "Rob", excludejob = 'police', item = drillitem}}, distance = 2.5 }) 
     exports['qb-target']:AddBoxZone("bayatmright",  vector3(-1317.07, -823.18, 17.25), 2, 2, { name = "bayatmright", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
     { options = {{ event = "Polar-BayCityBank:client:bayatmright", canInteract = function() if Config.bayatmright then return true end end, icon = "fas fa-bolt", label = "Rob", excludejob = 'police', item = drillitem}}, distance = 2.5 }) 
   
end 

function vaultdone() Config.Vault = true TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayvaultgate') TriggerServerEvent('Polar-BayCityBank:Server:Vault') end
function system() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baystaffonlydoor')  TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayvaultdoor') QBCore.Functions.Notify("System Disabled", "success", 2500) TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputer1')  TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputer2')  TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputer3')  TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputer4') end
function turnatmon() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayatmleft') TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayatmright')  QBCore.Functions.Notify("Partial System Disabled", "success", 2500) end
function pcback() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeback')  end
function pcleft() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputerleft') QBCore.Functions.Notify("Partial System Disabled", "success", 2500) end
function pcright() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputerright')  end
function turnbackon() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baycomputerback')  end 
function turnlefton() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeleft') end
function turnrighton() TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'bayofficeright')  end
function unlockdoor(door) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) QBCore.Functions.Notify("Door Unlocked", "success", 2500) TriggerServerEvent('Polar-BayCityBank:Server:StartButton') end
function lockpick(door) TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) local ped = PlayerPedId() local chance = math.random(1,100) QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then loadAnimDict("veh@break_in@0h@p_m_one@") 
    local location = vector4(-1299.54, -822.02, 16.15, 306.76) SetEntityCoords(ped, location) SetEntityHeading(ped, location.w) TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0) 
    exports[circleexport]:Circle(function(success) if success then if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', kitcheddooritem, 1) end unlockdoor(door) else if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', kitcheddooritem, 1) end QBCore.Functions.Notify("You Failed the Lockpick", "error", 2500) TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) end
    end, circleinfo.circles, circleinfo.time) else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'goldbar', 10) end end, {kitcheddooritem})  -- lockpick finish 
end 
------ BOX THERMITE
RegisterNetEvent('Polar-BayCityBank:client:bayfusebox', function() pp = vector4(-1286.11, -834.72, 17.3, 124.14) door = 'bayfusebox' coords = vector3(-1286.16, -833.69, 17.2) TriggerEvent('Polar-BayCityBank:client:ThermiteStart', pp, door, coords) end)
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


RegisterNetEvent('Polar-BayCityBank:client:bayvaultgate', function() hack('bayvaultgate')   end)
RegisterNetEvent('Polar-BayCityBank:client:bayvaultdoor', function()   hack('bayvaultdoor')  end)


function hack(door)
    LocalPlayer.state:set('inv_busy', true, true) 
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    local ped = PlayerPedId()
    local loc = nil local location = nil
    if door == 'bayvaultdoor' then  
        loc = vector4(-1304.29, -816.1, 17.15, 313.0)
        location = vector4(-1304.29, -816.1, 17.15, 313.0)
    elseif door == 'bayvaultgate' then
        loc = vector4(-1308.45, -815.27, 17.15, 125.21)
        location = vector4(-1308.45, -815.27, 17.15, 125.21)
    end
    SetEntityHeading(ped, location.w)
    SetEntityCoords(ped, vec3(location.x, location.y, location.z-1))
    QBCore.Functions.Progressbar("door", "Connecting to Door ..", math.random(5000, 7500), false, true, {
    disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
    }, {}, {}, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        SetEntityCoords(ped, vec3(loc.x, loc.y, loc.z-1))
        local animDict = 'anim@heists@ornate_bank@hack'
        loadAnimDict(animDict)
        loadModel('hei_prop_hst_laptop')
        loadModel('hei_p_m_bag_var22_arm_s')
        local ped = PlayerPedId()
        local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
        SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
        SetEntityHeading(ped, loc.w)
        local animPos = GetAnimInitialOffsetPosition(animDict, 'hack_enter', loc.x, loc.y, loc.z+1, loc.x, loc.y, loc.z, 0, 2)
        local animPos2 = GetAnimInitialOffsetPosition(animDict, 'hack_loop', loc.x, loc.y, loc.z+1, loc.x, loc.y, loc.z, 0, 2)
        local animPos3 = GetAnimInitialOffsetPosition(animDict, 'hack_exit', loc.x, loc.y, loc.z+1, loc.x, loc.y, loc.z, 0, 2)
    
        FreezeEntityPosition(ped, true)
        local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), targetPosition, 1, 1, 0)
        local laptop = CreateObject(GetHashKey('hei_prop_hst_laptop'), targetPosition, 1, 1, 0)
    
        NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'hack_enter_bag', 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, 'hack_enter_laptop', 4.0, -8.0, 1)
    
        local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'hack_loop_bag', 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, 'hack_loop_laptop', 4.0, -8.0, 1)
    
        local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'hack_exit_bag', 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, 'hack_exit_laptop', 4.0, -8.0, 1)
    
        Wait(200)
        NetworkStartSynchronisedScene(netScene)
        Wait(6300)
        NetworkStartSynchronisedScene(netScene2)
        Wait(2000)
        if door == 'bayvaultdoor' then
            LocalPlayer.state:set('inv_busy', true, true) 
        exports[hackname]:OpenHackingGame(10, 5, 3, function(Success) local chance = math.random(1,100)
            if Success then
               -- if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', vaultitem, 1) end
                vaultdone()
                Wait(4000)
                NetworkStartSynchronisedScene(netScene3)
                Wait(4500)
                NetworkStopSynchronisedScene(netScene3)
                DeleteObject(bag)
                SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                DeleteObject(laptop)
                FreezeEntityPosition(ped, false)
                LocalPlayer.state:set('inv_busy', false, true) 
                QBCore.Functions.Notify("Vault Opening", "success", 2500)
            else
                if chance <=50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', vaultitem, 1) end
                Wait(4000)
                NetworkStartSynchronisedScene(netScene3)
                Wait(4500)
                NetworkStopSynchronisedScene(netScene3)
                DeleteObject(bag)
                SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                DeleteObject(laptop)
                FreezeEntityPosition(ped, false)
                LocalPlayer.state:set('inv_busy', false, true) 
                TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
            end
        end)
        elseif door == 'bayvaultgate' then
        -- levels is how many levels you want. Max is 4, Min is 1
        -- lifes is how many life player has, Max is 6, Min is 1
        -- time is how much time player has in minutes, Max is 9, min is 1 (I highly recommend to set it between 3-1)
        -- callback is the callback function to catch the outcome
            LocalPlayer.state:set('inv_busy', true, true) 
        TriggerEvent("".. fingerhack ..":Start", 4, 1, 1, function(outcome, reason) local chance = math.random(1,100)
        if outcome == true then -- success
            --if chance <= 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', vaultitem, 1) end
            TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true) 
            QBCore.Functions.Notify("Door Unlocked", "success", 2500)
        elseif outcome == false then -- fail
            if chance <= 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true)
            TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) 
        end end)
        end
       
    end, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
        LocalPlayer.state:set('inv_busy', false, true) 
    end)
end
RegisterNetEvent('Polar-BayCityBank:client:HackComputerRight', function() TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) local chance=math.random(1,100) local success = exports[memorygame]:MiniGame(10, 7) if success then  if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end turnlefton()  else  if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end end end) 
RegisterNetEvent('Polar-BayCityBank:client:HackComputerLeft', function() TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) local chance=math.random(1,100) exports[thermiteexport]:Scrambler(function(success)  if success then  if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end turnbackon()    else if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end end end, Config.RandomScrambler2[math.random(1, #Config.RandomScrambler2)], math.random(Config.ScramblerSecondMin2 + 1,Config.ScramblerSecondMax2 + 1),  math.random(Config.ScramblerMirrorMin2,Config.ScramblerMirrorMax2)) end)
RegisterNetEvent('Polar-BayCityBank:client:HackComputerBack', function() TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) local chance=math.random(1,100) exports[thermiteexport]:Var(function(success)  if success then  if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end turnatmon() system()   else if chance < 50 then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end end  end, 5, 5) end)
RegisterNetEvent('Polar-BayCityBank:client:keycard', function(door, position, rot, item, itemchance) TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) pcright()
    local ped = PlayerPedId() local chance = math.random(1,100) local pos = GetEntityCoords(ped) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(ped, true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(ped, 131.12) SetEntityCoords(ped, vector3(-1299.13, -828.04, 16.15)) if chance <= itemchance then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(ped, animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(ped, animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(ped, animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(ped, animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(ped, false) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) QBCore.Functions.Notify("Door Unlocked", "success", 2500)
end)
RegisterNetEvent('Polar-BayCityBank:client:AtmRob', function(drillpos, drillrot, door)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    drill(drillpos, drillrot, drillitem, 50, door)
    goodies()
    TriggerServerEvent('Polar-BayCityBank:Server:RemoveItems', atmitem, amount)
    else  TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'weapon_assaultrifle', 1) end end, {drillitem}) -- hiest finish
end)
RegisterNetEvent('Polar-BayCityBank:client:Thermite', function(pp, door, coords)
    if hi then ThermiteEffect(door, coords) else
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    if math.random(1, 100) <= 85 and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)

    exports[thermiteexport]:Thermite(function(success)
    if success then ThermiteEffect(door, coords) if door == 'bayofficeleft' then pcleft() end if door == 'bayofficeback' then pcback() end else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) QBCore.Functions.Notify("Thermite Failed..", "error") end
    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks

    else  TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'markedbills', 3) end end, {thermiteitem}) end  -- thermite finish
end)
RegisterNetEvent('Polar-BayCityBank:client:ThermiteStart', function(pp, door, coords)
    QBCore.Functions.TriggerCallback('Polar-BayCityBank:IsRobbery', function(result) if result then return end end)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then if math.random(1, 100) <= 85 and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end
            if CurrentCops >= Config.RequiredCops then
                LocalPlayer.state:set('inv_busy', true, true)
                    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
                    PlantThermite(pp, door)
                    exports[thermiteexport]:Thermite(function(success) 
                    if success then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-BayCityBank:Server:Cooldown', door)
                    print(Config.bayfusebox)
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
                    else TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    QBCore.Functions.Notify("Thermite Failed..", "error") end
                    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
                
                    
            else QBCore.Functions.Notify("Not enough police..", "error")  end
        else TriggerServerEvent('Polar-BayCityBank:Server:GiveRewards', 'markedbills', math.random(2,4)) end  -- cart finish
    end,  {thermiteitem})
end)
RegisterNetEvent("Polar-BayCityBank:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)
function gloves()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3) local model = GetEntityModel(PlayerPedId()) local retval = true if model == 'mp_m_freemode_01' then if Config.MaleGloves[armIndex] ~= nil 
    and Config.MaleGloves[armIndex] then retval = false end else if Config.FemaleGloves[armIndex] ~= nil and Config.FemaleGloves[armIndex] then retval = false end end return retval
end
function ThermiteEffect(door, coords)
    if door == 'bayfusebox' then CallPolice() end
    local ped = PlayerPedId() RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-BayCityBank:Server:ThermitePtfx", coords) Wait(500) TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) Wait(thermitetime) ClearPedTasks(ped)
    if door == 'baystaffonlydoor' then TriggerServerEvent('Polar-BayCityBank:Server:StartStaffDoor') end
    if door == 'bayfusebox' then TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', 'baykitchendoor') TriggerServerEvent('Polar-BayCityBank:Server:StartEnterance') turnrighton() TriggerServerEvent('qb-doorlock:server:updateState', 'bayfrondoor1', false, false, false, true, false, false) TriggerServerEvent('qb-doorlock:server:updateState', 'bayfrondoor2', false, false, false, true, false, false) end TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)  QBCore.Functions.Notify("Door Unlocked", "success", 2500)
end 
function PlantThermite(pp, door)
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) TriggerServerEvent("QBCore:Server:RemoveItem", thermiteitem, 1)  TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[thermiteitem], "remove") RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") or not HasModelLoaded("hei_p_m_bag_var22_arm_s") or not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    local ped = PlayerPedId() local pos = pp SetEntityHeading(ped, pos.w) Wait(100) local rotx, roty, rotz = table.unpack(vector3(GetEntityRotation(PlayerPedId()))) local netscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3) local bag = CreateObject('hei_p_m_bag_var22_arm_s', pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true) local x, y, z = table.unpack(GetEntityCoords(ped)) local thermite = CreateObject('hei_prop_heist_thermite', x, y, z + 0.2,  true,  true, true) SetEntityCollision(thermite, false, true) AttachEntityToEntity(thermite, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true) NetworkAddPedToSynchronisedScene(ped, netscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1) SetPedComponentVariation(ped, 5, 0, 0, 0) NetworkStartSynchronisedScene(netscene) Wait(5000) DetachEntity(thermite, 1, 1) FreezeEntityPosition(thermite, true) DeleteObject(bag)  SetPedComponentVariation(ped, 5, Config.BagUseID, 1, 1) NetworkStopSynchronisedScene(netscene) CreateThread(function() Wait(15000) DeleteEntity(thermite) end)
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
   -- if chance <= itemchance then TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', item, 1) end
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





























RegisterNetEvent('Polar-BayCityBank:Client:AddPickupTarget', function(numba, door, door2, prop, var, pile) 
    exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = true, minZ = var - 0.5, maxZ =  var + 0.5,}, 
    { options = {{ event = "Polar-BayCityBank:Client:PickupTarget", type = door, number = numba, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 

end)
RegisterNetEvent('Polar-BayCityBank:Client:PickupTarget', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    animDict = 'random@domestic'
    local ped = PlayerPedId()
    local pile = data.piles
    local door = data.type
    local numba = data.number
         TriggerServerEvent('Polar-BayCityBank:Server:TargetRemove', door)  
        if pile then  
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(ped)
        else
        loadAnimDict(animDict) TaskPlayAnim(ped, animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
        end
        TriggerServerEvent('Polar-BayCityBank:Server:Synapse'.. numba ..'', prop)
        TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
        LocalPlayer.state:set('inv_busy', false, true)  
end)
function Animation(door, props, model, animDict)
    if door == 'baybutton40' then
        SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
        LocalPlayer.state:set('inv_busy', true, true) -- Busy
      
        local ped = PlayerPedId()
        local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
        local animDict = ''
        

        if model == 'h4_prop_h4_gold_stack_01a' then
            animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
            loadAnimDict(animDict)
        else
            animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
            loadAnimDict(animDict)
        end
                
        loadModel('hei_p_m_bag_var22_arm_s')
        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        
        local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(props), 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3) 
        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
        local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(props), 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3) 
        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080) 
        if model == 'h4_prop_h4_gold_stack_01a' then 
        NetworkAddEntityToSynchronisedScene(props, scene2, animDict, 'grab_gold', 1.0, -1.0, 1148846080) else 
        NetworkAddEntityToSynchronisedScene(props, scene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080) end
        local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(props), 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080) 
        NetworkStartSynchronisedScene(scene1)
        Wait(1000)
        NetworkStartSynchronisedScene(scene2)
        Wait(GetAnimDuration(animDict, 'grab') * 1000 - 3000)
        DeleteObject(props)
        NetworkStartSynchronisedScene(scene3)
        Wait(GetAnimDuration(animDict, 'exit') * 1000)        
        ClearPedTasks(ped)
        DeleteObject(bag)
        SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
        LocalPlayer.state:set('inv_busy', false, true) 

    else
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
    loadAnimDict(animDict) loadModel(model) local bag = CreateObject(GetHashKey(model), pedCo, 1, 1, 0)
    local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(props), GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
    local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(props), GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
    local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(props), GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 0, 1) NetworkStartSynchronisedScene(scene1) Wait(1000)
    NetworkStartSynchronisedScene(scene2)
    FreezeEntityPosition(props, true)
    SetEntityInvincible(props, true)
    SetEntityNoCollisionEntity(props, ped)
    AttachEntityToEntity(props, ped, GetPedBoneIndex(ped, 58866), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
    SetEntityRotation(props, 0.0, 0.0, 2, 2)
    Wait(500) SetEntityVisible(props, false, false)
    NetworkStartSynchronisedScene(scene3) Wait(1000) ClearPedTasks(ped) DeleteObject(bag) SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true)  
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door)
    end
end 
RegisterNetEvent('Polar-BayCityBank:Client:TargetRemove', function(door) exports['qb-target']:RemoveZone(door) end)
RegisterNetEvent('Polar-BayCityBank:Client:AddTarget', function(door, door2, prop, var) 
    exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = true, minZ = var - 0.5, maxZ =  var + 0.5,}, 
    { options = {{ event = "Polar-BayCityBank:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 

end)

RegisterNetEvent('Polar-BayCityBank:Client:Target', function(data) 
    model = 'hei_p_m_bag_var22_arm_s' animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
    local p = data.type
    TriggerServerEvent('Polar-BayCityBank:Server:TargetRemove', p)    
    if p == 'baybutton' then       Animation(p, buttonprop, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse', prop)
    elseif p == 'baybutton2' then  Animation(p, buttonprop2, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse2', prop) 
    elseif p == 'baybutton3' then  Animation('baybutton3', buttonprop3, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse2', prop) 
    elseif p == 'baybutton4' then  Animation('baybutton4', buttonprop4, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse4', prop) 
    elseif p == 'baybutton5' then  Animation('baybutton5', buttonprop5, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse5', prop) 
    elseif p == 'baybutton6' then  Animation('baybutton6', buttonprop6, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse6', prop) 
    elseif p == 'baybutton7' then  Animation('baybutton7', buttonprop7, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse7', prop) 
    elseif p == 'baybutton25' then Animation('baybutton25', buttonprop25, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse25', prop) 
    elseif p == 'baybutton26' then Animation('baybutton26', buttonprop26, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse26', prop) 
    elseif p == 'baybutton27' then Animation('baybutton27', buttonprop27, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse27', prop) 
    elseif p == 'baybutton28' then Animation('baybutton28', buttonprop28, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse28', prop) 
    elseif p == 'baybutton29' then Animation('baybutton29', buttonprop29, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse29', prop) 
    elseif p == 'baybutton30' then Animation('baybutton30', buttonprop30, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse30', prop) 
    elseif p == 'baybutton31' then   Animation('baybutton31', buttonprop31, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse31', prop) 
    elseif p == 'baybutton32' then   Animation('baybutton32', buttonprop32, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse32', prop) 
    elseif p == 'baybutton33' then   Animation('baybutton33', buttonprop33, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse33', prop) 
    elseif p == 'baybutton34' then   Animation('baybutton34', buttonprop34, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse34', prop) 
    elseif p == 'baybutton35' then   Animation('baybutton35', buttonprop35, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse35', prop) 
    elseif p == 'baybutton39' then   Animation('baybutton39', buttonprop39, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse39', prop) 
    elseif p == 'baybutton40' then   Animation('baybutton40', buttonprop40, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse40', prop) 
    elseif p == 'baybutton41' then   Animation('baybutton41', buttonprop41, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse41', prop) 
    elseif p == 'baybutton42' then   Animation('baybutton42', buttonprop42, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse42', prop) 
    elseif p == 'baybutton43' then   Animation('baybutton43', buttonprop43, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse43', prop) 
    elseif p == 'baybutton44' then   Animation('baybutton44', buttonprop44, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse44', prop) 
    elseif p == 'baybutton45' then   Animation('baybutton45', buttonprop45, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse45', prop) 
    elseif p == 'baybutton46' then   Animation('baybutton46', buttonprop46, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse46', prop) 
    elseif p == 'baybutton47' then   Animation('baybutton47', buttonprop47, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse47', prop) 
    elseif p == 'baybutton48' then   Animation('baybutton48', buttonprop48, model, animDict)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse48', prop) 
    elseif p == 'baybutton36' then   grabloot(buttonprop36, prop36)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse36', prop) 
    elseif p == 'baybutton37' then   grabloot(buttonprop37, prop37)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse37', prop) 
    elseif p == 'baybutton38' then   grabloot(buttonprop38, prop38)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse38', prop) 
    elseif p == 'baybutton49' then   grabloot(buttonprop49, prop49)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse49', prop) 
    elseif p == 'baybutton50' then   grabloot(buttonprop50, prop50)  TriggerServerEvent('Polar-BayCityBank:Server:Synapse50', prop) 
        
    end
end)
--- grabs kitchen
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop', function(door, prop, var) loadModel(prop) buttonprop =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton then print('deleted 1') DeleteEntity(buttonprop) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop2', function(door, prop, var) loadModel(prop) buttonprop2 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop2, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton2 then print('deleted 2') DeleteEntity(buttonprop2) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop3', function(door, prop, var) loadModel(prop) buttonprop3 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop3, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton3 then print('deleted 3') DeleteEntity(buttonprop3) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop4', function(door, prop, var) loadModel(prop) buttonprop4 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop4, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton4 then print('deleted 4') DeleteEntity(buttonprop4) break end end end) end)
--- grabs big room
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop5', function(door, prop, var) loadModel(prop) buttonprop5 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop5, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton5 then DeleteEntity(buttonprop5) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop6', function(door, prop, var) loadModel(prop) buttonprop6 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop6, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton6 then DeleteEntity(buttonprop6) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop7', function(door, prop, var) loadModel(prop) buttonprop7 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop7, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton7 then DeleteEntity(buttonprop7) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop25', function(door, prop, var) loadModel(prop) buttonprop25 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop25, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton25 then DeleteEntity(buttonprop25) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop26', function(door, prop, var) loadModel(prop)  buttonprop26 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop26, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door)    CreateThread(function() while true do Wait(100) if not Config.baybutton26 then DeleteEntity(buttonprop26) break end end end) end)
--- pickups big room
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop27', function(door, prop, var) loadModel(prop) buttonprop27 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop27, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton27 then DeleteEntity(buttonprop27) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop28', function(door, prop, var) loadModel(prop) buttonprop28 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop28, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton28 then DeleteEntity(buttonprop28) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop29', function(door, prop, var) loadModel(prop) buttonprop29 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop29, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton29 then DeleteEntity(buttonprop29) break end end end) end)

--- ============= OFFICES =================
--- grabs office right
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop34', function(door, prop, var) loadModel(prop) buttonprop34 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop34, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton34 then DeleteEntity(buttonprop34) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop35', function(door, prop, var) loadModel(prop) buttonprop35 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop35, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton35 then DeleteEntity(buttonprop35) break end end end) end)
--- pickups office right
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop30', function(door, prop, var) loadModel(prop) buttonprop30 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop30, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton30 then DeleteEntity(buttonprop30) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop31', function(door, prop, var) loadModel(prop) buttonprop31 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop31, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton31 then DeleteEntity(buttonprop31) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop32', function(door, prop, var) loadModel(prop) buttonprop32 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop32, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton32 then DeleteEntity(buttonprop32) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop33', function(door, prop, var) loadModel(prop) buttonprop33 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop33, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton33 then DeleteEntity(buttonprop33) break end end end) end)
--- TROLLYS
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop36', function(door, prop, var) loadModel(prop) prop36 = prop buttonprop36 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop36, var.w)  
        TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton36 then DeleteEntity(buttonprop36) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop37', function(door, prop, var) loadModel(prop) prop37 = prop buttonprop37 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop37, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton37 then DeleteEntity(buttonprop36) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop38', function(door, prop, var) loadModel(prop) prop38 = prop buttonprop38 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop38, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton38 then DeleteEntity(buttonprop38) break end end end) end)
---- piles
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop39', function(door, prop, var) loadModel(prop) buttonprop39 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop39, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton39 then DeleteEntity(buttonprop39) break end end end) end)
--- BIG CASH GRAB
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop40', function(door, prop, var) loadModel(prop) buttonprop40 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop40, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton40 then DeleteEntity(buttonprop40) break end end end) end)

-- ================ VAULT ===============
--- piles (vault)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop41', function(door, prop, var) loadModel(prop) buttonprop41 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop41, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton41 then DeleteEntity(buttonprop41) break end end end) end) 
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop42', function(door, prop, var) loadModel(prop) buttonprop42 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop42, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton42 then DeleteEntity(buttonprop42) break end end end) end)
-- grabs (vauls)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop44', function(door, prop, var) loadModel(prop) buttonprop44 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop44, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton44 then DeleteEntity(buttonprop44) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop45', function(door, prop, var) loadModel(prop) buttonprop45 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop45, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton45 then DeleteEntity(buttonprop45) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop46', function(door, prop, var) loadModel(prop) buttonprop46 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop46, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton46 then DeleteEntity(buttonprop46) break end end end) end)
-- pickups (vault)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop47', function(door, prop, var) loadModel(prop) buttonprop47 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop47, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton47 then DeleteEntity(buttonprop47) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop48', function(door, prop, var) loadModel(prop) buttonprop48 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop48, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton48 then DeleteEntity(buttonprop48) break end end end) end)
--- trollys (vault)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop49', function(door, prop, var) loadModel(prop) prop49 = prop buttonprop49 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop49, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton49 then DeleteEntity(buttonprop49) break end end end) end)
RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop50', function(door, prop, var) loadModel(prop) prop50 = prop buttonprop50 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop50, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton50 then DeleteEntity(buttonprop50) break end end end) end)
     



    function CashAppear(grabModel)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local grabmodel = GetHashKey(grabModel)
    loadModel(grabmodel)
    local grabobj = CreateObject(grabmodel, pedCoords, true)
    FreezeEntityPosition(grabobj, true)
    SetEntityInvincible(grabobj, true)
    SetEntityNoCollisionEntity(grabobj, ped)
    SetEntityVisible(grabobj, false, false)
    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
    local startedGrabbing = GetGameTimer()
    CreateThread(function()
        while GetGameTimer() - startedGrabbing < 37000 do
            Wait(1)
            DisableControlAction(0, 73, true)
            if HasAnimEventFired(ped, GetHashKey('CASH_APPEAR')) then
                if not IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, true, false)
                end
            end
            if HasAnimEventFired(ped, GetHashKey('RELEASE_CASH_DESTROY')) then
                if IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, false, false)
                end
            end
        end
        DeleteObject(grabobj)
    end)
end

function grabloot(object, prop)
    local ped = PlayerPedId()
    if prop == 'ch_prop_ch_cash_trolly_01a' then grabModel = 'hei_prop_heist_cash_pile'  end
    if prop == 'ch_prop_gold_trolly_01a' then grabModel = 'ch_prop_gold_bar_01a' end
    if prop == 'ch_prop_diamond_trolly_01a' then grabModel = 'ch_prop_vault_dimaondbox_01a' end
    local prop2 = GetEntityCoords(object)
    local rot = GetEntityRotation(object)
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    local ped = PlayerPedId() 
    local pedCoords, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
    local animDict = 'anim@heists@ornate_bank@grab_cash'
    loadAnimDict(animDict)
    loadModel('hei_p_m_bag_var22_arm_s')
    local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCoords, true, false, false)
    scene1 = NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene1, animDict, 'intro', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 4.0, -8.0, 1)
    scene2 =  NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene2, animDict, 'grab', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_grab', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(object, scene2, animDict, 'cart_cash_dissapear', 4.0, -8.0, 1)
    scene3 =  NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene3, animDict, 'exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_exit', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene1)
    Wait(1750)
    CashAppear(grabModel)
    NetworkStartSynchronisedScene(scene2)
    Wait(37000)
    NetworkStartSynchronisedScene(scene3)
    Wait(2000)
    DeleteObject(bag)
    ClearPedTasks(ped)
    SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
end






























    


RegisterNetEvent('Polar-BayCityBank:client:HackComputer', function(data)
    local door = data.door
    TriggerServerEvent('Polar-BayCityBank:Server:StopInteract', door) 
    local chance=math.random(1,100) 

    local time = 60
    TriggerEvent('ultra-voltlab', time, function(result,reason)
    if result == 0 then --failed
        if chance < 50 then  TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) 
    elseif result == 1 then --success
        if chance < 50 then  TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end
        Wait(2000)
        TriggerServerEvent('Polar-BayCityBank:Server:RemoveItems', pcitem)
    elseif result == 2 then --time out
        if chance < 50 then  TriggerServerEvent('Polar-BayCityBank:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) 
    elseif result == -1 then end
    end) 
end)








local zone = PolyZone:Create({
    vector2(-1306.82, -789.02),
    vector2(-1364.39, -832.95),
    vector2(-1307.58, -896.21),
    vector2(-1238.64, -860.98),
    vector2(-1293.56, -781.06)
  }, {
	debugPoly=false,
    name="zone",
    minZ = 16.0,
    maxZ = 35.0,
})
zone:onPlayerInOut(function(isPointInside)
    if isPointInside then
        if not Config.Vault then
        VaultForceClose() 
       
        end
    else
        if not Config.Vault then
            
            VaultForceClose() 
           
         end
    end
end)



function VaultForceClose()
    local p = false
    if p then
    local object = GetClosestObjectOfType(vector3(-1307.85, -816.5, 17.82), 20.0, 961976194, false, false, false)
    --print(object)
    local entHeading = 37.75
    FreezeEntityPosition(object, false)
    SetEntityHeading(object, entHeading)
    FreezeEntityPosition(object, true)     
    else
        local object = GetClosestObjectOfType(vector3(-1307.85, -816.5, 17.82), 20.0, 961976194, false, false, false)
    --print(object)
    local entHeading = -125.74
    FreezeEntityPosition(object, false)
    while true do
        if entHeading < 37.75 then
            SetEntityHeading(object, entHeading - 1)
            entHeading = entHeading + 01.004
        else
            FreezeEntityPosition(object, true)
          
            break
        end

        Wait(10)
    end
    end
end
RegisterNetEvent('Polar-BayCityBank:Client:Vault', function(open)
    if not open then
    local object = GetClosestObjectOfType(vector3(-1307.85, -816.5, 17.82), 20.0, 961976194, false, false, false)
    --print(object)
    local entHeading = -125.74
    FreezeEntityPosition(object, false)
    while true do
        if entHeading < 37.75 then
            SetEntityHeading(object, entHeading - 1)
            entHeading = entHeading + 0.004
        else
            FreezeEntityPosition(object, true)
          
            break
        end

        Wait(10)
    end
    else
        local object = GetClosestObjectOfType(vector3(-1307.85, -816.5, 17.82), 20.0, 961976194, false, false, false)
        --print(object)
        local entHeading = 37.75
        FreezeEntityPosition(object, false)
        while true do
            if entHeading > -125.74 then
                SetEntityHeading(object, entHeading)
                entHeading = entHeading - 0.01
            else
                FreezeEntityPosition(object, true)
                TriggerServerEvent('Polar-BayCityBank:Server:VaultClose')
                break
            end
    
            Wait(10)
        end
    end
end)







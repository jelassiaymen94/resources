if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
local oxt = Config.OxTarget -- ox target
local oxdoorname = nil

local ped = PlayerPedId()
local animDict = nil local model = nil local prop = nil local var = nil local drillpos = nil local drillrot = nil local door = nil local pp = nil local coords = nil local rot = nil local position = nil local item = nil local CurrentCops = 0
local amount = nil

local specialgrab = 'Pacificgrab'
local vaultdoorname = Config.VaultDoorDoor
local vaultanimloc = Config.VaultDoorThirdEye
local fingerprintdoor = ''
-- vault stuff
local vaultid = 1
local open = 37.75
local closed = -125.74
local vaultloc = vector3(-1307.85, -816.5, 17.82)

local hi = Config.Debug

--- THERMITE
local thermiteinfo = { time = 30, squares = 4, errors = 3}
local thermitetime = 20000 -- thermite burn time

local hackname = 'hacking' -- https://github.com/Jesper-Hustad/NoPixel-minigame
local circleexport = 'Polar-UI' -- https://github.com/Project-Sloth/ps-ui
local thermiteexport = 'Polar-UI' -- https://github.com/Project-Sloth/ps-ui
local fingerhack = 'utk_fingerprint' -- https://github.com/utkuali/Finger-Print-Hacking-Game
local memorygame = 'memory' 
local voltgame = 'ultra-voltlab' -- https://forum.cfx.re/t/release-voltlab-hacking-minigame-cayo-perico-mission/3933171

--- QBCORE MEMORY GAME ----------------
local memgame = false -- if using default qbcore memorygame then set to true
local memname = "memorygame"


----------------------
local drillreward = nil
function goodies()  local chance = math.random(1,100) if chance <= 25 then drillreward = 'band' amount = 3 elseif chance <= 50 then drillreward = 'band' amount = 2 elseif chance <=100 then drillreward = 'band' amount = 1 end end


local pcitem = 'btc' -- crypto or sum
local thermiteitem = "thermite"
local vaultitem = 'laptop_blue' -- bluelaptop
local vaultitemchance = 50
local drillitem = 'drill' 
local drillitemchance = 50
local carditem = 'keycard' -- vaultkeycard
local carditemchance = 50
local computeritem = 'hacking_device' -- hacking_device


local Pacificstartname = 'Pacificstart'
local Pacificdoor1name = 'Pacificdoor1'
local Pacificdoor2name = 'Pacificdoor2'
local Pacificdoor3name = 'Pacificdoor3'
local Pacificdoorcard1name = 'Pacificdoorcard1'
local Pacificdoorcard2name = 'Pacificdoorcard2'



AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  TriggerEvent('Polar-Pacific:Client:ResetProps') TriggerEvent('Polar-Pacific:Client:ResetDoors') TriggerEvent('Polar-Pacific:Client:ResetPropsKeypads') resetstuff() LocalPlayer.state:set('inv_busy', false, true) end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if hi then print('Starting Targets')  end starttarget() blip()  end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if hi then print('Player Loaded Targets Starting') end starttarget() blip()  end)
RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)
RegisterNetEvent("Polar-Pacific:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)

local callback = Config.TrigCallBack -- QBCore.Functions.TriggerCallback ESX.TriggerServerCallback

RegisterNetEvent('Polar-Pacific:client:start', function()  pp = vector4(-109.43, 6483.32, 31.47, 224.11) door = Pacificstartname coords = vector3(-109.46, 6484.36, 31.27)
    if CurrentCops >= Config.RequiredCops then
    if playeritem(thermiteitem) then
    callback('Polar-Pacific:DoorCheckstart', function(result) if result then
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    Wait(50)
        TriggerEvent('Polar-Pacific:client:ThermiteStart', pp, door, coords)
    else
        notify(text('cooldown'), "error")
    end end)
    else notify(text('nothermite'), "error") end
    else notify(text('nopolice'), "error") end
end)

RegisterNetEvent('Polar-Pacific:client:ThermiteStart', function(pp, door, coords)
                    LocalPlayer.state:set('inv_busy', true, true)
                    PlantThermite(pp, door)
        if hi then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-Pacific:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor1')
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor2')
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor3')
                    TriggerServerEvent('Polar-Pacific:Server:StartTargets')
        else
            if memgame then 
                exports[memname]:thermiteminigame(10, 3, 3, 10,
                function() -- success
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-Pacific:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor1')
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor2')
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor3')
                    TriggerServerEvent('Polar-Pacific:Server:StartTargets')
                end,
                function() -- failure
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    notify(text('thermitefail'), "error") 
                end)
            else
                exports[thermiteexport]:Thermite(function(success) 
                if success then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-Pacific:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor1')
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor2')
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor3')
                    TriggerServerEvent('Polar-Pacific:Server:StartTargets')
                else 
                    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    notify(text('thermitefail'), "error") end
            end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
        end
    end
end)





RegisterNetEvent('Polar-Pacific:client:Thermite', function(pp, door, coords)
    if hi then PlantThermite(pp, door) ThermiteEffect(door, coords) else
        if playeritem(thermiteitem) then
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    if math.random(1, 100) <= Config.FingerPrintPercent and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)
    if memgame then 
        exports[memname]:thermiteminigame(10, 3, 3, 10,
        function() -- success
            TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) ThermiteEffect(door, coords)
           
        end,
        function() -- failure
            TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
            notify(text('thermitefail'), "error") 
        end)
    else
    exports[thermiteexport]:Thermite(function(success)
    if success then TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) ThermiteEffect(door, coords)
    
    else TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
        notify(text('thermitefail'), "error") end
    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
    end
    else notify(text('nothermite'), "error") end
    end
end)
function ThermiteEffect(door, coords)
    if door == 'Pacificstart' then CallPolice() end
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-Pacific:Server:ThermitePtfx", vec3(coords.x, coords.y, coords.z+0.2)) Wait(500) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) TriggerEvent('Polar-Pacific:Client:DestroyPad', door) Wait(thermitetime) ClearPedTasks(PlayerPedId())   TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)
 end 
function PlantThermite(pp, door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door) TriggerServerEvent('Polar-Pacific:Server:RemoveItem', thermiteitem, 1) RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") or not HasModelLoaded("hei_p_m_bag_var22_arm_s") or not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    local pos = pp SetEntityHeading(PlayerPedId(), pos.w) Wait(100) local rotx, roty, rotz = table.unpack(vector3(GetEntityRotation(PlayerPedId()))) local netscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3) local bag = CreateObject('hei_p_m_bag_var22_arm_s', pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true) local x, y, z = table.unpack(GetEntityCoords(PlayerPedId())) local thermite = CreateObject('hei_prop_heist_thermite', x, y, z + 0.2,  true,  true, true) SetEntityCollision(thermite, false, true) AttachEntityToEntity(thermite, ped, GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true) NetworkAddPedToSynchronisedScene(PlayerPedId(), netscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1) SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0) NetworkStartSynchronisedScene(netscene) Wait(5000) DetachEntity(thermite, 1, 1) FreezeEntityPosition(thermite, true) DeleteObject(bag)  SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 1, 1) NetworkStopSynchronisedScene(netscene) CreateThread(function() Wait(15000) DeleteEntity(thermite) end)
end
function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end
function drill(drillpos, drillrot, item, door) local pedCo = GetEntityCoords(PlayerPedId()) LocalPlayer.state:set('inv_busy', true, true) local coords, pedRotation = GetEntityCoords(PlayerPedId()), GetEntityRotation(PlayerPedId()) local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@' loadAnimDict(animDict) local bagModel = 'hei_p_m_bag_var22_arm_s' loadModel(bagModel) local laserDrillModel = 'hei_prop_heist_drill' loadModel(laserDrillModel) RequestAmbientAudioBank('DLC_HEIST_FLEECA_SOUNDSET', 0) RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL', 0) RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL_2', 0) soundId = GetSoundId() cam = CreateCam('DEFAULT_ANIMATED_CAMERA', true) SetCamActive(cam, true) RenderScriptCams(true, 0, 3000, 1, 0) bag = CreateObject(GetHashKey(bagModel), coords, 1, 0, 0) laserDrill = CreateObject(GetHashKey(laserDrillModel), coords, 1, 0, 0)
    scene1 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'intro', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene1, animDict, 'intro_drill_bit', 1.0, -1.0, 1148846080) scene2 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'drill_straight_start', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_drill_straight_start', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene2, animDict, 'drill_straight_start_drill_bit', 1.0, -1.0, 1148846080) scene3 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'drill_straight_end_idle', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_drill_straight_end_idle', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene3, animDict, 'drill_straight_end_idle_drill_bit', 1.0, -1.0, 1148846080) scene4 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene4, animDict, 'drill_straight_fail', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene4, animDict, 'bag_drill_straight_fail', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene4, animDict, 'drill_straight_fail_drill_bit', 1.0, -1.0, 1148846080) scene5 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene5, animDict, 'drill_straight_end', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene5, animDict, 'bag_drill_straight_end', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene5, animDict, 'drill_straight_end_drill_bit', 1.0, -1.0, 1148846080) scene6 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene6, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene6, animDict, 'bag_exit', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene6, animDict, 'exit_drill_bit', 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene1) PlayCamAnim(cam, 'intro_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'intro') * 1000) NetworkStartSynchronisedScene(scene2) PlayCamAnim(cam, 'drill_straight_start_cam', animDict, drillpos, drillrot, 0, 2) NetworkStartSynchronisedScene(scene3) PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, drillpos, drillrot, 0, 2) PlaySoundFromEntity(soundId, 'Drill', laserDrill, 'DLC_HEIST_FLEECA_SOUNDSET', 1, 0)
    TriggerEvent('Drilling:Start',function(success) if success then                             
    StopSound(soundId) NetworkStartSynchronisedScene(scene5) PlayCamAnim(cam, 'drill_straight_end_cam', animDict, drillpos, drillrot, 0, 2)
    Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000) NetworkStartSynchronisedScene(scene6) PlayCamAnim(cam, 'exit_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'exit') * 1000)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId()) DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- success
    goodies()
    TriggerServerEvent('Polar-Pacific:Server:RemoveItems', drillreward, amount)
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100)
    if chance <= drillitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', item, 1) end
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
    else
    StopSound(soundId) NetworkStartSynchronisedScene(scene4) PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId())  DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- fail 
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100) TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
    if chance <= drillitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', item, 1) end
    end
    end)
end

function blip()
    if Config.UseBlip then
    local blip = AddBlipForCoord(Config.BlipLocation) SetBlipSprite (blip, Config.BlipSprite) SetBlipDisplay(blip, 6) SetBlipScale (blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, Config.BlipColor) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName(Config.BlipName) EndTextCommandSetBlipName(blip)
    else return end
end
function gloves()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3) local model = GetEntityModel(PlayerPedId()) local retval = true if model == 'mp_m_freemode_01' then if Config.MaleGloves[armIndex] ~= nil 
    and Config.MaleGloves[armIndex] then retval = false end else if Config.FemaleGloves[armIndex] ~= nil and Config.FemaleGloves[armIndex] then retval = false end end return retval
end





function other()
    if oxt then
        box = exports.ox_target:addBoxZone({ coords = vaultanimloc, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:VaultHack",  icon = "fas fa-bolt", label = "Hack" }, } })
        if hi then print(' vaultdoor = ' .. box .. ' ') end

        box = exports.ox_target:addBoxZone({ coords = Config.FingerPrintDoorDoor, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:VaultFinger",  icon = "fas fa-bolt", label = "Hack Door" }, } })
        if hi then print(' vaultfingerdoor = ' .. box .. ' ') end

    else
        exports['qb-target']:AddBoxZone(vaultdoorname,  vaultanimloc, 0.5, 0.5, { name =  vaultdoorname, heading = 28.69, debug = false, minZ = vaultanimloc.z-0.5, maxZ =  vaultanimloc.z+0.5,}, 
        { options = {{ event = "Polar-Pacific:Client:VaultHack", icon = "fas fa-bolt", label = "Hack", excludejob = 'police' }}, distance = 1 }) 

        exports['qb-target']:AddBoxZone(Config.FingerPrintDoorDoor,  Config.FingerEye, 0.5, 0.5, { name =  Config.FingerPrintDoorDoor, heading = 28.69, debug = false, minZ = Config.FingerEye.z-0.5, maxZ =  Config.FingerEye.z+0.5,}, 
        { options = {{ event = "Polar-Pacific:Client:VaultFinger",  icon = "fas fa-bolt", label = "Hack Door", excludejob = 'police', item = vaultitem}}, distance = 2.5 }) 
       
    end

    local k = 0 local p = 0 local distance1 = 0.22 local distance2 = 0.22 local space1 = nil local space2 = nil local chance = math.random(1,100)  if chance<=15 then   space2 = k+distance1  space1 = k-distance2  elseif chance<=30 then   space2 = k-distance2  space1 = k+distance1  elseif chance<=45 then   space2 = k  space1 = k+distance1   elseif chance<=60 then   space1 = k space2 = k+distance2 elseif chance<=75 then   space2 = k-distance2 space1 = k elseif chance<=90 then   space1 = k-distance1 space2 = k elseif chance<=100 then   space2 = k  space1 = k end 
  
    local loc =  vector4(258.67, 218.69, 102.27-space1, 339.88)
    local name = "Pacificdrill1"
    adddrillspot(loc, name)
    local loc =   vector4(260.44, 218.03, 102.27-space2, 333.66)
    local name = "Pacificdrill2"
    adddrillspot(loc, name)
    local loc =  vector4(259.13, 213.47, 102.27-space1, 161.43)
    local name = "Pacificdrill3"
    adddrillspot(loc, name)
    local loc =   vector4(256.97, 214.06, 102.27-space2, 164.85)
    local name = "Pacificdrill4"
    adddrillspot(loc, name)
    local loc = vector4(266.76, 213.43,  102.27-space1, 250.05)
    local name = "Pacificdrill5"
    adddrillspot(loc, name)
    local loc =   vector4(263.84, 217.06,  102.27-space2, 343.68)
    local name = "Pacificdrill6"
    adddrillspot(loc, name)
    local loc = vector4(263.72, 211.86,  102.27-space1, 161.47)
    local name = "Pacificdrill7"
    adddrillspot(loc, name)
    local loc =   vector4(262.46, 212.25,  102.27-space2, 161.2)
    local name = "Pacificdrill8"
    adddrillspot(loc, name)


end 

function adddrillspot(loc, name)
    if oxt then
        exports.ox_target:addBoxZone({ coords = vector3(loc.x, loc.y, loc.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox" }, } })
    else
        exports['qb-target']:AddBoxZone(name,  vector3(loc.x, loc.y, loc.z), 0.25, 0.25, { name = name, heading = loc.w, debug = hi, minZ = loc.z-1, maxZ =  loc.z+1,}, 
        { options = {{ event = "Polar-Pacific:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox", excludejob = 'police', item = drillitem}}, distance = 1 }) 
    end
end








function CashAppear(grabModel)
   
    local pedCoords = GetEntityCoords(PlayerPedId())
    local grabmodel = GetHashKey(grabModel)
    loadModel(grabmodel)
    local grabobj = CreateObject(grabmodel, pedCoords, true)
    FreezeEntityPosition(grabobj, true)
    SetEntityInvincible(grabobj, true)
    SetEntityNoCollisionEntity(grabobj, ped)
    SetEntityVisible(grabobj, false, false)
    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(PlayerPedId(), 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
    local startedGrabbing = GetGameTimer()
    CreateThread(function()
        while GetGameTimer() - startedGrabbing < 37000 do
            Wait(1)
            DisableControlAction(0, 73, true)
            if HasAnimEventFired(PlayerPedId(), GetHashKey('CASH_APPEAR')) then
                if not IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, true, false)
                end
            end
            if HasAnimEventFired(PlayerPedId(), GetHashKey('RELEASE_CASH_DESTROY')) then
                if IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, false, false)
                end
            end
        end
        DeleteObject(grabobj)
    end)
end

function grabloot(door, object, prop, p, name)
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    if prop == 'ch_prop_ch_cash_trolly_01a' then grabModel = 'hei_prop_heist_cash_pile'  end
    if prop == 'ch_prop_gold_trolly_01a' then grabModel = 'ch_prop_gold_bar_01a' end
    if prop == 'ch_prop_diamond_trolly_01a' then grabModel = 'ch_prop_vault_dimaondbox_01a' end
    local prop2 = GetEntityCoords(object)
    local rot = GetEntityRotation(object)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    local pedCoords, pedRotation = GetEntityCoords(PlayerPedId()), vector3(0.0, 0.0, 0.0)
    local animDict = 'anim@heists@ornate_bank@grab_cash'
    loadAnimDict(animDict)
    loadModel('hei_p_m_bag_var22_arm_s')
    local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCoords, true, false, false)
    scene1 = NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'intro', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 4.0, -8.0, 1)
    scene2 =  NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_grab', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(object, scene2, animDict, 'cart_cash_dissapear', 4.0, -8.0, 1)
    scene3 =  NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_exit', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene1)
    Wait(1750)
    CashAppear(grabModel)
    NetworkStartSynchronisedScene(scene2)
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop) 
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(5000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Pacific:Server:SynapsePacific' .. name .. '', prop)    
    NetworkStartSynchronisedScene(scene3)
    Wait(2000)
    DeleteObject(bag)
    ClearPedTasks(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
end





local zone = PolyZone:Create({
    vector2(-95.45, 6557.95),
    vector2(29.92, 6432.58),
    vector2(-119.70, 6274.62),
    vector2(-265.91, 6426.14)
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
    local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
    --print(object)
    local entHeading = open
    FreezeEntityPosition(object, false)
    SetEntityHeading(object, entHeading)
    FreezeEntityPosition(object, true)     
    else
        local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
    --print(object)
    local entHeading = closed
    FreezeEntityPosition(object, false)
    while true do
        if not Config.Vault then
        if entHeading < open then
            SetEntityHeading(object, entHeading - 1)
            entHeading = entHeading + 01.004
        else
            FreezeEntityPosition(object, true)
          
            break
        end
        end
        Wait(10)
    end
    end
end
RegisterNetEvent('Polar-Pacific:Client:Vault', function(opens)
    if Config.DoorLock then TriggerServerEvent('qb-doorlock:server:updateState',  vaultdoorname, false, false, false, true, false, false)   return end
    if not opens then
    local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
    --print(object)
    local entHeading = closed
    FreezeEntityPosition(object, false)
    while true do
        print('h')
        if entHeading > open then
            SetEntityHeading(object, entHeading + 1)
            entHeading = entHeading - 0.01
        else
            FreezeEntityPosition(object, true)
          
            break
        end

        Wait(10)
    end
    else
        local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
        --print(object)
        local entHeading = open
        FreezeEntityPosition(object, false)
        while true do
            if entHeading > closed then
                SetEntityHeading(object, entHeading)
                entHeading = entHeading - 0.01
            else
                FreezeEntityPosition(object, true)
                TriggerServerEvent('Polar-Pacific:Server:VaultClose')
                break
            end
    
            Wait(10)
        end
    end
end)







RegisterNetEvent('Polar-Pacific:Client:AddPickupTarget', function(door, door2, prop, var, pile) 
    if oxt then
        rod = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
        if hi then print('grab id: ' .. rod .. ' propdoor: ' .. door .. ' proplabel: ' .. prop .. ' ispile: ') end
    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z  - 0.5, maxZ =  var.z + 0.5,}, 
        { options = {{ event = "Polar-Pacific:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1 }) 
    end
end)





function Animation(door, props, model, animDict, sped)
    if door == specialgrab then
       
        SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
        LocalPlayer.state:set('inv_busy', true, true) -- Busy
      
       
        local pedCo, pedRotation = GetEntityCoords(PlayerPedId()), GetEntityRotation(PlayerPedId())
        local animDict = ''
        

        if model == 'h4_prop_h4_gold_stack_01a' then
            animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
            loadAnimDict(animDict)
        else
            animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
            loadAnimDict(animDict)
        end
        TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
        loadModel('hei_p_m_bag_var22_arm_s')
        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
        local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(props), 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3) 
        NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
        local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(props), 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3) 
        NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080) 
        if model == 'h4_prop_h4_gold_stack_01a' then 
        NetworkAddEntityToSynchronisedScene(props, scene2, animDict, 'grab_gold', 1.0, -1.0, 1148846080) 
        else 
        NetworkAddEntityToSynchronisedScene(props, scene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080) 
        end
        local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(props), 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080) 
        NetworkStartSynchronisedScene(scene1)
        Wait(1000)
        NetworkStartSynchronisedScene(scene2)
        Wait(GetAnimDuration(animDict, 'grab') * 1000 - 3000)
        DeleteObject(props)
        NetworkStartSynchronisedScene(scene3)
        Wait(GetAnimDuration(animDict, 'exit') * 1000)        
        ClearPedTasks(PlayerPedId())
        DeleteObject(bag)
        SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
        LocalPlayer.state:set('inv_busy', false, true) 
        TriggerServerEvent('Polar-Pacific:Server:Synapse' .. door .. '', sped)  
    else
        rottt = GetEntityRotation(props)
        if rottt == nil then  
            print('error')
        else
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    local pedCo, pedRotation = GetEntityCoords(PlayerPedId()), GetEntityRotation(PlayerPedId())
    loadAnimDict(animDict) loadModel(model) local bag = CreateObject(GetHashKey(model), pedCo, 1, 1, 0)
    local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(props), GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
    local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(props), GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
    local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(props), GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 0, 1) NetworkStartSynchronisedScene(scene1) Wait(1000)
    NetworkStartSynchronisedScene(scene2)
    FreezeEntityPosition(props, true)
    SetEntityInvincible(props, true)
    SetEntityNoCollisionEntity(props, ped)
    AttachEntityToEntity(props, ped, GetPedBoneIndex(PlayerPedId(), 58866), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
    SetEntityRotation(props, 0.0, 0.0, 2, 2)
    Wait(500) SetEntityVisible(props, false, false)
    NetworkStartSynchronisedScene(scene3) Wait(1000) ClearPedTasks(PlayerPedId()) DeleteObject(bag) SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true)  
    TriggerServerEvent('Polar-Pacific:Server:Synapse' .. door .. '', sped)  
        end
    end
end 
RegisterNetEvent('Polar-Pacific:Client:AddTarget', function(door, door2, prop, var) 
    if oxt then 
        box = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
        if hi then print('grab id: ' .. box .. ' propdoor: ' .. door .. ' proplabel: ' .. prop) end

    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
        { options = {{ event = "Polar-Pacific:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1 }) 
    end
end)

RegisterNetEvent('Polar-Pacific:Client:HackComputer', function(data)
    if playeritem(computeritem) then
        print('hi')
    local door = data.door
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door) 
    local chance=math.random(1,100) 

    local time = 60
    TriggerEvent(voltgame, time, function(result,reason)
    if result == 0 then --failed
        if chance < 50 then  TriggerServerEvent('Polar-Pacific:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
    elseif result == 1 then --success
        if chance < 50 then  TriggerServerEvent('Polar-Pacific:Server:RemoveItem', computeritem, 1) end
        Wait(2000)
        TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
        TriggerServerEvent('Polar-Pacific:Server:RemoveItems', pcitem)
    elseif result == 2 then --time out
        if chance < 50 then  TriggerServerEvent('Polar-Pacific:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
    elseif result == -1 then end
    end) 
    else notify(text('nopcitem'), "error") end
end)








RegisterNetEvent('Polar-Pacific:client:keycard', function(door, position, rot, item) TriggerServerEvent('Polar-Pacific:Server:StopInteract', door) 
    if playeritem(carditem) then
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
    local chance = math.random(1,100) local pos = GetEntityCoords(PlayerPedId()) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(PlayerPedId(), true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(PlayerPedId(), position.w) SetEntityCoords(PlayerPedId(), vector3(position.x, position.y,position.z-1)) if chance <= carditemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(PlayerPedId(), animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(PlayerPedId(), animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(PlayerPedId(), animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(PlayerPedId(), animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(PlayerPedId(), false) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)  notify(text('doorunlock'), "success", 2500)
    else  notify(text('nokeycard'), "error") end
end)


function next(door, loc)
    SetEntityCoords(ped, vec3(loc.x, loc.y, loc.z-1))
    local animDict = 'anim@heists@ornate_bank@hack'
    loadAnimDict(animDict)
    loadModel('hei_prop_hst_laptop')
    loadModel('hei_p_m_bag_var22_arm_s')
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    SetEntityHeading(ped, loc.w)
    local animPos = GetAnimInitialOffsetPosition(animDict, 'hack_enter', loc.x, loc.y, loc.z-0.445, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, 'hack_loop', loc.x, loc.y, loc.z-0.445, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, 'hack_exit', loc.x, loc.y, loc.z-0.445, loc.x, loc.y, loc.z, 0, 2)

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
    if door == vaultdoorname then
        LocalPlayer.state:set('inv_busy', true, true) 
    exports[hackname]:OpenHackingGame(10, 5, 3, function(Success) 
        if Success then
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', vaultitem, 1) end
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
            notify(text('vaultopen'), "success", 2500)
            TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
        else
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true) 
            TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
        end
    end)
      
        elseif door == fingerprintdoor then
     
            LocalPlayer.state:set('inv_busy', true, true) 
        TriggerEvent("".. fingerhack ..":Start", 4, 1, 1, function(outcome, reason) 
        if outcome == true then -- success
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', vaultitem, 1) end
            doorlock(door, false)
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true) 
            notify(text('doorunlock'), "success", 2500)
            TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
        elseif outcome == false then -- fail
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true)
            TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
        end end)
        end 
       
end
function hack(door)
    LocalPlayer.state:set('inv_busy', true, true) 
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    local ped = PlayerPedId()
    local loc = nil local location = nil
    if door ==  vaultdoorname then  
        loc = Config.VaultDoorAnimation
       
    elseif door == Config.FingerPrintDoorDoor then
        loc = Config.FingerPrintDoor
       
    end
    SetEntityHeading(ped, loc.w)
    SetEntityCoords(ped, vec3(loc.x, loc.y, loc.z-1))
    if Config.Notify == 'esx' then
        next(door, loc)
    else
    QBCore.Functions.Progressbar("door", "Connecting to Door ..", math.random(5000, 7500), false, true, {
    disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
    }, {}, {}, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        next(door, loc)
    end, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
        LocalPlayer.state:set('inv_busy', false, true) 
    end)
    end
end

RegisterNetEvent('Polar-Pacific:client:DrillStart', function(drillpos, drillrot, door)
    if playeritem(drillitem) then
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    drill(drillpos, drillrot, drillitem, door)
    else  notify(text('nodrill'), "error") end
end)

RegisterNetEvent('Polar-Pacific:Client:Drill', function(data)
    callback('Polar-Pacific:' .. data.door .. '', function(result) if result then 
    TriggerEvent('Polar-Pacific:client:DrillStart', data.coords, vector3(0.0, 0.0, data.head), data.door)
    else
        notify(text('sometingelse'), "error")
    end end)
end)

function vaultdone() TriggerServerEvent('Polar-Pacific:Server:Vault') end
RegisterNetEvent('Polar-Pacific:Client:VaultHack', function() 
    if playeritem(vaultitem) then
    callback('Polar-Pacific:VaultCheck', function(result) if result then 
        hack(vaultdoorname)
    else
        notify(text('sometingelse'), "error")
    end end)
    else notify(text('novaultitem'), "error") end
end)



  





























local prop16 = nil
local prop17 = nil
local prop18 = nil
local prop19 = nil
local prop20 = nil

local prop26 = nil
local prop27 = nil
local prop28 = nil
local prop29 = nil
local prop30 = nil







function starttarget()
    ------ DOOR THERMITE
    if oxt then
        box = exports.ox_target:addBoxZone({ coords = Config.StartThirdEye, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Pacificstartname, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Pacific:client:start' }, } })
        if hi then print(' startbox = ' .. box .. ' ') end
    else
    
    exports['qb-target']:AddBoxZone(Pacificstartname, Config.StartThirdEye, 1, 1, { name = Pacificstartname, heading = 0.0, debug = hi, minZ = Config.StartThirdEye.z-1, maxZ =  Config.StartThirdEye.z+1,}, 
    { options = {{ event = "Polar-Pacific:client:start", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 1 }) 

    end
end

RegisterNetEvent('Polar-Pacific:Client:StartLoot', function()

    TriggerServerEvent('Polar-Pacific:Server:SetupGrab1')

    TriggerServerEvent('Polar-Pacific:Server:SetupPickup1')

    TriggerServerEvent('Polar-Pacific:Server:SetupPile1')

    TriggerServerEvent('Polar-Pacific:Server:SetupTrolly1')


end)

RegisterNetEvent('Polar-Pacific:Client:StartTargets', function()
    
    if oxt then

        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Pacificdoor1name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Pacific:Client:Door1' }, } })
        if hi then print(' ' .. Pacificdoor1name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Pacificdoor2name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Pacific:Client:Door2' }, } })
        if hi then print(' ' .. Pacificdoor2name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Pacificdoor3name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Pacific:Client:Door3' }, } })
        if hi then print(' ' .. Pacificdoor3name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Pacificdoorcard1name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-Pacific:Client:doorcard1' }, } })
        if hi then print(' ' .. Pacificdoorcard1name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Pacificdoorcard2name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-Pacific:Client:doorcard2' }, } })
        if hi then print(' ' .. Pacificdoorcard2name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = Config.Pc1, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc1name, event = 'Polar-Pacific:Client:HackComputer' }, } })
        if hi then print(' ' .. Config.Pc1name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = Config.Pc2, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc2name, event = 'Polar-Pacific:Client:HackComputer' }, } })
        if hi then print(' ' .. Config.Pc2name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = Config.Pc3, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc3name, event = 'Polar-Pacific:Client:HackComputer' }, } })
        if hi then print(' ' .. Config.Pc3name .. box .. '') end
      
    else
    
   
    exports['qb-target']:AddBoxZone(Pacificdoor1name, vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), 1, 1, { name = Pacificdoor1name, heading = 0.0, debug = hi, minZ = Config.Door1Eye.z-1, maxZ =  Config.Door1Eye.z+1,}, 
    { options = {{ event = "Polar-Pacific:Client:Door1", icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 1 }) 
    exports['qb-target']:AddBoxZone(Pacificdoor2name, vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), 1, 1, { name = Pacificdoor2name, heading = 0.0, debug = hi, minZ = Config.Door2Eye.z-1, maxZ =  Config.Door2Eye.z+1,}, 
    { options = {{ event = "Polar-Pacific:Client:Door2", icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 1 }) 
    exports['qb-target']:AddBoxZone(Pacificdoor3name, vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), 1, 1, { name = Pacificdoor3name, heading = 0.0, debug = hi, minZ = Config.Door3Eye.z-1, maxZ =  Config.Door3Eye.z+1,}, 
    { options = {{ event = "Polar-Pacific:Client:Door3", icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 1 }) 
    
    exports['qb-target']:AddBoxZone(Pacificdoorcard1name, vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), 1, 1, { name = Pacificdoorcard1name, heading = 0.0, debug = hi, minZ = Config.doorcard1Eye.z-1, maxZ =  Config.doorcard1Eye.z+1,}, 
    { options = {{ event = "Polar-Pacific:Client:doorcard1", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police'}}, distance = 1 }) 
    exports['qb-target']:AddBoxZone(Pacificdoorcard2name, vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), 1, 1, { name = Pacificdoorcard2name, heading = 0.0, debug = hi, minZ = Config.doorcard2Eye.z-1, maxZ =  Config.doorcard2Eye.z+1,}, 
    { options = {{ event = "Polar-Pacific:Client:doorcard2", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police'}}, distance = 1 }) 
   
    exports['qb-target']:AddBoxZone(Config.Pc1name, Config.Pc1, 2, 2, { name = Config.Pc1name, heading = 28.69, debug = hi, minZ = Config.Pc1-1, maxZ =  Config.Pc1+1,}, 
    { options = {{ event = "Polar-Pacific:Client:HackComputer", door = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police' }}, distance = 1 }) 
    exports['qb-target']:AddBoxZone(Config.Pc2name, Config.Pc2, 2, 2, { name = Config.Pc2name, heading = 28.69, debug = hi, minZ = Config.Pc2-1, maxZ =  Config.Pc2+1,}, 
    { options = {{ event = "Polar-Pacific:Client:HackComputer", door = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police'}}, distance = 1 }) 
    exports['qb-target']:AddBoxZone(Config.Pc3name, Config.Pc3, 2, 2, { name = Config.Pc3name, heading = 28.69, debug = hi, minZ = Config.Pc3-1, maxZ =  Config.Pc3+1,}, 
    { options = {{ event = "Polar-Pacific:Client:HackComputer", door = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police'}}, distance = 1 }) 
    
    end

    other()

end)


--- Thermites
RegisterNetEvent('Polar-Pacific:Client:Door1', function() pp = vec4(Config.Door1Thermite.x, Config.Door1Thermite.y, Config.Door1Thermite.z + 0.2, Config.Door1Thermite.w) door = Pacificdoor1name coords =  Config.Door1Pfx callback('Polar-Pacific:Door1', function(result) if result then TriggerEvent('Polar-Pacific:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-Pacific:Client:Door2', function() pp = vec4(Config.Door2Thermite.x, Config.Door2Thermite.y, Config.Door2Thermite.z + 0.2, Config.Door2Thermite.w) door = Pacificdoor2name coords =  Config.Door2Pfx callback('Polar-Pacific:Door2', function(result) if result then TriggerEvent('Polar-Pacific:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-Pacific:Client:Door3', function() pp = vec4(Config.Door3Thermite.x, Config.Door3Thermite.y, Config.Door3Thermite.z + 0.2, Config.Door3Thermite.w) door = Pacificdoor3name coords =  Config.Door3Pfx callback('Polar-Pacific:Door3', function(result) if result then TriggerEvent('Polar-Pacific:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
----- CARD INSERT
RegisterNetEvent('Polar-Pacific:Client:doorcard1', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard1swipe door = Pacificdoorcard1name TriggerEvent('Polar-Pacific:client:keycard', door, position, rot, item) end)
RegisterNetEvent('Polar-Pacific:Client:doorcard2', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard2swipe door = Pacificdoorcard2name TriggerEvent('Polar-Pacific:client:keycard', door, position, rot, item) end)






























---- grabs 1-5 and 31-40


function resetstuff()
    for i = 1, 40 do
        if hi then print('setting to nil ' .. i .. ' / 40') end
        _G["Pacificprop" .. i] = nil
    end
end


local Pacificprop1 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop1', function(door, prop, var) loadModel(prop) Pacificprop1 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop1, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
 
end)

local Pacificprop2 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop2', function(door, prop, var) loadModel(prop) Pacificprop2 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop2, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
   
end)

local Pacificprop3 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop3', function(door, prop, var) loadModel(prop) Pacificprop3 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop3, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
 
end)

local Pacificprop4 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop4', function(door, prop, var) loadModel(prop) Pacificprop4 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop4, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)

local Pacificprop5 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop5', function(door, prop, var) loadModel(prop) Pacificprop5 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop5, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)


local Pacificprop31 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop31', function(door, prop, var) loadModel(prop) Pacificprop31 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop31, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
   
end)

local Pacificprop32 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop32', function(door, prop, var) loadModel(prop) Pacificprop32 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop32, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
 
end)

local Pacificprop33 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop33', function(door, prop, var) loadModel(prop) Pacificprop33 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop33, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)

local Pacificprop34 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop34', function(door, prop, var) loadModel(prop) Pacificprop34 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop34, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
 
end)

local Pacificprop35 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop35', function(door, prop, var) loadModel(prop) Pacificprop35 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop35, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)


local Pacificprop36 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop36', function(door, prop, var) loadModel(prop) Pacificprop36 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop36, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
 
end)

local Pacificprop37 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop37', function(door, prop, var) loadModel(prop) Pacificprop37 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop37, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)

local Pacificprop38 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop38', function(door, prop, var) loadModel(prop) Pacificprop38 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop38, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
 
end)

local Pacificprop39 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop39', function(door, prop, var) loadModel(prop) Pacificprop39 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop39, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop40 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop40', function(door, prop, var) loadModel(prop) Pacificprop40 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop40, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
   
end)












---- pickups 6-10 and 21 - 25

local Pacificprop6 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop6', function(door, prop, var) loadModel(prop) Pacificprop6 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop6, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)

local Pacificprop7 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop7', function(door, prop, var) loadModel(prop) Pacificprop7 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop7, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
  
end)

local Pacificprop8 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop8', function(door, prop, var) loadModel(prop) Pacificprop8 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop8, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop9 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop9', function(door, prop, var) loadModel(prop) Pacificprop9 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop9, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop10 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop10', function(door, prop, var) loadModel(prop) Pacificprop10 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop10, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)


local Pacificprop21 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop21', function(door, prop, var) loadModel(prop) Pacificprop21 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop21, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
 
end)

local Pacificprop22 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop22', function(door, prop, var) loadModel(prop) Pacificprop22 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop22, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop23 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop23', function(door, prop, var) loadModel(prop) Pacificprop23 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop23, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop24 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop24', function(door, prop, var) loadModel(prop) Pacificprop24 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop24, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop25 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop25', function(door, prop, var) loadModel(prop) Pacificprop25 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop25, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)











---- piles 11-15

local Pacificprop11 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop11', function(door, prop, var) loadModel(prop) Pacificprop11 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop11, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop12 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop12', function(door, prop, var) loadModel(prop) Pacificprop12 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop12, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop13 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop13', function(door, prop, var) loadModel(prop) Pacificprop13 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop13, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop14 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop14', function(door, prop, var) loadModel(prop) Pacificprop14 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop14, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)

local Pacificprop15 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop15', function(door, prop, var) loadModel(prop) Pacificprop15 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop15, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 

end)




---- trollys 16-20 and 26-30

local Pacificprop16 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop16', function(door, prop, var) loadModel(prop) prop16 = prop Pacificprop16 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop16, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop17 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop17', function(door, prop, var) loadModel(prop) prop17 = prop Pacificprop17 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop17, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop18 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop18', function(door, prop, var) loadModel(prop) prop18 = prop Pacificprop18 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop18, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop19 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop19', function(door, prop, var) loadModel(prop) prop19 = prop Pacificprop19 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop19, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop20 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop20', function(door, prop, var) loadModel(prop) prop20 = prop Pacificprop20 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop20, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)


local Pacificprop26 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop26', function(door, prop, var) loadModel(prop) prop26 = prop Pacificprop26 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop26, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop27 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop27', function(door, prop, var) loadModel(prop) prop27 = prop Pacificprop27 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop27, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop28 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop28', function(door, prop, var) loadModel(prop) prop28 = prop Pacificprop28 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop28, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop29 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop29', function(door, prop, var) loadModel(prop) prop29 = prop Pacificprop29 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop29, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)

local Pacificprop30 = nil
RegisterNetEvent('Polar-Pacific:Client:Pacificprop30', function(door, prop, var) loadModel(prop) prop30 = prop Pacificprop30 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(Pacificprop30, var.w) 
    TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)

end)





RegisterNetEvent('Polar-Pacific:Client:TargetRemove', function(door) 

    if door == 'Pacificprop1' then DeleteEntity(Pacificprop1)end --  oxdoorname = Pacificprop1 end
    if door == 'Pacificprop2' then DeleteEntity(Pacificprop2)end --  oxdoorname = Pacificprop2 end
    if door == 'Pacificprop3' then DeleteEntity(Pacificprop3)end --  oxdoorname = Pacificprop3 end
    if door == 'Pacificprop4' then DeleteEntity(Pacificprop4)end --  oxdoorname = Pacificprop4 end
    if door == 'Pacificprop5' then DeleteEntity(Pacificprop5)end --  oxdoorname = Pacificprop5 end
    if door == 'Pacificprop6' then DeleteEntity(Pacificprop6)end 
    if door == 'Pacificprop7' then DeleteEntity(Pacificprop7)end 
    if door == 'Pacificprop8' then DeleteEntity(Pacificprop8)end 
    if door == 'Pacificprop9' then DeleteEntity(Pacificprop9)end 
    if door == 'Pacificprop10' then DeleteEntity(Pacificprop10)end 
   
   -- if door == 'Pacificprop11' then DeleteEntity(Pacificprop11) end
   -- if door == 'Pacificprop12' then DeleteEntity(Pacificprop12) end
  --  if door == 'Pacificprop13' then DeleteEntity(Pacificprop13) end
  --  if door == 'Pacificprop14' then DeleteEntity(Pacificprop14) end
  --  if door == 'Pacificprop15' then DeleteEntity(Pacificprop15) end

   -- if door == 'Pacificprop16' then DeleteEntity(Pacificprop16) end
  --  if door == 'Pacificprop17' then DeleteEntity(Pacificprop17) end
  --  if door == 'Pacificprop18' then DeleteEntity(Pacificprop18) end
  --  if door == 'Pacificprop19' then DeleteEntity(Pacificprop19) end
   -- if door == 'Pacificprop20' then DeleteEntity(Pacificprop20) end

    if door == 'Pacificprop21' then DeleteEntity(Pacificprop21)end --  oxdoorname = Pacificprop11 end
    if door == 'Pacificprop22' then DeleteEntity(Pacificprop22)end 
    if door == 'Pacificprop23' then DeleteEntity(Pacificprop23)end --  oxdoorname = Pacificprop13 end
    if door == 'Pacificprop24' then DeleteEntity(Pacificprop24)end --  oxdoorname = Pacificprop14 end
    if door == 'Pacificprop25' then DeleteEntity(Pacificprop25)end --  oxdoorname = Pacificprop15 end
  --  if door == 'Pacificprop26' then DeleteEntity(Pacificprop26) end
  --  if door == 'Pacificprop27' then DeleteEntity(Pacificprop27) end
  --  if door == 'Pacificprop28' then DeleteEntity(Pacificprop28) end
  --  if door == 'Pacificprop29' then DeleteEntity(Pacificprop29) end
  --  if door == 'Pacificprop30' then DeleteEntity(Pacificprop30) end

    if door == 'Pacificprop31' then DeleteEntity(Pacificprop31)end --  oxdoorname = Pacificprop31 end
    if door == 'Pacificprop32' then DeleteEntity(Pacificprop32)end --  oxdoorname = Pacificprop32 end
    if door == 'Pacificprop33' then DeleteEntity(Pacificprop33)end --  oxdoorname = Pacificprop33 end
    if door == 'Pacificprop34' then DeleteEntity(Pacificprop34)end --  oxdoorname = Pacificprop34 end
    if door == 'Pacificprop35' then DeleteEntity(Pacificprop35)end --  oxdoorname = Pacificprop35 end
    if door == 'Pacificprop36' then DeleteEntity(Pacificprop36)end --  oxdoorname = Pacificprop36 end
    if door == 'Pacificprop37' then DeleteEntity(Pacificprop37)end --  oxdoorname = Pacificprop37 end
    if door == 'Pacificprop38' then DeleteEntity(Pacificprop38)end --  oxdoorname = Pacificprop38 end
    if door == 'Pacificprop39' then DeleteEntity(Pacificprop39)end --  oxdoorname = Pacificprop39 end
    if door == 'Pacificprop40' then DeleteEntity(Pacificprop40)end --  oxdoorname = Pacificprop40 end

    if oxt then
        if door == Pacificdoor1name then oxdoorname = 2 end
        if door == Pacificdoor2name then oxdoorname = 3 end
        if door == Pacificdoor3name then oxdoorname = 4 end
        if door == Pacificdoorcard1name then oxdoorname = 5 end
        if door == Pacificdoorcard2name then oxdoorname = 6 end
        if door == Config.Pc1name then oxdoorname = 7 end
        if door == Config.Pc2name then oxdoorname = 8 end
        if door == Config.Pc3name then oxdoorname = 9 end
        -- pickups
        if door == 'Pacificprop6' then  oxdoorname = 20 end 
        if door == 'Pacificprop7' then  oxdoorname = 21 end 
        if door == 'Pacificprop8' then  oxdoorname = 22 end 
        if door == 'Pacificprop9' then  oxdoorname = 23 end 
        if door == 'Pacificprop10' then oxdoorname = 24 end
        if door == 'Pacificprop21' then oxdoorname = 25 end 
        if door == 'Pacificprop22' then oxdoorname = 26 end 
        -- piles
        if door == 'Pacificprop11' then oxdoorname = 27 end
        if door == 'Pacificprop12' then oxdoorname = 28 end
        -- grabs
        if door == 'Pacificprop1' then  oxdoorname = 10 end 
        if door == 'Pacificprop2' then  oxdoorname = 11 end 
        if door == 'Pacificprop3' then  oxdoorname = 12 end 
        if door == 'Pacificprop4' then  oxdoorname = 13 end 
        if door == 'Pacificprop5' then oxdoorname = 14 end
        if door == 'Pacificprop31' then  oxdoorname = 15 end 
        if door == 'Pacificprop32' then  oxdoorname = 16 end 
        if door == 'Pacificprop33' then  oxdoorname = 17 end 
        if door == 'Pacificprop34' then  oxdoorname = 18 end 
        if door == 'Pacificprop35' then oxdoorname = 19 end
        -- trollys
        if door == 'Pacificprop16' then oxdoorname = 29 end 
        if door == 'Pacificprop17' then oxdoorname = 30 end 
        if door == 'Pacificprop18' then oxdoorname = 31 end
        if door == 'Pacificprop19' then oxdoorname = 32 end
        -- vault
        if door == vaultdoorname then oxdoorname = 33 end
        Wait(1)
        if door == nil then return end
        if oxdoorname == nil then return end
        exports.ox_target:removeZone(oxdoorname)
        oxdoorname = nil
    else
   
        exports['qb-target']:RemoveZone(door) 
    end
end)


RegisterNetEvent('Polar-Pacific:Client:Target', function(data) 
    model = 'hei_p_m_bag_var22_arm_s' animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
    local p = data.type 
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', p)
    if p == 'Pacificprop1' then     Animation(p, Pacificprop1, model, animDict, prop)  
    elseif p == 'Pacificprop2' then   Animation(p, Pacificprop2, model, animDict, prop) 
    elseif p == 'Pacificprop3' then   Animation(p, Pacificprop3, model, animDict, prop)  
    elseif p == 'Pacificprop4' then   Animation(p, Pacificprop4, model, animDict, prop)  
    elseif p == 'Pacificprop5' then   Animation(p, Pacificprop5, model, animDict, prop)  
    elseif p == 'Pacificprop31' then   Animation(p, Pacificprop31, model, animDict, prop) 
    elseif p == 'Pacificprop32' then   Animation(p, Pacificprop32, model, animDict, prop)   
    elseif p == 'Pacificprop33' then   Animation(p, Pacificprop33, model, animDict, prop) 
    elseif p == 'Pacificprop34' then   Animation(p, Pacificprop34, model, animDict, prop) 
    elseif p == 'Pacificprop35' then   Animation(p, Pacificprop35, model, animDict, prop)   
    elseif p == 'Pacificprop36' then   Animation(p, Pacificprop36, model, animDict, prop)      
    elseif p == 'Pacificprop37' then   Animation(p, Pacificprop37, model, animDict, prop)   
    elseif p == 'Pacificprop38' then   Animation(p, Pacificprop38, model, animDict, prop)   
    elseif p == 'Pacificprop39' then   Animation(p, Pacificprop39, model, animDict, prop) 
    elseif p == 'Pacificprop40' then   Animation(p, Pacificprop40, model, animDict, prop)   
  
  --  elseif p == 'specialgrab' then  Animation('specialgrab', specialgrabprop, model, animDict, prop)

    elseif p == 'Pacificprop16' then   grabloot(p, Pacificprop16, prop16, prop, 'prop16')      
    elseif p == 'Pacificprop17' then   grabloot(p, Pacificprop17, prop17, prop, 'prop17')  
    elseif p == 'Pacificprop18' then   grabloot(p, Pacificprop18, prop18, prop, 'prop18')   
    elseif p == 'Pacificprop19' then   grabloot(p, Pacificprop19, prop19, prop, 'prop19') 
    elseif p == 'Pacificprop20' then   grabloot(p, Pacificprop20, prop20, prop, 'prop20')     
    elseif p == 'Pacificprop26' then   grabloot(p, Pacificprop26, prop26, prop, 'prop26')    
    elseif p == 'Pacificprop27' then   grabloot(p, Pacificprop27, prop27, prop, 'prop27')   
    elseif p == 'Pacificprop28' then   grabloot(p, Pacificprop28, prop28, prop, 'prop28') 
    elseif p == 'Pacificprop29' then   grabloot(p, Pacificprop29, prop29, prop, 'prop29')  
    elseif p == 'Pacificprop30' then   grabloot(p, Pacificprop30, prop30, prop, 'prop30') 
 
    end
end)


RegisterNetEvent('Polar-Pacific:Client:ResetProps', function()
    
    if DoesEntityExist(Pacificprop1) then DeleteEntity(Pacificprop1) targetname = 'Pacificprop1' end
    if DoesEntityExist(Pacificprop2) then DeleteEntity(Pacificprop2) targetname = 'Pacificprop2' end
    if DoesEntityExist(Pacificprop3) then DeleteEntity(Pacificprop3) targetname = 'Pacificprop3' end
    if DoesEntityExist(Pacificprop4) then DeleteEntity(Pacificprop4) targetname = 'Pacificprop4' end
    if DoesEntityExist(Pacificprop5) then DeleteEntity(Pacificprop5) targetname = 'Pacificprop5' end
    if DoesEntityExist(Pacificprop6) then DeleteEntity(Pacificprop6) targetname = 'Pacificprop6' end
    if DoesEntityExist(Pacificprop7) then DeleteEntity(Pacificprop7) targetname = 'Pacificprop7' end
    if DoesEntityExist(Pacificprop8) then DeleteEntity(Pacificprop8) targetname = 'Pacificprop8' end
    if DoesEntityExist(Pacificprop9) then DeleteEntity(Pacificprop9) targetname = 'Pacificprop9' end
    if DoesEntityExist(Pacificprop10) then DeleteEntity(Pacificprop10) targetname = 'Pacificprop10' end
    if DoesEntityExist(Pacificprop11) then DeleteEntity(Pacificprop11) targetname = 'Pacificprop11' end
    if DoesEntityExist(Pacificprop12) then DeleteEntity(Pacificprop12) targetname = 'Pacificprop12' end
    if DoesEntityExist(Pacificprop13) then DeleteEntity(Pacificprop13) targetname = 'Pacificprop13' end
    if DoesEntityExist(Pacificprop14) then DeleteEntity(Pacificprop14) targetname = 'Pacificprop14' end
    if DoesEntityExist(Pacificprop15) then DeleteEntity(Pacificprop15) targetname = 'Pacificprop15' end
    if DoesEntityExist(Pacificprop16) then DeleteEntity(Pacificprop16) targetname = 'Pacificprop16' end
    if DoesEntityExist(Pacificprop17) then DeleteEntity(Pacificprop17) targetname = 'Pacificprop17' end
    if DoesEntityExist(Pacificprop18) then DeleteEntity(Pacificprop18) targetname = 'Pacificprop18' end
    if DoesEntityExist(Pacificprop19) then DeleteEntity(Pacificprop19) targetname = 'Pacificprop19' end
    if DoesEntityExist(Pacificprop20) then DeleteEntity(Pacificprop20) targetname = 'Pacificprop20' end
    if DoesEntityExist(Pacificprop21) then DeleteEntity(Pacificprop21) targetname = 'Pacificprop21' end
    if DoesEntityExist(Pacificprop22) then DeleteEntity(Pacificprop22) targetname = 'Pacificprop22' end
    if DoesEntityExist(Pacificprop23) then DeleteEntity(Pacificprop23) targetname = 'Pacificprop23' end
    if DoesEntityExist(Pacificprop24) then DeleteEntity(Pacificprop24) targetname = 'Pacificprop24' end
    if DoesEntityExist(Pacificprop25) then DeleteEntity(Pacificprop25) targetname = 'Pacificprop25' end
    if DoesEntityExist(Pacificprop26) then DeleteEntity(Pacificprop26) targetname = 'Pacificprop26' end
    if DoesEntityExist(Pacificprop27) then DeleteEntity(Pacificprop27) targetname = 'Pacificprop27' end
    if DoesEntityExist(Pacificprop28) then DeleteEntity(Pacificprop28) targetname = 'Pacificprop28' end
    if DoesEntityExist(Pacificprop29) then DeleteEntity(Pacificprop29) targetname = 'Pacificprop29' end
    if DoesEntityExist(Pacificprop30) then DeleteEntity(Pacificprop30) targetname = 'Pacificprop30' end
    if DoesEntityExist(Pacificprop31) then DeleteEntity(Pacificprop31) targetname = 'Pacificprop31' end
    if DoesEntityExist(Pacificprop32) then DeleteEntity(Pacificprop32) targetname = 'Pacificprop32' end
    if DoesEntityExist(Pacificprop33) then DeleteEntity(Pacificprop33) targetname = 'Pacificprop33' end
    if DoesEntityExist(Pacificprop34) then DeleteEntity(Pacificprop34) targetname = 'Pacificprop34' end
    if DoesEntityExist(Pacificprop35) then DeleteEntity(Pacificprop35) targetname = 'Pacificprop35' end
    if DoesEntityExist(Pacificprop36) then DeleteEntity(Pacificprop36) targetname = 'Pacificprop36' end
    if DoesEntityExist(Pacificprop37) then DeleteEntity(Pacificprop37) targetname = 'Pacificprop37' end
    if DoesEntityExist(Pacificprop38) then DeleteEntity(Pacificprop38) targetname = 'Pacificprop38' end
    if DoesEntityExist(Pacificprop39) then DeleteEntity(Pacificprop39) targetname = 'Pacificprop39' end
    if DoesEntityExist(Pacificprop40) then DeleteEntity(Pacificprop40) targetname = 'Pacificprop40' end
    if targetname == nil then return end
    if oxt then
        exports.ox_target:removeZone(targetname)
    else
        exports['qb-target']:RemoveZone(targetname)
    end
end)


RegisterNetEvent('Polar-Pacific:Client:PickupTarget', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    animDict = 'random@domestic'
    local pile = data.piles
    local door = data.type
    local numba = data.number
    if pile then  
        TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
        if door == 'Pacificprop11' then DeleteEntity(Pacificprop11) end
        if door == 'Pacificprop12' then DeleteEntity(Pacificprop12) end
        if door == 'Pacificprop13' then DeleteEntity(Pacificprop13) end
        if door == 'Pacificprop14' then DeleteEntity(Pacificprop14) end
        if door == 'Pacificprop15' then DeleteEntity(Pacificprop15) end
    else
        loadAnimDict(animDict) TaskPlayAnim(PlayerPedId(), animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
    end
        TriggerServerEvent('Polar-Pacific:Server:Synapse'.. door ..'', prop)
        TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
        LocalPlayer.state:set('inv_busy', false, true)
        TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
end)



RegisterNetEvent('Polar-Pacific:Client:ResetDoors', function()
    TriggerServerEvent('qb-doorlock:server:updateState', Pacificdoor1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Pacificdoor2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Pacificdoor3name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Pacificdoorcard1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Pacificdoorcard2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Config.VaultDoorDoor, true, false, false, true, false, false)
 --   doorlock(Pacificdoor1name, true)
  --  doorlock(Pacificdoor2name, true)
  --  doorlock(Pacificdoor3name, true)
  --  doorlock(Pacificdoorcard1name, true)
  --  doorlock(Pacificdoorcard2name, true)
 --   doorlock(Config.VaultDoorDoor, true)
    
end)

function doorlock(name, what)
    print(' and the name is ' .. name .. ' john the rock ' .. what .. ' cena')
    TriggerServerEvent('qb-doorlock', name, what, false, false, true, false, false)
end

function playeritem(item, amount)
    if Config.Notify == 'qb' then
    return exports['qb-inventory']:HasItem(item, amount)
    else
        
    end
end
  
function notify(what, color)
    if Config.Notify == 'qb' then
        QBCore.Functions.Notify(what, color)
    elseif Config.Notify == 'esx' then
        if color == 'error' then colo = 'r' elseif color == 'success' then colo = 'g' end
        ESX.ShowNotification(what, true, true, colo)
    end
end
 
  
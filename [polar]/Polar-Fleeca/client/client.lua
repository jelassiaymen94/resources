 local QBCore = exports[Config.Core]:GetCoreObject()

local oxt = Config.OxTarget -- ox target
local oxdoorname = nil

local ped = PlayerPedId()
local animDict = nil local model = nil local prop = nil local var = nil local drillpos = nil local drillrot = nil local door = nil local pp = nil local coords = nil local rot = nil local position = nil local item = nil local CurrentCops = 0
local amount = nil

local specialgrab = 'fleecagrab'
local vaultdoorname = Config.VaultDoorDoor
local vaultanimloc = Config.VaultDoorThirdEye
local fingerprintdoor = ''
-- vault stuff
local vaultid = 1
local open = 37.75
local closed = -125.74
local vaultloc = vector3(-1307.85, -816.5, 17.82)

local hi = false

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
local vaultitem = 'laptop_green' -- bluelaptop
local vaultitemchance = 50
local drillitem = 'drill' 
local drillitemchance = 50
local carditem = 'keycard' -- vaultkeycard
local carditemchance = 50
local computeritem = 'hacking_device' -- hacking_device


local fleecastartname = 'fleecastart'
local fleecadoor1name = 'fleecadoor1'
local fleecadoor2name = 'fleecadoor2'
local fleecadoor3name = 'fleecadoor3'
local fleecadoorcard1name = 'fleecadoorcard1'
local fleecadoorcard2name = 'fleecadoorcard2'



AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  TriggerEvent('Polar-fleeca:Client:ResetProps') TriggerEvent('Polar-fleeca:Client:ResetDoors') TriggerEvent('Polar-fleeca:Client:ResetPropsKeypads') end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Targets')  end starttarget() blip()  end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if Config.Debug then print('Player Loaded Targets Starting') end starttarget() blip()  end)
RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)
RegisterNetEvent("Polar-fleeca:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)



RegisterNetEvent('Polar-fleeca:client:start', function()  pp = vector4(-109.43, 6483.32, 31.47, 224.11) door = fleecastartname coords = vector3(-109.46, 6484.36, 31.27)
    QBCore.Functions.TriggerCallback('Polar-fleeca:DoorCheckstart', function(result) if result then
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
    Wait(50)
    TriggerEvent('Polar-fleeca:client:ThermiteStart', pp, door, coords)
    
    
    else
        QBCore.Functions.Notify(text('cooldown'), "error")
    end end)
end)

RegisterNetEvent('Polar-fleeca:client:ThermiteStart', function(pp, door, coords)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then if math.random(1, 100) <= Config.FingerPrintPercent and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end
            if CurrentCops >= Config.RequiredCops then
                    LocalPlayer.state:set('inv_busy', true, true)
                    PlantThermite(pp, door)
                    if hi then
                        LocalPlayer.state:set('inv_busy', false, true)
                        TriggerServerEvent('Polar-fleeca:Server:StartCooldown')
                        ThermiteEffect(door, coords) 
                        TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor1')
                        TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor2')
                        TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor3')
                        TriggerServerEvent('Polar-fleeca:Server:StartTargets')
                    else
                    if memgame then 
                        exports[memname]:thermiteminigame(10, 3, 3, 10,
                        function() -- success
                            LocalPlayer.state:set('inv_busy', false, true)
                            TriggerServerEvent('Polar-fleeca:Server:StartCooldown')
                            ThermiteEffect(door, coords) 
                            TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor1')
                            TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor2')
                            TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor3')
                            TriggerServerEvent('Polar-fleeca:Server:StartTargets')
                        end,
                        function() -- failure
                            TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
                            LocalPlayer.state:set('inv_busy', false, true)
                            QBCore.Functions.Notify(text('thermitefail'), "error") 
                        end)
                    else
                    exports[thermiteexport]:Thermite(function(success) 
                    if success then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-fleeca:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor1')
                    TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor2')
                    TriggerServerEvent('Polar-fleeca:Server:StartInteract', 'fleecadoor3')
                    TriggerServerEvent('Polar-fleeca:Server:StartTargets')
                    else 
                    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    QBCore.Functions.Notify(text('thermitefail'), "error") end
                    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
                    end
                    end
            else QBCore.Functions.Notify(text('nopolice'), "error")  TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) end
        else QBCore.Functions.Notify(text('nothermite'), "error") end 
    end,  {thermiteitem})
end)





RegisterNetEvent('Polar-fleeca:client:Thermite', function(pp, door, coords)
    if hi then PlantThermite(pp, door) ThermiteEffect(door, coords) else
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
    if math.random(1, 100) <= Config.FingerPrintPercent and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)
    if memgame then 
        exports[memname]:thermiteminigame(10, 3, 3, 10,
        function() -- success
            TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) ThermiteEffect(door, coords)
            TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)
        end,
        function() -- failure
            TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 
            QBCore.Functions.Notify(text('thermitefail'), "error") 
        end)
    else
    exports[thermiteexport]:Thermite(function(success)
    if success then TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) ThermiteEffect(door, coords)
    TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)
    else TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 
        QBCore.Functions.Notify(text('thermitefail'), "error") end
    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
    end
    else 
        QBCore.Functions.Notify(text('nothermite'), "error")
    end end, {thermiteitem}) end
end)
function ThermiteEffect(door, coords)
    if door == 'fleecastart' then CallPolice() end
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-fleeca:Server:ThermitePtfx", vec3(coords.x, coords.y, coords.z+0.2)) Wait(500) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) TriggerEvent('Polar-fleeca:Client:DestroyPad', door) Wait(thermitetime) ClearPedTasks(PlayerPedId())
 end 
function PlantThermite(pp, door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door) TriggerServerEvent('Polar-fleeca:Server:RemoveItem', thermiteitem, 1) RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("hei_p_m_bag_var22_arm_s")
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
    TriggerServerEvent('Polar-fleeca:Server:RemoveItems', drillreward, amount)
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100)
    if chance <= drillitemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', item, 1) end
    TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) 
    else
    StopSound(soundId) NetworkStartSynchronisedScene(scene4) PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId())  DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- fail 
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100) TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
    if chance <= drillitemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', item, 1) end
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

    exports['qb-target']:AddBoxZone(vaultdoorname,  vaultanimloc, 0.5, 0.5, { name =  vaultdoorname, heading = 28.69, debug = false, minZ = vaultanimloc.z-0.5, maxZ =  vaultanimloc.z+0.5,}, 
    { options = {{ event = "Polar-fleeca:Client:VaultHack", icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = vaultitem}}, distance = 2.5 }) 
   
    local k = 0
    local p = 0
    local distance1 = 0.22
    local distance2 = 0.22
    local space1 = nil
    local space2 = nil
    local chance = math.random(1,100) 
    if chance<=10 then   space2 = k+distance1  space1 = k+distance2 
    elseif chance<=25 then   space2 = k+distance2  space1 = k+distance1 
    elseif chance<=30 then   space2 = k-distance1  space1 = k-distance2
    elseif chance<=35 then   space2 = k-distance2  space1 = k-distance1  
    elseif chance<=40 then   space2 = k  space1 = k+distance1  
    elseif chance<=45 then   space2 = k space1 = k+distance2
    elseif chance<=50 then   space2 = k+distance2 space1 = k
    elseif chance<=55 then   space2 = k+distance1 space1 = k
    elseif chance<=60 then   space2 = k  space1 = k-distance1  
    elseif chance<=65 then   space2 = k space1 = k-distance2 
    elseif chance<=70 then   space2 = k-distance2 space1 = k 
    elseif chance<=75 then   space2 = k-distance1  space1 = k
    elseif chance<=80 then   space2 = k+distance2  space1 = k-distance2 
    elseif chance<=85 then   space2 = k-distance2  space1 = k+distance2
    elseif chance<=90 then   space2 = k+distance1  space1 = k-distance1
    elseif chance<=100 then   space2 = k-distance1  space1 = k+distance1 
    end

    local loc = vector4(-96.21, 6460.11, 31.63-space1, 226.61)  
    local name = "fleecadrill1"
    exports['qb-target']:AddBoxZone(name,  vector3(loc.x, loc.y, loc.z), 0.25, 0.25, { name = name, heading = loc.w, debug = Config.Debug, minZ = loc.z-1, maxZ =  loc.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox", excludejob = 'police', item = drillitem}}, distance = 1.5 }) 
   
    local loc = vector4(-96.85, 6463.54, 31.63-space2, 314.59) 
    local name = "fleecadrill2"
    exports['qb-target']:AddBoxZone(name,  vector3(loc.x, loc.y, loc.z), 0.25, 0.25, { name = name, heading = loc.w, debug = Config.Debug, minZ = loc.z-1, maxZ =  loc.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox", excludejob = 'police', item = drillitem}}, distance = 1.5 }) 
   
   
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
    TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door)
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
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
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop) 
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(5000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-fleeca:Server:Synapsefleeca' .. name .. '', prop)    
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
RegisterNetEvent('Polar-fleeca:Client:Vault', function(open)
    if Config.fleeca then TriggerServerEvent('qb-doorlock:server:updateState',  vaultdoorname, false, false, false, true, false, false)   return end
    if not open then
    local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
    --print(object)
    local entHeading = closed
    FreezeEntityPosition(object, false)
    while true do
        if entHeading < open then
            SetEntityHeading(object, entHeading - 1)
            entHeading = entHeading + 0.01
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
                TriggerServerEvent('Polar-fleeca:Server:VaultClose')
                break
            end
    
            Wait(10)
        end
    end
end)







RegisterNetEvent('Polar-fleeca:Client:AddPickupTarget', function(door, door2, prop, var, pile) 
    if oxt then
       -- boxzone = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
      --  options = {{  event = "Polar-fleeca:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
     
    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = Config.Debug, minZ = var.z  - 0.5, maxZ =  var.z + 0.5,}, 
        { options = {{ event = "Polar-fleeca:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 
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
        TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door)
        loadModel('hei_p_m_bag_var22_arm_s')
        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
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
        TriggerServerEvent('Polar-fleeca:Server:Synapse' .. door .. '', sped)  
    else
        rottt = GetEntityRotation(props)
        if rottt == nil then  
            print('error')
        else
    TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
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
    TriggerServerEvent('Polar-fleeca:Server:Synapse' .. door .. '', sped)  
        end
    end
end 
RegisterNetEvent('Polar-fleeca:Client:AddTarget', function(door, door2, prop, var) 
    exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = Config.Debug, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
    { options = {{ event = "Polar-fleeca:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 

end)


RegisterNetEvent('Polar-fleeca:client:HackComputer', function(data)
    local door = data.door
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door) 
    local chance=math.random(1,100) 

    local time = 60
    TriggerEvent(voltgame, time, function(result,reason)
    if result == 0 then --failed
        if chance < 50 then  TriggerServerEvent('Polar-fleeca:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 
    elseif result == 1 then --success
        if chance < 50 then  TriggerServerEvent('Polar-fleeca:Server:RemoveItem', computeritem, 1) end
        Wait(2000)
        TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door)
        TriggerServerEvent('Polar-fleeca:Server:RemoveItems', pcitem)
    elseif result == 2 then --time out
        if chance < 50 then  TriggerServerEvent('Polar-fleeca:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 
    elseif result == -1 then end
    end) 
end)








RegisterNetEvent('Polar-fleeca:client:keycard', function(door, position, rot, item) TriggerServerEvent('Polar-fleeca:Server:StopInteract', door) 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) 
    local chance = math.random(1,100) local pos = GetEntityCoords(PlayerPedId()) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(PlayerPedId(), true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(PlayerPedId(), position.w) SetEntityCoords(PlayerPedId(), vector3(position.x, position.y,position.z-1)) if chance <= carditemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(PlayerPedId(), animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(PlayerPedId(), animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(PlayerPedId(), animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(PlayerPedId(), animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(PlayerPedId(), false) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) QBCore.Functions.Notify(text('doorunlock'), "success", 2500)
    else  QBCore.Functions.Notify(text('nokeycard'), "error") end
    end, {carditem})
end)




function hack(door)
    LocalPlayer.state:set('inv_busy', true, true) 
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
    local ped = PlayerPedId()
    local loc = nil local location = nil
    if door ==  vaultdoorname then  
        loc = Config.VaultDoorAnimation
       
    elseif door == Config.FingerPrintDoorDoor then
        loc = Config.FingerPrintDoor
       
    end
    SetEntityHeading(ped, loc.w)
    SetEntityCoords(ped, vec3(loc.x, loc.y, loc.z-1))
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
       -- if door == vaultdoorname then
            LocalPlayer.state:set('inv_busy', true, true) 
        exports[hackname]:OpenHackingGame(10, 5, 3, function(Success) 
            if Success then
                local chance = math.random(1,100)
                if chance <= vaultitemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', vaultitem, 1) end
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
                QBCore.Functions.Notify(text('vaultopen'), "success", 2500)
                TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) 
            else
                local chance = math.random(1,100)
                if chance <= vaultitemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', vaultitem, 1) end
                Wait(4000)
                NetworkStartSynchronisedScene(netScene3)
                Wait(4500)
                NetworkStopSynchronisedScene(netScene3)
                DeleteObject(bag)
                SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                DeleteObject(laptop)
                FreezeEntityPosition(ped, false)
                LocalPlayer.state:set('inv_busy', false, true) 
                TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
            end
        end)
     --[[  
        elseif door == fingerprintdoor then
     
            LocalPlayer.state:set('inv_busy', true, true) 
        TriggerEvent("".. fingerhack ..":Start", 4, 1, 1, function(outcome, reason) 
        if outcome == true then -- success
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', vaultitem, 1) end
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
            QBCore.Functions.Notify(text('doorunlock'), "success", 2500)
            TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) 
        elseif outcome == false then -- fail
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-fleeca:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true)
            TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 
        end end)
        end ]]
       
    end, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
        LocalPlayer.state:set('inv_busy', false, true) 
    end)
end

RegisterNetEvent('Polar-fleeca:client:DrillStart', function(drillpos, drillrot, door)
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result) if result then 
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
    drill(drillpos, drillrot, drillitem, door)
    else  QBCore.Functions.Notify(text('nodrill'), "error") end
    end, {drillitem})
end)

RegisterNetEvent('Polar-fleeca:Client:Drill', function(data)
    QBCore.Functions.TriggerCallback('Polar-fleeca:' .. data.door .. '', function(result) if result then 
    TriggerEvent('Polar-fleeca:client:DrillStart', data.coords, vector3(0.0, 0.0, data.head), data.door)
    else
        QBCore.Functions.Notify(text('sometingelse'), "error")
    end end)
 end)

 function vaultdone() TriggerServerEvent('Polar-fleeca:Server:Vault') end
RegisterNetEvent('Polar-fleeca:Client:VaultHack', function() 
    QBCore.Functions.TriggerCallback('Polar-fleeca:VaultCheck', function(result) if result then 
        hack(vaultdoorname)
    else
        QBCore.Functions.Notify(text('sometingelse'), "error")
    end end)
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
        exports.ox_target:addBoxZone({ coords = Config.StartThirdEye, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = fleecastartname, icon = "fas fa-fire", label = "Thermite", event = 'Polar-fleeca:client:start' }, } })

    else
    
    exports['qb-target']:AddBoxZone(fleecastartname, Config.StartThirdEye, 1, 1, { name = fleecastartname, heading = 0.0, debug = Config.Debug, minZ = Config.StartThirdEye.z-1, maxZ =  Config.StartThirdEye.z+1,}, 
    { options = {{ event = "Polar-fleeca:client:start", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 

    end
end

RegisterNetEvent('Polar-fleeca:Client:StartLoot', function()

    TriggerServerEvent('Polar-fleeca:Server:SetupGrab1')

    TriggerServerEvent('Polar-fleeca:Server:SetupPickup1')

    TriggerServerEvent('Polar-fleeca:Server:SetupPile1')

    TriggerServerEvent('Polar-fleeca:Server:SetupTrolly1')


end)

RegisterNetEvent('Polar-fleeca:Client:StartTargets', function()
    
    if oxt then

        fleecadoor1 = exports.ox_target:addBoxZone({ coords = vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = fleecadoor1name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-fleeca:Client:Door1' }, } })
        fleecadoor2 = exports.ox_target:addBoxZone({ coords = vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = fleecadoor2name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-fleeca:Client:Door2' }, } })
        fleecadoor3 = exports.ox_target:addBoxZone({ coords = vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = fleecadoor3name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-fleeca:Client:Door3' }, } })

        card1 = exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = fleecadoorcard1name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-fleeca:Client:doorcard1' }, } })
        card2 = exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = fleecadoorcard2name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-fleeca:Client:doorcard2' }, } })
      
        pc1 = exports.ox_target:addBoxZone({ coords = Config.Pc1, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", event = 'Polar-fleeca:Client:HackComputer' }, } })
        pc2 = exports.ox_target:addBoxZone({ coords = Config.Pc2, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", event = 'Polar-fleeca:Client:HackComputer' }, } })
        pc3 = exports.ox_target:addBoxZone({ coords = Config.Pc3, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", event = 'Polar-fleeca:Client:HackComputer' }, } })
      

        

    else
    
   
    exports['qb-target']:AddBoxZone(fleecadoor1name, vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), 1, 1, { name = fleecadoor1name, heading = 0.0, debug = Config.Debug, minZ = Config.Door1Eye.z-1, maxZ =  Config.Door1Eye.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:Door1", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(fleecadoor2name, vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), 1, 1, { name = fleecadoor2name, heading = 0.0, debug = Config.Debug, minZ = Config.Door2Eye.z-1, maxZ =  Config.Door2Eye.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:Door2", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(fleecadoor3name, vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), 1, 1, { name = fleecadoor3name, heading = 0.0, debug = Config.Debug, minZ = Config.Door3Eye.z-1, maxZ =  Config.Door3Eye.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:Door3", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    
    exports['qb-target']:AddBoxZone(fleecadoorcard1name, vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), 1, 1, { name = fleecadoorcard1name, heading = 0.0, debug = Config.Debug, minZ = Config.doorcard1Eye.z-1, maxZ =  Config.doorcard1Eye.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:doorcard1", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police', item = carditem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(fleecadoorcard2name, vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), 1, 1, { name = fleecadoorcard2name, heading = 0.0, debug = Config.Debug, minZ = Config.doorcard2Eye.z-1, maxZ =  Config.doorcard2Eye.z+1,}, 
    { options = {{ event = "Polar-fleeca:Client:doorcard2", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police', item = carditem}}, distance = 2.5 }) 
   
    exports['qb-target']:AddBoxZone(Config.Pc1name, Config.Pc1, 2, 2, { name = Config.Pc1name, heading = 28.69, debug = Config.Debug, minZ = Config.Pc1-1, maxZ =  Config.Pc1+1,}, 
    { options = {{ event = "Polar-fleeca:client:HackComputer", door = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(Config.Pc2name, Config.Pc1, 2, 2, { name = Config.Pc2name, heading = 28.69, debug = Config.Debug, minZ = Config.Pc2-1, maxZ =  Config.Pc2+1,}, 
    { options = {{ event = "Polar-fleeca:client:HackComputer", door = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(Config.Pc3name, Config.Pc3, 2, 2, { name = Config.Pc3name, heading = 28.69, debug = Config.Debug, minZ = Config.Pc3-1, maxZ =  Config.Pc3+1,}, 
    { options = {{ event = "Polar-fleeca:client:HackComputer", door = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    
    end

    other()

end)


--- Thermites
RegisterNetEvent('Polar-fleeca:Client:Door1', function() pp = vec4(Config.Door1Thermite.x, Config.Door1Thermite.y, Config.Door1Thermite.z + 0.2, Config.Door1Thermite.w) door = fleecadoor1name coords =  Config.Door1Pfx QBCore.Functions.TriggerCallback('Polar-fleeca:Door1', function(result) if result then TriggerEvent('Polar-fleeca:client:Thermite', pp, door, coords) else  QBCore.Functions.Notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-fleeca:Client:Door2', function() pp = vec4(Config.Door2Thermite.x, Config.Door2Thermite.y, Config.Door2Thermite.z + 0.2, Config.Door2Thermite.w) door = fleecadoor2name coords =  Config.Door2Pfx QBCore.Functions.TriggerCallback('Polar-fleeca:Door2', function(result) if result then TriggerEvent('Polar-fleeca:client:Thermite', pp, door, coords) else  QBCore.Functions.Notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-fleeca:Client:Door3', function() pp = vec4(Config.Door3Thermite.x, Config.Door3Thermite.y, Config.Door3Thermite.z + 0.2, Config.Door3Thermite.w) door = fleecadoor3name coords =  Config.Door3Pfx QBCore.Functions.TriggerCallback('Polar-fleeca:Door3', function(result) if result then TriggerEvent('Polar-fleeca:client:Thermite', pp, door, coords) else  QBCore.Functions.Notify(text('sometingelse'), "error") end end) end)
----- CARD INSERT
RegisterNetEvent('Polar-fleeca:Client:doorcard1', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard1swipe door = fleecadoorcard1name TriggerEvent('Polar-fleeca:client:keycard', door, position, rot, item) end)
RegisterNetEvent('Polar-fleeca:Client:doorcard2', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard2swipe door = fleecadoorcard2name TriggerEvent('Polar-fleeca:client:keycard', door, position, rot, item) end)






























---- grabs 1-5 and 31-40





local fleecaprop1 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop1', function(door, prop, var) loadModel(prop) fleecaprop1 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop1, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
 
end)

local fleecaprop2 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop2', function(door, prop, var) loadModel(prop) fleecaprop2 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop2, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
   
end)

local fleecaprop3 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop3', function(door, prop, var) loadModel(prop) fleecaprop3 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop3, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
 
end)

local fleecaprop4 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop4', function(door, prop, var) loadModel(prop) fleecaprop4 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop4, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)

local fleecaprop5 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop5', function(door, prop, var) loadModel(prop) fleecaprop5 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop5, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)


local fleecaprop31 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop31', function(door, prop, var) loadModel(prop) fleecaprop31 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop31, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
   
end)

local fleecaprop32 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop32', function(door, prop, var) loadModel(prop) fleecaprop32 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop32, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
 
end)

local fleecaprop33 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop33', function(door, prop, var) loadModel(prop) fleecaprop33 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop33, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)

local fleecaprop34 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop34', function(door, prop, var) loadModel(prop) fleecaprop34 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop34, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
 
end)

local fleecaprop35 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop35', function(door, prop, var) loadModel(prop) fleecaprop35 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop35, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)


local fleecaprop36 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop36', function(door, prop, var) loadModel(prop) fleecaprop36 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop36, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
 
end)

local fleecaprop37 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop37', function(door, prop, var) loadModel(prop) fleecaprop37 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop37, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)

local fleecaprop38 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop38', function(door, prop, var) loadModel(prop) fleecaprop38 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop38, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
 
end)

local fleecaprop39 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop39', function(door, prop, var) loadModel(prop) fleecaprop39 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop39, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop40 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop40', function(door, prop, var) loadModel(prop) fleecaprop40 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop40, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
   
end)












---- pickups 6-10 and 21 - 25

local fleecaprop6 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop6', function(door, prop, var) loadModel(prop) fleecaprop6 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop6, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)

local fleecaprop7 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop7', function(door, prop, var) loadModel(prop) fleecaprop7 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop7, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)
  
end)

local fleecaprop8 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop8', function(door, prop, var) loadModel(prop) fleecaprop8 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop8, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop9 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop9', function(door, prop, var) loadModel(prop) fleecaprop9 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop9, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop10 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop10', function(door, prop, var) loadModel(prop) fleecaprop10 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop10, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)


local fleecaprop21 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop21', function(door, prop, var) loadModel(prop) fleecaprop21 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop21, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 
 
end)

local fleecaprop22 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop22', function(door, prop, var) loadModel(prop) fleecaprop22 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop22, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop23 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop23', function(door, prop, var) loadModel(prop) fleecaprop23 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop23, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop24 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop24', function(door, prop, var) loadModel(prop) fleecaprop24 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop24, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop25 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop25', function(door, prop, var) loadModel(prop) fleecaprop25 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop25, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)











---- piles 11-15

local fleecaprop11 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop11', function(door, prop, var) loadModel(prop) fleecaprop11 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop11, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop12 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop12', function(door, prop, var) loadModel(prop) fleecaprop12 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop12, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop13 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop13', function(door, prop, var) loadModel(prop) fleecaprop13 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop13, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop14 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop14', function(door, prop, var) loadModel(prop) fleecaprop14 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop14, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)

local fleecaprop15 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop15', function(door, prop, var) loadModel(prop) fleecaprop15 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop15, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door) 

end)




---- trollys 16-20 and 26-30

local fleecaprop16 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop16', function(door, prop, var) loadModel(prop) prop16 = prop fleecaprop16 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop16, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop17 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop17', function(door, prop, var) loadModel(prop) prop17 = prop fleecaprop17 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop17, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop18 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop18', function(door, prop, var) loadModel(prop) prop18 = prop fleecaprop18 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop18, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop19 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop19', function(door, prop, var) loadModel(prop) prop19 = prop fleecaprop19 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop19, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop20 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop20', function(door, prop, var) loadModel(prop) prop20 = prop fleecaprop20 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop20, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)


local fleecaprop26 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop26', function(door, prop, var) loadModel(prop) prop26 = prop fleecaprop26 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop26, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop27 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop27', function(door, prop, var) loadModel(prop) prop27 = prop fleecaprop27 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop27, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop28 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop28', function(door, prop, var) loadModel(prop) prop28 = prop fleecaprop28 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop28, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop29 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop29', function(door, prop, var) loadModel(prop) prop29 = prop fleecaprop29 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop29, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)

local fleecaprop30 = nil
RegisterNetEvent('Polar-fleeca:Client:fleecaprop30', function(door, prop, var) loadModel(prop) prop30 = prop fleecaprop30 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(fleecaprop30, var.w) 
    TriggerServerEvent('Polar-fleeca:Server:StartInteract', door)

end)





RegisterNetEvent('Polar-fleeca:Client:TargetRemove', function(door) 

    if door == 'fleecaprop1' then DeleteEntity(fleecaprop1)end --  oxdoorname = fleecaprop1 end
    if door == 'fleecaprop2' then DeleteEntity(fleecaprop2)end --  oxdoorname = fleecaprop2 end
    if door == 'fleecaprop3' then DeleteEntity(fleecaprop3)end --  oxdoorname = fleecaprop3 end
    if door == 'fleecaprop4' then DeleteEntity(fleecaprop4)end --  oxdoorname = fleecaprop4 end
    if door == 'fleecaprop5' then DeleteEntity(fleecaprop5)end --  oxdoorname = fleecaprop5 end
    if door == 'fleecaprop6' then DeleteEntity(fleecaprop6)end --  oxdoorname = fleecaprop6 end
    if door == 'fleecaprop7' then DeleteEntity(fleecaprop7)end --  oxdoorname = fleecaprop7 end
    if door == 'fleecaprop8' then DeleteEntity(fleecaprop8)end --  oxdoorname = fleecaprop8 end
    if door == 'fleecaprop9' then DeleteEntity(fleecaprop9)end --  oxdoorname = fleecaprop9 end
    if door == 'fleecaprop10' then DeleteEntity(fleecaprop10)end --  oxdoorname = fleecaprop10 end
   
   -- if door == 'fleecaprop11' then DeleteEntity(fleecaprop11) end
   -- if door == 'fleecaprop12' then DeleteEntity(fleecaprop12) end
  --  if door == 'fleecaprop13' then DeleteEntity(fleecaprop13) end
  --  if door == 'fleecaprop14' then DeleteEntity(fleecaprop14) end
  --  if door == 'fleecaprop15' then DeleteEntity(fleecaprop15) end

   -- if door == 'fleecaprop16' then DeleteEntity(fleecaprop16) end
  --  if door == 'fleecaprop17' then DeleteEntity(fleecaprop17) end
  --  if door == 'fleecaprop18' then DeleteEntity(fleecaprop18) end
  --  if door == 'fleecaprop19' then DeleteEntity(fleecaprop19) end
   -- if door == 'fleecaprop20' then DeleteEntity(fleecaprop20) end

    if door == 'fleecaprop21' then DeleteEntity(fleecaprop21)end --  oxdoorname = fleecaprop11 end
    if door == 'fleecaprop22' then DeleteEntity(fleecaprop22)end --  oxdoorname = fleecaprop12 end
    if door == 'fleecaprop23' then DeleteEntity(fleecaprop23)end --  oxdoorname = fleecaprop13 end
    if door == 'fleecaprop24' then DeleteEntity(fleecaprop24)end --  oxdoorname = fleecaprop14 end
    if door == 'fleecaprop25' then DeleteEntity(fleecaprop25)end --  oxdoorname = fleecaprop15 end
  --  if door == 'fleecaprop26' then DeleteEntity(fleecaprop26) end
  --  if door == 'fleecaprop27' then DeleteEntity(fleecaprop27) end
  --  if door == 'fleecaprop28' then DeleteEntity(fleecaprop28) end
  --  if door == 'fleecaprop29' then DeleteEntity(fleecaprop29) end
  --  if door == 'fleecaprop30' then DeleteEntity(fleecaprop30) end

    if door == 'fleecaprop31' then DeleteEntity(fleecaprop31)end --  oxdoorname = fleecaprop31 end
    if door == 'fleecaprop32' then DeleteEntity(fleecaprop32)end --  oxdoorname = fleecaprop32 end
    if door == 'fleecaprop33' then DeleteEntity(fleecaprop33)end --  oxdoorname = fleecaprop33 end
    if door == 'fleecaprop34' then DeleteEntity(fleecaprop34)end --  oxdoorname = fleecaprop34 end
    if door == 'fleecaprop35' then DeleteEntity(fleecaprop35)end --  oxdoorname = fleecaprop35 end
    if door == 'fleecaprop36' then DeleteEntity(fleecaprop36)end --  oxdoorname = fleecaprop36 end
    if door == 'fleecaprop37' then DeleteEntity(fleecaprop37)end --  oxdoorname = fleecaprop37 end
    if door == 'fleecaprop38' then DeleteEntity(fleecaprop38)end --  oxdoorname = fleecaprop38 end
    if door == 'fleecaprop39' then DeleteEntity(fleecaprop39)end --  oxdoorname = fleecaprop39 end
    if door == 'fleecaprop40' then DeleteEntity(fleecaprop40)end --  oxdoorname = fleecaprop40 end
    if oxt then
        
        if door == fleecadoor1name then oxdoorname = fleecadoor1 end
        if door == fleecadoor2name then oxdoorname = fleecadoor2 end
        if door == fleecadoor3name then oxdoorname = fleecadoor3 end
        if door == fleecadoorcard1name then oxdoorname = card1 end
        if door == fleecadoorcard2name then oxdoorname = card2 end
        if door == Config.Pc1name then oxdoorname = pc1 end
        if door == Config.Pc2name then oxdoorname = pc2 end
        if door == Config.Pc3name then oxdoorname = pc3 end
        Wait(1)
        if door == nil then return end
        exports.ox_target:removeZone(oxdoorname)
    else
   
        exports['qb-target']:RemoveZone(door) 
    end
end)


RegisterNetEvent('Polar-fleeca:Client:Target', function(data) 
    model = 'hei_p_m_bag_var22_arm_s' animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
    local p = data.type 
    TriggerServerEvent('Polar-fleeca:Server:StopInteract', p)
    if p == 'fleecaprop1' then     Animation(p, fleecaprop1, model, animDict, prop)  
    elseif p == 'fleecaprop2' then   Animation(p, fleecaprop2, model, animDict, prop) 
    elseif p == 'fleecaprop3' then   Animation(p, fleecaprop3, model, animDict, prop)  
    elseif p == 'fleecaprop4' then   Animation(p, fleecaprop4, model, animDict, prop)  
    elseif p == 'fleecaprop5' then   Animation(p, fleecaprop5, model, animDict, prop)  
    elseif p == 'fleecaprop31' then   Animation(p, fleecaprop31, model, animDict, prop) 
    elseif p == 'fleecaprop32' then   Animation(p, fleecaprop32, model, animDict, prop)   
    elseif p == 'fleecaprop33' then   Animation(p, fleecaprop33, model, animDict, prop) 
    elseif p == 'fleecaprop34' then   Animation(p, fleecaprop34, model, animDict, prop) 
    elseif p == 'fleecaprop35' then   Animation(p, fleecaprop35, model, animDict, prop)   
    elseif p == 'fleecaprop36' then   Animation(p, fleecaprop36, model, animDict, prop)      
    elseif p == 'fleecaprop37' then   Animation(p, fleecaprop37, model, animDict, prop)   
    elseif p == 'fleecaprop38' then   Animation(p, fleecaprop38, model, animDict, prop)   
    elseif p == 'fleecaprop39' then   Animation(p, fleecaprop39, model, animDict, prop) 
    elseif p == 'fleecaprop40' then   Animation(p, fleecaprop40, model, animDict, prop)   
  
  --  elseif p == 'specialgrab' then  Animation('specialgrab', specialgrabprop, model, animDict, prop)

    elseif p == 'fleecaprop16' then   grabloot(p, fleecaprop16, prop16, prop, 'prop16')      
    elseif p == 'fleecaprop17' then   grabloot(p, fleecaprop17, prop17, prop, 'prop17')  
    elseif p == 'fleecaprop18' then   grabloot(p, fleecaprop18, prop18, prop, 'prop18')   
    elseif p == 'fleecaprop19' then   grabloot(p, fleecaprop19, prop19, prop, 'prop19') 
    elseif p == 'fleecaprop20' then   grabloot(p, fleecaprop20, prop20, prop, 'prop20')     
    elseif p == 'fleecaprop26' then   grabloot(p, fleecaprop26, prop26, prop, 'prop26')    
    elseif p == 'fleecaprop27' then   grabloot(p, fleecaprop27, prop27, prop, 'prop27')   
    elseif p == 'fleecaprop28' then   grabloot(p, fleecaprop28, prop28, prop, 'prop28') 
    elseif p == 'fleecaprop29' then   grabloot(p, fleecaprop29, prop29, prop, 'prop29')  
    elseif p == 'fleecaprop30' then   grabloot(p, fleecaprop30, prop30, prop, 'prop30') 
 
    end
end)


RegisterNetEvent('Polar-fleeca:Client:ResetProps', function()
    
    if DoesEntityExist(fleecaprop1) then DeleteEntity(fleecaprop1) targetname = 'fleecaprop1' end
    if DoesEntityExist(fleecaprop2) then DeleteEntity(fleecaprop2) targetname = 'fleecaprop2' end
    if DoesEntityExist(fleecaprop3) then DeleteEntity(fleecaprop3) targetname = 'fleecaprop3' end
    if DoesEntityExist(fleecaprop4) then DeleteEntity(fleecaprop4) targetname = 'fleecaprop4' end
    if DoesEntityExist(fleecaprop5) then DeleteEntity(fleecaprop5) targetname = 'fleecaprop5' end
    if DoesEntityExist(fleecaprop6) then DeleteEntity(fleecaprop6) targetname = 'fleecaprop6' end
    if DoesEntityExist(fleecaprop7) then DeleteEntity(fleecaprop7) targetname = 'fleecaprop7' end
    if DoesEntityExist(fleecaprop8) then DeleteEntity(fleecaprop8) targetname = 'fleecaprop8' end
    if DoesEntityExist(fleecaprop9) then DeleteEntity(fleecaprop9) targetname = 'fleecaprop9' end
    if DoesEntityExist(fleecaprop10) then DeleteEntity(fleecaprop10) targetname = 'fleecaprop10' end
    if DoesEntityExist(fleecaprop11) then DeleteEntity(fleecaprop11) targetname = 'fleecaprop11' end
    if DoesEntityExist(fleecaprop12) then DeleteEntity(fleecaprop12) targetname = 'fleecaprop12' end
    if DoesEntityExist(fleecaprop13) then DeleteEntity(fleecaprop13) targetname = 'fleecaprop13' end
    if DoesEntityExist(fleecaprop14) then DeleteEntity(fleecaprop14) targetname = 'fleecaprop14' end
    if DoesEntityExist(fleecaprop15) then DeleteEntity(fleecaprop15) targetname = 'fleecaprop15' end
    if DoesEntityExist(fleecaprop16) then DeleteEntity(fleecaprop16) targetname = 'fleecaprop16' end
    if DoesEntityExist(fleecaprop17) then DeleteEntity(fleecaprop17) targetname = 'fleecaprop17' end
    if DoesEntityExist(fleecaprop18) then DeleteEntity(fleecaprop18) targetname = 'fleecaprop18' end
    if DoesEntityExist(fleecaprop19) then DeleteEntity(fleecaprop19) targetname = 'fleecaprop19' end
    if DoesEntityExist(fleecaprop20) then DeleteEntity(fleecaprop20) targetname = 'fleecaprop20' end
    if DoesEntityExist(fleecaprop21) then DeleteEntity(fleecaprop21) targetname = 'fleecaprop21' end
    if DoesEntityExist(fleecaprop22) then DeleteEntity(fleecaprop22) targetname = 'fleecaprop22' end
    if DoesEntityExist(fleecaprop23) then DeleteEntity(fleecaprop23) targetname = 'fleecaprop23' end
    if DoesEntityExist(fleecaprop24) then DeleteEntity(fleecaprop24) targetname = 'fleecaprop24' end
    if DoesEntityExist(fleecaprop25) then DeleteEntity(fleecaprop25) targetname = 'fleecaprop25' end
    if DoesEntityExist(fleecaprop26) then DeleteEntity(fleecaprop26) targetname = 'fleecaprop26' end
    if DoesEntityExist(fleecaprop27) then DeleteEntity(fleecaprop27) targetname = 'fleecaprop27' end
    if DoesEntityExist(fleecaprop28) then DeleteEntity(fleecaprop28) targetname = 'fleecaprop28' end
    if DoesEntityExist(fleecaprop29) then DeleteEntity(fleecaprop29) targetname = 'fleecaprop29' end
    if DoesEntityExist(fleecaprop30) then DeleteEntity(fleecaprop30) targetname = 'fleecaprop30' end
    if DoesEntityExist(fleecaprop31) then DeleteEntity(fleecaprop31) targetname = 'fleecaprop31' end
    if DoesEntityExist(fleecaprop32) then DeleteEntity(fleecaprop32) targetname = 'fleecaprop32' end
    if DoesEntityExist(fleecaprop33) then DeleteEntity(fleecaprop33) targetname = 'fleecaprop33' end
    if DoesEntityExist(fleecaprop34) then DeleteEntity(fleecaprop34) targetname = 'fleecaprop34' end
    if DoesEntityExist(fleecaprop35) then DeleteEntity(fleecaprop35) targetname = 'fleecaprop35' end
    if DoesEntityExist(fleecaprop36) then DeleteEntity(fleecaprop36) targetname = 'fleecaprop36' end
    if DoesEntityExist(fleecaprop37) then DeleteEntity(fleecaprop37) targetname = 'fleecaprop37' end
    if DoesEntityExist(fleecaprop38) then DeleteEntity(fleecaprop38) targetname = 'fleecaprop38' end
    if DoesEntityExist(fleecaprop39) then DeleteEntity(fleecaprop39) targetname = 'fleecaprop39' end
    if DoesEntityExist(fleecaprop40) then DeleteEntity(fleecaprop40) targetname = 'fleecaprop40' end
    if targetname == nil then else
        if oxt then
            exports.ox_target:removeZone(targetname)
        else
            exports['qb-target']:RemoveZone(targetname)
        end
    end
end)


RegisterNetEvent('Polar-fleeca:Client:PickupTarget', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    animDict = 'random@domestic'
    local pile = data.piles
    local door = data.type
    local numba = data.number
    if pile then  
        TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) 
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
        if door == 'fleecaprop11' then DeleteEntity(fleecaprop11) end
        if door == 'fleecaprop12' then DeleteEntity(fleecaprop12) end
        if door == 'fleecaprop13' then DeleteEntity(fleecaprop13) end
        if door == 'fleecaprop14' then DeleteEntity(fleecaprop14) end
        if door == 'fleecaprop15' then DeleteEntity(fleecaprop15) end
    else
        loadAnimDict(animDict) TaskPlayAnim(PlayerPedId(), animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
    end
        TriggerServerEvent('Polar-fleeca:Server:Synapse'.. door ..'', prop)
        TriggerServerEvent('Polar-fleeca:Server:StopInteract', door)
        LocalPlayer.state:set('inv_busy', false, true)
        TriggerServerEvent('Polar-fleeca:Server:TargetRemove', door) 
end)



RegisterNetEvent('Polar-fleeca:Client:ResetDoors', function()

    TriggerServerEvent('qb-doorlock:server:updateState', fleecadoor1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', fleecadoor2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', fleecadoor3name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', fleecadoorcard1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', fleecadoorcard2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Config.VaultDoorDoor, true, false, false, true, false, false)
    
end)
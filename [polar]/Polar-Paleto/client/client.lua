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

local specialgrab = 'paletograb'
local vaultdoorname = Config.VaultDoorDoor
local vaultanimloc = Config.VaultDoorThirdEye
local fingerprintdoor = ''
-- vault stuff
local vaultid = 1
local open = 37.75
local closed = -125.74
local vaultloc = vector3(-1307.85, -816.5, 17.82)

local hi = true

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


local paletostartname = 'paletostart'
local paletodoor1name = 'paletodoor1'
local paletodoor2name = 'paletodoor2'
local paletodoor3name = 'paletodoor3'
local paletodoorcard1name = 'paletodoorcard1'
local paletodoorcard2name = 'paletodoorcard2'



AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  TriggerEvent('Polar-Paleto:Client:ResetProps') TriggerEvent('Polar-Paleto:Client:ResetDoors') TriggerEvent('Polar-Paleto:Client:ResetPropsKeypads') end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Targets')  end starttarget() blip()  end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if Config.Debug then print('Player Loaded Targets Starting') end starttarget() blip()  end)
RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)
RegisterNetEvent("Polar-Paleto:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)

local callback = Config.TrigCallBack -- QBCore.Functions.TriggerCallback ESX.TriggerServerCallback

RegisterNetEvent('Polar-Paleto:client:start', function()  pp = vector4(-109.43, 6483.32, 31.47, 224.11) door = paletostartname coords = vector3(-109.46, 6484.36, 31.27)
    if CurrentCops >= Config.RequiredCops then
    if playeritem(thermiteitem) then
        callback('Polar-Paleto:DoorCheckstart', function(result) if result then
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
    Wait(50)
        TriggerEvent('Polar-Paleto:client:ThermiteStart', pp, door, coords)
    else
        notify(text('cooldown'), "error")
    end end)
    else notify(text('nothermite'), "error") end
    else notify(text('nopolice'), "error") end
end)

RegisterNetEvent('Polar-Paleto:client:ThermiteStart', function(pp, door, coords)
                    LocalPlayer.state:set('inv_busy', true, true)
                    PlantThermite(pp, door)
        if hi then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-Paleto:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor1')
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor2')
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor3')
                    TriggerServerEvent('Polar-Paleto:Server:StartTargets')
        else
            if memgame then 
                exports[memname]:thermiteminigame(10, 3, 3, 10,
                function() -- success
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-Paleto:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor1')
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor2')
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor3')
                    TriggerServerEvent('Polar-Paleto:Server:StartTargets')
                end,
                function() -- failure
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    notify(text('thermitefail'), "error") 
                end)
            else
                exports[thermiteexport]:Thermite(function(success) 
                if success then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-Paleto:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor1')
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor2')
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor3')
                    TriggerServerEvent('Polar-Paleto:Server:StartTargets')
                else 
                    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    notify(text('thermitefail'), "error") end
            end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
        end
    end
end)





RegisterNetEvent('Polar-Paleto:client:Thermite', function(pp, door, coords)
    if hi then PlantThermite(pp, door) ThermiteEffect(door, coords) else
        if playeritem(thermiteitem) then
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
    if math.random(1, 100) <= Config.FingerPrintPercent and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)
    if memgame then 
        exports[memname]:thermiteminigame(10, 3, 3, 10,
        function() -- success
            TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) ThermiteEffect(door, coords)
            doorlock(door, false)
        end,
        function() -- failure
            TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 
            notify(text('thermitefail'), "error") 
        end)
    else
    exports[thermiteexport]:Thermite(function(success)
    if success then TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) ThermiteEffect(door, coords)
    doorlock(door, false)
    else TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 
        notify(text('thermitefail'), "error") end
    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
    end
    else notify(text('nothermite'), "error") end
    end
end)
function ThermiteEffect(door, coords)
    if door == 'paletostart' then CallPolice() end
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-Paleto:Server:ThermitePtfx", vec3(coords.x, coords.y, coords.z+0.2)) Wait(500) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) TriggerEvent('Polar-Paleto:Client:DestroyPad', door) Wait(thermitetime) ClearPedTasks(PlayerPedId())
 end 
function PlantThermite(pp, door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door) TriggerServerEvent('Polar-Paleto:Server:RemoveItem', thermiteitem, 1) RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("hei_p_m_bag_var22_arm_s")
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
    TriggerServerEvent('Polar-Paleto:Server:RemoveItems', drillreward, amount)
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100)
    if chance <= drillitemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', item, 1) end
    TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) 
    else
    StopSound(soundId) NetworkStartSynchronisedScene(scene4) PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId())  DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- fail 
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100) TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
    if chance <= drillitemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', item, 1) end
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
        exports.ox_target:addBoxZone({ coords = vaultanimloc, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  event = "Polar-Paleto:Client:VaultHack",  icon = "fas fa-bolt", label = "Hack", item = vaultitem}, } })
    else
        exports['qb-target']:AddBoxZone(vaultdoorname,  vaultanimloc, 0.5, 0.5, { name =  vaultdoorname, heading = 28.69, debug = false, minZ = vaultanimloc.z-0.5, maxZ =  vaultanimloc.z+0.5,}, 
        { options = {{ event = "Polar-Paleto:Client:VaultHack", icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = vaultitem}}, distance = 2.5 }) 
    end

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
        local name = "paletodrill1"
        adddrillspot(loc, name)

        local loc = vector4(-96.85, 6463.54, 31.63-space2, 314.59) 
        local name = "paletodrill2"
        adddrillspot(loc, name)

end 

function adddrillspot(loc, name)
    if oxt then
        exports.ox_target:addBoxZone({ coords = vector3(loc.x, loc.y, loc.z), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  event = "Polar-Paleto:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox" }, } })
    else
        exports['qb-target']:AddBoxZone(name,  vector3(loc.x, loc.y, loc.z), 0.25, 0.25, { name = name, heading = loc.w, debug = Config.Debug, minZ = loc.z-1, maxZ =  loc.z+1,}, 
        { options = {{ event = "Polar-Paleto:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox", excludejob = 'police', item = drillitem}}, distance = 1.5 }) 
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
    TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door)
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
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
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop) 
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(5000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-Paleto:Server:Synapsepaleto' .. name .. '', prop)    
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
RegisterNetEvent('Polar-Paleto:Client:Vault', function(open)
    if Config.Paleto then doorlock(vaultdoorname, false)   return end
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
                TriggerServerEvent('Polar-Paleto:Server:VaultClose')
                break
            end
    
            Wait(10)
        end
    end
end)







RegisterNetEvent('Polar-Paleto:Client:AddPickupTarget', function(door, door2, prop, var, pile) 
    if oxt then
        rod = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  event = "Polar-Paleto:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
        print('pickup ' .. rod .. ' ' .. door)
    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = Config.Debug, minZ = var.z  - 0.5, maxZ =  var.z + 0.5,}, 
        { options = {{ event = "Polar-Paleto:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 
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
        TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door)
        loadModel('hei_p_m_bag_var22_arm_s')
        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
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
        TriggerServerEvent('Polar-Paleto:Server:Synapse' .. door .. '', sped)  
    else
        rottt = GetEntityRotation(props)
        if rottt == nil then  
            print('error')
        else
    TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
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
    TriggerServerEvent('Polar-Paleto:Server:Synapse' .. door .. '', sped)  
        end
    end
end 
RegisterNetEvent('Polar-Paleto:Client:AddTarget', function(door, door2, prop, var) 
    if oxt then 
        box = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  event = "Polar-Paleto:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
        print('grab ' .. box .. ' ' .. door)
    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = Config.Debug, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
        { options = {{ event = "Polar-Paleto:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 
    end
end)


RegisterNetEvent('Polar-Paleto:Client:HackComputer', function(data)
    if playeritem(computeritem) then
    local door = data.door
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door) 
    local chance=math.random(1,100) 

    local time = 60
    TriggerEvent(voltgame, time, function(result,reason)
    if result == 0 then --failed
        if chance < 50 then  TriggerServerEvent('Polar-Paleto:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 
    elseif result == 1 then --success
        if chance < 50 then  TriggerServerEvent('Polar-Paleto:Server:RemoveItem', computeritem, 1) end
        Wait(2000)
        TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door)
        TriggerServerEvent('Polar-Paleto:Server:RemoveItems', pcitem)
    elseif result == 2 then --time out
        if chance < 50 then  TriggerServerEvent('Polar-Paleto:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 
    elseif result == -1 then end
    end) 
    else notify(text('nopcitem'), "error") end
end)








RegisterNetEvent('Polar-Paleto:client:keycard', function(door, position, rot, item) TriggerServerEvent('Polar-Paleto:Server:StopInteract', door) 
    if playeritem(carditem) then
    TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) 
    local chance = math.random(1,100) local pos = GetEntityCoords(PlayerPedId()) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(PlayerPedId(), true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(PlayerPedId(), position.w) SetEntityCoords(PlayerPedId(), vector3(position.x, position.y,position.z-1)) if chance <= carditemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(PlayerPedId(), animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(PlayerPedId(), animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(PlayerPedId(), animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(PlayerPedId(), animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(PlayerPedId(), false) doorlock(door, false) notify(text('doorunlock'), "success", 2500)
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
   -- if door == vaultdoorname then
        LocalPlayer.state:set('inv_busy', true, true) 
    exports[hackname]:OpenHackingGame(10, 5, 3, function(Success) 
        if Success then
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', vaultitem, 1) end
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
            TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) 
        else
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true) 
            TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
        end
    end)
      --[[
        elseif door == fingerprintdoor then
     
            LocalPlayer.state:set('inv_busy', true, true) 
        TriggerEvent("".. fingerhack ..":Start", 4, 1, 1, function(outcome, reason) 
        if outcome == true then -- success
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', vaultitem, 1) end
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
            TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) 
        elseif outcome == false then -- fail
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-Paleto:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true)
            TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 
        end end)
        end ]]
       
end
function hack(door)
    LocalPlayer.state:set('inv_busy', true, true) 
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
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
        TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
        LocalPlayer.state:set('inv_busy', false, true) 
    end)
    end
end

RegisterNetEvent('Polar-Paleto:client:DrillStart', function(drillpos, drillrot, door)
    if playeritem(drillitem) then
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
    drill(drillpos, drillrot, drillitem, door)
    else  notify(text('nodrill'), "error") end
end)

RegisterNetEvent('Polar-Paleto:Client:Drill', function(data)
    callback('Polar-Paleto:' .. data.door .. '', function(result) if result then 
    TriggerEvent('Polar-Paleto:client:DrillStart', data.coords, vector3(0.0, 0.0, data.head), data.door)
    else
        notify(text('sometingelse'), "error")
    end end)
end)

function vaultdone() TriggerServerEvent('Polar-Paleto:Server:Vault') end
RegisterNetEvent('Polar-Paleto:Client:VaultHack', function() 
    if playeritem(vaultitem) then
    callback('Polar-Paleto:VaultCheck', function(result) if result then 
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
        exports.ox_target:addBoxZone({ coords = Config.StartThirdEye, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = paletostartname, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Paleto:client:start' }, } })
    else
    
    exports['qb-target']:AddBoxZone(paletostartname, Config.StartThirdEye, 1, 1, { name = paletostartname, heading = 0.0, debug = Config.Debug, minZ = Config.StartThirdEye.z-1, maxZ =  Config.StartThirdEye.z+1,}, 
    { options = {{ event = "Polar-Paleto:client:start", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 

    end
end

RegisterNetEvent('Polar-Paleto:Client:StartLoot', function()

    TriggerServerEvent('Polar-Paleto:Server:SetupGrab1')

    TriggerServerEvent('Polar-Paleto:Server:SetupPickup1')

    TriggerServerEvent('Polar-Paleto:Server:SetupPile1')

    TriggerServerEvent('Polar-Paleto:Server:SetupTrolly1')


end)

RegisterNetEvent('Polar-Paleto:Client:StartTargets', function()
    
    if oxt then

        exports.ox_target:addBoxZone({ coords = vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = paletodoor1name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Paleto:Client:Door1' }, } })
        exports.ox_target:addBoxZone({ coords = vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = paletodoor2name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Paleto:Client:Door2' }, } })
        exports.ox_target:addBoxZone({ coords = vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = paletodoor3name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Paleto:Client:Door3' }, } })

        exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = paletodoorcard1name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-Paleto:Client:doorcard1' }, } })
        exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = paletodoorcard2name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-Paleto:Client:doorcard2' }, } })
      
        exports.ox_target:addBoxZone({ coords = Config.Pc1, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc1name, event = 'Polar-Paleto:Client:HackComputer' }, } })
        exports.ox_target:addBoxZone({ coords = Config.Pc2, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc2name, event = 'Polar-Paleto:Client:HackComputer' }, } })
        exports.ox_target:addBoxZone({ coords = Config.Pc3, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc3name, event = 'Polar-Paleto:Client:HackComputer' }, } })
      
    else
    
   
    exports['qb-target']:AddBoxZone(paletodoor1name, vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), 1, 1, { name = paletodoor1name, heading = 0.0, debug = Config.Debug, minZ = Config.Door1Eye.z-1, maxZ =  Config.Door1Eye.z+1,}, 
    { options = {{ event = "Polar-Paleto:Client:Door1", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(paletodoor2name, vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), 1, 1, { name = paletodoor2name, heading = 0.0, debug = Config.Debug, minZ = Config.Door2Eye.z-1, maxZ =  Config.Door2Eye.z+1,}, 
    { options = {{ event = "Polar-Paleto:Client:Door2", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(paletodoor3name, vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), 1, 1, { name = paletodoor3name, heading = 0.0, debug = Config.Debug, minZ = Config.Door3Eye.z-1, maxZ =  Config.Door3Eye.z+1,}, 
    { options = {{ event = "Polar-Paleto:Client:Door3", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 2.5 }) 
    
    exports['qb-target']:AddBoxZone(paletodoorcard1name, vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), 1, 1, { name = paletodoorcard1name, heading = 0.0, debug = Config.Debug, minZ = Config.doorcard1Eye.z-1, maxZ =  Config.doorcard1Eye.z+1,}, 
    { options = {{ event = "Polar-Paleto:Client:doorcard1", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police', item = carditem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(paletodoorcard2name, vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), 1, 1, { name = paletodoorcard2name, heading = 0.0, debug = Config.Debug, minZ = Config.doorcard2Eye.z-1, maxZ =  Config.doorcard2Eye.z+1,}, 
    { options = {{ event = "Polar-Paleto:Client:doorcard2", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police', item = carditem}}, distance = 2.5 }) 
   
    exports['qb-target']:AddBoxZone(Config.Pc1name, Config.Pc1, 2, 2, { name = Config.Pc1name, heading = 28.69, debug = Config.Debug, minZ = Config.Pc1-1, maxZ =  Config.Pc1+1,}, 
    { options = {{ event = "Polar-Paleto:Client:HackComputer", door = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(Config.Pc2name, Config.Pc1, 2, 2, { name = Config.Pc2name, heading = 28.69, debug = Config.Debug, minZ = Config.Pc2-1, maxZ =  Config.Pc2+1,}, 
    { options = {{ event = "Polar-Paleto:Client:HackComputer", door = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    exports['qb-target']:AddBoxZone(Config.Pc3name, Config.Pc3, 2, 2, { name = Config.Pc3name, heading = 28.69, debug = Config.Debug, minZ = Config.Pc3-1, maxZ =  Config.Pc3+1,}, 
    { options = {{ event = "Polar-Paleto:Client:HackComputer", door = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police', item = computeritem}}, distance = 2.5 }) 
    
    end

    other()

end)


--- Thermites
RegisterNetEvent('Polar-Paleto:Client:Door1', function() pp = vec4(Config.Door1Thermite.x, Config.Door1Thermite.y, Config.Door1Thermite.z + 0.2, Config.Door1Thermite.w) door = paletodoor1name coords =  Config.Door1Pfx callback('Polar-Paleto:Door1', function(result) if result then TriggerEvent('Polar-Paleto:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-Paleto:Client:Door2', function() pp = vec4(Config.Door2Thermite.x, Config.Door2Thermite.y, Config.Door2Thermite.z + 0.2, Config.Door2Thermite.w) door = paletodoor2name coords =  Config.Door2Pfx callback('Polar-Paleto:Door2', function(result) if result then TriggerEvent('Polar-Paleto:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-Paleto:Client:Door3', function() pp = vec4(Config.Door3Thermite.x, Config.Door3Thermite.y, Config.Door3Thermite.z + 0.2, Config.Door3Thermite.w) door = paletodoor3name coords =  Config.Door3Pfx callback('Polar-Paleto:Door3', function(result) if result then TriggerEvent('Polar-Paleto:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
----- CARD INSERT
RegisterNetEvent('Polar-Paleto:Client:doorcard1', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard1swipe door = paletodoorcard1name TriggerEvent('Polar-Paleto:client:keycard', door, position, rot, item) end)
RegisterNetEvent('Polar-Paleto:Client:doorcard2', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard2swipe door = paletodoorcard2name TriggerEvent('Polar-Paleto:client:keycard', door, position, rot, item) end)






























---- grabs 1-5 and 31-40





local paletoprop1 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop1', function(door, prop, var) loadModel(prop) paletoprop1 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop1, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
 
end)

local paletoprop2 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop2', function(door, prop, var) loadModel(prop) paletoprop2 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop2, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
   
end)

local paletoprop3 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop3', function(door, prop, var) loadModel(prop) paletoprop3 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop3, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
 
end)

local paletoprop4 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop4', function(door, prop, var) loadModel(prop) paletoprop4 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop4, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)

local paletoprop5 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop5', function(door, prop, var) loadModel(prop) paletoprop5 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop5, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)


local paletoprop31 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop31', function(door, prop, var) loadModel(prop) paletoprop31 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop31, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
   
end)

local paletoprop32 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop32', function(door, prop, var) loadModel(prop) paletoprop32 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop32, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
 
end)

local paletoprop33 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop33', function(door, prop, var) loadModel(prop) paletoprop33 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop33, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)

local paletoprop34 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop34', function(door, prop, var) loadModel(prop) paletoprop34 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop34, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
 
end)

local paletoprop35 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop35', function(door, prop, var) loadModel(prop) paletoprop35 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop35, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)


local paletoprop36 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop36', function(door, prop, var) loadModel(prop) paletoprop36 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop36, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
 
end)

local paletoprop37 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop37', function(door, prop, var) loadModel(prop) paletoprop37 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop37, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)

local paletoprop38 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop38', function(door, prop, var) loadModel(prop) paletoprop38 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop38, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
 
end)

local paletoprop39 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop39', function(door, prop, var) loadModel(prop) paletoprop39 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop39, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop40 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop40', function(door, prop, var) loadModel(prop) paletoprop40 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop40, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
   
end)












---- pickups 6-10 and 21 - 25

local paletoprop6 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop6', function(door, prop, var) loadModel(prop) paletoprop6 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop6, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)

local paletoprop7 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop7', function(door, prop, var) loadModel(prop) paletoprop7 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop7, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
  
end)

local paletoprop8 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop8', function(door, prop, var) loadModel(prop) paletoprop8 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop8, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop9 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop9', function(door, prop, var) loadModel(prop) paletoprop9 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop9, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop10 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop10', function(door, prop, var) loadModel(prop) paletoprop10 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop10, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)


local paletoprop21 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop21', function(door, prop, var) loadModel(prop) paletoprop21 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop21, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 
 
end)

local paletoprop22 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop22', function(door, prop, var) loadModel(prop) paletoprop22 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop22, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop23 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop23', function(door, prop, var) loadModel(prop) paletoprop23 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop23, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop24 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop24', function(door, prop, var) loadModel(prop) paletoprop24 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop24, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop25 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop25', function(door, prop, var) loadModel(prop) paletoprop25 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop25, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)











---- piles 11-15

local paletoprop11 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop11', function(door, prop, var) loadModel(prop) paletoprop11 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop11, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop12 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop12', function(door, prop, var) loadModel(prop) paletoprop12 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop12, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop13 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop13', function(door, prop, var) loadModel(prop) paletoprop13 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop13, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop14 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop14', function(door, prop, var) loadModel(prop) paletoprop14 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop14, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)

local paletoprop15 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop15', function(door, prop, var) loadModel(prop) paletoprop15 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop15, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door) 

end)




---- trollys 16-20 and 26-30

local paletoprop16 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop16', function(door, prop, var) loadModel(prop) prop16 = prop paletoprop16 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop16, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop17 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop17', function(door, prop, var) loadModel(prop) prop17 = prop paletoprop17 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop17, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop18 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop18', function(door, prop, var) loadModel(prop) prop18 = prop paletoprop18 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop18, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop19 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop19', function(door, prop, var) loadModel(prop) prop19 = prop paletoprop19 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop19, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop20 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop20', function(door, prop, var) loadModel(prop) prop20 = prop paletoprop20 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop20, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)


local paletoprop26 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop26', function(door, prop, var) loadModel(prop) prop26 = prop paletoprop26 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop26, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop27 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop27', function(door, prop, var) loadModel(prop) prop27 = prop paletoprop27 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop27, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop28 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop28', function(door, prop, var) loadModel(prop) prop28 = prop paletoprop28 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop28, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop29 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop29', function(door, prop, var) loadModel(prop) prop29 = prop paletoprop29 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop29, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)

local paletoprop30 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop30', function(door, prop, var) loadModel(prop) prop30 = prop paletoprop30 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop30, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)

end)





RegisterNetEvent('Polar-Paleto:Client:TargetRemove', function(door) 

    if door == 'paletoprop1' then DeleteEntity(paletoprop1)end --  oxdoorname = paletoprop1 end
    if door == 'paletoprop2' then DeleteEntity(paletoprop2)end --  oxdoorname = paletoprop2 end
    if door == 'paletoprop3' then DeleteEntity(paletoprop3)end --  oxdoorname = paletoprop3 end
    if door == 'paletoprop4' then DeleteEntity(paletoprop4)end --  oxdoorname = paletoprop4 end
    if door == 'paletoprop5' then DeleteEntity(paletoprop5)end --  oxdoorname = paletoprop5 end
    if door == 'paletoprop6' then DeleteEntity(paletoprop6)end 
    if door == 'paletoprop7' then DeleteEntity(paletoprop7)end 
    if door == 'paletoprop8' then DeleteEntity(paletoprop8)end 
    if door == 'paletoprop9' then DeleteEntity(paletoprop9)end 
    if door == 'paletoprop10' then DeleteEntity(paletoprop10)end 
   
   -- if door == 'paletoprop11' then DeleteEntity(paletoprop11) end
   -- if door == 'paletoprop12' then DeleteEntity(paletoprop12) end
  --  if door == 'paletoprop13' then DeleteEntity(paletoprop13) end
  --  if door == 'paletoprop14' then DeleteEntity(paletoprop14) end
  --  if door == 'paletoprop15' then DeleteEntity(paletoprop15) end

   -- if door == 'paletoprop16' then DeleteEntity(paletoprop16) end
  --  if door == 'paletoprop17' then DeleteEntity(paletoprop17) end
  --  if door == 'paletoprop18' then DeleteEntity(paletoprop18) end
  --  if door == 'paletoprop19' then DeleteEntity(paletoprop19) end
   -- if door == 'paletoprop20' then DeleteEntity(paletoprop20) end

    if door == 'paletoprop21' then DeleteEntity(paletoprop21)end --  oxdoorname = paletoprop11 end
    if door == 'paletoprop22' then DeleteEntity(paletoprop22)end 
    if door == 'paletoprop23' then DeleteEntity(paletoprop23)end --  oxdoorname = paletoprop13 end
    if door == 'paletoprop24' then DeleteEntity(paletoprop24)end --  oxdoorname = paletoprop14 end
    if door == 'paletoprop25' then DeleteEntity(paletoprop25)end --  oxdoorname = paletoprop15 end
  --  if door == 'paletoprop26' then DeleteEntity(paletoprop26) end
  --  if door == 'paletoprop27' then DeleteEntity(paletoprop27) end
  --  if door == 'paletoprop28' then DeleteEntity(paletoprop28) end
  --  if door == 'paletoprop29' then DeleteEntity(paletoprop29) end
  --  if door == 'paletoprop30' then DeleteEntity(paletoprop30) end

    if door == 'paletoprop31' then DeleteEntity(paletoprop31)end --  oxdoorname = paletoprop31 end
    if door == 'paletoprop32' then DeleteEntity(paletoprop32)end --  oxdoorname = paletoprop32 end
    if door == 'paletoprop33' then DeleteEntity(paletoprop33)end --  oxdoorname = paletoprop33 end
    if door == 'paletoprop34' then DeleteEntity(paletoprop34)end --  oxdoorname = paletoprop34 end
    if door == 'paletoprop35' then DeleteEntity(paletoprop35)end --  oxdoorname = paletoprop35 end
    if door == 'paletoprop36' then DeleteEntity(paletoprop36)end --  oxdoorname = paletoprop36 end
    if door == 'paletoprop37' then DeleteEntity(paletoprop37)end --  oxdoorname = paletoprop37 end
    if door == 'paletoprop38' then DeleteEntity(paletoprop38)end --  oxdoorname = paletoprop38 end
    if door == 'paletoprop39' then DeleteEntity(paletoprop39)end --  oxdoorname = paletoprop39 end
    if door == 'paletoprop40' then DeleteEntity(paletoprop40)end --  oxdoorname = paletoprop40 end

    if oxt then
        if door == paletodoor1name then oxdoorname = 2 end
        if door == paletodoor2name then oxdoorname = 3 end
        if door == paletodoor3name then oxdoorname = 4 end
        if door == paletodoorcard1name then oxdoorname = 5 end
        if door == paletodoorcard2name then oxdoorname = 6 end
        if door == Config.Pc1name then oxdoorname = 7 end
        if door == Config.Pc2name then oxdoorname = 8 end
        if door == Config.Pc3name then oxdoorname = 9 end
        -- pickups
        if door == 'paletoprop6' then  oxdoorname = 20 end 
        if door == 'paletoprop7' then  oxdoorname = 21 end 
        if door == 'paletoprop8' then  oxdoorname = 22 end 
        if door == 'paletoprop9' then  oxdoorname = 23 end 
        if door == 'paletoprop10' then oxdoorname = 24 end
        if door == 'paletoprop21' then oxdoorname = 25 end 
        if door == 'paletoprop22' then oxdoorname = 26 end 
        -- piles
        if door == 'paletoprop11' then oxdoorname = 27 end
        if door == 'paletoprop12' then oxdoorname = 28 end
        -- grabs
        if door == 'paletoprop1' then  oxdoorname = 10 end 
        if door == 'paletoprop2' then  oxdoorname = 11 end 
        if door == 'paletoprop3' then  oxdoorname = 12 end 
        if door == 'paletoprop4' then  oxdoorname = 13 end 
        if door == 'paletoprop5' then oxdoorname = 14 end
        if door == 'paletoprop31' then  oxdoorname = 15 end 
        if door == 'paletoprop32' then  oxdoorname = 16 end 
        if door == 'paletoprop33' then  oxdoorname = 17 end 
        if door == 'paletoprop34' then  oxdoorname = 18 end 
        if door == 'paletoprop35' then oxdoorname = 19 end
        -- trollys
        if door == 'paletoprop16' then oxdoorname = 29 end 
        if door == 'paletoprop17' then oxdoorname = 30 end 
        if door == 'paletoprop18' then oxdoorname = 31 end
        if door == 'paletoprop19' then oxdoorname = 32 end

        Wait(1)
        if door == nil then return end
        if oxdoorname == nil then return end
        exports.ox_target:removeZone(oxdoorname)
        oxdoorname = nil
    else
   
        exports['qb-target']:RemoveZone(door) 
    end
end)


RegisterNetEvent('Polar-Paleto:Client:Target', function(data) 
    model = 'hei_p_m_bag_var22_arm_s' animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
    local p = data.type 
    TriggerServerEvent('Polar-Paleto:Server:StopInteract', p)
    if p == 'paletoprop1' then     Animation(p, paletoprop1, model, animDict, prop)  
    elseif p == 'paletoprop2' then   Animation(p, paletoprop2, model, animDict, prop) 
    elseif p == 'paletoprop3' then   Animation(p, paletoprop3, model, animDict, prop)  
    elseif p == 'paletoprop4' then   Animation(p, paletoprop4, model, animDict, prop)  
    elseif p == 'paletoprop5' then   Animation(p, paletoprop5, model, animDict, prop)  
    elseif p == 'paletoprop31' then   Animation(p, paletoprop31, model, animDict, prop) 
    elseif p == 'paletoprop32' then   Animation(p, paletoprop32, model, animDict, prop)   
    elseif p == 'paletoprop33' then   Animation(p, paletoprop33, model, animDict, prop) 
    elseif p == 'paletoprop34' then   Animation(p, paletoprop34, model, animDict, prop) 
    elseif p == 'paletoprop35' then   Animation(p, paletoprop35, model, animDict, prop)   
    elseif p == 'paletoprop36' then   Animation(p, paletoprop36, model, animDict, prop)      
    elseif p == 'paletoprop37' then   Animation(p, paletoprop37, model, animDict, prop)   
    elseif p == 'paletoprop38' then   Animation(p, paletoprop38, model, animDict, prop)   
    elseif p == 'paletoprop39' then   Animation(p, paletoprop39, model, animDict, prop) 
    elseif p == 'paletoprop40' then   Animation(p, paletoprop40, model, animDict, prop)   
  
  --  elseif p == 'specialgrab' then  Animation('specialgrab', specialgrabprop, model, animDict, prop)

    elseif p == 'paletoprop16' then   grabloot(p, paletoprop16, prop16, prop, 'prop16')      
    elseif p == 'paletoprop17' then   grabloot(p, paletoprop17, prop17, prop, 'prop17')  
    elseif p == 'paletoprop18' then   grabloot(p, paletoprop18, prop18, prop, 'prop18')   
    elseif p == 'paletoprop19' then   grabloot(p, paletoprop19, prop19, prop, 'prop19') 
    elseif p == 'paletoprop20' then   grabloot(p, paletoprop20, prop20, prop, 'prop20')     
    elseif p == 'paletoprop26' then   grabloot(p, paletoprop26, prop26, prop, 'prop26')    
    elseif p == 'paletoprop27' then   grabloot(p, paletoprop27, prop27, prop, 'prop27')   
    elseif p == 'paletoprop28' then   grabloot(p, paletoprop28, prop28, prop, 'prop28') 
    elseif p == 'paletoprop29' then   grabloot(p, paletoprop29, prop29, prop, 'prop29')  
    elseif p == 'paletoprop30' then   grabloot(p, paletoprop30, prop30, prop, 'prop30') 
 
    end
end)


RegisterNetEvent('Polar-Paleto:Client:ResetProps', function()
    
    if DoesEntityExist(paletoprop1) then DeleteEntity(paletoprop1) targetname = 'paletoprop1' end
    if DoesEntityExist(paletoprop2) then DeleteEntity(paletoprop2) targetname = 'paletoprop2' end
    if DoesEntityExist(paletoprop3) then DeleteEntity(paletoprop3) targetname = 'paletoprop3' end
    if DoesEntityExist(paletoprop4) then DeleteEntity(paletoprop4) targetname = 'paletoprop4' end
    if DoesEntityExist(paletoprop5) then DeleteEntity(paletoprop5) targetname = 'paletoprop5' end
    if DoesEntityExist(paletoprop6) then DeleteEntity(paletoprop6) targetname = 'paletoprop6' end
    if DoesEntityExist(paletoprop7) then DeleteEntity(paletoprop7) targetname = 'paletoprop7' end
    if DoesEntityExist(paletoprop8) then DeleteEntity(paletoprop8) targetname = 'paletoprop8' end
    if DoesEntityExist(paletoprop9) then DeleteEntity(paletoprop9) targetname = 'paletoprop9' end
    if DoesEntityExist(paletoprop10) then DeleteEntity(paletoprop10) targetname = 'paletoprop10' end
    if DoesEntityExist(paletoprop11) then DeleteEntity(paletoprop11) targetname = 'paletoprop11' end
    if DoesEntityExist(paletoprop12) then DeleteEntity(paletoprop12) targetname = 'paletoprop12' end
    if DoesEntityExist(paletoprop13) then DeleteEntity(paletoprop13) targetname = 'paletoprop13' end
    if DoesEntityExist(paletoprop14) then DeleteEntity(paletoprop14) targetname = 'paletoprop14' end
    if DoesEntityExist(paletoprop15) then DeleteEntity(paletoprop15) targetname = 'paletoprop15' end
    if DoesEntityExist(paletoprop16) then DeleteEntity(paletoprop16) targetname = 'paletoprop16' end
    if DoesEntityExist(paletoprop17) then DeleteEntity(paletoprop17) targetname = 'paletoprop17' end
    if DoesEntityExist(paletoprop18) then DeleteEntity(paletoprop18) targetname = 'paletoprop18' end
    if DoesEntityExist(paletoprop19) then DeleteEntity(paletoprop19) targetname = 'paletoprop19' end
    if DoesEntityExist(paletoprop20) then DeleteEntity(paletoprop20) targetname = 'paletoprop20' end
    if DoesEntityExist(paletoprop21) then DeleteEntity(paletoprop21) targetname = 'paletoprop21' end
    if DoesEntityExist(paletoprop22) then DeleteEntity(paletoprop22) targetname = 'paletoprop22' end
    if DoesEntityExist(paletoprop23) then DeleteEntity(paletoprop23) targetname = 'paletoprop23' end
    if DoesEntityExist(paletoprop24) then DeleteEntity(paletoprop24) targetname = 'paletoprop24' end
    if DoesEntityExist(paletoprop25) then DeleteEntity(paletoprop25) targetname = 'paletoprop25' end
    if DoesEntityExist(paletoprop26) then DeleteEntity(paletoprop26) targetname = 'paletoprop26' end
    if DoesEntityExist(paletoprop27) then DeleteEntity(paletoprop27) targetname = 'paletoprop27' end
    if DoesEntityExist(paletoprop28) then DeleteEntity(paletoprop28) targetname = 'paletoprop28' end
    if DoesEntityExist(paletoprop29) then DeleteEntity(paletoprop29) targetname = 'paletoprop29' end
    if DoesEntityExist(paletoprop30) then DeleteEntity(paletoprop30) targetname = 'paletoprop30' end
    if DoesEntityExist(paletoprop31) then DeleteEntity(paletoprop31) targetname = 'paletoprop31' end
    if DoesEntityExist(paletoprop32) then DeleteEntity(paletoprop32) targetname = 'paletoprop32' end
    if DoesEntityExist(paletoprop33) then DeleteEntity(paletoprop33) targetname = 'paletoprop33' end
    if DoesEntityExist(paletoprop34) then DeleteEntity(paletoprop34) targetname = 'paletoprop34' end
    if DoesEntityExist(paletoprop35) then DeleteEntity(paletoprop35) targetname = 'paletoprop35' end
    if DoesEntityExist(paletoprop36) then DeleteEntity(paletoprop36) targetname = 'paletoprop36' end
    if DoesEntityExist(paletoprop37) then DeleteEntity(paletoprop37) targetname = 'paletoprop37' end
    if DoesEntityExist(paletoprop38) then DeleteEntity(paletoprop38) targetname = 'paletoprop38' end
    if DoesEntityExist(paletoprop39) then DeleteEntity(paletoprop39) targetname = 'paletoprop39' end
    if DoesEntityExist(paletoprop40) then DeleteEntity(paletoprop40) targetname = 'paletoprop40' end
    if targetname == nil then return end
    if oxt then
        exports.ox_target:removeZone(targetname)
    else
        exports['qb-target']:RemoveZone(targetname)
    end
end)


RegisterNetEvent('Polar-Paleto:Client:PickupTarget', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    animDict = 'random@domestic'
    local pile = data.piles
    local door = data.type
    local numba = data.number
    if pile then  
        TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) 
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
        if door == 'paletoprop11' then DeleteEntity(paletoprop11) end
        if door == 'paletoprop12' then DeleteEntity(paletoprop12) end
        if door == 'paletoprop13' then DeleteEntity(paletoprop13) end
        if door == 'paletoprop14' then DeleteEntity(paletoprop14) end
        if door == 'paletoprop15' then DeleteEntity(paletoprop15) end
    else
        loadAnimDict(animDict) TaskPlayAnim(PlayerPedId(), animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
    end
        TriggerServerEvent('Polar-Paleto:Server:Synapse'.. door ..'', prop)
        TriggerServerEvent('Polar-Paleto:Server:StopInteract', door)
        LocalPlayer.state:set('inv_busy', false, true)
        TriggerServerEvent('Polar-Paleto:Server:TargetRemove', door) 
end)



RegisterNetEvent('Polar-Paleto:Client:ResetDoors', function()

    doorlock(paletodoor1name, true)
    doorlock(paletodoor2name, true)
    doorlock(paletodoor3name, true)
    doorlock(paletodoorcard1name, true)
    doorlock(paletodoorcard2name, true)
    doorlock(Config.VaultDoorDoor, true)
    
end)

function doorlock(name, what)
    TriggerServerEvent('qb-doorlock', name, what, false, false, true, false, false)
end

function playeritem(item, amount)
    return exports['qb-inventory']:HasItem(item, amount)
end
  
function notify(what, color)
    if Config.Notify == 'qb' then
        QBCore.Functions.Notify(what, color)
    elseif Config.Notify == 'esx' then
        if color == 'error' then colo = 'r' elseif color == 'success' then colo = 'g' end
        ESX.ShowNotification(what, true, true, colo)
    end
end
 
  
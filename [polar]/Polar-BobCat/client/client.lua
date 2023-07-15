if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
local oxt = Config.OxTarget -- ox target
local oxdoorname = nil
local oxd = Config.OxDoorlock
local ped = PlayerPedId()
local animDict = nil local model = nil local prop = nil local var = nil local drillpos = nil local drillrot = nil local door = nil local pp = nil local coords = nil local rot = nil local position = nil local item = nil local CurrentCops = 0
local amount = nil

local specialgrab = 'BobCatgrab'
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
local bombitem = "weapon_stickybomb"

local BobCatstartname = 'BobCatstart'
local BobCatdoor1name = 'Bobcat1'
local BobCatdoor2name = 'Bobcat4'
local BobCatdoor3name = 'Bobcat3'
local BobCatdoorcard1name = 'Bobcat2'
local BobCatdoorcard2name = 'Bobcat3'


AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  TriggerEvent('Polar-BobCat:Client:ResetProps') TriggerEvent('Polar-BobCat:Client:ResetDoors') TriggerEvent('Polar-BobCat:Client:ResetPropsKeypads') resetstuff() LocalPlayer.state:set('inv_busy', false, true) end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if hi then print('Starting Targets')  end starttarget() blip() resetpeds() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if hi then print('Player Loaded Targets Starting') end starttarget() blip()  end)
RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)
RegisterNetEvent("Polar-BobCat:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)

local callback = Config.TrigCallBack -- QBCore.Functions.TriggerCallback ESX.TriggerServerCallback

RegisterNetEvent('Polar-BobCat:client:start', function()  pp = Config.StartThermite door = BobCatstartname coords = Config.StartPfx
    if CurrentCops >= Config.RequiredCops then
    if playeritem(thermiteitem) then
    callback('Polar-BobCat:DoorCheckstart', function(result) if result then
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
    Wait(50)
        TriggerEvent('Polar-BobCat:client:ThermiteStart', pp, door, coords)
    else
        notify(text('cooldown'), "error")
    end end)
    else notify(text('nothermite'), "error") end
    else notify(text('nopolice'), "error") end
end)

RegisterNetEvent('Polar-BobCat:client:ThermiteStart', function(pp, door, coords)
                    LocalPlayer.state:set('inv_busy', true, true)
                    PlantThermite(pp, door)
        if hi then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-BobCat:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor1')
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor2')
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor3')
                    TriggerServerEvent('Polar-BobCat:Server:StartTargets')
        else
            if memgame then 
                exports[memname]:thermiteminigame(10, 3, 3, 10,
                function() -- success
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-BobCat:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor1')
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor2')
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor3')
                    TriggerServerEvent('Polar-BobCat:Server:StartTargets')
                end,
                function() -- failure
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    notify(text('thermitefail'), "error") 
                end)
            else
                exports[thermiteexport]:Thermite(function(success) 
                if success then
                    LocalPlayer.state:set('inv_busy', false, true)
                    TriggerServerEvent('Polar-BobCat:Server:StartCooldown')
                    ThermiteEffect(door, coords) 
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor1')
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor2')
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', 'BobCatdoor3')
                    TriggerServerEvent('Polar-BobCat:Server:StartTargets')
                else 
                    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
                    LocalPlayer.state:set('inv_busy', false, true)
                    notify(text('thermitefail'), "error") end
            end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors)
        end
    end
end)





RegisterNetEvent('Polar-BobCat:client:Thermite', function(pp, door, coords)
    if hi then PlantThermite(pp, door) ThermiteEffect(door, coords) else
        if playeritem(thermiteitem) then
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
    if math.random(1, 100) <= Config.FingerPrintPercent and not gloves() then TriggerServerEvent("evidence:server:CreateFingerDrop", GetEntityCoords(PlayerPedId())) end PlantThermite(pp, door)
    if memgame then 
        exports[memname]:thermiteminigame(10, 3, 3, 10,
        function() -- success
            TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) ThermiteEffect(door, coords)
           
        end,
        function() -- failure
            TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 
            notify(text('thermitefail'), "error") 
        end)
    else
    exports[thermiteexport]:Thermite(function(success)
    if success then TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) ThermiteEffect(door, coords)
    
    else TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 
        notify(text('thermitefail'), "error") end
    end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
    end
    else notify(text('nothermite'), "error") end
    end
end)
function ThermiteEffect(door, coords)
    if door == 'BobCatstart' then CallPolice() end
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-BobCat:Server:ThermitePtfx", vec3(coords.x, coords.y, coords.z+0.2)) Wait(500) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) TriggerEvent('Polar-BobCat:Client:DestroyPad', door) Wait(thermitetime) ClearPedTasks(PlayerPedId())    if oxd then  TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', door, false)
    else TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) end
 end 
function PlantThermite(pp, door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door) TriggerServerEvent('Polar-BobCat:Server:RemoveItem', thermiteitem, 1) RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("hei_p_m_bag_var22_arm_s")
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
    TriggerServerEvent('Polar-BobCat:Server:RemoveItems', drillreward, amount)
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100)
    if chance <= drillitemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', item, 1) end
    TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) 
    else
    StopSound(soundId) NetworkStartSynchronisedScene(scene4) PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId())  DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) 
    -- fail 
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    local chance = math.random(1,100) TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
    if chance <= drillitemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', item, 1) end
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
    
    exports['qb-target']:AddBoxZone(vaultdoorname, vector3(888.03, -2130.2, 31.51), 1, 1, { name = vaultdoorname, heading = 0.0, debug = hi, minZ = 31.5-1, maxZ =  31.5+1,}, 
    { options = {{ event = "Polar-BobCat:Client:PlantBomb", icon = "fas fa-fire", label = "Plant Explosive"}}, distance = 1.5 }) 

    SetPedRelationshipGroupHash(PlayerPedId(), 'PLAYER')
    AddRelationshipGroup('npcguards')
    
    peds()

    if oxt then
        box = exports.ox_target:addBoxZone({ coords = vaultanimloc, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-BobCat:Client:VaultHack",  icon = "fas fa-bolt", label = "Hack" }, } })
        if hi then print(' vaultdoor = ' .. box .. ' ') end
    else
      --  exports['qb-target']:AddBoxZone(vaultdoorname,  vaultanimloc, 0.5, 0.5, { name =  vaultdoorname, heading = 28.69, debug = false, minZ = vaultanimloc.z-0.5, maxZ =  vaultanimloc.z+0.5,}, 
      --  { options = {{ event = "Polar-BobCat:Client:VaultHack", icon = "fas fa-bolt", label = "Hack", excludejob = 'police' }}, distance = 1.5 }) 
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
        local name = "BobCatdrill1"
        adddrillspot(loc, name)

        local loc = vector4(-96.85, 6463.54, 31.63-space2, 314.59) 
        local name = "BobCatdrill2"
        adddrillspot(loc, name)

end 

function adddrillspot(loc, name)
    if oxt then
        exports.ox_target:addBoxZone({ coords = vector3(loc.x, loc.y, loc.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-BobCat:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox" }, } })
    else
        exports['qb-target']:AddBoxZone(name,  vector3(loc.x, loc.y, loc.z), 0.25, 0.25, { name = name, heading = loc.w, debug = hi, minZ = loc.z-1, maxZ =  loc.z+1,}, 
        { options = {{ event = "Polar-BobCat:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox", excludejob = 'police', item = drillitem}}, distance = 1.5 }) 
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
    TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door)
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
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
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop) 
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(5000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)  
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)   
    Wait(1000)
    TriggerServerEvent('Polar-BobCat:Server:SynapseBobCat' .. name .. '', prop)    
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
RegisterNetEvent('Polar-BobCat:Client:Vault', function(open)
    if Config.BobCat then if oxd then  TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', vaultdoorname, false) else TriggerServerEvent('qb-doorlock:server:updateState', vaultdoorname, false, false, false, true, false, false)  return end end
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
                TriggerServerEvent('Polar-BobCat:Server:VaultClose')
                break
            end
    
            Wait(10)
        end
    end
end)







RegisterNetEvent('Polar-BobCat:Client:AddPickupTarget', function(door, door2, prop, var, pile) 
    if oxt then
        rod = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-BobCat:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
        if hi then print('grab id: ' .. rod .. ' propdoor: ' .. door .. ' proplabel: ' .. prop .. ' ispile: ') end
    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z  - 0.5, maxZ =  var.z + 0.5,}, 
        { options = {{ event = "Polar-BobCat:Client:PickupTarget", type = door, piles = pile, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 
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
        TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door)
        loadModel('hei_p_m_bag_var22_arm_s')
        local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
        TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
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
        TriggerServerEvent('Polar-BobCat:Server:Synapse' .. door .. '', sped)  
    else
        rottt = GetEntityRotation(props)
        if rottt == nil then  
            print('error')
        else
    TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
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
    TriggerServerEvent('Polar-BobCat:Server:Synapse' .. door .. '', sped)  
        end
    end
end 
RegisterNetEvent('Polar-BobCat:Client:AddTarget', function(door, door2, prop, var) 
    if oxt then 
        box = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-BobCat:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab" }, } })
        if hi then print('grab id: ' .. box .. ' propdoor: ' .. door .. ' proplabel: ' .. prop) end

    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
        { options = {{ event = "Polar-BobCat:Client:Target", type = door, canInteract = function() if door2 then return true end end, icon = "fas fa-bolt", label = "Grab", excludejob = 'police'}}, distance = 1.5 }) 
    end
end)

RegisterNetEvent('Polar-BobCat:Client:HackComputer', function(data)
    if playeritem(computeritem) then
        print('hi')
    local door = data.door
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door) 
    local chance=math.random(1,100) 

    local time = 60
    TriggerEvent(voltgame, time, function(result,reason)
    if result == 0 then --failed
        if chance < 50 then  TriggerServerEvent('Polar-BobCat:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 
    elseif result == 1 then --success
        if chance < 50 then  TriggerServerEvent('Polar-BobCat:Server:RemoveItem', computeritem, 1) end
        Wait(2000)
        TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door)
        TriggerServerEvent('Polar-BobCat:Server:RemoveItems', pcitem)
    elseif result == 2 then --time out
        if chance < 50 then  TriggerServerEvent('Polar-BobCat:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 
    elseif result == -1 then end
    end) 
    else notify(text('nopcitem'), "error") end
end)








RegisterNetEvent('Polar-BobCat:client:keycard', function(door, position, rot, item) TriggerServerEvent('Polar-BobCat:Server:StopInteract', door) 
    if playeritem(carditem) then
    TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) 
    local chance = math.random(1,100) local pos = GetEntityCoords(PlayerPedId()) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(PlayerPedId(), true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(PlayerPedId(), position.w) SetEntityCoords(PlayerPedId(), vector3(position.x, position.y,position.z-1)) if chance <= carditemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(PlayerPedId(), animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(PlayerPedId(), animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(PlayerPedId(), animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(PlayerPedId(), animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(PlayerPedId(), false) 
    if oxd then  TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', door, false)  else TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) end 
     notify(text('doorunlock'), "success", 2500)
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
            if chance <= vaultitemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', vaultitem, 1) end
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
            TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) 
        else
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true) 
            TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
        end
    end)
      --[[
        elseif door == fingerprintdoor then
     
            LocalPlayer.state:set('inv_busy', true, true) 
        TriggerEvent("".. fingerhack ..":Start", 4, 1, 1, function(outcome, reason) 
        if outcome == true then -- success
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', vaultitem, 1) end
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
            TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) 
        elseif outcome == false then -- fail
            local chance = math.random(1,100)
            if chance <= vaultitemchance then TriggerServerEvent('Polar-BobCat:Server:RemoveItem', vaultitem, 1) end
            Wait(4000)
            NetworkStartSynchronisedScene(netScene3)
            Wait(4500)
            NetworkStopSynchronisedScene(netScene3)
            DeleteObject(bag)
            SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
            LocalPlayer.state:set('inv_busy', false, true)
            TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 
        end end)
        end ]]
       
end
function hack(door)
    LocalPlayer.state:set('inv_busy', true, true) 
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
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
        TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
        LocalPlayer.state:set('inv_busy', false, true) 
    end)
    end
end

RegisterNetEvent('Polar-BobCat:client:DrillStart', function(drillpos, drillrot, door)
    if playeritem(drillitem) then
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
    drill(drillpos, drillrot, drillitem, door)
    else  notify(text('nodrill'), "error") end
end)

RegisterNetEvent('Polar-BobCat:Client:Drill', function(data)
    callback('Polar-BobCat:' .. data.door .. '', function(result) if result then 
    TriggerEvent('Polar-BobCat:client:DrillStart', data.coords, vector3(0.0, 0.0, data.head), data.door)
    else
        notify(text('sometingelse'), "error")
    end end)
end)

function vaultdone() TriggerServerEvent('Polar-BobCat:Server:Vault') end
RegisterNetEvent('Polar-BobCat:Client:VaultHack', function() 
    if playeritem(vaultitem) then
    callback('Polar-BobCat:VaultCheck', function(result) if result then 
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
        options = {{  name = BobCatstartname, icon = "fas fa-fire", label = "Thermite", event = 'Polar-BobCat:client:start' }, } })
        if hi then print(' startbox = ' .. box .. ' ') end
    else
    
    exports['qb-target']:AddBoxZone(BobCatstartname, Config.StartThirdEye, 1, 1, { name = BobCatstartname, heading = 0.0, debug = hi, minZ = Config.StartThirdEye.z-1, maxZ =  Config.StartThirdEye.z+1,}, 
    { options = {{ event = "Polar-BobCat:client:start", icon = "fas fa-fire", label = "Thermite", excludejob = 'police', item = thermiteitem}}, distance = 1.5 }) 

    end
end

RegisterNetEvent('Polar-BobCat:Client:StartLoot', function()

    TriggerServerEvent('Polar-BobCat:Server:SetupGrab1')

    TriggerServerEvent('Polar-BobCat:Server:SetupPickup1')

    TriggerServerEvent('Polar-BobCat:Server:SetupPile1')

    TriggerServerEvent('Polar-BobCat:Server:SetupTrolly1')


end)

RegisterNetEvent('Polar-BobCat:Client:StartTargets', function()
    other()
    if oxt then

        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = BobCatdoor1name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-BobCat:Client:Door1' }, } })
        if hi then print(' ' .. BobCatdoor1name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = BobCatdoor2name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-BobCat:Client:Door2' }, } })
        if hi then print(' ' .. BobCatdoor2name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = BobCatdoor3name, icon = "fas fa-fire", label = "Thermite", event = 'Polar-BobCat:Client:Door3' }, } })
        if hi then print(' ' .. BobCatdoor3name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = BobCatdoorcard1name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-BobCat:Client:doorcard1' }, } })
        if hi then print(' ' .. BobCatdoorcard1name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = BobCatdoorcard2name, icon = "fas fa-bolt", label = "Insert Card", event = 'Polar-BobCat:Client:doorcard2' }, } })
        if hi then print(' ' .. BobCatdoorcard2name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = Config.Pc1, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc1name, event = 'Polar-BobCat:Client:HackComputer' }, } })
        if hi then print(' ' .. Config.Pc1name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = Config.Pc2, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc2name, event = 'Polar-BobCat:Client:HackComputer' }, } })
        if hi then print(' ' .. Config.Pc2name .. box .. '') end
        box =  exports.ox_target:addBoxZone({ coords = Config.Pc3, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", door = Config.Pc3name, event = 'Polar-BobCat:Client:HackComputer' }, } })
        if hi then print(' ' .. Config.Pc3name .. box .. '') end
      
    else
    
   
    exports['qb-target']:AddBoxZone(BobCatdoor1name, vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), 1, 1, { name = BobCatdoor1name, heading = 0.0, debug = hi, minZ = Config.Door1Eye.z-1, maxZ =  Config.Door1Eye.z+1,}, 
    { options = {{ event = "Polar-BobCat:Client:Door1", icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 1.5 }) 
    exports['qb-target']:AddBoxZone(BobCatdoor2name, vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), 1, 1, { name = BobCatdoor2name, heading = 0.0, debug = hi, minZ = Config.Door2Eye.z-1, maxZ =  Config.Door2Eye.z+1,}, 
    { options = {{ event = "Polar-BobCat:Client:Door2", icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 1.5 }) 
    exports['qb-target']:AddBoxZone(BobCatdoor3name, vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), 1, 1, { name = BobCatdoor3name, heading = 0.0, debug = hi, minZ = Config.Door3Eye.z-1, maxZ =  Config.Door3Eye.z+1,}, 
    { options = {{ event = "Polar-BobCat:Client:Door3", icon = "fas fa-fire", label = "Thermite", excludejob = 'police'}}, distance = 1.5 }) 
    
    exports['qb-target']:AddBoxZone(BobCatdoorcard1name, vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), 1, 1, { name = BobCatdoorcard1name, heading = 0.0, debug = hi, minZ = Config.doorcard1Eye.z-1, maxZ =  Config.doorcard1Eye.z+1,}, 
    { options = {{ event = "Polar-BobCat:Client:doorcard1", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police'}}, distance = 1.5 }) 
    exports['qb-target']:AddBoxZone(BobCatdoorcard2name, vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), 1, 1, { name = BobCatdoorcard2name, heading = 0.0, debug = hi, minZ = Config.doorcard2Eye.z-1, maxZ =  Config.doorcard2Eye.z+1,}, 
    { options = {{ event = "Polar-BobCat:Client:doorcard2", icon = "fas fa-bolt", label = "Insert Card", excludejob = 'police'}}, distance = 1.5 }) 
   
    exports['qb-target']:AddBoxZone(Config.Pc1name, Config.Pc1, 2, 2, { name = Config.Pc1name, heading = 28.69, debug = hi, minZ = Config.Pc1-1, maxZ =  Config.Pc1+1,}, 
    { options = {{ event = "Polar-BobCat:Client:HackComputer", door = Config.Pc1name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police' }}, distance = 1.5 }) 
    exports['qb-target']:AddBoxZone(Config.Pc2name, Config.Pc2, 2, 2, { name = Config.Pc2name, heading = 28.69, debug = hi, minZ = Config.Pc2-1, maxZ =  Config.Pc2+1,}, 
    { options = {{ event = "Polar-BobCat:Client:HackComputer", door = Config.Pc2name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police'}}, distance = 1.5 }) 
    exports['qb-target']:AddBoxZone(Config.Pc3name, Config.Pc3, 2, 2, { name = Config.Pc3name, heading = 28.69, debug = hi, minZ = Config.Pc3-1, maxZ =  Config.Pc3+1,}, 
    { options = {{ event = "Polar-BobCat:Client:HackComputer", door = Config.Pc3name, icon = "fas fa-bolt", label = "Hack", excludejob = 'police'}}, distance = 1.5 }) 
    
    end

   

end)


--- Thermites
RegisterNetEvent('Polar-BobCat:Client:Door1', function() pp = vec4(Config.Door1Thermite.x, Config.Door1Thermite.y, Config.Door1Thermite.z + 0.2, Config.Door1Thermite.w) door = BobCatdoor1name coords =  Config.Door1Pfx callback('Polar-BobCat:Door1', function(result) if result then TriggerEvent('Polar-BobCat:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-BobCat:Client:Door2', function() pp = vec4(Config.Door2Thermite.x, Config.Door2Thermite.y, Config.Door2Thermite.z + 0.2, Config.Door2Thermite.w) door = BobCatdoor2name coords =  Config.Door2Pfx callback('Polar-BobCat:Door2', function(result) if result then TriggerEvent('Polar-BobCat:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
RegisterNetEvent('Polar-BobCat:Client:Door3', function() pp = vec4(Config.Door3Thermite.x, Config.Door3Thermite.y, Config.Door3Thermite.z + 0.2, Config.Door3Thermite.w) door = BobCatdoor3name coords =  Config.Door3Pfx callback('Polar-BobCat:Door3', function(result) if result then TriggerEvent('Polar-BobCat:client:Thermite', pp, door, coords) else  notify(text('sometingelse'), "error") end end) end)
----- CARD INSERT
RegisterNetEvent('Polar-BobCat:Client:doorcard1', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard1swipe door = BobCatdoorcard1name TriggerEvent('Polar-BobCat:client:keycard', door, position, rot, item) end)
RegisterNetEvent('Polar-BobCat:Client:doorcard2', function() item = carditem  rot = vector3(0.0, 0.0, 37.0) position = Config.doorcard2swipe door = BobCatdoorcard2name TriggerEvent('Polar-BobCat:client:keycard', door, position, rot, item) end)
























---- grabs 1-5 and 31-40


function resetstuff()
    for i = 1, 40 do
        if hi then print('setting to nil ' .. i .. ' / 40') end
        _G["BobCatprop" .. i] = nil
    end

end


local BobCatprop1 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop1', function(door, prop, var) loadModel(prop) BobCatprop1 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop1, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
 
end)

local BobCatprop2 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop2', function(door, prop, var) loadModel(prop) BobCatprop2 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop2, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
   
end)

local BobCatprop3 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop3', function(door, prop, var) loadModel(prop) BobCatprop3 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop3, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
 
end)

local BobCatprop4 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop4', function(door, prop, var) loadModel(prop) BobCatprop4 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop4, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)

local BobCatprop5 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop5', function(door, prop, var) loadModel(prop) BobCatprop5 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop5, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)


local BobCatprop31 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop31', function(door, prop, var) loadModel(prop) BobCatprop31 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop31, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
   
end)

local BobCatprop32 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop32', function(door, prop, var) loadModel(prop) BobCatprop32 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop32, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
 
end)

local BobCatprop33 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop33', function(door, prop, var) loadModel(prop) BobCatprop33 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop33, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)

local BobCatprop34 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop34', function(door, prop, var) loadModel(prop) BobCatprop34 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop34, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
 
end)

local BobCatprop35 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop35', function(door, prop, var) loadModel(prop) BobCatprop35 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop35, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)


local BobCatprop36 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop36', function(door, prop, var) loadModel(prop) BobCatprop36 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop36, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
 
end)

local BobCatprop37 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop37', function(door, prop, var) loadModel(prop) BobCatprop37 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop37, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)

local BobCatprop38 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop38', function(door, prop, var) loadModel(prop) BobCatprop38 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop38, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
 
end)

local BobCatprop39 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop39', function(door, prop, var) loadModel(prop) BobCatprop39 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop39, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop40 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop40', function(door, prop, var) loadModel(prop) BobCatprop40 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop40, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
   
end)












---- pickups 6-10 and 21 - 25

local BobCatprop6 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop6', function(door, prop, var) loadModel(prop) BobCatprop6 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop6, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)

local BobCatprop7 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop7', function(door, prop, var) loadModel(prop) BobCatprop7 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop7, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)
  
end)

local BobCatprop8 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop8', function(door, prop, var) loadModel(prop) BobCatprop8 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop8, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop9 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop9', function(door, prop, var) loadModel(prop) BobCatprop9 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop9, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop10 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop10', function(door, prop, var) loadModel(prop) BobCatprop10 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop10, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)


local BobCatprop21 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop21', function(door, prop, var) loadModel(prop) BobCatprop21 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop21, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 
 
end)

local BobCatprop22 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop22', function(door, prop, var) loadModel(prop) BobCatprop22 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop22, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop23 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop23', function(door, prop, var) loadModel(prop) BobCatprop23 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop23, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop24 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop24', function(door, prop, var) loadModel(prop) BobCatprop24 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop24, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop25 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop25', function(door, prop, var) loadModel(prop) BobCatprop25 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop25, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)











---- piles 11-15

local BobCatprop11 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop11', function(door, prop, var) loadModel(prop) BobCatprop11 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop11, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop12 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop12', function(door, prop, var) loadModel(prop) BobCatprop12 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop12, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop13 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop13', function(door, prop, var) loadModel(prop) BobCatprop13 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop13, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop14 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop14', function(door, prop, var) loadModel(prop) BobCatprop14 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop14, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)

local BobCatprop15 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop15', function(door, prop, var) loadModel(prop) BobCatprop15 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop15, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door) 

end)




---- trollys 16-20 and 26-30

local BobCatprop16 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop16', function(door, prop, var) loadModel(prop) prop16 = prop BobCatprop16 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop16, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop17 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop17', function(door, prop, var) loadModel(prop) prop17 = prop BobCatprop17 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop17, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop18 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop18', function(door, prop, var) loadModel(prop) prop18 = prop BobCatprop18 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop18, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop19 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop19', function(door, prop, var) loadModel(prop) prop19 = prop BobCatprop19 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop19, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop20 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop20', function(door, prop, var) loadModel(prop) prop20 = prop BobCatprop20 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop20, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)


local BobCatprop26 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop26', function(door, prop, var) loadModel(prop) prop26 = prop BobCatprop26 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop26, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop27 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop27', function(door, prop, var) loadModel(prop) prop27 = prop BobCatprop27 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop27, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop28 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop28', function(door, prop, var) loadModel(prop) prop28 = prop BobCatprop28 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop28, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop29 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop29', function(door, prop, var) loadModel(prop) prop29 = prop BobCatprop29 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop29, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)

local BobCatprop30 = nil
RegisterNetEvent('Polar-BobCat:Client:BobCatprop30', function(door, prop, var) loadModel(prop) prop30 = prop BobCatprop30 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(BobCatprop30, var.w) 
    TriggerServerEvent('Polar-BobCat:Server:StartInteract', door)

end)





RegisterNetEvent('Polar-BobCat:Client:TargetRemove', function(door) 

    if door == 'BobCatprop1' then DeleteEntity(BobCatprop1)end --  oxdoorname = BobCatprop1 end
    if door == 'BobCatprop2' then DeleteEntity(BobCatprop2)end --  oxdoorname = BobCatprop2 end
    if door == 'BobCatprop3' then DeleteEntity(BobCatprop3)end --  oxdoorname = BobCatprop3 end
    if door == 'BobCatprop4' then DeleteEntity(BobCatprop4)end --  oxdoorname = BobCatprop4 end
    if door == 'BobCatprop5' then DeleteEntity(BobCatprop5)end --  oxdoorname = BobCatprop5 end
    if door == 'BobCatprop6' then DeleteEntity(BobCatprop6)end 
    if door == 'BobCatprop7' then DeleteEntity(BobCatprop7)end 
    if door == 'BobCatprop8' then DeleteEntity(BobCatprop8)end 
    if door == 'BobCatprop9' then DeleteEntity(BobCatprop9)end 
    if door == 'BobCatprop10' then DeleteEntity(BobCatprop10)end 
   
   -- if door == 'BobCatprop11' then DeleteEntity(BobCatprop11) end
   -- if door == 'BobCatprop12' then DeleteEntity(BobCatprop12) end
  --  if door == 'BobCatprop13' then DeleteEntity(BobCatprop13) end
  --  if door == 'BobCatprop14' then DeleteEntity(BobCatprop14) end
  --  if door == 'BobCatprop15' then DeleteEntity(BobCatprop15) end

   -- if door == 'BobCatprop16' then DeleteEntity(BobCatprop16) end
  --  if door == 'BobCatprop17' then DeleteEntity(BobCatprop17) end
  --  if door == 'BobCatprop18' then DeleteEntity(BobCatprop18) end
  --  if door == 'BobCatprop19' then DeleteEntity(BobCatprop19) end
   -- if door == 'BobCatprop20' then DeleteEntity(BobCatprop20) end

    if door == 'BobCatprop21' then DeleteEntity(BobCatprop21)end --  oxdoorname = BobCatprop11 end
    if door == 'BobCatprop22' then DeleteEntity(BobCatprop22)end 
    if door == 'BobCatprop23' then DeleteEntity(BobCatprop23)end --  oxdoorname = BobCatprop13 end
    if door == 'BobCatprop24' then DeleteEntity(BobCatprop24)end --  oxdoorname = BobCatprop14 end
    if door == 'BobCatprop25' then DeleteEntity(BobCatprop25)end --  oxdoorname = BobCatprop15 end
  --  if door == 'BobCatprop26' then DeleteEntity(BobCatprop26) end
  --  if door == 'BobCatprop27' then DeleteEntity(BobCatprop27) end
  --  if door == 'BobCatprop28' then DeleteEntity(BobCatprop28) end
  --  if door == 'BobCatprop29' then DeleteEntity(BobCatprop29) end
  --  if door == 'BobCatprop30' then DeleteEntity(BobCatprop30) end

    if door == 'BobCatprop31' then DeleteEntity(BobCatprop31)end --  oxdoorname = BobCatprop31 end
    if door == 'BobCatprop32' then DeleteEntity(BobCatprop32)end --  oxdoorname = BobCatprop32 end
    if door == 'BobCatprop33' then DeleteEntity(BobCatprop33)end --  oxdoorname = BobCatprop33 end
    if door == 'BobCatprop34' then DeleteEntity(BobCatprop34)end --  oxdoorname = BobCatprop34 end
    if door == 'BobCatprop35' then DeleteEntity(BobCatprop35)end --  oxdoorname = BobCatprop35 end
    if door == 'BobCatprop36' then DeleteEntity(BobCatprop36)end --  oxdoorname = BobCatprop36 end
    if door == 'BobCatprop37' then DeleteEntity(BobCatprop37)end --  oxdoorname = BobCatprop37 end
    if door == 'BobCatprop38' then DeleteEntity(BobCatprop38)end --  oxdoorname = BobCatprop38 end
    if door == 'BobCatprop39' then DeleteEntity(BobCatprop39)end --  oxdoorname = BobCatprop39 end
    if door == 'BobCatprop40' then DeleteEntity(BobCatprop40)end --  oxdoorname = BobCatprop40 end

    if oxt then
        if door == BobCatdoor1name then oxdoorname = 2 end
        if door == BobCatdoor2name then oxdoorname = 3 end
        if door == BobCatdoor3name then oxdoorname = 4 end
        if door == BobCatdoorcard1name then oxdoorname = 5 end
        if door == BobCatdoorcard2name then oxdoorname = 6 end
        if door == Config.Pc1name then oxdoorname = 7 end
        if door == Config.Pc2name then oxdoorname = 8 end
        if door == Config.Pc3name then oxdoorname = 9 end
        -- pickups
        if door == 'BobCatprop6' then  oxdoorname = 20 end 
        if door == 'BobCatprop7' then  oxdoorname = 21 end 
        if door == 'BobCatprop8' then  oxdoorname = 22 end 
        if door == 'BobCatprop9' then  oxdoorname = 23 end 
        if door == 'BobCatprop10' then oxdoorname = 24 end
        if door == 'BobCatprop21' then oxdoorname = 25 end 
        if door == 'BobCatprop22' then oxdoorname = 26 end 
        -- piles
        if door == 'BobCatprop11' then oxdoorname = 27 end
        if door == 'BobCatprop12' then oxdoorname = 28 end
        -- grabs
        if door == 'BobCatprop1' then  oxdoorname = 10 end 
        if door == 'BobCatprop2' then  oxdoorname = 11 end 
        if door == 'BobCatprop3' then  oxdoorname = 12 end 
        if door == 'BobCatprop4' then  oxdoorname = 13 end 
        if door == 'BobCatprop5' then oxdoorname = 14 end
        if door == 'BobCatprop31' then  oxdoorname = 15 end 
        if door == 'BobCatprop32' then  oxdoorname = 16 end 
        if door == 'BobCatprop33' then  oxdoorname = 17 end 
        if door == 'BobCatprop34' then  oxdoorname = 18 end 
        if door == 'BobCatprop35' then oxdoorname = 19 end
        -- trollys
        if door == 'BobCatprop16' then oxdoorname = 29 end 
        if door == 'BobCatprop17' then oxdoorname = 30 end 
        if door == 'BobCatprop18' then oxdoorname = 31 end
        if door == 'BobCatprop19' then oxdoorname = 32 end
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


RegisterNetEvent('Polar-BobCat:Client:Target', function(data) 
    model = 'hei_p_m_bag_var22_arm_s' animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
    local p = data.type 
    TriggerServerEvent('Polar-BobCat:Server:StopInteract', p)
    if p == 'BobCatprop1' then     Animation(p, BobCatprop1, model, animDict, prop)  
    elseif p == 'BobCatprop2' then   Animation(p, BobCatprop2, model, animDict, prop) 
    elseif p == 'BobCatprop3' then   Animation(p, BobCatprop3, model, animDict, prop)  
    elseif p == 'BobCatprop4' then   Animation(p, BobCatprop4, model, animDict, prop)  
    elseif p == 'BobCatprop5' then   Animation(p, BobCatprop5, model, animDict, prop)  
    elseif p == 'BobCatprop31' then   Animation(p, BobCatprop31, model, animDict, prop) 
    elseif p == 'BobCatprop32' then   Animation(p, BobCatprop32, model, animDict, prop)   
    elseif p == 'BobCatprop33' then   Animation(p, BobCatprop33, model, animDict, prop) 
    elseif p == 'BobCatprop34' then   Animation(p, BobCatprop34, model, animDict, prop) 
    elseif p == 'BobCatprop35' then   Animation(p, BobCatprop35, model, animDict, prop)   
    elseif p == 'BobCatprop36' then   Animation(p, BobCatprop36, model, animDict, prop)      
    elseif p == 'BobCatprop37' then   Animation(p, BobCatprop37, model, animDict, prop)   
    elseif p == 'BobCatprop38' then   Animation(p, BobCatprop38, model, animDict, prop)   
    elseif p == 'BobCatprop39' then   Animation(p, BobCatprop39, model, animDict, prop) 
    elseif p == 'BobCatprop40' then   Animation(p, BobCatprop40, model, animDict, prop)   
  
  --  elseif p == 'specialgrab' then  Animation('specialgrab', specialgrabprop, model, animDict, prop)

    elseif p == 'BobCatprop16' then   grabloot(p, BobCatprop16, prop16, prop, 'prop16')      
    elseif p == 'BobCatprop17' then   grabloot(p, BobCatprop17, prop17, prop, 'prop17')  
    elseif p == 'BobCatprop18' then   grabloot(p, BobCatprop18, prop18, prop, 'prop18')   
    elseif p == 'BobCatprop19' then   grabloot(p, BobCatprop19, prop19, prop, 'prop19') 
    elseif p == 'BobCatprop20' then   grabloot(p, BobCatprop20, prop20, prop, 'prop20')     
    elseif p == 'BobCatprop26' then   grabloot(p, BobCatprop26, prop26, prop, 'prop26')    
    elseif p == 'BobCatprop27' then   grabloot(p, BobCatprop27, prop27, prop, 'prop27')   
    elseif p == 'BobCatprop28' then   grabloot(p, BobCatprop28, prop28, prop, 'prop28') 
    elseif p == 'BobCatprop29' then   grabloot(p, BobCatprop29, prop29, prop, 'prop29')  
    elseif p == 'BobCatprop30' then   grabloot(p, BobCatprop30, prop30, prop, 'prop30') 
 
    end
end)


RegisterNetEvent('Polar-BobCat:Client:ResetProps', function()
    TriggerServerEvent('Polar-BobCat:Server:UpdateInterior', false)
    if DoesEntityExist(BobCatprop1) then DeleteEntity(BobCatprop1) targetname = 'BobCatprop1' end
    if DoesEntityExist(BobCatprop2) then DeleteEntity(BobCatprop2) targetname = 'BobCatprop2' end
    if DoesEntityExist(BobCatprop3) then DeleteEntity(BobCatprop3) targetname = 'BobCatprop3' end
    if DoesEntityExist(BobCatprop4) then DeleteEntity(BobCatprop4) targetname = 'BobCatprop4' end
    if DoesEntityExist(BobCatprop5) then DeleteEntity(BobCatprop5) targetname = 'BobCatprop5' end
    if DoesEntityExist(BobCatprop6) then DeleteEntity(BobCatprop6) targetname = 'BobCatprop6' end
    if DoesEntityExist(BobCatprop7) then DeleteEntity(BobCatprop7) targetname = 'BobCatprop7' end
    if DoesEntityExist(BobCatprop8) then DeleteEntity(BobCatprop8) targetname = 'BobCatprop8' end
    if DoesEntityExist(BobCatprop9) then DeleteEntity(BobCatprop9) targetname = 'BobCatprop9' end
    if DoesEntityExist(BobCatprop10) then DeleteEntity(BobCatprop10) targetname = 'BobCatprop10' end
    if DoesEntityExist(BobCatprop11) then DeleteEntity(BobCatprop11) targetname = 'BobCatprop11' end
    if DoesEntityExist(BobCatprop12) then DeleteEntity(BobCatprop12) targetname = 'BobCatprop12' end
    if DoesEntityExist(BobCatprop13) then DeleteEntity(BobCatprop13) targetname = 'BobCatprop13' end
    if DoesEntityExist(BobCatprop14) then DeleteEntity(BobCatprop14) targetname = 'BobCatprop14' end
    if DoesEntityExist(BobCatprop15) then DeleteEntity(BobCatprop15) targetname = 'BobCatprop15' end
    if DoesEntityExist(BobCatprop16) then DeleteEntity(BobCatprop16) targetname = 'BobCatprop16' end
    if DoesEntityExist(BobCatprop17) then DeleteEntity(BobCatprop17) targetname = 'BobCatprop17' end
    if DoesEntityExist(BobCatprop18) then DeleteEntity(BobCatprop18) targetname = 'BobCatprop18' end
    if DoesEntityExist(BobCatprop19) then DeleteEntity(BobCatprop19) targetname = 'BobCatprop19' end
    if DoesEntityExist(BobCatprop20) then DeleteEntity(BobCatprop20) targetname = 'BobCatprop20' end
    if DoesEntityExist(BobCatprop21) then DeleteEntity(BobCatprop21) targetname = 'BobCatprop21' end
    if DoesEntityExist(BobCatprop22) then DeleteEntity(BobCatprop22) targetname = 'BobCatprop22' end
    if DoesEntityExist(BobCatprop23) then DeleteEntity(BobCatprop23) targetname = 'BobCatprop23' end
    if DoesEntityExist(BobCatprop24) then DeleteEntity(BobCatprop24) targetname = 'BobCatprop24' end
    if DoesEntityExist(BobCatprop25) then DeleteEntity(BobCatprop25) targetname = 'BobCatprop25' end
    if DoesEntityExist(BobCatprop26) then DeleteEntity(BobCatprop26) targetname = 'BobCatprop26' end
    if DoesEntityExist(BobCatprop27) then DeleteEntity(BobCatprop27) targetname = 'BobCatprop27' end
    if DoesEntityExist(BobCatprop28) then DeleteEntity(BobCatprop28) targetname = 'BobCatprop28' end
    if DoesEntityExist(BobCatprop29) then DeleteEntity(BobCatprop29) targetname = 'BobCatprop29' end
    if DoesEntityExist(BobCatprop30) then DeleteEntity(BobCatprop30) targetname = 'BobCatprop30' end
    if DoesEntityExist(BobCatprop31) then DeleteEntity(BobCatprop31) targetname = 'BobCatprop31' end
    if DoesEntityExist(BobCatprop32) then DeleteEntity(BobCatprop32) targetname = 'BobCatprop32' end
    if DoesEntityExist(BobCatprop33) then DeleteEntity(BobCatprop33) targetname = 'BobCatprop33' end
    if DoesEntityExist(BobCatprop34) then DeleteEntity(BobCatprop34) targetname = 'BobCatprop34' end
    if DoesEntityExist(BobCatprop35) then DeleteEntity(BobCatprop35) targetname = 'BobCatprop35' end
    if DoesEntityExist(BobCatprop36) then DeleteEntity(BobCatprop36) targetname = 'BobCatprop36' end
    if DoesEntityExist(BobCatprop37) then DeleteEntity(BobCatprop37) targetname = 'BobCatprop37' end
    if DoesEntityExist(BobCatprop38) then DeleteEntity(BobCatprop38) targetname = 'BobCatprop38' end
    if DoesEntityExist(BobCatprop39) then DeleteEntity(BobCatprop39) targetname = 'BobCatprop39' end
    if DoesEntityExist(BobCatprop40) then DeleteEntity(BobCatprop40) targetname = 'BobCatprop40' end
    if targetname == nil then return end
    if oxt then
        exports.ox_target:removeZone(targetname)
    else
        exports['qb-target']:RemoveZone(targetname)
    end

end)


RegisterNetEvent('Polar-BobCat:Client:PickupTarget', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    animDict = 'random@domestic'
    local pile = data.piles
    local door = data.type
    local numba = data.number
    if pile then  
        TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) 
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
        if door == 'BobCatprop11' then DeleteEntity(BobCatprop11) end
        if door == 'BobCatprop12' then DeleteEntity(BobCatprop12) end
        if door == 'BobCatprop13' then DeleteEntity(BobCatprop13) end
        if door == 'BobCatprop14' then DeleteEntity(BobCatprop14) end
        if door == 'BobCatprop15' then DeleteEntity(BobCatprop15) end
    else
        loadAnimDict(animDict) TaskPlayAnim(PlayerPedId(), animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
    end
        TriggerServerEvent('Polar-BobCat:Server:Synapse'.. door ..'', prop)
        TriggerServerEvent('Polar-BobCat:Server:StopInteract', door)
        LocalPlayer.state:set('inv_busy', false, true)
        TriggerServerEvent('Polar-BobCat:Server:TargetRemove', door) 
end)



RegisterNetEvent('Polar-BobCat:Client:ResetDoors', function()
    if oxd then
        TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', BobCatdoor1name, true)
        TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', BobCatdoor2name, true)
        TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', BobCatdoor2name, true)
        TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', BobCatdoorcard1name, true)
        TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', BobCatdoorcard2name, true)
        TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', Config.VaultDoorDoor, true)
       
    else
    TriggerServerEvent('qb-doorlock:server:updateState', BobCatdoor1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', BobCatdoor2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', BobCatdoor3name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', BobCatdoorcard1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', BobCatdoorcard2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Config.VaultDoorDoor, true, false, false, true, false, false)

    end
    TriggerServerEvent('Polar-BobCat:Slient:TargetRemove', vaultdoorname)
 --   doorlock(BobCatdoor1name, true)
  --  doorlock(BobCatdoor2name, true)
  --  doorlock(BobCatdoor3name, true)
  --  doorlock(BobCatdoorcard1name, true)
  --  doorlock(BobCatdoorcard2name, true)
 --   doorlock(Config.VaultDoorDoor, true)
    resetpeds()
end)

function doorlock(name, what)
    print(' and the name is ' .. name .. ' john the rock ' .. what .. ' cena')
    if oxd then  TriggerServerEvent('Polar-BobCat:Server:OxDoorlock', name, what)
    else 
    TriggerServerEvent('qb-doorlock', name, what, false, false, true, false, false)
    end
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
local cop1 = nil
local cop2 = nil


function makeped(model, weapon, loc, start)
    if start then
    RequestModel(model) while not HasModelLoaded(model) do Wait(0) end
    cop1 = CreatePed(4, model, vector3(907.35, -2122.66, 31.23), 0, true, true)
    GiveWeaponToPed(cop1, weapon, Config.AmmoCount, 0, 1)
    SetPedCombatAttributes(cop1, 46, true)
    SetPedCombatAttributes(cop1, 5, true)
    SetPedCombatAbility(cop1, 100)
    SetPedCombatMovement(cop1, 1)
    SetPedAsEnemy(cop1, true)
    SetEntityHealth(cop1, Config.Health) -- health
    SetPedAccuracy(cop1, Config.Accuracy) -- accuracy
    SetPedCombatRange(cop1, Config.Range) -- range
   -- TaskCombatPed(cop1, PlayerPedId(), 0, 16)
    SetPedRelationshipGroupDefaultHash(cop1, "npcguards")
    SetPedRelationshipGroupHash(cop1, "npcguards")
    SetCanAttackFriendly(cop1, true, true)
    SetEntityHeading(cop1, 270.0)

    cop2 = CreatePed(4, model, vector3(908.11, -2115.26, 31.23), 0, true, true)
    GiveWeaponToPed(cop2, weapon, Config.AmmoCount, 0, 1)
    SetPedCombatAttributes(cop2, 46, true)
    SetPedCombatAttributes(cop2, 5, true)
    SetPedCombatAbility(cop2, 100)
    SetPedCombatMovement(cop2, 1)
    SetPedAsEnemy(cop2, true)
    SetEntityHealth(cop2, Config.Health) -- health
    SetPedAccuracy(cop2, Config.Accuracy) -- accuracy
    SetPedCombatRange(cop2, Config.Range) -- range
   -- TaskCombatPed(cop1, PlayerPedId(), 0, 16)
    SetPedRelationshipGroupDefaultHash(cop2, "npcguards")
    SetPedRelationshipGroupHash(cop2, "npcguards")
    SetCanAttackFriendly(cop2, true, true)
    SetEntityHeading(cop2, 250.0)

    else

    TaskCombatPed(cop1, PlayerPedId(), 0, 16)
    TaskCombatPed(cop2, PlayerPedId(), 0, 16)

    RequestModel(model) while not HasModelLoaded(model) do Wait(0) end
    enemy = CreatePed(4, model, loc, 0, true, true)
    GiveWeaponToPed(enemy, weapon, Config.AmmoCount, 0, 1)
    SetPedCombatAttributes(enemy, 46, true)
    SetPedCombatAttributes(enemy, 5, true)
    SetPedCombatAbility(enemy, 100)
    SetPedCombatMovement(enemy, 1)
    SetPedAsEnemy(enemy, true)
    SetEntityHealth(enemy, Config.Health) -- health
    SetPedAccuracy(enemy, Config.Accuracy) -- accuracy
    SetPedCombatRange(enemy, Config.Range) -- range
    SetPedRelationshipGroupDefaultHash(enemy, "npcguards")
    SetPedRelationshipGroupHash(enemy, "npcguards")
    SetCanAttackFriendly(enemy, true, true)
    TaskCombatPed(enemy, PlayerPedId(), 0, 16)
    SetEntityHeading(cop2, loc.w)

    end
end


RegisterNetEvent('Polar-BobCat:Client:PlantBomb', function() TriggerServerEvent('Polar-BobCat:Server:StopInteract', door) 
    callback('Polar-BobCat:VaultCheck', function(result) if result then 
    if playeritem(bombitem) then
        TriggerServerEvent('Polar-BobCat:Server:StopInteract', vaultdoorname)
        plantbomb()
    else  notify(text('nobomb'), "error") end
    else  notify(text('sometingelse'), "error") end end) 
end)
function plantbomb()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel("ch_p_m_bag_var02_arm_s") RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    SetEntityHeading(PlayerPedId(), 358.47)
    local pos = vector3(887.89, -2130.52, 31.23)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("ch_p_m_bag_var02_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)
    LocalPlayer.state:set('inv_busy', true, true)
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local thermite = CreateObject(GetHashKey("ch_prop_ch_explosive_01a"), x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(thermite, false, true)
    AttachEntityToEntity(thermite, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    TriggerServerEvent('Polar-BobCat:Server:RemoveItem', bombitem, 1)
    Wait(5000)
    DetachEntity(thermite, 1, 1)
    FreezeEntityPosition(thermite, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(bagscene)
    exports[thermiteexport]:Thermite(function(success)
    if success then 
        TriggerServerEvent('Polar-BobCat:Server:TargetRemove', vaultdoorname) 
        LocalPlayer.state:set('inv_busy', false, true)
        notify("Bomb will explode in 30 seconds", "error")
        Wait(30000)
        AddExplosion(888.3242, -2130.5498, 31.2301, 82, 2.5, true, false, 1.0, true)
        DeleteObject(thermite)
        Wait(50)
        TriggerServerEvent('Polar-BobCat:Server:UpdateInterior', true)
    else 
        LocalPlayer.state:set('inv_busy', false, true)
        AddExplosion(888.3242, -2130.5498, 31.2301, 82, 2.5, true, false, 1.0, true)
        DeleteObject(thermite)
        Wait(50)
        TriggerServerEvent('Polar-BobCat:Server:UpdateInterior', true)
    end end, thermiteinfo.time, thermiteinfo.squares, thermiteinfo.errors) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBloc

    
   
  --  LocalPlayer.state:set('inv_busy', false, true)
   
end

RegisterNetEvent('Polar-BobCat:Client:UpdateInterior', function(what)
    if what then
        CreateModelSwap(888.12, -2129.87, 29.23, 7.5, GetHashKey("des_vaultdoor001_start"),
        GetHashKey("des_vaultdoor001_end"), 1)
    else
        CreateModelSwap(888.12, -2129.87, 29.23, 7.5, GetHashKey("des_vaultdoor001_end"),
        GetHashKey("des_vaultdoor001_start"), 1)
    end
end)

function resetpeds()
   

    makeped("s_m_m_prisguard_01", "weapon_pistol", vector3(908.11, -2115.26, 31.23), true) -- front


end
function peds()

    makeped("s_m_m_prisguard_01", "weapon_smg", vector4(881.37, -2129.78, 31.23, 20.0))
    Wait(150)
    makeped("s_m_m_prisguard_01", "weapon_smg", vector4(885.77, -2119.7, 31.23, 20.0))
    Wait(150)
    makeped('s_m_m_prisguard_01', 'weapon_smg', vector4(888.92, -2124.51, 31.23, 20.0))
    Wait(150)
    makeped("s_m_m_prisguard_01", "weapon_mg", vector4(889.66, -2128.86, 31.23, 20.0))
    Wait(150)
    makeped("s_m_m_prisguard_01", "weapon_combatmg", vector4(893.7, -2131.92, 31.23, 20.0))
    Wait(150)
    makeped("s_m_m_prisguard_01", "weapon_pumpshotgun", vector4(898.78, -2123.36, 31.23, 20.0))
    Wait(150)
   

    SetRelationshipBetweenGroups(0, 'npcguards', 'npcguards')
    SetRelationshipBetweenGroups(5, 'npcguards', 'PLAYER')
    SetRelationshipBetweenGroups(5, 'PLAYER', 'npcguards')
end
if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end
local amount = nil




--============== CONFIG ====================================================================================================================================================



local knifeitem = 'weapon_switchblade' -- item for paintings

local thermiteitem = "thermite" -- item for doors

local computeritem = 'hacking_device' -- item to hack computers
local pcitem = 'btc' -- comes from pc completion

local vaultitem = 'laptop_red' -- item for vault
local vaultitemchance = 50 -- chance for item to be removed

local laserdrillitem = 'drill' -- laser drill to cutout glass
local yellowdrillitem = 'drill' -- item for deposit boxes (2 sections, yellow drill)
local ydrillitemchance = 50 -- chance for yellow drill to break
local drillitem = 'drill' -- item for deposit boxes (regular)
local drillitemchance = 50 -- chance for item to break

local carditem = 'keycard' -- item for keycard rooms
local carditemchance = 50 -- chance for item to be removed



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


--==================================================================================================================================================================


local spam = Config.TrollySpam


local trollytable = {
    'Pacificprop16',
    'Pacificprop17',
    'Pacificprop18', 
    'Pacificprop19', 
    'Pacificprop20',
    'Pacificprop26', 
    'Pacificprop27', 
    'Pacificprop28', 
    'Pacificprop29', 
    'Pacificprop30',
}




local disabled = true






local gabz = Config.Gabz

local bagcolor = Config.Bag

local oxt = Config.OxTarget -- ox target
local oxdoorname = nil
local oxd = Config.OxDoorlock

local ped = PlayerPedId()
local animDict = nil local model = nil local prop = nil local var = nil local drillpos = nil local drillrot = nil local door = nil local pp = nil local coords = nil local rot = nil local position = nil local item = nil 


local doors = {}
local trollys = {}
local targets = {}
local caseitem = {}
local itemstand = {}
local displaycase = {}

local specialgrab = 'Pacificgrab'
local vaultdoorname = Config.VaultDoorName
local vaultanimloc = Config.VaultDoorThirdEye
local fingerprintdoor = Config.FingerDoorName

-- vault stuff
local vaultid = 961976194
local open = -3.1
local closed = 158.92
local vaultloc = vector3(255.23, 223.98, 102.39)

local hi = Config.Debug


local proptable = {
    'Pacificprop1', 'Pacificprop2', 'Pacificprop3', 'Pacificprop4', 'Pacificprop5', 'Pacificprop6', 'Pacificprop7', 'Pacificprop8', 'Pacificprop9', 'Pacificprop10', 'Pacificprop11', 'Pacificprop12','Pacificprop13', 'Pacificprop14', 'Pacificprop15',
    'Pacificprop16', 'Pacificprop17',  'Pacificprop18', 'Pacificprop19', 'Pacificprop20', 'Pacificprop21', 'Pacificprop22', 'Pacificprop23', 'Pacificprop24', 'Pacificprop25', 'Pacificprop26','Pacificprop27', 'Pacificprop28', 'Pacificprop29',
    'Pacificprop30', 'Pacificprop31', 'Pacificprop32', 'Pacificprop33', 'Pacificprop34', 'Pacificprop35', 'Pacificprop36', 'Pacificprop37', 'Pacificprop38', 'Pacificprop39', 'Pacificprop40', 'Pacificprop41',
    'Pacificprop42', 'Pacificprop43', 'Pacificprop44', 'Pacificprop45', 'Pacificprop46', 'Pacificprop47', 'Pacificprop48', 'Pacificprop49', 'Pacificprop50',
}



local startdoorname = Config.StartDoor
local door1name = Config.Door1
local door2name = Config.Door2
local door3name = Config.Door3
local doorcard1name = Config.doorcard1
local doorcard2name = Config.doorcard2


local doortable = {
    
    door1name,
    door2name,
    door3name,
    doorcard1name,
    doorcard2name,
    Config.Pc1name,
    Config.Pc2name,
    Config.Pc3name,
    Config.LazerName,
    Config.VaultDoorName,
    Config.FingerDoorName,

}

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  TriggerServerEvent('Polar-Pacific:Server:Restart')  TriggerEvent('Polar-Pacific:Client:ResetProps') TriggerEvent('Polar-Pacific:Client:ResetDoors') TriggerEvent('Polar-Pacific:Client:ResetPropsKeypads') resetstuff() LocalPlayer.state:set('inv_busy', false, true) end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if hi then print('Starting Targets')  end starttarget() blip()  end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if hi then print('Player Loaded Targets Starting') end starttarget() blip()  end)

RegisterNetEvent("Polar-Pacific:Client:ThermitePtfx", function(coords) if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then  RequestNamedPtfxAsset("scr_ornate_heist") end while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end SetPtfxAssetNextCall("scr_ornate_heist") local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)  Wait(thermitetime) StopParticleFxLooped(effect, 0) end)

local callback = Config.TrigCallBack -- QBCore.Functions.TriggerCallback ESX.TriggerServerCallback

RegisterNetEvent('Polar-Pacific:client:start', function()  pp = Config.StartThermite door = startdoorname coords = Config.StartPfx
    QBCore.Functions.TriggerCallback('Polar-Callbacks:Server:GetCops', function(result)
    if result >= Config.RequiredCops then
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
    if door == 'Pacificstart' then if Config.LazerPolice then if Config.Debug then print('Lazer Police Call') else CallPolice() end end end
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(50) end Wait(1500)
    TriggerServerEvent("Polar-Pacific:Server:ThermitePtfx", vec3(coords.x, coords.y, coords.z+0.2)) Wait(500) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0) TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0) TriggerEvent('Polar-Pacific:Server:DestroyPad', door) Wait(thermitetime) ClearPedTasks(PlayerPedId())  if oxd then  doorlock(door, false)
    else TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) end
 end 
function PlantThermite(pp, door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door) TriggerServerEvent('Polar-Pacific:Server:RemoveItem', thermiteitem, 1) RequestAnimDict("anim@heists@ornate_bank@thermal_charge") RequestModel(bagcolor)
    RequestNamedPtfxAsset("scr_ornate_heist") while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") or not HasModelLoaded(bagcolor) or not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(50) end
    local pos = pp SetEntityHeading(PlayerPedId(), pos.w) Wait(100) local rotx, roty, rotz = table.unpack(vector3(GetEntityRotation(PlayerPedId()))) local netscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3) local bag = CreateObject(bagcolor, pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true) local x, y, z = table.unpack(GetEntityCoords(PlayerPedId())) local thermite = CreateObject('hei_prop_heist_thermite', x, y, z + 0.2,  true,  true, true) SetEntityCollision(thermite, false, true) AttachEntityToEntity(thermite, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true) NetworkAddPedToSynchronisedScene(PlayerPedId(), netscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)  SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1) NetworkStartSynchronisedScene(netscene) Wait(5000) DetachEntity(thermite, 1, 1) FreezeEntityPosition(thermite, true) DeleteObject(bag)  SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 1, 1) NetworkStopSynchronisedScene(netscene) CreateThread(function() Wait(15000) DeleteEntity(thermite) end)
end
function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end
function drill(drillpos, drillrot, door) local pedCo = GetEntityCoords(PlayerPedId()) LocalPlayer.state:set('inv_busy', true, true) local coords, pedRotation = GetEntityCoords(PlayerPedId()), GetEntityRotation(PlayerPedId()) local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@' loadAnimDict(animDict) local bagModel = bagcolor loadModel(bagModel) local laserDrillModel = 'hei_prop_heist_drill' loadModel(laserDrillModel) RequestAmbientAudioBank('DLC_HEIST_FLEECA_SOUNDSET', 0) RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL', 0) 
    RequestAmbientAudioBank('DLC_MPHEIST\\HEIST_FLEECA_DRILL_2', 0) 
    soundId = GetSoundId()
    cam = CreateCam('DEFAULT_ANIMATED_CAMERA', true) SetCamActive(cam, true) RenderScriptCams(true, 0, 3000, 1, 0) bag = CreateObject(GetHashKey(bagModel), coords, 1, 0, 0) laserDrill = CreateObject(GetHashKey(laserDrillModel), coords, 1, 0, 0)
    scene1 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'intro', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene1, animDict, 'intro_drill_bit', 1.0, -1.0, 1148846080) scene2 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'drill_straight_start', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_drill_straight_start', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene2, animDict, 'drill_straight_start_drill_bit', 1.0, -1.0, 1148846080) scene3 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'drill_straight_end_idle', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_drill_straight_end_idle', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene3, animDict, 'drill_straight_end_idle_drill_bit', 1.0, -1.0, 1148846080) scene4 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene4, animDict, 'drill_straight_fail', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene4, animDict, 'bag_drill_straight_fail', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene4, animDict, 'drill_straight_fail_drill_bit', 1.0, -1.0, 1148846080) scene5 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene5, animDict, 'drill_straight_end', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene5, animDict, 'bag_drill_straight_end', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene5, animDict, 'drill_straight_end_drill_bit', 1.0, -1.0, 1148846080) scene6 = NetworkCreateSynchronisedScene(drillpos, drillrot, 2, true, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(PlayerPedId(), scene6, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene6, animDict, 'bag_exit', 1.0, -1.0, 1148846080) NetworkAddEntityToSynchronisedScene(laserDrill, scene6, animDict, 'exit_drill_bit', 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene1) PlayCamAnim(cam, 'intro_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'intro') * 1000) NetworkStartSynchronisedScene(scene2) PlayCamAnim(cam, 'drill_straight_start_cam', animDict, drillpos, drillrot, 0, 2) NetworkStartSynchronisedScene(scene3) PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, drillpos, drillrot, 0, 2) PlaySoundFromEntity(soundId, 'Drill', laserDrill, 'DLC_HEIST_FLEECA_SOUNDSET', 1, 0)
    TriggerEvent('Drilling:Start',function(success) if success then                             
    StopSound(soundId) NetworkStartSynchronisedScene(scene5) PlayCamAnim(cam, 'drill_straight_end_cam', animDict, drillpos, drillrot, 0, 2)
    Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000) NetworkStartSynchronisedScene(scene6) PlayCamAnim(cam, 'exit_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'exit') * 1000)
    RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId()) DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) RemoveAnimDict(animDict)
    TriggerServerEvent('Polar-Pacific:Drill', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    
    local chance = math.random(1,100) if chance <= drillitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', drillitem, 1) end
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
    else
        StopSound(soundId) NetworkStartSynchronisedScene(scene4) PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, drillpos, drillrot, 0, 2) Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
        RenderScriptCams(false, false, 0, 1, 0) DestroyCam(cam, false) ClearPedTasks(PlayerPedId())  DeleteObject(bag) DeleteObject(laserDrill) LocalPlayer.state:set('inv_busy', false, true) RemoveAnimDict(animDict)
        SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
        TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
        local chance = math.random(1,100) if chance <= drillitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', drillitem, 1) end
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




function CreateTarget(names, coords1, handler, labels, icons, his)
    if oxt then
        targets[names] = exports.ox_target:addBoxZone({ coords = coords1, size = vec3(1, 1, 1), rotation = 1, debug = his,
        options = {{  event = handler,  icon = icons, label = labels, id = names, canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
    else
        exports['qb-target']:AddBoxZone(names,  coords1, 0.5, 0.5, { name =  names, heading = 28.69, debug = his, minZ = coords1.z-0.5, maxZ =  coords1.z+0.5,}, 
        { options = {{ event = handler, icon = icons, label = labels, id = names }}, distance = 1 }) 
    end
    --print(names .. ' is ' .. json.encode(targets[names]))
    
end

local Pacificdrill1loc = nil local Pacificdrill1name = nil local Pacificdrill2loc = nil local Pacificdrill2name = nil
function other()
    CreateTarget(vaultdoorname, vaultanimloc, "Polar-Pacific:Client:VaultHack", "Hack", "fas fa-bolt", Config.Debug)
    CreateTarget(fingerprintdoor, Config.FingerEye, "Polar-Pacific:Client:VaultHack", "Hack", "fas fa-bolt", Config.Debug)


    drill1()
   
end 


function drill1()
    local k = 0 local p = 0 local distance1 = 0.22 local distance2 = 0.22 local space1 = nil local space2 = nil local chance = math.random(1,100)  if chance<=15 then   space2 = k+distance1  space1 = k-distance2  elseif chance<=30 then   space2 = k-distance2  space1 = k+distance1  elseif chance<=45 then   space2 = k  space1 = k+distance1   elseif chance<=60 then   space1 = k space2 = k+distance2 elseif chance<=75 then   space2 = k-distance2 space1 = k elseif chance<=90 then   space1 = k-distance1 space2 = k elseif chance<=100 then   space2 = k  space1 = k end 
  
    if gabz then
        

    else
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
end


function adddrillspot(loc, name)
    if oxt then
        targets[name] = exports.ox_target:addBoxZone({ coords = vector3(loc.x, loc.y, loc.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox" }, } })
    else
        exports['qb-target']:AddBoxZone(name,  vector3(loc.x, loc.y, loc.z), 1.25, 1.25, { name = name, heading = loc.w, debug = hi, minZ = loc.z-1, maxZ =  loc.z+1,}, 
        { options = {{ event = "Polar-Pacific:Client:Drill", door = name, head = loc.w, coords = vec3(loc.x, loc.y, loc.z), icon = "fas fa-bolt", label = "Drill Lockbox"}}, distance = 1 }) 
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
    AttachEntityToEntity(grabobj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
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

function grabloot(door, object)
    local grabModel = nil
    local object2 = object
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
    local prop = trollys[door]
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
    loadModel(bagcolor)
    local bag = CreateObject(GetHashKey(bagcolor), pedCoords, true, false, false)
    local scene1 = NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'intro', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene1, animDict, 'bag_intro', 4.0, -8.0, 1)
    local scene2 =  NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'bag_grab', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(object2, scene2, animDict, 'cart_cash_dissapear', 4.0, -8.0, 1)
    local scene3 =  NetworkCreateSynchronisedScene(prop2, rot, 2, true, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'bag_exit', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene1)
    Wait(1750)
    CashAppear(grabModel)
    NetworkStartSynchronisedScene(scene2)
    Wait(1000)
 
    if spam then
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)  
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)   
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)   
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)   
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)   
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)   
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(5000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)   
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    Wait(1000)
    else
        Wait(8000)
        Wait(18000)
        Wait(10000)
     TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
    end
    NetworkStartSynchronisedScene(scene3)
    Wait(2000)
    DeleteObject(bag)
    ClearPedTasks(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true) -- Not Busy
    SetEntityAsNoLongerNeeded(object)
    RemoveAnimDict(animDict)
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
    if Config.VaultDoorlock then  if oxd then  doorlock(vaultdoorname, false) else TriggerServerEvent('qb-doorlock:server:updateState', vaultdoorname, false, false, false, true, false, false) end return end
    if not opens then
    local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
    --print(object)
    local entHeading = closed
    FreezeEntityPosition(object, false)
   
    while true do
       -- print('h')
        if entHeading > open then
            SetEntityHeading(object, entHeading + 1)
            entHeading = entHeading - 0.501
            PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
        else
            FreezeEntityPosition(object, true)
            TriggerServerEvent('Polar-Pacific:Server:VaultClose')
            break
        end

        Wait(10)
    end
    else
        print('closing')
        local object = GetClosestObjectOfType(vaultloc, 20.0, vaultid, false, false, false)
        --print(object)
        local entHeading = open
        FreezeEntityPosition(object, false)
        while true do
            --print('d')
            if entHeading < closed then
                SetEntityHeading(object, entHeading)
                entHeading = entHeading + 0.501
                PlaySoundFrontend(-1, "OPENING", "MP_PROPERTIES_ELEVATOR_DOORS" , 1)
            else
                FreezeEntityPosition(object, true)
                
                break
            end
    
            Wait(10)
        end
    end
end)





RegisterNetEvent('Polar-Pacific:Client:AddTarget', function(door, prop, var) 
    if oxt then 
        targets[door] = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:Target", type = door,  icon = "fas fa-bolt", label = "Grab", canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
        if hi then print('grab id: ' ..  targets[door] .. ' propdoor: ' .. door .. ' proplabel: ' .. prop) end

    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
        { options = {{ event = "Polar-Pacific:Client:Target", type = door,  icon = "fas fa-bolt", label = "Grab"}}, distance = 1.0  }) 
    end
end)
RegisterNetEvent('Polar-Pacific:Client:AddPickupTarget', function(door, prop, var, pile) 
    if oxt then
        targets[door] = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:PickupTarget", type = door, piles = pile, icon = "fas fa-bolt", label = "Grab", canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
        if hi then print('grab id: ' .. targets[door] .. ' propdoor: ' .. door .. ' proplabel: ' .. prop .. ' ispile: ') end
    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z  - 0.5, maxZ =  var.z + 0.5,}, 
        { options = {{ event = "Polar-Pacific:Client:PickupTarget", type = door, piles = pile, icon = "fas fa-bolt", label = "Grab"}}, distance = 2.5 }) 
    end
end)
RegisterNetEvent('Polar-Pacific:Client:AddPaintTarget', function(door, prop, var, cases) 
    if oxt then 
        targets[door] = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = "Polar-Pacific:Client:PaintTarget", type = door, case = cases, icon = "fas fa-bolt", label = "Grab", canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
        if hi then print('paint id: ' ..  targets[door] .. ' propdoor: ' .. door .. ' proplabel: ' .. prop) end

    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
        { options = {{ event = "Polar-Pacific:Client:PaintTarget", type = door, case = cases, icon = "fas fa-bolt", label = "Grab"}}, distance = 1.0 }) 
    end
end)





function Animation(door, props)
    local propCoords = GetEntityCoords(props)
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
        loadModel(bagcolor)
        local bag = CreateObject(GetHashKey(bagcolor), pedCo, 1, 1, 0)
        local scene1 = NetworkCreateSynchronisedScene(propCoords, 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3) 
        NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
        local scene2 = NetworkCreateSynchronisedScene(propCoords, 
        GetEntityRotation(props), 2, true, false, 1065353216, 0, 1.3) 
        NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) 
        NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080) 
        if model == 'h4_prop_h4_gold_stack_01a' then 
        NetworkAddEntityToSynchronisedScene(props, scene2, animDict, 'grab_gold', 1.0, -1.0, 1148846080) 
        else 
        NetworkAddEntityToSynchronisedScene(props, scene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080) 
        end
        local scene3 = NetworkCreateSynchronisedScene(propCoords, 
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
        TriggerServerEvent('Polar-Pacific:Server:Synapse', door, sped)  
        RemoveAnimDict(animDict)
    else
        model = bagcolor animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
       
            local playerCoords = GetEntityCoords(PlayerPedId())
            
            local direction = vector3(propCoords.x - playerCoords.x, propCoords.y - playerCoords.y, propCoords.z - playerCoords.z)
            local heading = -math.atan2(direction.x, direction.y) * 180.0 / math.pi
            local pitch = math.asin(direction.z / #(direction)) * 180.0 / math.pi

        local dotProduct = Citizen.InvokeNative(0xBFE95ABAF46CD9B8, direction.x, direction.y, direction.z, 0.0, 0.0, 1.0)
        if dotProduct then else 
   
        SetEntityHeading(PlayerPedId(), heading)
        SetEntityRotation(PlayerPedId(), pitch, 0.0, heading, 2, true)
    
    
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    loadAnimDict(animDict) loadModel(model) local bag = CreateObject(GetHashKey(model), playerCoords, 1, 1, 0)
    local scene1 = NetworkCreateSynchronisedScene(propCoords, GetEntityRotation(PlayerPedId()), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
    local scene2 = NetworkCreateSynchronisedScene(propCoords, GetEntityRotation(PlayerPedId()), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
    local scene3 = NetworkCreateSynchronisedScene(propCoords, GetEntityRotation(PlayerPedId()), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 0, 1) NetworkStartSynchronisedScene(scene1) Wait(1000)
    NetworkStartSynchronisedScene(scene2)
    FreezeEntityPosition(props, true)
    SetEntityInvincible(props, true)
    SetEntityNoCollisionEntity(props, PlayerPedId())
    Wait(100)
    Wait(100)
    Wait(100)
    AttachEntityToEntity(props, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xFA60), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
    Wait(300) SetEntityVisible(props, false, false)
    TriggerServerEvent('Polar-Pacific:Server:RemoveProp', door)
    NetworkStartSynchronisedScene(scene3) Wait(900) ClearPedTasks(PlayerPedId()) DeleteObject(bag) SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true)  
    TriggerServerEvent('Polar-Pacific:Server:Synapse', door, sped)  
            

    RemoveAnimDict(animDict)

        end
    end
end 


RegisterNetEvent('Polar-Pacific:Client:HackComputer', function(data)
    if playeritem(computeritem) then
        local door = data.id
        callback('Polar-Pacific:Door' .. door, function(result) if result then 
       
    
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
        else  notify(text('sometingelse'), "error") end end)
    else notify(text('nopcitem'), "error") end
end)








RegisterNetEvent('Polar-Pacific:client:keycard', function(door, position, rot, item) TriggerServerEvent('Polar-Pacific:Server:StopInteract', door) 
    if playeritem(carditem) then
        if oxd then  doorlock(door, false)  else TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) end 
    local chance = math.random(1,100) local pos = GetEntityCoords(PlayerPedId()) local animDict = "anim@heists@keycard@" loadAnimDict(animDict) local prop = 'vw_prop_vw_key_card_01a' loadModel(prop) local prop2 =  CreateObject(prop, pos.x, pos.y, pos.z + 0.2,  true,  true, true)
    FreezeEntityPosition(PlayerPedId(), true) AttachEntityToEntity(prop2, ped, GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 180.0, true, true, false, true, 1, true) SetEntityHeading(PlayerPedId(), position.w) SetEntityCoords(PlayerPedId(), vector3(position.x, position.y,position.z-1)) if chance <= carditemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', item, 1) end 
    TaskPlayAnim(PlayerPedId(), animDict, "enter", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) TaskPlayAnim(PlayerPedId(), animDict, "idle_a", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(5000) TaskPlayAnim(PlayerPedId(), animDict, "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0) Wait(1000) StopAnimTask(PlayerPedId(), animDict, "exit", 16.0)  DeleteEntity(prop2) FreezeEntityPosition(PlayerPedId(), false) TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false)  notify(text('doorunlock'), "success", 2500)
    RemoveAnimDict(animDict) else  notify(text('nokeycard'), "error") end
end)


function next(door, loc)
   -- if door == vaultdoorname then

    --SetEntityCoords(ped, vec3(loc.x, loc.y, loc.z-1))
    local animDict = 'anim@heists@ornate_bank@hack'
    loadAnimDict(animDict)
    loadModel('hei_prop_hst_laptop')
    loadModel(bagcolor)
    loadModel('hei_prop_heist_card_hack_02')
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    SetEntityHeading(ped, loc.w)
    local heading = GetEntityHeading(PlayerPedId())
    local step = 0.5
   -- local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local headingRadians = math.rad(heading)
    local forwardX = step * math.sin(-headingRadians)
    local forwardY = step * math.cos(headingRadians)
    local x = loc.x + forwardX
    local y = loc.y + forwardY
    local z = loc.z+0.5

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(vec3(x,y,z), targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey(bagcolor), targetPosition, 1, 1, 0)
    local laptop = CreateObject(GetHashKey('hei_prop_hst_laptop'), targetPosition, 1, 1, 0)
    local card = CreateObject(GetHashKey("hei_prop_heist_card_hack_02"), targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'hack_enter_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, 'hack_enter_laptop', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(vec3(x,y,z), targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'hack_loop_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, 'hack_loop_laptop', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)

    local netScene3 = NetworkCreateSynchronisedScene(vec3(x,y,z), targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'hack_exit_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, 'hack_exit_laptop', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)

    --Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    Wait(2000)

    if hi then

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
        RemoveAnimDict(animDict)
        return true

    else
               
        LocalPlayer.state:set('inv_busy', true, true) 
    exports[hackname]:OpenHackingGame(10, 5, 3, function(Success) 
        if Success then
            TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
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
            RemoveAnimDict(animDict)
            PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
            return true
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
            RemoveAnimDict(animDict)
            PlaySoundFrontend(-1, "HACKING_FAILURE", "", false)
            return false
        end

    end)

    end

  --[[ elseif door == fingerprintdoor then
     
            local animDict = 'anim_heist@hs3f@ig1_hack_keypad@arcade@male@' RequestAnimDict(animDict) RequestModel('prop_phone_ing') RequestModel('hei_prop_hst_usb_drive')while not HasAnimDictLoaded(animDict) or not HasModelLoaded('prop_phone_ing') or not HasModelLoaded('hei_prop_hst_usb_drive') do Wait(100) end

            local ped = PlayerPedId() 
            local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
            SetEntityHeading(ped, loc.w)
            
            local heading = GetEntityHeading(PlayerPedId())
            local step = 0.5
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
            local headingRadians = math.rad(heading)
            local forwardX = step * math.sin(-headingRadians)
            local forwardY = step * math.cos(headingRadians)
            local x = loc.x + forwardX
            local y = loc.y + forwardY
            local z = loc.z+0.5
            FreezeEntityPosition(ped, true) local phone = CreateObject(GetHashKey('prop_phone_ing'), vec3(x,y,z), 1, 1, 0) local usb = CreateObject(GetHashKey('hei_prop_hst_usb_drive'), targetPosition, 1, 1, 0)
            local netScene = NetworkCreateSynchronisedScene(vec3(x,y,z), targetRotation, 2, false, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'action_var_01', 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(phone, netScene, animDict, 'action_var_01_prop_phone_ing', 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(usb, netScene, animDict, 'action_var_01_ch_prop_ch_usb_drive01x', 4.0, -8.0, 1)
            local netScene2 = NetworkCreateSynchronisedScene(vec3(x,y,z), targetRotation, 2, false, true, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop_var_01', 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(phone, netScene2, animDict, 'hack_loop_var_01_prop_phone_ing', 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(usb, netScene2, animDict, 'hack_loop_var_01_ch_prop_ch_usb_drive01x', 4.0, -8.0, 1)
            local netScene3 = NetworkCreateSynchronisedScene(vec3(x,y,z), targetRotation, 2, false, false, 1065353216, 0, 1.3) NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'success_react_exit_var_01', 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(phone, netScene3, animDict, 'success_react_exit_var_01_prop_phone_ing', 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(usb, netScene3, animDict, 'success_react_exit_var_01_ch_prop_ch_usb_drive01x', 4.0, -8.0, 1) NetworkStartSynchronisedScene(netScene) Wait(4000) NetworkStartSynchronisedScene(netScene2) Wait(2000)
        
            LocalPlayer.state:set('inv_busy', true, true) 
            TriggerEvent("".. fingerhack ..":Start", 4, 1, 1, function(outcome, reason) 
                if outcome == true then -- success
                TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
                local chance = math.random(1,100)
                if chance <= vaultitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', vaultitem, 1) end
                if oxd then  doorlock(door, false)
                else TriggerServerEvent('qb-doorlock:server:updateState', door, false, false, false, true, false, false) end
                NetworkStartSynchronisedScene(netScene3)
                Wait(4000)
                NetworkStopSynchronisedScene(netScene3)
                DeleteObject(usb)
                DeleteObject(phone)
                FreezeEntityPosition(ped, false)
                RemoveAnimDict(animDict)
                LocalPlayer.state:set('inv_busy', false, true) 
                notify(text('doorunlock'), "success", 2500)
                PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                return true
            -- lose
            elseif outcome == false then -- fail
                local chance = math.random(1,100)
                if chance <= vaultitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', vaultitem, 1) end
                NetworkStartSynchronisedScene(netScene3)
                Wait(4000)
                NetworkStopSynchronisedScene(netScene3)
                DeleteObject(usb)
                DeleteObject(phone)
                FreezeEntityPosition(ped, false)
                RemoveAnimDict(animDict)
                LocalPlayer.state:set('inv_busy', false, true)
                TriggerServerEvent('Polar-Pacific:Server:StartInteract', door) 
                PlaySoundFrontend(-1, "HACKING_FAILURE", "", false)
                return false
           
        end end)
        
    end]]
end

function hack(door)
    LocalPlayer.state:set('inv_busy', true, true) 
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    local ped = PlayerPedId()
    local loc = nil local location = nil
    if oxt then
        if door ==  targets[vaultdoorname] then  
            loc = Config.VaultDoorAnimation
           
        elseif door == targets[Config.FingerDoorName] then
            loc = Config.FingerPrintDoor
           
        end
    else
        if door ==  vaultdoorname then  
            loc = Config.VaultDoorAnimation
           
        elseif door == Config.FingerDoorName then
            loc = Config.FingerPrintDoor
           
        end
    end
    SetEntityHeading(ped, loc.w)
    SetEntityCoords(ped, vec3(loc.x, loc.y, loc.z-1))
    if Config.Framework == 'esx' then
        if next(door, loc) then
            if door == fingerprintdoor then
                TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
            else
                notify(text('vaultopen'), "success", 2500)
                TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
                vaultdone()
            end
        else
            TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
        end
       
    else
    QBCore.Functions.Progressbar("door", "Connecting to Door ..", math.random(5000, 7500), false, true, {
    disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
    }, {}, {}, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        if next(door, loc) then
            if door == fingerprintdoor then
                TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
            else
                notify(text('vaultopen'), "success", 2500)
                TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
                vaultdone()
            end
        else
            TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
        end
    end, function() StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
        TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
        LocalPlayer.state:set('inv_busy', false, true) 
    end)
    end
end


RegisterNetEvent('Polar-Pacific:client:DrillStart', function(drillpos, drillrot, door)
    if door == 'Pacificdrill15' then
        if playeritem(yellowdrillitem) then
            SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
            TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
         
            local animDict = "anim_heist@hs3f@ig10_lockbox_drill@pattern_01@lockbox_01@male@"
          
                yellodrill(drillpos, drillrot, yellowdrillitem, door, animDict)
          
            
        else notify(text('nodrill'), "error") end
    else
    if playeritem(drillitem) then
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    TriggerServerEvent('Polar-Pacific:Server:StopInteract', door)
    
    drill(drillpos, drillrot)
    
    else  notify(text('nodrill'), "error") end
    end
end)

RegisterNetEvent('Polar-Pacific:Client:Drill', function(data)
    callback('Polar-Pacific:' .. data.door .. '', function(result) if result then 
    TriggerEvent('Polar-Pacific:client:DrillStart', data.coords, vector3(0.0, 0.0, data.head), data.door)
    else
        notify(text('sometingelse'), "error")
    end end)
end)

function vaultdone() TriggerServerEvent('Polar-Pacific:Server:Vault') end
RegisterNetEvent('Polar-Pacific:Client:VaultHack', function(data) 
    if playeritem(vaultitem) then
        if data.id == fingerprintdoor then
            callback('Polar-Pacific:FingerCheck', function(result) if result then 
               
                    hack(data.id)
              
            else
                notify(text('sometingelse'), "error")
            end end)
        else
            callback('Polar-Pacific:VaultCheck', function(result) if result then 
               
                        hack(data.id)
                   
            else
                notify(text('sometingelse'), "error")
            end end)
        end
    else notify(text('novaultitem'), "error") end
end)



  
































function starttarget()
    ------ DOOR THERMITE
    if oxt then
        exports.ox_target:addBoxZone({ coords = Config.StartThirdEye, size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  name = startdoorname, icon = "fas fa-fire", label = "Thermite", event = 'Polar-Pacific:client:start', canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
    else
    
    exports['qb-target']:AddBoxZone(startdoorname, Config.StartThirdEye, 1, 1, { name = startdoorname, heading = 0.0, debug = hi, minZ = Config.StartThirdEye.z-1, maxZ =  Config.StartThirdEye.z+1,}, 
    { options = {{ event = "Polar-Pacific:client:start", icon = "fas fa-fire", label = "Thermite"}}, distance = 1 }) 

    end
end

RegisterNetEvent('Polar-Pacific:Client:StartLoot', function()

    TriggerServerEvent('Polar-Pacific:Server:SetupGrab1')

    TriggerServerEvent('Polar-Pacific:Server:SetupPickup1')

    TriggerServerEvent('Polar-Pacific:Server:SetupPile1')

    TriggerServerEvent('Polar-Pacific:Server:SetupTrolly1')

    TriggerServerEvent('Polar-Pacific:Server:SetupPainting1')

    TriggerServerEvent('Polar-Pacific:Server:SetupCase1')

end)

RegisterNetEvent('Polar-Pacific:Client:StartTargets', function()
    beginlazers()

    CreateTarget(door1name, vec3(Config.Door1Eye.x, Config.Door1Eye.y, Config.Door1Eye.z + 0.2), "Polar-Pacific:Client:Door", "Thermite", "fas fa-fire", Config.Debug)
    CreateTarget(door2name, vec3(Config.Door2Eye.x, Config.Door2Eye.y, Config.Door2Eye.z + 0.2), "Polar-Pacific:Client:Door", "Thermite", "fas fa-fire", Config.Debug)
    CreateTarget(door3name, vec3(Config.Door3Eye.x, Config.Door3Eye.y, Config.Door3Eye.z + 0.2), "Polar-Pacific:Client:Door", "Thermite", "fas fa-fire", Config.Debug)

    CreateTarget(doorcard1name, vec3(Config.doorcard1Eye.x, Config.doorcard1Eye.y, Config.doorcard1Eye.z + 0.2), "Polar-Pacific:Client:doorcard", "Insert Card", "fas fa-bolt", Config.Debug)
    CreateTarget(doorcard2name, vec3(Config.doorcard2Eye.x, Config.doorcard2Eye.y, Config.doorcard2Eye.z + 0.2), "Polar-Pacific:Client:doorcard", "Insert Card", "fas fa-bolt", Config.Debug)
   
    CreateTarget(Config.Pc1name, Config.Pc1, "Polar-Pacific:Client:HackComputer", "Hack", "fas fa-bolt", Config.Debug)
    CreateTarget(Config.Pc2name, Config.Pc2, "Polar-Pacific:Client:HackComputer", "Hack", "fas fa-bolt", Config.Debug)
    CreateTarget(Config.Pc3name, Config.Pc3, "Polar-Pacific:Client:HackComputer", "Hack", "fas fa-bolt", Config.Debug)
    if Config.Lazers then CreateTarget(Config.LazerName, Config.LazerLocation, "Polar-Pacific:Client:StopLazers", "Press", "fas fa-bolt", Config.Debug) end

    other()

    changecolor()
end)


--- Thermites
RegisterNetEvent('Polar-Pacific:Client:Door', function(data)
    local name = data.id
    door = name
    if name == door1name then
    pp = vec4(Config.Door1Thermite.x, Config.Door1Thermite.y, Config.Door1Thermite.z + 0.2, Config.Door1Thermite.w) 
    coords =  Config.Door1Pfx 
    elseif name == door2name then
        pp = vec4(Config.Door2Thermite.x, Config.Door2Thermite.y, Config.Door2Thermite.z + 0.2, Config.Door2Thermite.w) 
        coords =  Config.Door2Pfx 
    elseif name == door3name then
        pp = vec4(Config.Door3Thermite.x, Config.Door3Thermite.y, Config.Door3Thermite.z + 0.2, Config.Door3Thermite.w) 
        coords =  Config.Door3Pfx 
    end
    callback('Polar-Pacific:Door' .. name, function(result) if result then 
        TriggerEvent('Polar-Pacific:client:Thermite', pp, door, coords) 
    else  notify(text('sometingelse'), "error") end end)
end)

----- CARD INSERT
RegisterNetEvent('Polar-Pacific:Client:doorcard', function(data) 
    item = carditem  
    rot = vector3(0.0, 0.0, 37.0) 
    door = data.id
    if door == doorcard1name then
        position = Config.doorcard1swipe 
    elseif door == doorcard2name then
        position = Config.doorcard2swipe 
    end
    TriggerEvent('Polar-Pacific:client:keycard', door, position, rot, item) 
end)






























function resetstuff()
    doors = {}
    trollys = {}
    targets = {}
    caseitem = {}
    itemstand = {}
    displaycase = {}
    disabled = true
    for i = 1, 40 do
        if hi then print('setting to nil ' .. i .. ' / 40') end
        _G["Pacificprop" .. i] = nil
    end
end


RegisterNetEvent('Polar-Pacific:Client:PacificProp', function(door, prop, var, value, number) 
    loadModel(prop) 
    if value then
        if number == 1 then
            itemstand[door] =  CreateObject(prop, var.x, var.y, var.z,  false,  true, false) 
            SetEntityHeading(itemstand[door], var.w) 
        elseif number == 2 then
            displaycase[door] =  CreateObject(prop, var.x, var.y, var.z,  false,  true, false) 
            SetEntityHeading(displaycase[door], var.w) 
        end
    else
    doors[door] =  CreateObject(prop, var.x, var.y, var.z,  false,  true, false) 
    SetEntityHeading(doors[door], var.w) 
    --print(doors[door])
    end
end)








RegisterNetEvent('Polar-Pacific:Client:RemoveProp', function(door) 
    if hi then print(doors[door]) end
   
            
    if DoesEntityExist(doors[door]) then DeleteEntity(doors[door]) end
end)



RegisterNetEvent('Polar-Pacific:Client:TargetRemove', function(door) 
    if hi then print(doors[door]) end
    --if targets[door] == nil then return end
    if oxt then 
        exports.ox_target:removeZone(targets[door]) 
    else  
        exports['qb-target']:RemoveZone(door) 
    end
  --  if tablecheck(door, paintingtable) then return end
  --  if tablecheck(door, casetable) then return end
  --  if tablecheck(door, trollytable) then return end
       
        
            
        
        --print(door)
      --  print(targets[door])
       -- print(doors[door])
            
  --  if DoesEntityExist(doors[door]) then DeleteEntity(doors[door]) end 
end)

RegisterNetEvent('Polar-Pacific:Client:SetTrollyProp', function(door, prop)
    trollys[door] = prop 

end)

RegisterNetEvent('Polar-Pacific:Client:Target', function(data) 
    local p = data.type 
    
   
   -- print(GetEntityRotation(doors[p]))
   
    if tablecheck(p, trollytable) then
        grabloot(p, doors[p])
    else
        Animation(p, doors[p])  
    end
end)

RegisterNetEvent('Polar-Pacific:Client:ResetProps', function()
    for _, v in ipairs(proptable) do
        if oxt then exports.ox_target:removeZone(targets[v])  else exports['qb-target']:RemoveZone(v) end
        if DoesEntityExist(doors[v]) then DeleteEntity(doors[v]) end
    end
    for _, v in ipairs(doortable) do
        if oxt then exports.ox_target:removeZone(targets[v])  else exports['qb-target']:RemoveZone(v) end
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
        TriggerServerEvent('Polar-Pacific:Server:RemoveProp', door)
        RemoveAnimDict(animDict)
    else
        animDict = 'random@domestic'
        loadAnimDict(animDict) TaskPlayAnim(PlayerPedId(), animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
        TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door) 
       
        Wait(500)
        
        AttachEntityToEntity(doors[door], PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58867), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
        Wait(1000) SetEntityVisible(doors[door], false, false)

        TriggerServerEvent('Polar-Pacific:Server:RemoveProp', door)
        RemoveAnimDict(animDict)
    end
        TriggerServerEvent('Polar-Pacific:Server:Synapse', door)    
        LocalPlayer.state:set('inv_busy', false, true)
       
end)



RegisterNetEvent('Polar-Pacific:Client:ResetDoors', function()
    if oxd then
        doorlock(door1name, true)
        doorlock(door2name, true)
        doorlock(door3name, true)
        doorlock(doorcard1name, true)
        doorlock(doorcard2name, true)
        doorlock(Config.FingerDoorName, true)
        doorlock(Config.VaultDoorName, true)
       
    else
    TriggerServerEvent('qb-doorlock:server:updateState', door1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', door2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', door3name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', doorcard1name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', doorcard2name, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Config.FingerDoorName, true, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Config.VaultDoorName, true, false, false, true, false, false)
 --   doorlock(door1name, true)
  --  doorlock(door2name, true)
  --  doorlock(door3name, true)
  --  doorlock(doorcard1name, true)
  --  doorlock(doorcard2name, true)
 --   doorlock(Config.VaultDoorName, true)
    end
end)


RegisterNetEvent('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)
local PlayerData = nil
function playeritem(items, amount)
        if Config.Framework == 'qb' then    
        PlayerData = QBCore.Functions.GetPlayerData()
        else
        PlayerData = ESX.PlayerData
        end
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
    if Config.Framework == 'qb' then
        QBCore.Functions.Notify(what, color)
    elseif Config.Framework == 'esx' then
        if color == 'error' then colo = 'r' elseif color == 'success' then colo = 'g' end
        ESX.ShowNotification(what, true, true, colo)
    end
end
 

function tablecheck(p, table)
    for _, v in ipairs(table) do
        if v == p then
            return true
        end
    end
end

local lasers = {}
function beginlazers()
    if Config.Lazers then
   -- laser("first", vec3(-101.134003, 6467.113770, 33.004002), vec3(-104.083000, 6464.405762, 32.124001), 5, 106, 90, 205)
   
    lasers["moving1"] = Laser.new(
        {vec3(-101.362999, 6461.002930, 31.698000), vec3(-100.135002, 6459.774902, 31.736000), vec3(-98.877998, 6458.518066, 31.739000)},
        {vec3(-97.832001, 6464.497070, 31.802000), vec3(-96.651001, 6463.314941, 31.764999), vec3(-95.439003, 6462.103027, 31.730000)},
        {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, name = "moving1"}
      )
    lasers["moving2"] = Laser.new(
        {vec3(-93.833000, 6467.546875, 33.467999), vec3(-93.830002, 6467.542969, 33.466000), vec3(-93.830002, 6467.542969, 33.466000), vec3(-93.830002, 6467.542969, 33.466000), vec3(-93.830002, 6467.542969, 33.466000)},
        {vec3(-97.891998, 6464.827148, 32.606998), vec3(-99.960999, 6466.895996, 31.788000), vec3(-96.339996, 6470.054199, 31.174999), vec3(-99.608002, 6468.919922, 31.895000), vec3(-97.908997, 6467.060059, 31.421000)},
        {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, name = "moving2"}
      )
    lasers["moving3"] = Laser.new(
        {vec3(-101.035004, 6460.296875, 33.442001), vec3(-101.038002, 6460.294922, 33.438000), vec3(-101.038002, 6460.294922, 33.438000), vec3(-101.038002, 6460.294922, 33.438000), vec3(-101.038002, 6460.294922, 33.438000)},
        {vec3(-104.584000, 6457.172852, 33.353001), vec3(-106.407997, 6458.998047, 32.362999), vec3(-107.008003, 6461.537109, 31.837999), vec3(-105.745003, 6462.782227, 31.500999), vec3(-104.716003, 6463.830078, 31.556999)},
        {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, name = "moving3"}
      )

    Wait(1000)
    lasers["moving4"] = Laser.new(
        {vec3(-102.453003, 6476.030762, 31.007000), vec3(-102.457001, 6476.026855, 32.174000), vec3(-102.422997, 6476.061035, 33.252998), vec3(-103.452003, 6475.032227, 33.266998), vec3(-103.518997, 6474.964844, 32.125999), vec3(-103.515999, 6474.967773, 30.927000), vec3(-104.871002, 6473.592773, 30.976999), vec3(-104.857002, 6473.626953, 32.292000), vec3(-104.888000, 6473.596191, 33.345001), vec3(-106.099998, 6473.138184, 33.379002), vec3(-106.987000, 6472.250000, 33.387001), vec3(-107.723999, 6471.514160, 33.366001), vec3(-108.564003, 6470.673828, 33.424999), vec3(-109.207001, 6470.030762, 33.380001), vec3(-110.007004, 6469.230957, 33.372002), vec3(-110.780998, 6468.457031, 33.355999), vec3(-111.714996, 6467.522949, 33.346001), vec3(-111.612000, 6466.727051, 33.313000), vec3(-112.360001, 6465.433105, 33.333000), vec3(-112.384003, 6465.409180, 32.091000), vec3(-111.553001, 6466.240234, 32.028000)},
        {vec3(-97.475998, 6471.211914, 30.879000), vec3(-97.778000, 6471.341797, 32.146999), vec3(-97.443001, 6471.244141, 33.352001), vec3(-98.844002, 6469.842773, 33.129002), vec3(-98.775002, 6469.912109, 32.062000), vec3(-98.802002, 6469.884766, 31.040001), vec3(-100.688004, 6468.018066, 30.889999), vec3(-100.723999, 6467.981934, 32.084999), vec3(-100.719002, 6467.985840, 33.383999), vec3(-99.845001, 6464.816895, 33.507000), vec3(-100.197998, 6464.463867, 33.618999), vec3(-100.888000, 6463.772949, 33.648998), vec3(-101.519997, 6463.142090, 33.657001), vec3(-102.099998, 6462.562012, 33.637001), vec3(-104.275002, 6464.412109, 33.390999), vec3(-105.815002, 6462.890137, 33.473000), vec3(-106.945999, 6461.741211, 33.382000), vec3(-107.202003, 6461.484863, 33.333000), vec3(-107.915001, 6460.771973, 33.318001), vec3(-107.916000, 6460.770996, 32.182999), vec3(-107.225998, 6461.460938, 32.244999)},
        {travelTimeBetweenTargets = {0.1, 1.0}, waitTimeAtTargets = {0.0, 0.0}, name = "moving4"}
    )
    Wait(1000)
    Wait(1000)
    lasers["moving5"] = Laser.new(
        {vec3(-102.453003, 6476.030762, 31.007000), vec3(-102.457001, 6476.026855, 32.174000), vec3(-102.422997, 6476.061035, 33.252998), vec3(-103.452003, 6475.032227, 33.266998), vec3(-103.518997, 6474.964844, 32.125999), vec3(-103.515999, 6474.967773, 30.927000), vec3(-104.871002, 6473.592773, 30.976999), vec3(-104.857002, 6473.626953, 32.292000), vec3(-104.888000, 6473.596191, 33.345001), vec3(-106.099998, 6473.138184, 33.379002), vec3(-106.987000, 6472.250000, 33.387001), vec3(-107.723999, 6471.514160, 33.366001), vec3(-108.564003, 6470.673828, 33.424999), vec3(-109.207001, 6470.030762, 33.380001), vec3(-110.007004, 6469.230957, 33.372002), vec3(-110.780998, 6468.457031, 33.355999), vec3(-111.714996, 6467.522949, 33.346001), vec3(-111.612000, 6466.727051, 33.313000), vec3(-112.360001, 6465.433105, 33.333000), vec3(-112.384003, 6465.409180, 32.091000), vec3(-111.553001, 6466.240234, 32.028000)},
        {vec3(-97.475998, 6471.211914, 30.879000), vec3(-97.778000, 6471.341797, 32.146999), vec3(-97.443001, 6471.244141, 33.352001), vec3(-98.844002, 6469.842773, 33.129002), vec3(-98.775002, 6469.912109, 32.062000), vec3(-98.802002, 6469.884766, 31.040001), vec3(-100.688004, 6468.018066, 30.889999), vec3(-100.723999, 6467.981934, 32.084999), vec3(-100.719002, 6467.985840, 33.383999), vec3(-99.845001, 6464.816895, 33.507000), vec3(-100.197998, 6464.463867, 33.618999), vec3(-100.888000, 6463.772949, 33.648998), vec3(-101.519997, 6463.142090, 33.657001), vec3(-102.099998, 6462.562012, 33.637001), vec3(-104.275002, 6464.412109, 33.390999), vec3(-105.815002, 6462.890137, 33.473000), vec3(-106.945999, 6461.741211, 33.382000), vec3(-107.202003, 6461.484863, 33.333000), vec3(-107.915001, 6460.771973, 33.318001), vec3(-107.916000, 6460.770996, 32.182999), vec3(-107.225998, 6461.460938, 32.244999)},
        {travelTimeBetweenTargets = {0.1, 0.5}, waitTimeAtTargets = {0.0, 0.0}, name = "moving5"}
      )
    Wait(1000)
    lasers["moving6"] = Laser.new(
        {vec3(-102.453003, 6476.030762, 31.007000), vec3(-102.457001, 6476.026855, 32.174000), vec3(-102.422997, 6476.061035, 33.252998), vec3(-103.452003, 6475.032227, 33.266998), vec3(-103.518997, 6474.964844, 32.125999), vec3(-103.515999, 6474.967773, 30.927000), vec3(-104.871002, 6473.592773, 30.976999), vec3(-104.857002, 6473.626953, 32.292000), vec3(-104.888000, 6473.596191, 33.345001), vec3(-106.099998, 6473.138184, 33.379002), vec3(-106.987000, 6472.250000, 33.387001), vec3(-107.723999, 6471.514160, 33.366001), vec3(-108.564003, 6470.673828, 33.424999), vec3(-109.207001, 6470.030762, 33.380001), vec3(-110.007004, 6469.230957, 33.372002), vec3(-110.780998, 6468.457031, 33.355999), vec3(-111.714996, 6467.522949, 33.346001), vec3(-111.612000, 6466.727051, 33.313000), vec3(-112.360001, 6465.433105, 33.333000), vec3(-112.384003, 6465.409180, 32.091000), vec3(-111.553001, 6466.240234, 32.028000)},
        {vec3(-97.475998, 6471.211914, 30.879000), vec3(-97.778000, 6471.341797, 32.146999), vec3(-97.443001, 6471.244141, 33.352001), vec3(-98.844002, 6469.842773, 33.129002), vec3(-98.775002, 6469.912109, 32.062000), vec3(-98.802002, 6469.884766, 31.040001), vec3(-100.688004, 6468.018066, 30.889999), vec3(-100.723999, 6467.981934, 32.084999), vec3(-100.719002, 6467.985840, 33.383999), vec3(-99.845001, 6464.816895, 33.507000), vec3(-100.197998, 6464.463867, 33.618999), vec3(-100.888000, 6463.772949, 33.648998), vec3(-101.519997, 6463.142090, 33.657001), vec3(-102.099998, 6462.562012, 33.637001), vec3(-104.275002, 6464.412109, 33.390999), vec3(-105.815002, 6462.890137, 33.473000), vec3(-106.945999, 6461.741211, 33.382000), vec3(-107.202003, 6461.484863, 33.333000), vec3(-107.915001, 6460.771973, 33.318001), vec3(-107.916000, 6460.770996, 32.182999), vec3(-107.225998, 6461.460938, 32.244999)},
        {travelTimeBetweenTargets = {0.1, 0.8}, waitTimeAtTargets = {0.0, 0.0}, name = "moving6"}
      )
    Wait(2000)
    lasers["moving7"] = Laser.new(
        {vec3(-102.453003, 6476.030762, 31.007000), vec3(-102.457001, 6476.026855, 32.174000), vec3(-102.422997, 6476.061035, 33.252998), vec3(-103.452003, 6475.032227, 33.266998), vec3(-103.518997, 6474.964844, 32.125999), vec3(-103.515999, 6474.967773, 30.927000), vec3(-104.871002, 6473.592773, 30.976999), vec3(-104.857002, 6473.626953, 32.292000), vec3(-104.888000, 6473.596191, 33.345001), vec3(-106.099998, 6473.138184, 33.379002), vec3(-106.987000, 6472.250000, 33.387001), vec3(-107.723999, 6471.514160, 33.366001), vec3(-108.564003, 6470.673828, 33.424999), vec3(-109.207001, 6470.030762, 33.380001), vec3(-110.007004, 6469.230957, 33.372002), vec3(-110.780998, 6468.457031, 33.355999), vec3(-111.714996, 6467.522949, 33.346001), vec3(-111.612000, 6466.727051, 33.313000), vec3(-112.360001, 6465.433105, 33.333000), vec3(-112.384003, 6465.409180, 32.091000), vec3(-111.553001, 6466.240234, 32.028000)},
        {vec3(-97.475998, 6471.211914, 30.879000), vec3(-97.778000, 6471.341797, 32.146999), vec3(-97.443001, 6471.244141, 33.352001), vec3(-98.844002, 6469.842773, 33.129002), vec3(-98.775002, 6469.912109, 32.062000), vec3(-98.802002, 6469.884766, 31.040001), vec3(-100.688004, 6468.018066, 30.889999), vec3(-100.723999, 6467.981934, 32.084999), vec3(-100.719002, 6467.985840, 33.383999), vec3(-99.845001, 6464.816895, 33.507000), vec3(-100.197998, 6464.463867, 33.618999), vec3(-100.888000, 6463.772949, 33.648998), vec3(-101.519997, 6463.142090, 33.657001), vec3(-102.099998, 6462.562012, 33.637001), vec3(-104.275002, 6464.412109, 33.390999), vec3(-105.815002, 6462.890137, 33.473000), vec3(-106.945999, 6461.741211, 33.382000), vec3(-107.202003, 6461.484863, 33.333000), vec3(-107.915001, 6460.771973, 33.318001), vec3(-107.916000, 6460.770996, 32.182999), vec3(-107.225998, 6461.460938, 32.244999)},
        {travelTimeBetweenTargets = {0.1, 0.8}, waitTimeAtTargets = {0.0, 0.0}, name = "moving7"}
      )
    startlasers()

    
    end
end

function laser(names, startloc, endloc, d, r, g, b)
    lasers[names] = Laser.new(
        startloc,
        {endloc},
        {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = names, maxDistance = d, color = {r, g, b, 255}}
    )
end

function clear(v, pos)
    disabled = false
    if Config.LazerPolice then CallPolice() end
    if Config.Lockdown then TriggerServerEvent('Polar-Pacific:Server:LockDown') end
    if Config.Debug then print('name = ' .. v .. ' hitPos = ' .. pos) end
    if Config.LazerSounds then TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 50.0, "warehousealert", 0.35) end
    lasers[v].clearOnPlayerHit()
   
    for v, table in pairs(lasers) do
        
        lasers[v].setActive(false)

    end
    
end
function changecolor()
    while disabled do
    for v, table in pairs(lasers) do
        local chance = math.random(1,100)
        if chance < 50 then lasers[v].setMoving(false) else lasers[v].setMoving(true) end
        if chance < 20 then
            lasers[v].setColor(106, 90, 205, 255)
        elseif chance < 40 then
            lasers[v].setColor(255, 165, 0, 255)
        elseif chance < 60 then
            lasers[v].setColor(238, 130, 238, 255)
        elseif chance < 80 then
            lasers[v].setColor(60, 179, 113, 255)
        else
            lasers[v].setColor(255, 0, 0, 255)
        end
    end
    Wait(5000)
    end
end
function startlasers()
    for v, table in pairs(lasers) do
        
        
        if disabled then 
            lasers[v].setActive(true)

        Wait(1)

        local chance = math.random(1,100)
        if chance < 50 then lasers[v].setMoving(false) else lasers[v].setMoving(true) end
        if chance < 20 then
            lasers[v].setMoving(true)
            lasers[v].setColor(106, 90, 205, 255)
        elseif chance < 40 then
            lasers[v].setMoving(true)
            lasers[v].setColor(255, 165, 0, 255)
        elseif chance < 60 then
            lasers[v].setMoving(true)
            lasers[v].setColor(238, 130, 238, 255)
        elseif chance < 80 then
            lasers[v].setMoving(true)
            lasers[v].setColor(60, 179, 113, 255)
        else
            lasers[v].setMoving(false)
            lasers[v].setColor(255, 0, 0, 255)
        end

        lasers[v].onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                
                clear(v, hitPos)
                
            else
                lasers[v].clearOnPlayerHit()
            end
        end)
        end
    end
end

RegisterNetEvent('Polar-Pacific:Client:StopLazers', function(data)
    disabled = false
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', data.id) 
    notify('Security System Disabled In 10 Seconds', 'success')
    Wait(10000)
    if Config.LazerPolice then if Config.LazerPoliceDisableCall then CallPolice() end end
    notify(text('lazers'), "success")
    for v, table in pairs(lasers) do
        
        lasers[v].clearOnPlayerHit()
        lasers[v].setActive(false)

    end
end)






























function yellodrill(drillpos, drillrot, drillitems, door, animDict)
    LocalPlayer.state:set("inv_busy", true, true)
    RequestAnimDict(animDict) RequestModel("ch_prop_vault_drill_01a") RequestModel(bagcolor) while not HasAnimDictLoaded(animDict) or not HasModelLoaded("ch_prop_vault_drill_01a") or not HasModelLoaded(bagcolor) do Wait(100) end
    local ped = PlayerPedId() local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped)) 
    local animPos = GetAnimInitialOffsetPosition(animDict, "top_left_enter", drillpos.x, drillpos.y, drillpos.z - 2)
    FreezeEntityPosition(ped, true)

    local bag = CreateObject(bagcolor, targetPosition, 1, 1, 0)
    local drill = CreateObject('ch_prop_vault_drill_01a', targetPosition, 1, 1, 0) 

    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 0, true, true, 1065353216, 0, 1.0) 
    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "top_left_enter", 1.5, -4.0, 1, 16, 1148846080, 0) 
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "enter_p_m_bag_var22_arm_s", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(drill, netScene, animDict, "enter_ch_prop_vault_drill_01a", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, true, true, 1065353216, 0, 1.0) 
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "action", 0, 0, 10, 16, 1148846080, 0) 
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "action_p_m_bag_var22_arm_s", 4.0, -80.0, 1)
    NetworkAddEntityToSynchronisedScene(drill, netScene2, animDict, "action_ch_prop_vault_drill_01a", 4.0, -80.0, 1) 

    local netScene3 = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, true, true, 1065353216, 0, 1.0)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "exit", 0, 0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "exit_p_m_bag_var22_arm_s", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(drill, netScene3, animDict, "exit_ch_prop_vault_drill_01a", 4.0, -8.0, 1)

    local netScene4 = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, true, true, 1065353216, 0, 1.0)
    NetworkAddPedToSynchronisedScene(ped, netScene4, animDict, "reward", 0, 0, 10, 16, 1148846080, 0) 
    NetworkAddEntityToSynchronisedScene(bag, netScene4, animDict, "reward_p_m_bag_var22_arm_s", 4.0, -80.0, 1) 
    NetworkAddEntityToSynchronisedScene(drill, netScene4, animDict, "reward_ch_prop_vault_drill_01a", 4.0, -80.0, 1)

    SetEntityHeading(ped, drillrot) 

        NetworkStartSynchronisedScene(netScene) Wait(3500) NetworkStopSynchronisedScene(netScene) 
    
        
        NetworkStartSynchronisedScene(netScene2)
    
        Wait(7000)
    
       
      
        NetworkStopSynchronisedScene(netScene2)  NetworkStartSynchronisedScene(netScene4) Wait(3000)
    
        NetworkStopSynchronisedScene(netScene4) NetworkStartSynchronisedScene(netScene3) Wait(3000)
        
        NetworkStopSynchronisedScene(netScene3) 
    
        DeleteObject(bag) 
        DeleteObject(drill)  
        FreezeEntityPosition(ped, false)

        TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
        TriggerServerEvent('Polar-Pacific:Drill', door)
        local chance = math.random(1,100) if chance <= ydrillitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', drillitems, 1) end
        LocalPlayer.state:set("inv_busy", false, true)
        RemoveAnimDict(animDict)
    
    

 
  
   -- TriggerServerEvent('Polar-Pacific:Server:StartInteract', door)
   -- local chance = math.random(1,100) if chance <= ydrillitemchance then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', drillitems, 1) end
    
end



















RegisterNetEvent('Polar-Pacific:Client:PaintTarget', function(data)
    local door = data.type
    local case = data.case
    if case then
        if playeritem(laserdrillitem) then
            local chances = 50
            local items = laserdrillitem
        snatch(door, items, chances)
        else notify(text('nolaserdrill'), "error") end
    else
        if playeritem(knifeitem) then

       
        HeistAnimation(door)
        
    else notify(text('noswitchblade'), "error") end
    end
end)


local ArtHeist = {}

function HeistAnimation(door)

    local object = doors[door]
    local sceneRot = GetEntityRotation(object)
    local scenePos2 = GetEntityCoords(object)
    local heading = GetEntityHeading(object)
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
    local scenes = {false, false, false, false}
    local animDict = "anim_heist@hs3f@ig11_steal_painting@male@"
  
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', door)
   


    RequestAnimDict(animDict) RequestModel(bagcolor) RequestModel('w_me_switchblade')
    while not HasAnimDictLoaded(animDict) or not HasModelLoaded(bagcolor) or not HasModelLoaded('w_me_switchblade') do Wait(100) 
    end

  
    local bag = CreateObject(bagcolor, pedCo, 1, 1, 0)
    local knife = CreateObject('w_me_switchblade', pedCo, 1, 1, 0)

   
    local step = -0.425
    local headingRadians = math.rad(heading)
    local forwardX = step * math.sin(-headingRadians)
    local forwardY = step * math.cos(headingRadians)
    local x = scenePos2.x + forwardX
    local y = scenePos2.y + forwardY
    local z = scenePos2.z-1.16
    local veca = vec3(x,y,z)

    for i = 1, 10 do

        ArtHeist[i] = NetworkCreateSynchronisedScene(veca, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

        NetworkAddPedToSynchronisedScene(ped, ArtHeist[i], animDict, 'ver_01_'..Config.PaintAnimations[i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(object, ArtHeist[i], animDict, 'ver_01_'..Config.PaintAnimations[i][3], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(bag, ArtHeist[i], animDict, 'ver_01_'..Config.PaintAnimations[i][4], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(knife, ArtHeist[i], animDict, 'ver_01_'..Config.PaintAnimations[i][5], 1.0, -1.0, 1148846080)
    end
    LocalPlayer.state:set("inv_busy", true, true)
    cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, 0, 3000, 1, 0)
    







    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    FreezeEntityPosition(ped, true)
    NetworkStartSynchronisedScene(ArtHeist[1])
    PlayCamAnim(cam, 'ver_01_top_left_enter_cam_ble', animDict, veca, sceneRot, 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(ArtHeist[2])
    PlayCamAnim(cam, 'ver_01_cutting_top_left_idle_cam', animDict, veca, sceneRot, 0, 2)
    repeat
       
        if IsControlPressed(0, 24) then
            --  if IsControlJustPressed(0, 38) then
            scenes[1] = true
        end
        Wait(1)
    until scenes[1] == true
    NetworkStartSynchronisedScene(ArtHeist[3])
    PlayCamAnim(cam, 'ver_01_cutting_top_left_to_right_cam', animDict, veca, sceneRot, 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(ArtHeist[4])
    PlayCamAnim(cam, 'ver_01_cutting_top_right_idle_cam', animDict, veca, sceneRot, 0, 2)
    repeat
        
        if IsControlPressed(0, 24) then
            --  if IsControlJustPressed(0, 38) then
            scenes[2] = true
        end
        Wait(1)
    until scenes[2] == true
    NetworkStartSynchronisedScene(ArtHeist[5])
    PlayCamAnim(cam, 'ver_01_cutting_right_top_to_bottom_cam', animDict, veca, sceneRot, 0, 2)
    Wait(3000)
    NetworkStartSynchronisedScene(ArtHeist[6])
    PlayCamAnim(cam, 'ver_01_cutting_bottom_right_idle_cam', animDict, veca, sceneRot, 0, 2)
    repeat
        
        if IsControlPressed(0, 24) then
            --  if IsControlJustPressed(0, 38) then
            scenes[3] = true
        end
        Wait(1)
    until scenes[3] == true
    NetworkStartSynchronisedScene(ArtHeist[7])
    PlayCamAnim(cam, 'ver_01_cutting_bottom_right_to_left_cam', animDict, veca, sceneRot, 0, 2)
    Wait(3000)
    repeat
        if IsControlPressed(0, 24) then
      --  if IsControlJustPressed(0, 38) then
            scenes[4] = true
        end
        Wait(1)
    until scenes[4] == true
    NetworkStartSynchronisedScene(ArtHeist[9])
    PlayCamAnim(cam, 'ver_01_cutting_left_top_to_bottom_cam', animDict, veca, sceneRot, 0, 2)
    Wait(1500)
    NetworkStartSynchronisedScene(ArtHeist[10])
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    Wait(7500)
    

    ClearPedTasks(ped)
	FreezeEntityPosition(ped, false)

    LocalPlayer.state:set("inv_busy", false, true)
    
    DeleteObject(bag)
    DeleteObject(knife)
    DeleteEntity(object)
  
    ArtHeist = {}
    
    TriggerServerEvent('Polar-Pacific:Server:Synapse', door)  
    TriggerServerEvent('Polar-Pacific:Server:RemoveProp', door)

    scenes = {false, false, false, false}
    
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 1, 1)
    RemoveAnimDict(animDict)
end


function snatch(name, item, chances)
    TriggerServerEvent('Polar-Pacific:Server:TargetRemove', name)
    
    LocalPlayer.state:set("inv_busy", true, true)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    RequestScriptAudioBank("DLC_HEI4/DLCHEI4_GENERIC_01", false)
    
    local dict = "anim@scripted@heist@ig16_glass_cut@male@"
    RequestAnimDict(dict)  while not HasAnimDictLoaded(dict) do Wait(100)  end

    local ptfx = "scr_ih_fin"
    if not HasNamedPtfxAssetLoaded(ptfx) then  RequestNamedPtfxAsset(ptfx) end 
    while not HasNamedPtfxAssetLoaded(ptfx) do Wait(100) end SetPtfxAssetNextCall(ptfx)

    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)

    local boneIndex = GetPedBoneIndex(ped, 0x49D9)
    loadModel("h4_prop_h4_glass_cut_01a")
    loadModel("h4_prop_h4_cutter_01a")
    loadModel("h4_prop_h4_glass_disp_01b")
   
    local displayEntityCoords = GetEntityCoords(doors[name])
    local displayEntityRotation = GetEntityRotation(doors[name])


    local entityHeading = GetEntityHeading(doors[name])

    local offset2 = GetOffsetFromEntityInWorldCoords(doors[name], 0.0, 0.0, 0.0)
    local offset = vec3(offset2.x, offset2.y, offset2.z -1.035)
    Wait(50)
    SetEntityHeading(ped, entityHeading)
    SetEntityCoords(ped, offset.x , offset.y, offset.z)

    local pedRotation = GetEntityRotation(ped)
    local cutterEntity = CreateObject("h4_prop_h4_cutter_01a",  vec3(offset.x, offset.y, offset.z - 6.0), 1, 1, 0) 
    local bagEntity =  CreateObject(bagcolor,  vec3(offset.x, offset.y, offset.z - 4.0), 1, 1, 0) 
    local glassEntity =  CreateObject("h4_prop_h4_glass_cut_01a",  vec3(offset.x, offset.y, offset.z - 5.0), 1, 1, 0) 
    local newDisplayEntity = CreateObject("h4_prop_h4_glass_disp_01b",  vec3(offset.x, offset.y, offset.z - 8.0), 1, 1, 0) 
   
    SetEntityCollision(newDisplayEntity, false, true)
    SetEntityCollision(bagEntity, false, true)
    SetEntityCollision(glassEntity, false, true)
    SetEntityCollision(cutterEntity, false, true)
   
    FreezeEntityPosition(newDisplayEntity, true)
    FreezeEntityPosition(bagEntity, true)
    FreezeEntityPosition(glassEntity, true)
    FreezeEntityPosition(cutterEntity, true)

    SetEntityRotation(newDisplayEntity, displayEntityRotation.x, displayEntityRotation.y, displayEntityRotation.z)

   


    

    

    local scene = NetworkCreateSynchronisedScene(offset.x, offset.y, offset.z, pedRotation.x, pedRotation.y, pedRotation.z, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, dict, "enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(cutterEntity, scene, dict, "enter_cutter", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bagEntity, scene, dict, "enter_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(glassEntity, scene, dict, "enter_glass_display", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene)
    Wait(2900)
    local scene = NetworkCreateSynchronisedScene(offset.x, offset.y, offset.z, pedRotation.x, pedRotation.y, pedRotation.z, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, dict, "idle", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bagEntity, scene, dict, "idle_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(glassEntity, scene, dict, "idle_glass_display", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(cutterEntity, scene, dict, "idle_cutter", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene)

    

    

    local soundId = GetSoundId()
    PlaySoundFromEntity(soundId, "StartCutting", cutterEntity, "DLC_H4_anims_glass_cutter_Sounds", true, 0)

    local loop = StartNetworkedParticleFxLoopedOnEntity('scr_ih_fin_glass_cutter_cut', glassEntity,  0.005, -0.35, 1.29, 0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 0)
    SetParticleFxLoopedEvolution(loop, "power", 1, false)
    

    local scene = NetworkCreateSynchronisedScene(offset.x, offset.y, offset.z, pedRotation.x, pedRotation.y, pedRotation.z, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, dict, "cutting_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bagEntity, scene, dict, "cutting_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(glassEntity, scene, dict, "cutting_loop_glass_display", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(cutterEntity, scene, dict, "cutting_loop_cutter", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene)

    
    Wait(5000)
    Wait(5000)

    
    SetEntityCoords(newDisplayEntity, displayEntityCoords.x, displayEntityCoords.y, displayEntityCoords.z -1.035)
    DeleteEntity(displaycase[name])
    SetEntityCollision(newDisplayEntity, true, true)
    SetEntityAsNoLongerNeeded(newDisplayEntity)
    if DoesEntityExist(itemstand[name]) then SetEntityAsNoLongerNeeded(itemstand[name]) end

    local scene = NetworkCreateSynchronisedScene(offset.x, offset.y, offset.z, pedRotation.x, pedRotation.y, pedRotation.z, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, dict, "success", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bagEntity, scene, dict, "success_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(glassEntity, scene, dict, "success_glass_display", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(cutterEntity, scene, dict, "success_cutter", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(scene)
    Wait(1700)

    AttachEntityToEntity(doors[name], ped, boneIndex, 0.0, 0.0, 0.3, 0.0, 180.0, 0.0, false, false, false, false, 0, true)

    Wait(1250)
    
    


    TriggerServerEvent('Polar-Pacific:Server:RemoveProp', name)
    
   
    TriggerServerEvent('Polar-Pacific:Server:Synapse', name) 
    DeleteEntity(bagEntity)
    DeleteEntity(glassEntity)
    DeleteEntity(cutterEntity)
   -- DeleteEntity(caseitem)
    RemoveAnimDict(dict)
    RemovePtfxAsset(ptfx)
    StopSound(soundId)
    ReleaseScriptAudioBank()
    SetEntityCollision(newDisplayEntity, true, true)
    ptfx = nil
    soundId = nil
    local chance = math.random(1,100) if chance <= chances then TriggerServerEvent('Polar-Pacific:Server:RemoveItem', item, 1) end
    SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 1, 1)
    LocalPlayer.state:set("inv_busy", false, true)
    RemoveAnimDict(animDict)
end




function doorlock(doorId, state)
    TriggerServerEvent('Polar-Pacific:Doorlock', doorId, state)
end

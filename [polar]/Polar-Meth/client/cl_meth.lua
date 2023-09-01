if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end

local circleexport = 'Polar-UI'
local labname = nil
local target = Config.Target
local labs = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() 
    Wait(100) 

    labname = 'first'
    labs[labname] = {}

    starttarget() 
end)
CreateThread(function()
  
        Wait(100) 
        
        labname = 'first'
        labs[labname] = {}

        starttarget() 
 
end)
function animation() TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true) end
function endanimation() ClearPedTasks(PlayerPedId()) end
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
function removetarget(name, labname)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', name, labname)
    
end
function starttarget()
    if target == 'ox' then

        exports.ox_target:addBoxZone({ coords = Config.MixLocation, size = vec3(1, 1, 1), rotation = 1, debug = Config.Debug,
        options = {{  name = "methmix", icon = "fa-solid fa-bolt", label = "Mix Materials", event = 'Polar-Meth:Client:MethMix' }, } })
   
   
    else

        exports['qb-target']:AddBoxZone(labname .. "_mix", Config.MixLocation, 1, 1, { name = "mix", heading = 0.0, debug = Config.Debug, minZ = Config.MixLocation.z-1, maxZ =  Config.MixLocation.z+1,}, 
        { options = {{ event = "Polar-Meth:Client:MethMix", icon = "fa-solid fa-bolt", label = "Mix Materials"}}, distance = 1.5 }) 

        for labName, labData in pairs(Config.Labs) do
            local cord = labData.InsideLabCord
            local head = labData.InsideLabHead
        
            TriggerServerEvent('Polar-Meth:Server:SetupLab', labName)
        
            exports['qb-target']:AddBoxZone(labName .. "_enterlab", cord, 1, 1, { name = "enterlab", heading = 0.0, debug = Config.Debug, minZ = cord.z-1, maxZ =  cord.z+1,}, 
            { options = {{ event = "Polar-Meth:Client:EnterLab", icon = "fa-solid fa-bolt", label = "Enter Lab", type = labName}}, distance = 1.5 }) 
    
        end
      


        exports['qb-target']:AddBoxZone("exitlab", Config.ExitLabThirdEye, 1, 1, { name = "exitlab", heading = 0.0, debug = Config.Debug, minZ = Config.ExitLabThirdEye.z-1, maxZ =  Config.ExitLabThirdEye.z+1,}, 
        { options = {{ event = "Polar-Meth:Client:ExitLab", icon = "fa-solid fa-bolt", label = "Exit Lab", type = labname}}, distance = 1.5 }) 

    end
end

function traynext(amount)
    removetarget('temp', labname)
    TriggerServerEvent('Polar-Meth:Server:TrayAdd', labname)
    endanimation()
    TriggerServerEvent('Polar-Meth:Server:SetBagAmount', amount, labname)
end

RegisterNetEvent('Polar-Meth:Client:RemoveTarget', function(name, labnam2)
    if Config.Debug then print('removed target ' .. labnam2 .. "_" .. name) end
    exports['qb-target']:RemoveZone(labnam2 .. "_" .. name) 

end)

RegisterNetEvent('Polar-Meth:Client:MixTarget', function(labnam2)
    exports['qb-target']:AddBoxZone(labnam2 .. "_mix", Config.MixLocation, 1, 1, { name = "mix", heading = 0.0, debug = Config.Debug, minZ = Config.MixLocation.z-1, maxZ =  Config.MixLocation.z+1,}, 
    { options = {{ event = "Polar-Meth:Client:MethMix", icon = "fa-solid fa-bolt", label = "Mix Materials"}}, distance = 1.5 }) 
end)

RegisterNetEvent('Polar-Meth:Client:StartTargets', function(labnam2)
    exports['qb-target']:AddBoxZone(labnam2 .. "_temp", Config.TempLocation, 1, 1, { name = "temp", heading = 0.0, debug = Config.Debug, minZ = Config.TempLocation.z-1, maxZ =  Config.TempLocation.z+1,}, 
    { options = {{ event = "Polar-Meth:Client:MethTemperature", icon = "fa-solid fa-bolt", label = "Set Temperature"}}, distance = 1.5 }) 

    exports['qb-target']:AddBoxZone(labnam2 .. "_tray", Config.TrayLocation, 1, 1, { name = "tray", heading = 0.0, debug = Config.Debug, minZ = Config.TrayLocation.z-1, maxZ = Config.TrayLocation.z+1,}, 
    { options = {{ event = "Polar-Meth:Client:MethTray", icon = "fa-solid fa-bolt", label = "Smash Tray"}}, distance = 1.5 }) 

    exports['qb-target']:AddBoxZone(labnam2 .. "_bag", Config.BagLocation, 1, 1, { name = "bag", heading = 0.0, debug = Config.Debug, minZ = Config.BagLocation.z-1, maxZ =  Config.BagLocation.z+1,}, 
    { options = {{ event = "Polar-Meth:Client:MethBag", icon = "fa-solid fa-bolt", label = "Bag Crystals"}}, distance = 1.5 }) 

end)
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
----------------------


AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end LocalPlayer.state:set('inv_busy', false, true)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', 'tray', labname)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', 'temp', labname)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', 'mix', labname)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', 'bag', labname)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', 'enterlab', labname)
    TriggerServerEvent('Polar-Meth:Server:RemoveTarget', 'exitlab', labname)
    labname = nil

end)

RegisterNetEvent('Polar-Meth:Client:MethMix', function()
    if playeritem(Config.Ing1) and playeritem(Config.Ing2) and playeritem(Config.Ing3) and playeritem(Config.Ing4) then
        Config.TriggerCallBack('Polar-Meth:MixCheck', function(result) if result then
            TriggerServerEvent('Polar-Meth:Server:StopInteract', 'mix')
            LocalPlayer.state:set('inv_busy', true, true)
            TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.Ing1)
            TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.Ing2)
            TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.Ing3)
            TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.Ing4)
            local sceneCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            if Config.UseCam then
            RenderScriptCams(true, false, 0, 1, 0)
            SetCamCoord(sceneCam, 975.15, -143.58, -49.05)
            PointCamAtEntity(sceneCam, PlayerPedId(), 0.0, 0.0, 0.0, 1)
            end
            RequestAnimDict('anim@amb@business@meth@meth_monitoring_cooking@cooking@')
            RequestModel('bkr_prop_meth_sacid')
            RequestModel('bkr_prop_meth_ammonia')
            while not HasAnimDictLoaded('anim@amb@business@meth@meth_monitoring_cooking@cooking@') and not HasModelLoaded("bkr_prop_meth_sacid") and not HasModelLoaded("bkr_prop_meth_ammonia") do Wait(30) end
            local ammonia = CreateObject(GetHashKey("bkr_prop_meth_ammonia"), Config.CookZone.x, Config.CookZone.y, Config.CookZone.z, true, false, false)
            local sacid = CreateObject(GetHashKey("bkr_prop_meth_sacid"), Config.CookZone.x, Config.CookZone.y, Config.CookZone.z, true, false, false)
            SetEntityHeading(playerPed, 178.56)
            Wait(100)
            local cookingScene = NetworkCreateSynchronisedScene(Config.CookZone.x+4.84, Config.CookZone.y+1.99, Config.CookZone.z-0.40, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(PlayerPedId(), cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(ammonia, cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_ammonia", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(sacid, cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_sacid", 4.0, -8.0, 1)
            NetworkStartSynchronisedScene(cookingScene)
            Wait(56000)
            NetworkStopSynchronisedScene(cookingScene)
            ClearFocus()
            if Config.UseCam then
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(sceneCam, false)
            end
            DeleteEntity(ammonia)
            DeleteEntity(sacid)
            LocalPlayer.state:set('inv_busy', false, true)
            removetarget('mix', labname)
            notify(text('mixerstart'), 'success')
            Wait(5000)
            percentage()
        else notify(text('busy'), "error") end end, labname)
    else notify(text('ingredients'), "error") end
end)

RegisterNetEvent('Polar-Meth:Client:MethTemperature', function()
    Config.TriggerCallBack('Polar-Meth:TempCheck', function(result) if result then
        TriggerServerEvent('Polar-Meth:Server:StopInteract', 'temp')
        animation()
        local random2 = math.random(2,10)
        local random = math.random(10,20)
        exports[circleexport]:Circle(function(success)
        if success then notify(text('tempokay'), 'success') Wait(1000)
                exports[circleexport]:Circle(function(success)
                if success then notify(text('tempgood'), 'success') Wait(1000)
                        exports[circleexport]:Scrambler(function(success)
                        if success then notify(text('tempgreat'), 'success') Wait(1000)
                            notify(text('tray'), 'success')
                            traynext(4)
                        else Wait(1000)
                            notify(text('tray'), 'success')
                            traynext(3)
                        end end, Config.RandomScrambler2[math.random(1, #Config.RandomScrambler2- 1 )], math.random(Config.ScramblerSecondMin2 + 1,Config.ScramblerSecondMax2 + 1),  math.random(Config.ScramblerMirrorMin2,Config.ScramblerMirrorMax2)) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirro'error' (0: Normal, 1: Normal + Mirro'error' 2: Mirro'error' only )
                else Wait(1000)
                    notify(text('tray'), 'success')
                    traynext(2)
                end end, random2, random)
        else Wait(1000)
            notify(text('tray'), 'success')
            traynext(1)
        end end, random2, random)
    else notify(text('busy'), "error") end end, labname)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('Polar-Meth:Client:MethTray', function()
    if playeritem(Config.TrayItem) and playeritem(Config.BreakItem) then
        Config.TriggerCallBack('Polar-Meth:TrayCheck', function(result) if result then
        TriggerServerEvent('Polar-Meth:Server:StopInteract', 'tray')
        animation()
        TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.TrayItem)
        local chance = math.random(1,100) if chance < 35 then TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.BreakItem) end
        QBCore.Functions.Progressbar("smashing", "Smashing Tray...", Config.TrayTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },{},
            {}, {}, function() -- Done
            notify(text('bag'), 'success')
            endanimation()
            removetarget('tray', labname)
            TriggerServerEvent('Polar-Meth:Server:MethShardAdd', labname)
        end, function()
            endanimation()
            notify('Canceled', 'error')
            TriggerServerEvent('Polar-Meth:Server:StartInteract', 'tray')
        end)    
    else notify(text('busy'), "error") end end, labname)
    else notify(text('ingredients'), 'error') end
end)
                                     
RegisterNetEvent('Polar-Meth:Client:MethBag', function()
    if playeritem(Config.BagItem) and playeritem(Config.MethShardItem) then
    Config.TriggerCallBack('Polar-Meth:Cooldown', function(result) if result then
    Config.TriggerCallBack('Polar-Meth:BagCheck', function(result) if result then
    TriggerServerEvent('Polar-Meth:Server:StopInteract', 'bag')
    TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.MethShardItem)
    TriggerServerEvent('Polar-Meth:Server:RemoveItem', Config.BagItem)
    removetarget('bag', labname)
	RequestAnimDict('anim@amb@business@meth@meth_smash_weight_check@')
	while not HasAnimDictLoaded('anim@amb@business@meth@meth_smash_weight_check@') do Wait(10) end
	RequestModel('bkr_prop_meth_bigbag_04a')
	RequestModel('bkr_prop_meth_bigbag_03a')
	RequestModel('bkr_prop_fakeid_clipboard_01a')
	RequestModel('bkr_prop_meth_openbag_02')
	RequestModel('bkr_prop_fakeid_penclipboard')
	RequestModel('bkr_prop_coke_scale_01')
	RequestModel('bkr_prop_meth_scoop_01a')
	while not HasModelLoaded('bkr_prop_meth_bigbag_04a') and not HasModelLoaded('bkr_prop_meth_bigbag_03a') and not HasModelLoaded('bkr_prop_fakeid_clipboard_01a') and not HasModelLoaded('bkr_prop_meth_openbag_02') and not HasModelLoaded('bkr_prop_fakeid_penclipboard') and not HasModelLoaded('bkr_prop_coke_scale_01') and not HasModelLoaded('bkr_prop_meth_scoop_01a') do 
		Wait(50)
	end
	local animDict = "anim@amb@business@meth@meth_smash_weight_check@"
    SetEntityHeading(PlayerPedId(), 0.86)
	local packageScene = NetworkCreateSynchronisedScene(Config.PackageZone.x-4.72, Config.PackageZone.y-1.64, Config.PackageZone.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene2 = NetworkCreateSynchronisedScene(Config.PackageZone.x-4.72, Config.PackageZone.y-1.64, Config.PackageZone.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene3 = NetworkCreateSynchronisedScene(Config.PackageZone.x-4.72, Config.PackageZone.y-1.64, Config.PackageZone.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene4 = NetworkCreateSynchronisedScene(Config.PackageZone.x-4.72, Config.PackageZone.y-1.64, Config.PackageZone.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	local packageScene5 = NetworkCreateSynchronisedScene(Config.PackageZone.x-4.72, Config.PackageZone.y-1.64, Config.PackageZone.z-0.99, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
	Wait(10)
	local box01 = CreateObject(GetHashKey("bkr_prop_meth_bigbag_04a"), Config.PackageZone, 1, 0, 0)
	local box02 = CreateObject(GetHashKey("bkr_prop_meth_bigbag_03a"), Config.PackageZone, 1, 0, 0)
	local clipboard = CreateObject(GetHashKey("bkr_prop_fakeid_clipboard_01a"), Config.PackageZone, 1, 0, 0)
	local methbag01 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local methbag02 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local methbag03 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local methbag04 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local methbag05 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local methbag06 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local methbag07 = CreateObject(GetHashKey("bkr_prop_meth_openbag_02"), Config.PackageZone, 1, 0, 0)
	local pencil = CreateObject(GetHashKey("bkr_prop_fakeid_penclipboard"), Config.PackageZone, 1, 0, 0)
	local scale = CreateObject(GetHashKey("bkr_prop_coke_scale_01"), Config.PackageZone, 1, 0, 0)
	local scoop = CreateObject(GetHashKey("bkr_prop_meth_scoop_01a"), Config.PackageZone, 1, 0, 0)
	NetworkAddPedToSynchronisedScene(PlayerPedId(), packageScene, animDict, "break_weigh_v3_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(box01, packageScene, animDict, "break_weigh_v3_box01", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(box02, packageScene, animDict, "break_weigh_v3_box01^1", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(clipboard, packageScene, animDict, "break_weigh_v3_clipboard", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag01, packageScene2, animDict, "break_weigh_v3_methbag01", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag02, packageScene2, animDict, "break_weigh_v3_methbag01^1", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag03, packageScene2, animDict, "break_weigh_v3_methbag01^2", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag04, packageScene3, animDict, "break_weigh_v3_methbag01^3", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag05, packageScene3, animDict, "break_weigh_v3_methbag01^4", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag06, packageScene3, animDict, "break_weigh_v3_methbag01^5", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(methbag07, packageScene4, animDict, "break_weigh_v3_methbag01^6", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(pencil, packageScene4, animDict, "break_weigh_v3_pen", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(scale, packageScene4, animDict, "break_weigh_v3_scale", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(scoop, packageScene5, animDict, "break_weigh_v3_scoop", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(packageScene)
	NetworkStartSynchronisedScene(packageScene2)
	NetworkStartSynchronisedScene(packageScene3)
	NetworkStartSynchronisedScene(packageScene4)
	NetworkStartSynchronisedScene(packageScene5)
	--Wait(39800)
    Wait(Config.SceneTime)
	NetworkStopSynchronisedScene(packageScene)
	NetworkStopSynchronisedScene(packageScene2)
	NetworkStopSynchronisedScene(packageScene3)
	NetworkStopSynchronisedScene(packageScene4)
	NetworkStopSynchronisedScene(packageScene5)
	DeleteEntity(box02)
	DeleteEntity(box01)
	DeleteEntity(clipboard)
	DeleteEntity(methbag01)
	DeleteEntity(methbag02)
	DeleteEntity(methbag03)
	DeleteEntity(methbag04)
	DeleteEntity(methbag05)
	DeleteEntity(methbag06)
	DeleteEntity(methbag07)
	DeleteEntity(pencil)
	DeleteEntity(scale)
	DeleteEntity(scoop)
    Wait(150)
    TriggerServerEvent('Polar-Meth:Server:MethAdd', labname)
    TriggerServerEvent('Polar-Meth:Server:StartCooldown', labname)
    else notify(text('busy'), "error") end end, labname)
    else notify(text('cooldown'), "error") end end, labname)
    else notify(text('ingredients'), 'error') end
end)





local unlocked = false

--------------- TELEPORT ----------------------
RegisterNetEvent('Polar-Meth:Client:EnterLab', function(data)
    labname = data.type
    
    Wait(100)
    teleport(Config.ILabCord, Config.ILabHead)
           
       
end)
RegisterNetEvent('Polar-Meth:Client:ExitLab', function(data)
    local where = data.type
    Wait(100)
    teleport(Config.Labs[where].InsideLabCord, Config.Labs[where].InsideLabHead)
      

       
end)


function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function teleport(coord, heading)
    if playeritem(Config.LabKeyCard) then
    local ped = PlayerPedId() loadAnimDict("anim@heists@keycard@") TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(100) if Config.Sound then TriggerServerEvent("InteractSound_SV:PlayOnSource", "LockerOpen", 0.1) end DoScreenFadeOut(800) Wait(1850) SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0) SetEntityHeading(PlayerPedId(), heading) DoScreenFadeIn(900) ClearPedTasks(ped)
    else notify('You Need A Key', 'error') end
end







local number = 0
function percentage()
    while number < 100 do
    number = math.floor((number + 2) * 1.1)
    if number > 100 then TriggerServerEvent('Polar-Meth:Server:StartTargets', labname) notify("Batch Mixed!", "success") break end
    notify('Batch is ' .. number .. '% Mixed', 'success')
    Wait(5000)
    end
end








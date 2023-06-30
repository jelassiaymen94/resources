if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
--==========================================================================
                    -- WEED CONFIG --
--==========================================================================
local processitem = 'wetbud'  -- shit weed
local processitemmid = 'wetbud2'  -- mid weed
local processitemgood = 'wetbud3' -- good weed
local processitemamount = 1 -- amount of weed removed
local drugbagitem = 'drugbag' -- bag item
local drugbagitemamount = 1 -- bag item amount
local ouncetime = 7500
local smalljointtime = 7500
local largejointtime = 7500
--==========================================================================

--==========================================================================
AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
    if Config.Debug then print('Stopping Resource') end
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

local playerPed = PlayerPedId()
local src = source

local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)

local ForceCheck = false
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
function targets()
    exports['qb-target']:AddBoxZone("enter", vector3(2849.3, 4449.72, 48.52), 1, 1, { name = "enter", heading = 0, debug = Config.Debug, minZ =  47.79, maxZ =  49.79,}, 
    { options = {{ event = "Polar-Weed:Client:Enter", icon = "fa-solid fa-cannabis", label = "Enter", excludejob = 'police'}}, distance = 1.5})
    exports['qb-target']:AddBoxZone("exit", vector3(1066.68, -3183.975, -39.03), 1, 1, { name = "exit", heading = 0, debug = Config.Debug, minZ =  -40.00, maxZ =-38.7, }, 
    { options = {{ event = "Polar-Weed:Client:Exit", icon = "fa-solid fa-cannabis", label = "Exit", excludejob = 'police'}}, distance = 1.5 })
    exports['qb-target']:AddBoxZone("storage", vector3(1044.78, -3198.98, -38.45), 1.5, 2.0, { name="storage", heading = 0.0, debugPoly=Config.Debug, minZ=-39.3, maxZ=-37.3},
    { options = {{ event = "Polar-Weed:Client:Stash", icon = "fas fa-box-open", label = 'Open', excludejob = 'police', stash = "Storage", coords = vector3(1044.78, -3198.98, -38.45), }, },  distance = 2.0 })
    exports['qb-target']:AddBoxZone("Process", vector3(1037.4, -3205.92, -38.69), 1, 1, { name = "Process", heading = 0, debug = Config.Debug, minZ = -40.19, maxZ =  -38.19,}, 
    { options = {{ event = "Polar-Weed:Client:Process", icon = "fa-solid fa-cannabis", label = "Process", excludejob = 'police'}}, distance = 1.5 }) 
    exports['qb-target']:AddBoxZone("Divideound", vector3(229.67, -1759.67, 28.53), 1, 1, { name = "DividePound", heading = 0, debug = Config.Debug, minZ = 28, maxZ =  29,}, 
    { options = {{ event = "Polar-Weed:Client:OuncesMake", icon = "fa-solid fa-cannabis", label = "Divide Pound", excludejob = 'police'}}, distance = 1.5 }) 
end
function loadAnimDict(dict) while (not HasAnimDictLoaded(dict)) do RequestAnimDict(dict) Wait(5) end end
RegisterNetEvent('Polar-Weed:Client:Enter', function() enter() end)
RegisterNetEvent('Polar-Weed:Client:Exit', function() exit() end)
function teleport(coord, heading)
    local haslabitem = QBCore.Functions.HasItem(Config.LabKeyCard, Config.LabKeyCardAmount) if Config.Usekey then if haslabitem then
    local ped = PlayerPedId() loadAnimDict("anim@heists@keycard@") TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(100) if Config.Sound then TriggerServerEvent("InteractSound_SV:PlayOnSource", "LockerOpen", 0.1) end DoScreenFadeOut(800) Wait(1850) SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0) SetEntityHeading(PlayerPedId(), heading) DoScreenFadeIn(900) ClearPedTasks(ped)
    else QBCore.Functions.Notify('You Need A Key', red, alerttime) end else if Config.Debug then print('Key not On') end end
end
function enter() Wait(100) teleport(Config.InsideLabCord, Config.InsideLabHead) end
function exit() Wait(100) teleport(Config.OutSideLabCord, Config.OutsideLabHead) end
RegisterNetEvent('Polar-Weed:Client:Stash', function(data)  TriggerServerEvent("inventory:Server:OpenInventory", "stash", ""..data.stash) TriggerEvent("inventory:Client:SetCurrentStash", ""..data.stash) end)
RegisterNetEvent('Polar-Weed:Client:Process', function()
    local low = QBCore.Functions.HasItem(processitem, processitemamount)  local mid = QBCore.Functions.HasItem(processitemmid, processitemamount)  local good = QBCore.Functions.HasItem(processitemgood, processitemamount) 
    if low then pp() elseif mid then pp() elseif good then pp()
    else QBCore.Functions.Notify('You dont have any weed', red, alerttime) if Config.Debug then print('You dont have any weed') end end
end)
function pp()
    FreezeEntityPosition(PlayerPedId(), true)
   -- local drugbatitem = QBCore.Functions.HasItem(drugbagitem, drugbagitemamount) if drugbatitem then if Config.Debug then print('are you in chair?') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Check', function(Check) ForceCheck = Check end) Wait(100) if not ForceCheck then if Config.Debug then print('not in chair') end 
    TriggerServerEvent('Polar-Weed:Server:ForceCheck')
    local heading = 270 local coord =  vector3(1037.4, -3205.92, -37.69) local rotx =  0.85 local roty = 0 local rotz = -1.4 local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_sorting_seated@" RequestAnimDict(animDict) while not HasAnimDictLoaded(animDict) do Wait(10) end
    loadModel("bkr_prop_weed_dry_01a") loadModel("bkr_prop_weed_leaf_01a") loadModel("bkr_prop_weed_bag_01a") loadModel("bkr_prop_weed_bud_02b") loadModel("bkr_prop_weed_bud_02a") loadModel("bkr_prop_weed_bag_pile_01a") loadModel("bkr_prop_weed_bucket_open_01a")
    while not HasModelLoaded("bkr_prop_weed_dry_01a") and not HasModelLoaded("bkr_prop_weed_leaf_01a") and not HasModelLoaded("bkr_prop_weed_bag_01a") and not HasModelLoaded("bkr_prop_weed_bud_02b") and not HasModelLoaded("bkr_prop_weed_bud_02a") and not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and not HasModelLoaded("bkr_prop_weed_bucket_open_01a") do Wait(50) end
    SetEntityHeading(playerPed, heading) Wait(10)
    local packScene = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3) local packScene2 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3) local packScene3 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3) local packScene4 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3) local packScene5 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3) local packScene6 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local dry = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false) local dry2 = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false) local leaf = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false) local leaf2 = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false) local bag = CreateObject(GetHashKey("bkr_prop_weed_bag_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bud = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false) local bud2 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false) local bud3 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false) local bud4 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false) local bud5 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false) local bud6 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud7 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false) local bud8 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false) local bud9 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false) local bag2 = CreateObject(GetHashKey("bkr_prop_weed_bag_pile_01a"), coord.x, coord.y, coord.z, true, false, false) local buck = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false) local buck2 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "sorter_right_sort_v3_sorter02", 1.5, -4.0, 1, 16, 1148846080, 0) NetworkAddEntityToSynchronisedScene(dry, packScene, animDict, "sorter_right_sort_v3_weeddry01a", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(dry2, packScene, animDict, "sorter_right_sort_v3_weeddry01a^1", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(leaf, packScene, animDict, "sorter_right_sort_v3_weedleaf01a", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(leaf2, packScene2, animDict, "sorter_right_sort_v3_weedleaf01a^1", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bag, packScene2, animDict, "sorter_right_sort_v3_weedbag01a", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud, packScene2, animDict, "sorter_right_sort_v3_weedbud02b", 4.0, -8.0, 1)  NetworkAddEntityToSynchronisedScene(bud2, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^1", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud3, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud4, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^3", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud5, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^4", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud6, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^5", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud7, packScene4, animDict, "sorter_right_sort_v3_weedbud02a", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud8, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^1", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bud9, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^2", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(bag2, packScene5, animDict, "sorter_right_sort_v3_weedbagpile01a", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(buck, packScene6, animDict, "sorter_right_sort_v3_bucket01a", 4.0, -8.0, 1) NetworkAddEntityToSynchronisedScene(buck2, packScene6, animDict, "sorter_right_sort_v3_bucket01a^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene) NetworkStartSynchronisedScene(packScene2) NetworkStartSynchronisedScene(packScene3) NetworkStartSynchronisedScene(packScene4) NetworkStartSynchronisedScene(packScene5) NetworkStartSynchronisedScene(packScene6)
    Wait(24000)
    NetworkStopSynchronisedScene(packScene) NetworkStopSynchronisedScene(packScene2) NetworkStopSynchronisedScene(packScene3) NetworkStopSynchronisedScene(packScene4) NetworkStopSynchronisedScene(packScene5) NetworkStopSynchronisedScene(packScene6)
    DeleteEntity(dry) DeleteEntity(dry2) DeleteEntity(leaf) DeleteEntity(leaf2) DeleteEntity(bag) DeleteEntity(bag2) DeleteEntity(bud) DeleteEntity(bud2) DeleteEntity(bud3) DeleteEntity(bud4) DeleteEntity(bud5) DeleteEntity(bud6) DeleteEntity(bud7) DeleteEntity(bud8) DeleteEntity(bud9) DeleteEntity(buck) DeleteEntity(buck2)
    if Config.Debug then print('Finished Sort') end
    TriggerServerEvent('Polar-Weed:Server:UnDoCheck')
    TriggerServerEvent('Polar-Weed:Server:Process', 3)   
    else QBCore.Functions.Notify('This Seat is Taken', red, alerttime) if Config.Debug then print('This Seat is Taken') end end
  --  else QBCore.Functions.Notify('You dont have enough bags', red, alerttime) if Config.Debug then print('You dont have enough bags') end end
    FreezeEntityPosition(PlayerPedId(), false)
end
RegisterNetEvent('Polar-Weed:Client:Joint', function()
    exports['qb-menu']:openMenu({
        { header = "<img src=nui://"..Config.img..QBCore.Shared.Items['largejoint'].image.." width=45px onerror='this.onerror=null; this.remove();'> Joints",
        txt = "", isMenuHeader = true },
        { header = "<img src=nui://"..Config.img..QBCore.Shared.Items['1ozhigh'].image.." width=45px onerror='this.onerror=null; this.remove();'> Small Joint",
        txt = "Roll Some Small Ass Joints (1 Ounce Needed)", params = { event = "Polar-Weed:Client:SmallJointMake",}},
        { header = "<img src=nui://"..Config.img..QBCore.Shared.Items['1ozhigh'].image.." width=45px onerror='this.onerror=null; this.remove();'> Large Joint",
        txt = "Roll Some Large Mf Joints (4 Ounces Needed)", params = { event = "Polar-Weed:Client:LargeJointMake",}},
        { header = "Exit", params = { event = "Polar-Weed:Client:Exitw"}},
    })
end)
RegisterNetEvent('Polar-Weed:Client:LargeJointMake', function() 
    local ped = PlayerPedId() RequestAnimDict('amb@medic@standing@kneel@base') RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while not HasAnimDictLoaded('amb@medic@standing@kneel@base') or not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@') do Wait(0) end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 48, 0, false, false, false) TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)

    QBCore.Functions.Progressbar('w', 'Making Large Joint', smalljointtime, false, true, {
    disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('Polar-Weed:Server:LargeJoints') end)
        ClearPedTasks(PlayerPedId())
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end, function() 
        ClearPedTasks(PlayerPedId())
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
end)
RegisterNetEvent('Polar-Weed:Client:SmallJointMake', function() 
    local ped = PlayerPedId() RequestAnimDict('amb@medic@standing@kneel@base') RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while not HasAnimDictLoaded('amb@medic@standing@kneel@base') or not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@') do Wait(0) end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 48, 0, false, false, false) TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)

    QBCore.Functions.Progressbar('w', 'Making Small Joint', smalljointtime, false, true, {
    disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('Polar-Weed:Server:SmallJoints') end)
        ClearPedTasks(ped)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end, function() 
        ClearPedTasks(ped)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end) 
RegisterNetEvent('Polar-Weed:Client:OuncesMake', function() 
    local ped = PlayerPedId() RequestAnimDict('amb@medic@standing@kneel@base') RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while not HasAnimDictLoaded('amb@medic@standing@kneel@base') or not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@') do Wait(0) end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 48, 0, false, false, false) TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)

    QBCore.Functions.Progressbar('w', 'Making Ounces', ouncetime, false, true, {
    disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('Polar-Weed:Server:Ounces') 
        ClearPedTasks(ped)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end, function() 
        ClearPedTasks(ped)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end)
end)

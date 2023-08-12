
local QBCore = exports['qb-core']:GetCoreObject()

local amount = nil




--============== CONFIG ====================================================================================================================================================




local boxitem = "thermite" -- item for back box

local computeritem = 'hacking_device' -- item to hack computers
local pcitem = 'btc' -- comes from pc completion

local frontdooritem = 'advancedlockpick'


local circleexport = 'Polar-UI' -- https://github.com/Project-Sloth/ps-ui
local voltgame = 'ultra-voltlab' -- https://forum.cfx.re/t/release-voltlab-hacking-minigame-cayo-perico-mission/3933171




--==================================================================================================================================================================



local disabled = true






local gabz = Config.Gabz

local bagcolor = Config.Bag

local oxt = Config.OxTarget -- ox target
local oxdoorname = nil
local oxd = Config.OxDoorlock

local ped = PlayerPedId()
local animDict = nil local model = nil local prop = nil local var = nil local drillpos = nil local drillrot = nil local door = nil local pp = nil local coords = nil local rot = nil local position = nil local item = nil local CurrentCops = 0


local doors = {}
local targets = {}




-- vault stuff
local vaultid = 961976194
local open = -3.1
local closed = 158.92
local vaultloc = vector3(255.23, 223.98, 102.39)

local hi = Config.Debug

function peds()
   
    if Config.Debug then print('starting') end

for i = 1, #Config.Ped do
    exports['qb-target']:SpawnPed({
        model = Config.Ped[i].model,
        coords = Config.Ped[i].coords,
        minusOne = true,
        freeze = true,
        invincible = false,
        blockevents = true,
        scenario =  Config.Ped[i].scenario,
        target = {
            options = {
            {
                type = "Client",
                icon = Config.Ped[i].icon,
                label = Config.Ped[i].label,
                --job = {"mechanic", "tuner", "otto"},
               -- action = function()
               --     TriggerEvent('Polar-Sub:Client:CryptoPartMenu')
               -- end,
                --isserver = true,
                event = 'Polar-Stores:Client:StartStore',
                --item = Config.TraderPeds[i].product,
                --amount = Config.TraderPeds[i].amount,
               -- removeitem = Config.TraderPeds[i].removeitem,
              --  product = Config.Ped[i].product,
                --weapon = {
                --    name = `weapon_carbinerifle`,
                --    ammo = 0,
                --    hidden = false,
                --},
            }
            },
            distance = 2.5,
        },
    })

end
end

local proptable = {
    'storesprop1', 'storesprop2', 'storesprop3', 'storesprop4', 'storesprop5', 'storesprop6', 'storesprop7', 'storesprop8', 'storesprop9', 'storesprop10', 'storesprop11', 'storesprop12','storesprop13', 'storesprop14', 'storesprop15',
    'storesprop16', 'storesprop17',  'storesprop18', 'storesprop19', 'storesprop20', 'storesprop21', 'storesprop22', 'storesprop23', 'storesprop24', 'storesprop25', 'storesprop26','storesprop27', 'storesprop28', 'storesprop29',
    'storesprop30', 'storesprop31', 'storesprop32', 'storesprop33', 'storesprop34', 'storesprop35', 'storesprop36', 'storesprop37', 'storesprop38', 'storesprop39', 'storesprop40', 'storesprop41',
    'storesprop42', 'storesprop43', 'storesprop44', 'storesprop45', 'storesprop46', 'storesprop47', 'storesprop48', 'storesprop49', 'storesprop50',
}


local store = nil

local doortable = {}



AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  TriggerServerEvent('Polar-stores:Server:Restart')  TriggerEvent('Polar-stores:Client:ResetProps') TriggerEvent('Polar-stores:Client:ResetDoors') resetstuff() LocalPlayer.state:set('inv_busy', false, true) end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if hi then print('Starting Targets')  end peds() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if hi then print('Player Loaded Targets Starting') end peds() end)
RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)


local callback = Config.TrigCallBack -- QBCore.Functions.TriggerCallback ESX.TriggerServerCallback
RegisterNetEvent('Polar-Stores:Client:StartStore', function()
    if CurrentCops >= Config.RequiredCops then

        if playeritem(boxitem) then

            callback('Polar-stores:Cooldown', function(result) if result then
                local random = math.random(1,100)
                if random < 101 then store = "Store1" elseif random < 50 then store = 'Store2' elseif random < 75 then store = 'Store3' else store = 'Store4' end
                Wait(500)
                doortable = {
                    Config.Names[store]["Door1Name"],
                    Config.Names[store]["Door2Name"],
                    Config.ComputerName
                
                }

                TriggerServerEvent('Polar-stores:Server:StartCooldown', store)
                TriggerServerEvent('Polar-stores:Server:StartTargets', store)
            else
                notify(text('cooldown'), "error")
            end end)

        else notify(text('noboxitem'), "error") end

    else notify(text('nopolice'), "error") end
end)


local blip = nil
local what = false

RegisterNetEvent('Polar-stores:Client:GrabLoc', function(store)
   
    blip(Config.Names[store]["ComputerEye"])
    



end)




function blip(loc)
    blip = AddBlipForCoord(loc) SetBlipSprite (blip, Config.BlipSprite) SetBlipDisplay(blip, 6) SetBlipScale (blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, Config.BlipColor) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName(Config.BlipName) EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, true)
end

function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end


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

RegisterNetEvent('Polar-stores:Client:AddTarget', function(door, prop, var, handle, pile) 
    if oxt then 
        targets[door] = exports.ox_target:addBoxZone({ coords = vec3(var.x, var.y, var.z), size = vec3(1, 1, 1), rotation = 1, debug = hi,
        options = {{  event = handle, type = door, piles = pile,  icon = "fas fa-bolt", label = "Grab", canInteract = function(_, distance) return distance <= Config.OxTargetDistance end }, } })
       

    else
        exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
        { options = {{ event = handle, type = door, piles = pile, icon = "fas fa-bolt", label = "Grab"}}, distance = 1.0  }) 
    end
end)







function Animation(door)
    local props = doors[door]
    model = bagcolor animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
       
    local playerCoords = GetEntityCoords(PlayerPedId())
            
    local direction = vector3(propCoords.x - playerCoords.x, propCoords.y - playerCoords.y, propCoords.z - playerCoords.z)
    local heading = -math.atan2(direction.x, direction.y) * 180.0 / math.pi
    local pitch = math.asin(direction.z / #(direction)) * 180.0 / math.pi

    local dotProduct = Citizen.InvokeNative(0xBFE95ABAF46CD9B8, direction.x, direction.y, direction.z, 0.0, 0.0, 1.0)
    if dotProduct then else 
   
    SetEntityHeading(PlayerPedId(), heading)
    SetEntityRotation(PlayerPedId(), pitch, 0.0, heading, 2, true)
    
    
    TriggerServerEvent('Polar-stores:Server:TargetRemove', door)
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
    TriggerServerEvent('Polar-stores:Server:RemoveProp', door)
    NetworkStartSynchronisedScene(scene3) Wait(900) ClearPedTasks(PlayerPedId()) DeleteObject(bag) SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true)  
    TriggerServerEvent('Polar-stores:Server:Synapse', door)
            

    RemoveAnimDict(animDict)

    end
end 


RegisterNetEvent('Polar-stores:Client:HackComputer', function(data)
    if playeritem(computeritem) then
        local door = data.id
        callback('Polar-stores:Door' .. door, function(result) if result then 
       
    
    TriggerServerEvent('Polar-stores:Server:StopInteract', door) 
    local chance=math.random(1,100) 

    local time = 60
    TriggerEvent(voltgame, time, function(result,reason)
    if result == 0 then --failed
        if chance < 50 then  TriggerServerEvent('Polar-stores:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-stores:Server:StartInteract', door) 
    elseif result == 1 then --success
        if chance < 50 then  TriggerServerEvent('Polar-stores:Server:RemoveItem', computeritem, 1) end
        Wait(2000)
        TriggerServerEvent('Polar-stores:Server:TargetRemove', door)
        TriggerServerEvent('Polar-stores:Server:RemoveItems', pcitem)
    elseif result == 2 then --time out
        if chance < 50 then  TriggerServerEvent('Polar-stores:Server:RemoveItem', computeritem, 1) end
        TriggerServerEvent('Polar-stores:Server:StartInteract', door) 
    elseif result == -1 then end
    end) 
        else  notify(text('sometingelse'), "error") end end)
    else notify(text('nopcitem'), "error") end
end)






















RegisterNetEvent('Polar-stores:Client:StartLoot', function(store)
   

    Wait(500)
    TriggerServerEvent('Polar-stores:Server:SetStore', store)

    TriggerServerEvent('Polar-stores:Server:SetupGrab1', store)

    TriggerServerEvent('Polar-stores:Server:SetupPickup1', store)

    TriggerServerEvent('Polar-stores:Server:SetupPile1', store)

end)

RegisterNetEvent('Polar-stores:Client:StartTargets', function(store)
    
    CreateTarget(Config.Names[store]["Door1Name"], Config.Names[store]["Door1Eye"], "Polar-stores:Client:Door", "Thermite", "fas fa-fire", Config.Debug)

    CreateTarget(Config.Names[store]["Door2Name"], Config.Names[store]["Door2Eye"], "Polar-stores:Client:Door2", "Thermite", "fas fa-fire", Config.Debug)

    CreateTarget(Config.ComputerName, Config.Names[store]["ComputerEye"], "Polar-stores:Client:HackComputer", "Hack", "fas fa-bolt", Config.Debug)
 
    CreateTarget(Config.Names[store]["RegisterName"], Config.Names[store]["RegisterEye"], "Polar-stores:Client:Register", "Steal", "fas fa-bolt", Config.Debug)
 
    CreateTarget(Config.Names[store]["SafeName"], Config.Names[store]["SafeLocation"], "Polar-stores:Client:Safe", "Steal", "fas fa-bolt", Config.Debug)
 
end)




RegisterNetEvent('Polar-stores:Client:Register', function(data)
    local name = data.id
    callback('Polar-stores:Door' .. name, function(result) if result then 
    TriggerServerEvent('Polar-stores:Server:StopInteract', name)
    exports[circleexport]:Circle(function(success)
        if success then

            QBCore.Functions.Progressbar("door", "Stealing Money ..", math.random(5000, 7500), false, true, {
                disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
                }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
                }, {}, {}, function() 
                    StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                    TriggerServerEvent('Polar-stores:Server:TargetRemove', name)
                    

                end, function() 
                    StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                    TriggerServerEvent('Polar-stores:Server:StartInteract', name)


                end)


           
        else
            TriggerServerEvent('Polar-stores:Server:StartInteract', name)



            



        end
    end, 2, 20)
    else  notify(text('sometingelse'), "error") end end)
end)


RegisterNetEvent('Polar-stores:Client:Door', function(data)
    local name = data.id
    callback('Polar-stores:Door1', function(result) if result then 
        TriggerServerEvent('Polar-stores:Server:StopInteract', name)
        exports[circleexport]:Circle(function(success)
            if success then

                QBCore.Functions.Progressbar("door", "Disabling System ..", math.random(5000, 7500), false, true, {
                    disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
                    }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
                    }, {}, {}, function() 
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        if oxd then doorlock(Config.Names[name]["Door1Name"], false)
                        else 
                        TriggerServerEvent('qb-doorlock:server:updateState', Config.Names[name]["Door1Name"], false, false, false, true, false, false)
                        end
                        CallPolice(GetEntityCoords(PlayerPedId()))
                        TriggerServerEvent('Polar-stores:Server:TargetRemove', name)




                    end, function() 
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        TriggerServerEvent('Polar-stores:Server:StartInteract', name)

                    end)


               
            else


                TriggerServerEvent('Polar-stores:Server:StartInteract', name)

                



            end
        end, 2, 20)

    else  notify(text('sometingelse'), "error") end end)
end)



RegisterNetEvent('Polar-stores:Client:Door2', function(data)
    local name = data.id
    callback('Polar-stores:Door2', function(result) if result then 
        TriggerServerEvent('Polar-stores:Server:StopInteract', name)
        exports[circleexport]:Circle(function(success)
            if success then

                QBCore.Functions.Progressbar("door", "Unlocking Door ..", math.random(5000, 7500), false, true, {
                    disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
                    }, { animDict = "anim@gangops@facility@servers@", anim = "hotwire", flags = 16,
                    }, {}, {}, function() 
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        if oxd then doorlock(Config.Names[name]["Door2Name"], false)
                        else 
                        TriggerServerEvent('qb-doorlock:server:updateState', Config.Names[name]["Door2Name"], false, false, false, true, false, false)
                        end
                        TriggerServerEvent('Polar-stores:Server:TargetRemove', name)



                      
                    end, function() 
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        TriggerServerEvent('Polar-stores:Server:StartInteract', name)

                    end)


               
            else
                TriggerServerEvent('Polar-stores:Server:StartInteract', name)



                



            end
        end, 2, 20)

    else  notify(text('sometingelse'), "error") end end)
end)













function resetstuff()
    doors = {}
    targets = {}

    disabled = true
    for i = 1, 40 do
        if hi then print('setting to nil ' .. i .. ' / 40') end
        _G["storesprop" .. i] = nil
    end
end


RegisterNetEvent('Polar-stores:Client:storesProp', function(door, prop, var) 
    loadModel(prop) 
    doors[door] =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) 
    SetEntityHeading(doors[door], var.w) 
    --print(doors[door])
   
end)





RegisterNetEvent('Polar-stores:Client:RemoveProp', function(door) 
    if hi then print(doors[door]) end
   
            
    if DoesEntityExist(doors[door]) then DeleteEntity(doors[door]) end
end)



RegisterNetEvent('Polar-stores:Client:TargetRemove', function(door) 
    if hi then print(doors[door]) end
    --if targets[door] == nil then return end
    if oxt then 
        exports.ox_target:removeZone(targets[door]) 
    else  
        exports['qb-target']:RemoveZone(door) 
    end
end)

RegisterNetEvent('Polar-stores:Client:Target', function(data)  local p = data.type  Animation(p)  end)

RegisterNetEvent('Polar-stores:Client:ResetProps', function()
    for _, v in ipairs(proptable) do
        if oxt then exports.ox_target:removeZone(targets[v])  else exports['qb-target']:RemoveZone(v) end
        if DoesEntityExist(doors[v]) then DeleteEntity(doors[v]) end
    end
    for _, v in ipairs(doortable) do 
        if oxt then exports.ox_target:removeZone(targets[v])  else exports['qb-target']:RemoveZone(v) end
    end
end)


RegisterNetEvent('Polar-stores:Client:PickupTarget', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    animDict = 'random@domestic'
    local pile = data.piles
    local door = data.type
    local numba = data.number
    if pile then  
        TriggerServerEvent('Polar-stores:Server:TargetRemove', door) 
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('Polar-stores:Server:RemoveProp', door)
        RemoveAnimDict(animDict)
    else
        animDict = 'random@domestic'
        loadAnimDict(animDict) TaskPlayAnim(PlayerPedId(), animDict, 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
        TriggerServerEvent('Polar-stores:Server:TargetRemove', door) 
       
        Wait(500)
        
        AttachEntityToEntity(doors[door], PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58867), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
        Wait(1000) SetEntityVisible(doors[door], false, false)

        TriggerServerEvent('Polar-stores:Server:RemoveProp', door)
        RemoveAnimDict(animDict)
    end
        TriggerServerEvent('Polar-stores:Server:Synapse', door)    
        LocalPlayer.state:set('inv_busy', false, true)
       
end)



RegisterNetEvent('Polar-stores:Client:ResetDoors', function(store)
    if oxd then
        doorlock(Config.Names[store]["Door1Name"], false)
        doorlock(Config.Names[store]["Door2Name"], true)
      
       
    else
    TriggerServerEvent('qb-doorlock:server:updateState', Config.Names[store]["Door1Name"], false, false, false, true, false, false)
    TriggerServerEvent('qb-doorlock:server:updateState', Config.Names[store]["Door2Name"], true, false, false, true, false, false)
   
    end

    store = nil
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







function doorlock(doorId, state)
    TriggerServerEvent('Polar-stores:Doorlock', doorId, state)
end

if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end
local robitem = 'band'
local CurrentCops = 0
local hi = Config.Debug
local oxt = Config.OxTarget
local callback = Config.TrigCallBack
local HackName = Config.HackName

function playeritem(item, amount)
    if Config.Framework == 'qb' then
    return exports['inventory']:HasItem(item, amount)
    else
    if exports.ox_inventory:GetItemCount(item) > 0 then
    return true
    else return false
    end
end
end
  
function notify(what, color)
    if Config.Framework == 'qb' then
        QBCore.Functions.Notify(what, color)
    elseif Config.Framework == 'esx' then
        if color == 'error' then colo = 'r' elseif color == 'success' then colo = 'g' end
        ESX.ShowNotification(what, true, true, colo)
    end
end


RegisterNetEvent('police:SetCopCount', function(amount) CurrentCops = amount end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if hi then print('Player Loaded Targets Starting') end starttarget()  end)
CreateThread(function() if hi then starttarget() end end)
function starttarget()
    if oxt then 
    exports.ox_target:addModel(Config.Atms, {{ name = 'PolarAtms', event = 'Polar-Atms:Client:Start', icon = Config.Icon, label = Config.Label, canInteract = function(_, distance) return distance <= Config.Distance end }})
    else
    exports['qb-target']:AddTargetModel(Config.Atms, { options = { { event = "Polar-Atms:Client:Start", icon = Config.Icon, label = Config.Label},}, distance = Config.Distance, }) 
    end
end



RegisterNetEvent('Polar-Atms:Client:Start', function()
    callback('Polar-Atms:CooldownCheck', function(result) if result then
        if CurrentCops >= Config.MinimumPolice then
            if playeritem(Config.TamperItem) then
                if playeritem(Config.ItemRob) then

                    TriggerServerEvent('Polar-Atms:Server:StartCooldown')
                    local chance = math.random(1,100) if chance >= 50 then TriggerServerEvent('Polar-Atms:Server:RemoveItem', Config.TamperItem, 1) end
                    TriggerServerEvent('Polar-Atms:Server:RemoveItem', Config.ItemRob, 1)
                    alertpolice()
                
                    QBCore.Functions.Progressbar("robatm", "Opening Drawer...", 30000, false, true, {
                    disableMovement = true, disableCarMovement = true,  disableMouse = false, disableCombat = true,
                    },{
                        animDict = 'anim_casino_a@amb@casino@games@arcadecabinet@femaleleft',  anim = 'insert_coins', flags = 16,
                    }, {}, {}, function() -- Done
                        robatm()
                       
                    end, function()
                        notify(text('Canceled'), "error")
                    end)  

                elseif playeritem(Config.CardSwipeItem) then

                    TriggerServerEvent('Polar-Atms:Server:StartCooldown')
                    local chance = math.random(1,100) if chance >= 50 then TriggerServerEvent('Polar-Atms:Server:RemoveItem', Config.TamperItem, 1) end
                    TriggerServerEvent('Polar-Atms:Server:RemoveItem', Config.CardSwipeItem, 1)
                    alertpolice()

                    QBCore.Functions.Progressbar("robatm", "Swipping Card...", 30000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },{
                        animDict = 'missfbi_s4mop',
                        anim = 'swipe_card',
                        flags = 16,
                    }, {}, {}, function()
                        swipecard()
                       
                    end, function()
                        notify(text('Canceled'), "error")
                    end)  
    

                elseif playeritem(Config.HackItem) then

                    TriggerServerEvent('Polar-Atms:Server:StartCooldown')
                    local chance = math.random(1,100) if chance >= 50 then TriggerServerEvent('Polar-Atms:Server:RemoveItem', Config.TamperItem, 1) end
                    TriggerServerEvent('Polar-Atms:Server:RemoveItem', Config.HackItem, 1)
                    alertpolice()
                   
                QBCore.Functions.Progressbar("hackatm", "Connecting To The Mainframe...", 30000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },{
                    animDict = 'mp_missheist_countrybank@enter_code',
                    anim = 'enter_code_loop',
                    flags = 16,
                }, {}, {}, function()
                    hackatm()
                 
                end, function()
                    notify(text('Canceled'), "error")
                end)  

                else notify(text('norobitem'), "error") end
            else notify(text('notamperitem'), "error") end
        else notify(text('nopolice'), "error") end
    else
        notify(text('cooldown'), "error")
    end end)
end)
--------------------------------------------------------------------LVL 1 Robbing -------------------------------------------------------------------------------------


    



   


function robatm()
    exports[HackName]:Scrambler(function(success)
        if success then
            notify('You Cracked open the Drawer', "success") 
            Wait(1000)
            grabitem(robitem, 1)
        else
            notify('The ATMs are now locked', "error") 
        end 
    end, Config.RandomScrambler2[math.random(1, #Config.RandomScrambler2- 1 )], math.random(Config.ScramblerSecondMin2,Config.ScramblerSecondMax2),  math.random(Config.ScramblerMirrorMin2,Config.ScramblerMirrorMax2)) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )  
end

function grabitem(item, amount)
    QBCore.Functions.Progressbar("grab1item", "Grabbing Loose Goods", 30000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,

    },{
        animDict = 'anim@gangops@van@drive_grab@',
        anim = 'grab_drive',
        flags = 16,

    }, {}, {}, function() -- Done
        notify('You Cracked open the Drawer', "success") 
        TriggerServerEvent('Polar-BobCat:Server:RemoveItems', item, amount)
       

    end, function()
        notify('The ATMs are now locked', "error") 


    end)  
end



function hackatm()

    -- getting player id
    local ped = PlayerPedId()
    
    -- location of the player
    local loc = {x,y,z}
    loc.x = vector3(GetEntityCoords(ped)).x
    loc.y = vector3(GetEntityCoords(ped)).y 
    loc.z = vector3(GetEntityCoords(ped)).z + 0.62
    loc.h = vector3(GetEntityRotation(ped))

    ----------- LVL 2 ANIMATION --------------------

    -- animation dictionary
    local animDict = 'anim@heists@ornate_bank@hack'
    RequestAnimDict(animDict)

    -- requesting laptop model
    RequestModel('hei_prop_hst_laptop')

    -- requesting bag model
    RequestModel('hei_p_m_bag_var22_arm_s')

    -- if animation not loaded then wait
    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded('hei_prop_hst_laptop')
        or not HasModelLoaded('hei_p_m_bag_var22_arm_s') do
        Wait(100)
    end

    -- which way the player is rotated
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
    -- bag prop
    SetPedComponentVariation(ped, 5, Config.HideBagID, 1, 1)
    
    local animPos = GetAnimInitialOffsetPosition(animDict, 'hack_enter', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, 'hack_loop', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, 'hack_exit', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), targetPosition, 1, 1, 0)
    local laptop = CreateObject(GetHashKey('hei_prop_hst_laptop'), targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'hack_enter_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, 'hack_enter_laptop', 4.0, -8.0, 1)

    -- hack loop of hacking
    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'hack_loop_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, 'hack_loop_laptop', 4.0, -8.0, 1)

    -- exiting loop
    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'hack_exit_bag', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, 'hack_exit_laptop', 4.0, -8.0, 1)

    Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    QBCore.Functions.Notify('Disable the Security System', 'error')
    Wait(3500)
    
 
        exports[HackName]:VarHack(function(success)
            if success then
                
                notify('The ATMs are now locked', "error") 
                Wait(3500)
               
                exports[HackName]:Scrambler(function(success)
                    if success then
                       
                        Wait(3500)
                        
                        exports[HackName]:Thermite(function(success)
                            if success then
    
                                
                                NetworkStartSynchronisedScene(netScene3)
                                NetworkStopSynchronisedScene(netScene3)
                                DeleteObject(bag)
                                SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                                DeleteObject(laptop)
                                FreezeEntityPosition(ped, false)
                                
    
    
                            
                                Wait(1000)
    
                                
                                grabitem(robitem, 5)
                            else
                                if Config.Debug then print('hack atm function failed') end
                                NetworkStartSynchronisedScene(netScene3)
                                NetworkStopSynchronisedScene(netScene3)
                                DeleteObject(bag)
                                SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                                DeleteObject(laptop)
                                FreezeEntityPosition(ped, false)
                                
                               
    
                            end
                        end, math.random(Config.ThermiteTimeMin,Config.ThermiteTimeMax), math.random(Config.ThermiteGridsizeMin,Config.ThermiteGridsizeMax), math.random(Config.ThermiteIncorrectMin,Config.ThermiteIncorrectMax)) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
                    else
                         if Config.Debug then print('hack atm function failed') end
                        NetworkStartSynchronisedScene(netScene3)
                        NetworkStopSynchronisedScene(netScene3)
                        DeleteObject(bag)
                        SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                        DeleteObject(laptop)
                        FreezeEntityPosition(ped, false)
            
                       
                            end
                        end, Config.RandomScrambler2[math.random(1, #Config.RandomScrambler2- 1 )], math.random(Config.ScramblerSecondMin2,Config.ScramblerSecondMax2),  math.random(Config.ScramblerMirrorMin2,Config.ScramblerMirrorMax2)) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
                       
    
    
            else
                if Config.Debug then print('hack atm function failed') end
                NetworkStartSynchronisedScene(netScene3)
                NetworkStopSynchronisedScene(netScene3)
                DeleteObject(bag)
                SetPedComponentVariation(ped, 5, Config.BagUseID, 0, 1)
                DeleteObject(laptop)
                FreezeEntityPosition(ped, false)
                
              
            end
         end, 5, 8) 
    
    
    
    
    
    
end

function swipecard()
    exports[HackName]:Maze(function(success)
        if success then

            notify('The ATMs are now locked', "error") 
            
         
            grabitem(robitem, 3)

        else

            notify('The ATMs are now locked', "error") 

           

        end
    end, 20)
end



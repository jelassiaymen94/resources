local QBCore = exports[Config.Core]:GetCoreObject()

local sceneCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
local playerPed = PlayerPedId()

local busy = false

local p = nil

local processed = false
local prepared = false
local packaged = false
local grabbed  = false
local bagged = false

local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)
local bar = math.random(4500,5000)

local minigame = false
local level0 = false
local level1 = false
local level2 = false
local level3 = false
local level4 = false
CreateThread(function()
    --traderpeds()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        targets()
        props()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    targets()
    props()
    
end)
function targets()
    exports['qb-target']:AddBoxZone("enterlab2", vector3(387.1, 3584.2, 33.79), 1, 1, {
        name = "enterlab3",
        heading = 0,
             debugPoly = false,
            minZ =  32.79,
            maxZ =  34.79,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Coke:Client:Enter",
                    icon = "fa-solid fa-bolt",
                    label = "Enter",
                }
            },
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("exitlab", vector3(1088.16, -3187.18, -38.85), 1, 1, {
            name = "exitlab",
            heading = 0,
                 debugPoly = false,
                minZ =  -39.00,
                maxZ =-38.7,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Coke:Client:Exit",
                        icon = "fa-solid fa-bolt",
                        label = "Exit",
                    }
                },
                distance = 1.5
            })
end

CreateThread(function()


  
    
    exports['qb-target']:AddTargetModel("h4_prop_bush_cocaplant_01", {
            options = {
                {
                    type = "Client",
                    event = "Polar-Coke:Pick",
                    icon = "fas fa-leaf",
                    label = "Pick",
                },
            },
            distance = 1.5
    })



end)
CreateThread(function()

    exports['qb-target']:AddBoxZone("process1", vector3(1092.95, -3195.19, -39.19), 1, 1, {
        name = "process1",
        heading = 0,
             debugPoly = false,
            minZ = -40.19,
            maxZ =  -38.19,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Coke:Client:Process",
                    icon = "fa-solid fa-bolt",
                    label = "Process",
                }
            },
            distance = 1.5
        })


    
--   1093.94, -3199.58, -39.19 | -1250.8676, -1435.7048, 4.3739 | 3538.2329, 3660.6401, 28.3225
    exports['qb-target']:AddBoxZone("grabIng1", vector3(-1250.1676, -1435.9048, 4.5739), 1, 1, {
        name = "grabIng1",
        heading = 0,
             debugPoly = false,
            minZ =   3.1956,
            maxZ =   5.1956,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Coke:Client:GrabIng",
                    icon = "fa-solid fa-bolt",
                    label = "Grab Ingredients",
                }
            },
            distance = 0.7
        })

    
    exports['qb-target']:AddBoxZone("prepare1", vector3(1086.64, -3196.79, -39.14), 1, 1, {
            name = "prepare1",
            heading = 0,
                debugPoly = false,
                minZ = -39.29,
                maxZ = -38.99,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Coke:Client:PrepareCoke",
                        icon = "fa-solid fa-bolt",
                        label = "Prepare",
                    }
                },
            distance = 1.5
        })


    exports['qb-target']:AddBoxZone("bag1", vector3(1099.46, -3193.66, -39.15), 1, 1, {
                name = "bag1",
                heading = 0,
                    debugPoly = false,
                    minZ = -39.29,
                    maxZ = -38.99,
            }, {
                    options = {
                        {
                            type = "Client",
                            event = "Polar-Coke:Client:Bag",
                            icon = "fa-solid fa-bolt",
                            label = "Bag",
                        }
                    },
            distance = 1.5
        })
    


    
    


   
   
   
      --  props()
    --
   
   

 
   
end)

local processbusy = false
local preparebusy = false
RegisterNetEvent('Polar-Coke:Client:PrepareCoke', function()
    if not preparebusy then
    Wait(150)

    preparecoke()
    else
        sendbusy()
    end
end)

RegisterNetEvent('Polar-Coke:Client:Process', function()
    if not processbusy then
    Wait(150)

    processcoke()
    else
        sendbusy()
    end
end)
local doing = false
RegisterNetEvent('Polar-Coke:Client:GrabIng', function()

    GrabIng()
   

end)

RegisterNetEvent('Polar-Coke:Client:Package', function()
    if not busy then
    Wait(150)
    
    package()
    else
       sendbusy()
    end
end)
RegisterNetEvent('Polar-Coke:Client:Bag', function()
    if not bagbusy then
      
    Wait(150)
    
    bag()

    else
        sendbusy()
    end
end)
function sendbusy()
    if Config.Debug then print('busy') end

    QBCore.Functions.Notify('Youre Busy', red, alerttime)
end
function bag()
    local bag = QBCore.Functions.HasItem(Config.BagItem, Config.BagItemAmount) 
    local toy = QBCore.Functions.HasItem(Config.PackagedItem, Config.PackagedItemAmount) 
    if bag then
        if toy then
            if not bagbusy then
                bagbusy = true
        TriggerServerEvent('Polar-Coke:Server:RemoveBagItem')
        animation()
        QBCore.Functions.Progressbar("bagggg", "Bagging Cocaine...", bar, false, true, {

        -- what is disabled
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,

    },{},{}, {}, function() -- Done

      
        bagbusy = false

        endanimation()

        minigames()
        Wait(1500)
        givestuff()
        
        
        
       

        if Config.Debug then print('finished') end
        reset()
        
        end, function()

            bagbusy = false
        QBCore.Functions.Notify('Canceled', red, alerttime)
       
        endanimation()
        if Config.Debug then print('canceled') end



    end)
else
    sendbusy()
end
    else
        QBCore.Functions.Notify('You Dont have any Powder', red, alerttime)
        if Config.Debug then print('You Dont have any Powder') end
    end
    else
        QBCore.Functions.Notify('You Dont have a Bag', red, alerttime)
        if Config.Debug then print('You Dont have a Bag') end
    end
    
end
function resetprepare()
    
    Wait(Config.CooldownTime)
    
   
    prepared = false
   
    
end
function resetgrabbed()

    Wait(Config.CooldownTime)
    
   
    grabbed = false
   
    
end
function resetpackaged()

    Wait(Config.CooldownTime)
    
   
    packaged = false
   
    
end
function resetprocess()

    Wait(Config.CooldownTime)
    
   
    processed = false
   
    
end


------------- CAMERAS ----
function sortcam()
    if Config.SortUseCam then
        RenderScriptCams(true, false, 0, 1, 0)
        SetCamCoord(sceneCam, 1090.74, -3194.49, -38.99)
        PointCamAtEntity(sceneCam, playerPed, 0.0, 0.0, 0.0, 1)
    else
        if Config.Debug then print('sortcam not On') end
    end
end

function sortcamdelete()
    if Config.SortUseCam then
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(sceneCam, false)
    else
        if Config.Debug then print('No sortcam to Delete') end
    end
end


------------------------------------------------------------------------------------------------------
function processcoke()
    --processbusy = true
    local ing1 =  QBCore.Functions.HasItem(Config.Ing1, Config.Ing1Amount) 
    local ing2 =  QBCore.Functions.HasItem(Config.Ing2, Config.Ing2Amount) 
    local ing3 =  QBCore.Functions.HasItem(Config.Ing3, Config.Ing3Amount) 
    local ing4 =  QBCore.Functions.HasItem(Config.Ing4, Config.Ing4Amount) 
    local hasbreakitem = QBCore.Functions.HasItem(Config.BreakItem, Config.BreakItemAmount) 

   
        if hasbreakitem then
            if ing1 then
                if ing2 then
                    if ing3 then
                        if ing4 then
                            processbusy = true

    if Config.SortUseScene then
   
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@coc@coc_unpack_cut_left@"
    sortcam()
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    RequestModel("bkr_prop_coke_bakingsoda_o")
    RequestModel("prop_cs_credit_card")
    while not HasModelLoaded("prop_cs_credit_card") and not HasModelLoaded("bkr_prop_coke_bakingsoda_o") do Wait(10) end
    SetEntityHeading(playerPed, Config.SortHeading)
    Wait(10)
    local creditcard = CreateObject(GetHashKey("prop_cs_credit_card"), Config.SortZone.x, Config.SortZone.y, Config.SortZone.z, true, false, false)
    local creditcard2 = CreateObject(GetHashKey("prop_cs_credit_card"), Config.SortZone.x, Config.SortZone.y, Config.SortZone.z, true, false, false)
    local bakingsoda = CreateObject(GetHashKey("bkr_prop_coke_bakingsoda_o"), Config.SortZone.x, Config.SortZone.y, Config.SortZone.z, true, false, false)
    local processedcoke = NetworkCreateSynchronisedScene(Config.SortZone.x + Config.X, Config.SortZone.y + Config.Y, Config.SortZone.z + Config.Z, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(playerPed, processedcoke, animDict, "coke_cut_v5_coccutter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(creditcard, processedcoke, animDict, "coke_cut_v5_creditcard", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(creditcard2, processedcoke, animDict, "coke_cut_v5_creditcard^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bakingsoda, processedcoke, animDict, "coke_cut_v5_bakingsoda", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(processedcoke)
    Wait(Config.SortSceneTime)
    NetworkStopSynchronisedScene(processedcoke)
    ClearFocus()
    sortcamdelete()
    DeleteEntity(creditcard)
    DeleteEntity(creditcard2)
    DeleteEntity(bakingsoda)
	
    processbusy = false

    TriggerServerEvent('Polar-Coke:Server:RemoveIngredients')
    
    

    TriggerServerEvent('Polar-Coke:Server:AddPackage')
    resetprocess()
    else

    
    animation()
        QBCore.Functions.Progressbar("sort", "Mixing Ingredients...", bar, false, true, {

        -- what is disabled
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,

    },{},{}, {}, function() -- Done

       
        processbusy = true
        endanimation()

        TriggerServerEvent('Polar-Coke:Server:RemoveIngredients')
        TriggerServerEvent('Polar-Coke:Server:AddPackage')
       

        QBCore.Functions.Notify('Now Process the Cocaine', green, alerttime)
        

        if Config.Debug then print('mixing started') end
        
        
      
        resetprocess()
        end, function()


        QBCore.Functions.Notify('Canceled', red, alerttime)
        processbusy = false
        endanimation()
        if Config.Debug then print('canceled') end



    end)
    end
    
   
    else
        QBCore.Functions.Notify('Youre Missing a Suspicious Package', red, alerttime)
        if Config.Debug then print('Dont have ING4') end
    end
    -- ing3
    else
        QBCore.Functions.Notify('Youre Missing Ingredients', red, alerttime)
        if Config.Debug then print('Dont have ING3') end
    end
        -- ing2
    else
        QBCore.Functions.Notify('Youre Missing Baking Soda', red, alerttime)
        if Config.Debug then print('Dont have ING2') end
    end
        -- ing1
    else
        QBCore.Functions.Notify('Youre Missing Purified Water', red, alerttime)
        if Config.Debug then print('Dont have ING1') end
    end
    else -- if mix is not true
        QBCore.Functions.Notify('You Dont Have a Credit Card', red, alerttime)
    end
   

end
function preparecoke()
 

    local hasknife = QBCore.Functions.HasItem(Config.Can, Config.CanAmount) 
    local hasleaf = QBCore.Functions.HasItem(Config.LeafItem, Config.LeafItemAmount) 
    if hasleaf then
        if hasknife then
            preparebusy = true

        TriggerServerEvent('Polar-Coke:Server:RemoveLeaf')
        animation()
        QBCore.Functions.Progressbar("prepare", "Preparing Leaves...", bar, false, true, {

        -- what is disabled
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,

    },{},{}, {}, function() -- Done

        
        preparebusy = false
        endanimation()
    
       TriggerServerEvent('Polar-Coke:Server:GivePrepare')
       
        QBCore.Functions.Notify('Now Process the Leaves', green, alerttime)
        if Config.Debug then print('prepared') end
        
        
      
        resetprepare()
        end, function()

            preparebusy = false
        QBCore.Functions.Notify('Canceled', red, alerttime)
        prepared = false
        endanimation()
        if Config.Debug then print('canceled') end



        end)
    
    else
        QBCore.Functions.Notify('You Dont have a Jerry Can', red, alerttime)
        if Config.Debug then print('You Dont have a Jerry Can') end
    end
    else
        QBCore.Functions.Notify('You Dont have any Leaves', red, alerttime)
        if Config.Debug then print('You Dont have any Leaves') end
    end










end
function GrabIng()
    if Config.Debug then print('Start Grab') end
   
    
    if not doing then
        doing = true

        animation()



    QBCore.Functions.Progressbar("grabbing", "Grabbing Ingredients...", bar, false, true, {

        -- what is disabled
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,

    },{},{}, {}, function() -- Done

        endanimation()


        
        TriggerServerEvent('Polar-Coke:Server:Check')

        doing = false

        
       
        
      

        if Config.Debug then print('Grabbed Ingredients') end
        
        
      
        
        end, function()

        doing = false

        QBCore.Functions.Notify('Canceled', red, alerttime)
       
        endanimation()

        if Config.Debug then print('canceled') end


        end)

  
    else

        QBCore.Functions.Notify('You are Busy', red, alerttime)

    end
   

end

function time()

    local PlayerData = QBCore.Functions.GetPlayerData()
    local times = PlayerData.metadata["circletime"] or 0
    local ms1 = PlayerData.metadata["circlems"] or 0

    Wait(50)

    if times == 0 then
        times = 10
    end

    if ms1 == 0 then
        ms = 20
    elseif ms1 >= 1 then
        ms = ms1
    end
  
end

local timer = nil 
local ems = nil

function update()

    if times == 10 then
        timer = 9
    elseif times == 9 then
        timer = 8
    elseif times == 8 then
        timer = 7
    elseif times == 7 then
        timer = 6
    elseif times == 6 then
        timer = 5
    end

    if ms == 20 then
        ems = 19
    elseif ms == 19 then
        ems = 18
    elseif ms == 18 then
        ems = 17
    elseif ms == 17 then
        ems = 16
    elseif ms == 16 then
        ems = 15
    elseif ms == 15 then
        ems = 14
    elseif ms == 14 then
        ems = 13
    elseif ms == 13 then
        ems = 12
    elseif ms == 12 then
        ems = 11
    elseif ms == 11 then
        ems = 10
    elseif ms <= 10 then
        ems = 10
    end
    
    print(ems)
    print(timer)
    TriggerServerEvent('Polar-Coke:Server:UpdateMS', ems)
    TriggerServerEvent('Polar-Coke:Server:UpdateTime', timer)
   
end
function minigames()

    time()
    Wait(50)
    update()
    Wait(50)
    animation()
    print(ems)
    print(timer)
    exports['ps-ui']:Circle(function(success)
        if success then
            Wait(250)
            exports['ps-ui']:Circle(function(success)
                if success then
                    Wait(250)
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            Wait(250)
                            exports['ps-ui']:Thermite(function(success)
                                if success then
                                    level4 = true
                                    setminigame()
                                   
                                    endanimation()
                                else
                                    level3 = true
                                    setminigame()
                                   
                                    endanimation()
                                end
                             end, times, 5, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
                        else
                            print("fail")
                        end
                    end, 4, ms) -- NumberOfCircles, MS
                else
                    Wait(250)
                    exports['ps-ui']:Thermite(function(success)
                        if success then
                            level3 = true
                            setminigame()
                            
                            endanimation()
                        else
                            level2 = true
                            setminigame()
                            
                            endanimation()
                        end
                     end, times, 5, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
                end
            end, 4, ms) -- NumberOfCircles, MS
        else
            Wait(250)
            exports['ps-ui']:Circle(function(success)
                if success then
                    Wait(250)
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            level2 = true
                            setminigame()
                            
                            endanimation()
                        else
                            level1 = true
                            setminigame()
                            
                            endanimation()
                        end
                    end, 4, ms) -- NumberOfCircles, MS
                else
                    Wait(250)
                    exports['ps-ui']:Thermite(function(success)
                        if success then
                            level1 = true
                            setminigame()
                           
                        else
                            level0 = true
                            setminigame()
                           
                            endanimation()
                        end
                     end, times, 5, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
                end
            end, 4, ms) -- NumberOfCircles, MS
        end
    end, 4, ms)-- NumberOfCircles, MS
end


function setminigame()

    minigame = true

end
























function package()
    local packageitem = QBCore.Functions.HasItem(Config.PackageItem, Config.PackageItemAmount) 
    
if packageitem then

    if Config.PackageUseScene then
        TriggerServerEvent('Polar-Coke:Server:RemovePackage')
    local Items = {
        'bkr_prop_coke_fullscoop_01a',
        'bkr_prop_coke_doll',
        'bkr_prop_coke_boxedDoll',
        'bkr_prop_coke_dollCast',
        'bkr_prop_coke_dollmould',
        'bkr_prop_coke_fullmetalbowl_02',
        'bkr_prop_coke_press_01b',      
        'bkr_prop_coke_dollboxfolded',
    }
    
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@coc@coc_packing_hi@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    
    RequestModel("bkr_prop_coke_fullscoop_01a")
    RequestModel("bkr_prop_coke_doll")
    RequestModel("bkr_prop_coke_boxedDoll")
    RequestModel("bkr_prop_coke_dollmould")
    RequestModel("bkr_prop_coke_fullmetalbowl_02")
    RequestModel("bkr_prop_coke_press_01b")
    RequestModel("bkr_prop_coke_dollboxfolded")

    
    while not HasModelLoaded("bkr_prop_coke_fullscoop_01a") and not HasModelLoaded("bkr_prop_coke_doll") and not HasModelLoaded("bkr_prop_coke_boxedDoll") and not HasModelLoaded("bkr_prop_coke_dollCast") and not HasModelLoaded("bkr_prop_coke_dollmould") and not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and not HasModelLoaded("bkr_prop_coke_press_01b") and not HasModelLoaded("bkr_prop_coke_dollboxfolded") do Wait(50) end
    SetEntityHeading(playerPed, Config.PackageHeading)
    Wait(10)
    local packScene = NetworkCreateSynchronisedScene(Config.PackageZone.x-7.66, Config.PackageZone.y+2.17, Config.PackageZone.z-1.0, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(Config.PackageZone.x-7.66, Config.PackageZone.y+2.17, Config.PackageZone.z-1.0, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene3 = NetworkCreateSynchronisedScene(Config.PackageZone.x-7.66, Config.PackageZone.y+2.17, Config.PackageZone.z-1.0, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene4 = NetworkCreateSynchronisedScene(Config.PackageZone.x-7.66, Config.PackageZone.y+2.17, Config.PackageZone.z-1.0, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local scoop = CreateObject(GetHashKey("bkr_prop_coke_fullscoop_01a"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local doll = CreateObject(GetHashKey("bkr_prop_coke_doll"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local boxed = CreateObject(GetHashKey("bkr_prop_coke_boxedDoll"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local dollcast = CreateObject(GetHashKey("bkr_prop_coke_dollCast"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local dollcast2 = CreateObject(GetHashKey("bkr_prop_coke_dollCast"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local dollcast3 = CreateObject(GetHashKey("bkr_prop_coke_dollCast"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local dollcast4 = CreateObject(GetHashKey("bkr_prop_coke_dollCast"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local dollmold = CreateObject(GetHashKey("bkr_prop_coke_dollmould"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local bowl = CreateObject(GetHashKey("bkr_prop_coke_fullmetalbowl_02"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local press = CreateObject(GetHashKey("bkr_prop_coke_press_01b"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)
    local box1 = CreateObject(GetHashKey("bkr_prop_coke_dollboxfolded"), Config.PackageZone.x, Config.PackageZone.y, Config.PackageZone.z, true, false, false)

    
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "full_cycle_v3_pressoperator", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(scoop, packScene, animDict, "full_cycle_v3_scoop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(doll, packScene, animDict, "full_cycle_v3_cocdoll", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(boxed, packScene, animDict, "full_cycle_v3_boxedDoll", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dollcast, packScene2, animDict, "full_cycle_v3_dollcast", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dollcast2, packScene2, animDict, "full_cycle_v3_dollCast^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dollcast3, packScene2, animDict, "full_cycle_v3_dollCast^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dollcast4, packScene3, animDict, "full_cycle_v3_dollCast^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dollmold, packScene3, animDict, "full_cycle_v3_dollmould", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bowl, packScene3, animDict, "full_cycle_v3_cocbowl", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(press, packScene4, animDict, "full_cycle_v3_cokePress", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(box1, packScene4, animDict, "full_cycle_v3_FoldedBox", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    NetworkStartSynchronisedScene(packScene3)
    NetworkStartSynchronisedScene(packScene4)
    Wait(Config.PackageSceneTime)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    NetworkStopSynchronisedScene(packScene3)
    NetworkStopSynchronisedScene(packScene4)
   
    DeleteEntity(scoop)
    DeleteEntity(doll)
    DeleteEntity(boxed)
    DeleteEntity(dollcast)
    DeleteEntity(dollcast2)
    DeleteEntity(dollcast3)
    DeleteEntity(dollcast4)
    DeleteEntity(dollmold)
    DeleteEntity(bowl)
    DeleteEntity(press)
    DeleteEntity(box1)

    
    packaged = true
    QBCore.Functions.Notify('Now Bag the Cocaine', green, alerttime)
    
    TriggerServerEvent('Polar-Coke:Server:AddPackaged')
    resetpackaged()
    else
    TriggerServerEvent('Polar-Coke:Server:RemovePackage')
    
    animation()
    QBCore.Functions.Progressbar("sort", "Packaging Cocaine...", bar, false, true, {

    -- what is disabled
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,

    },{},{}, {}, function() -- Done
    
    packaged = true
    TriggerServerEvent('Polar-Coke:Server:AddPackaged')
    endanimation()
    Wait(1000)
    QBCore.Functions.Notify('Now Bag the Cocaine', green, alerttime)
    
   

    if Config.Debug then print('Now Bag the Cocaine') end
    
    
  
    
    end, function()


    QBCore.Functions.Notify('Canceled', red, alerttime)
    packaged = false
    endanimation()
    if Config.Debug then print('canceled') end


    
    end)
end
else
    QBCore.Functions.Notify('You dont have a unpackaged brick', red, alerttime)
    if Config.Debug then print('You dont have a unpackaged brick') end
end
    



end






function reset()

    Wait(Config.CooldownTime)
    
    busy = false
    processed = false
    prepared = false
    packaged = false
    grabbed  = false
    bagged = false
    minigame = false
    level0 = false
    level1 = false
    level2 = false
    level3 = false
    level4 = false
    
end



--------------- TELEPORT ----------------------
RegisterNetEvent('Polar-Coke:Client:Enter', function()




    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:Header', function(islock)
        unlocked = islock
    end)
    if unlocked then
        Wait(100)
        teleport(Config.ILabCord, Config.ILabHead)
      
    else
        local haslabitem = QBCore.Functions.HasItem(Config.LabKeyCard) 
        if Config.UseLab then
            if haslabitem then
            Wait(100)
            teleport(Config.ILabCord, Config.ILabHead)
            TriggerServerEvent('Polar-Meth:Server:Unlock')
        else
            QBCore.Functions.Notify('You Need A Key', red, alerttime)
        end
        else
            QBCore.Functions.Notify('Labs Are not Enabled', red, alerttime)
        end
    end


        
   
        

end)
RegisterNetEvent('Polar-Coke:Client:Exit', function()




    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:Header', function(islock)
        unlocked = islock
    end)
    if unlocked then
        Wait(100)
        teleport(Config.InsideLabCord, Config.InsideLabHead)
      
    else
        local haslabitem = QBCore.Functions.HasItem(Config.LabKeyCard) 
        if Config.UseLab then
            if haslabitem then
            Wait(100)
            teleport(Config.InsideLabCord, Config.InsideLabHead)
            TriggerServerEvent('Polar-Meth:Server:Unlock')
        else
            QBCore.Functions.Notify('You Need A Key', red, alerttime)
        end
        else
            QBCore.Functions.Notify('Labs Are not Enabled', red, alerttime)
        end
    end
       
       
    

end)


function teleport(coord, heading)
  
	DoScreenFadeOut(500)
	Wait(2000)
	SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0)
	SetEntityHeading(PlayerPedId(), heading)
	DoScreenFadeIn(500)
       
end
------------------------------------------------------------------------------------------------------

local use = 0
function uses()
    if use == 0 then
        use = 1
    elseif use == 1 then
        use = 2
    elseif use == 2 then
        use = 3
    end      
end
RegisterNetEvent('Polar-Coke:Client:CokeBill', function()

        local playerPed = PlayerPedId()
        if IsPedSittingInAnyVehicle(playerPed) then
            QBCore.Functions.Notify("Cannot Snort this while inside a vehicle", "error", 3500)
            return
        end
        QBCore.Functions.Progressbar("snort", "Snorting Line...", 9500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "switch@trevor@trev_smoking_meth",
            anim = "trev_smoking_meth_loop",
            flags = 49,
        }, {
            model = "p_cs_joint_01",
            bone = 26610,
            coords = { x = 0.10, y = -0.03, z = 0.00},
            rotation = { x = 0.00, y = 25.0, z = 0.0},
        }, {}, function() -- Done
            uses()
            AddArmourToPed(playerPed, math.random(9, 14))
            Wait(3000)
            TriggerServerEvent('hud:server:RelieveStress', math.random(5, 10)) 
            if use < 3 then
                local chance = math.random(1,100)
                if chance > 25 then
                Effect()
               -- SetPedArmour(playerPed, GetPedArmour(ped) - 25)
                --SetEntityHealth(playerPed, GetEntityHealth(ped) - 25)
                else
                    
                SetPedEyeColor(playerPed, 'all black')
                SetPedArmour(playerPed, 0)
                SetEntityHealth(playerPed, 0)
                AlienEffect()
                QBCore.Functions.Notify('You Overdosed', 'error', 2500)
                if Config.Debug then print('You Overdosed') end

                end
            else
                
                QBCore.Functions.Notify('You Overdosed', 'error', 2500)
                if Config.Debug then print('You Overdosed') end
                SetPedEyeColor(playerPed, 'all black')
                SetPedArmour(playerPed, 0)
                SetEntityHealth(playerPed, 0)
                AlienEffect()

            end
        end, function() -- Cancel
            ClearPedTasks(playerPed)
        end)
   
    
    -------- START OF JOINT 2 ------------
    
   
        local playerPed = PlayerPedId()
        if inJoint then
            inJoint = false
            ClearPedTasks(playerPed)
            TriggerEvent('qb-core:client:HideText')
            
            playAnim("timetable@gardener@smoking_joint", "idle_cough", 2000)
            AddArmourToPed(playerPed, math.random(15, 20))
            Wait(3000)
            TriggerServerEvent('hud:server:RelieveStress', math.random(15, 20))
        end 
   


end)


  


function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    local ped = PlayerPedId()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    SetPedCanRagdoll(ped, true )
    ShakeGameplayCam('DRUNK_SHAKE', 2.80)
    SetTimecycleModifier("Drunk")
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedMotionBlur(ped, true)
    SetPedIsDrunk(ped, true)
    Wait(1500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(13500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(120500)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    AnimpostfxStopAll()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(45000, 60000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end
---- ANIMATIONS -----
function animation()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)

end
function endanimation()
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
end
------------------------------------------------------------------------------------------------------







----------------- GIVE ITEMS ----------------------

function givestuff()

   
  
    if Config.Debug then print('rewards giving') end
    if level0 then
    if Config.Buffs then
        if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
            TriggerServerEvent('Polar-Coke:server:level0buff')
        else
            
            TriggerServerEvent('Polar-Coke:server:level0')
        end
    end
    elseif level1 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
                TriggerServerEvent('Polar-Coke:server:level1buff')
            else
                
                TriggerServerEvent('Polar-Coke:server:level1')
            end
        end
    elseif level2 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
                TriggerServerEvent('Polar-Coke:server:level2buff')
            else
                
                TriggerServerEvent('Polar-Coke:server:level2')
            end
        end
    elseif level3 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
                TriggerServerEvent('Polar-Coke:server:level3buff')
            else
                
                TriggerServerEvent('Polar-Coke:server:level3')
            end
        end
    elseif level4 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
                TriggerServerEvent('Polar-Coke:server:level4buff')
            else
                
                TriggerServerEvent('Polar-Coke:server:level4')
            end
        end



    elseif not minigame then
        QBCore.Functions.Notify('Canceled', red)
    end






end


-------------------------------------------------------------


function needtoprepare()

    QBCore.Functions.Notify('You need to Prepare the ingredients first', red, alerttime)
    if Config.Debug then print('You need to Prepare the ingredients first') end

end
function needtograb()

    QBCore.Functions.Notify('You need to Grab the ingredients first', red, alerttime)
    if Config.Debug then print('You need to Grab the ingredients first') end

end
function needtoprocess()

    QBCore.Functions.Notify('You need to Process the ingredients first', red, alerttime)
    if Config.Debug then print('You need to Process the ingredients first') end

end







function Effect()
    local startStamina = 8
    TrevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            TrevorEffect()
        end
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function TrevorEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Wait(3000)
	StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
	StopScreenEffect("DrugsTrevorClownsFight")
	StopScreenEffect("DrugsTrevorClownsFightIn")
	StopScreenEffect("DrugsTrevorClownsFightOut")
end











function props()
    if Config.UseProps then
   
    ---- TABLE

    local prop = CreateObject(GetHashKey("bkr_prop_coke_powder_02"), vector3(1092.6, -3195.67, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_powder_01"), vector3(1093.18, -3195.67, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_coke_plate2"),vector3(1092.11, -3195.66,  Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_box_01a"),vector3(1096.38, -3195.97, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_doll"),vector3(1094.96, -3196.09, Config.TableHeight), true, false, false) 
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_tablepowder"),vector3(1090.43, -3195.8, Config.TableHeight), true, false, false) 
    local prop =  CreateObject(GetHashKey("h4_prop_h4_coke_stack_01a"),vector3(1095.43, -3195.75, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_cut_01"),vector3(1092.41, -3195.93, Config.TableHeight), true, false, false) 
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_tablepowder"),vector3(1093.16, -3195.78, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_tub_01a"),vector3(1086.24, -3195.12, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_powderedmilk"),vector3(1089.32, -3196.15, Config.TableHeight), true, false, false) 
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_powderedmilk"),vector3(1096.52, -3195.47, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("prop_coke_block_01"),vector3(1086.42, -3198.18, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_powder_02"),vector3(1086.72, -3198.09, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("bkr_coke_plate2"),vector3(1086.66, -3198.28, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("v_med_cor_chemical"),vector3(1086.05, -3198.14, Config.TableHeight), true, false, false)
    local prop =  CreateObject(GetHashKey("ch_prop_calculator_01a"),vector3(1086.55, -3195.74, Config.TableHeight), true, false, false) 


    -- FLOOR
    
   
    local prop =  CreateObject(GetHashKey("ex_office_swag_drugstatue2"),vector3(1096.54, -3199.88, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("bkr_prop_coke_table01a"),vector3(1099.44, -3193.55, Config.Floor), true, false, false)
    local prop =  CreateObject(GetHashKey("ba_prop_battle_coke_doll_bigbox"),vector3(1098.99, -3199.57, Config.Floor), true, false, false)
    local prop =  CreateObject(GetHashKey("ba_prop_battle_coke_block_01a"),vector3(1097.55, -3193.03, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("imp_prop_impexp_coke_trolly"),vector3(1086.95, -3187.6, Config.Floor), true, false, false)
    local prop =  CreateObject(GetHashKey("v_61_bed2_mesh_drugstuff001"),vector3(1086.55, -3189.01, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("ex_office_swag_drugstatue"),vector3(1086.35, -3188.3, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("v_61_bed1_mesh_drugstuff"),vector3(1091.21, -3198.99, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("ex_cash_scatter_03"),vector3(1095.23, -3193.97, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("ch_prop_ch_cashtrolley_01a"),vector3(1103.02, -3197.71, Config.Floor), true, false, false) 
    local prop =  CreateObject(GetHashKey("sf_prop_sf_box_cash_01a"),vector3(1097.07, -3195.64, Config.Floor), true, false, false) 
    

    else
        
        if Config.Debug then print('Props not Enabled') end
    end
end
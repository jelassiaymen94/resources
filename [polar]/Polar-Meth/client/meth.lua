local QBCore = exports[Config.Core]:GetCoreObject()

-- Cooldowns and Spam Preventions

local mix = true
local temp = false
local temp1 = false
local temp2 = false
local temp3 = false
local temp4 = false
local smash = false
local bag = false
local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)
local bar = math.random(10000,12500)
local cooldown = false
local police = false
local percents = false


CreateThread(function()

    -- getting cops
   

  exports['qb-target']:AddBoxZone("methstart", vector3(978.21, -147.2, -48.53), 0.75, 0.75, {
        name = "methstart",
        heading = 0,
            debugPoly = false,
            minZ = -48.53  - 0.15,
            maxZ = -48.53  + 0.15,
        }, {
            options = {
                {
                    type = "client",
                    event = "Polar-Meth:client:Mix",
                    icon = "fa-solid fa-bolt",
                    label = "Mix",
                }
            },
            distance = 1.5
        })
    
   
        exports['qb-target']:AddBoxZone("temp", vector3(982.97, -145.95, -48.7), 1.5, 1.5, {
            name = "temp",
            heading = 0,
                debugPoly = false,
                minZ =  -49.0- 1,
                maxZ =  -49.0 + 1,
            }, {
                options = {
                    {
                        type = "client",
                        event = "Polar-Meth:client:Temperature",
                        icon = "fa-solid fa-bolt",
                        label = "Check Temperature",
                    }
                },
                distance = 1.5
            })


  
        exports['qb-target']:AddBoxZone("smash", vector3(984.7, -140.94, -49.2), 0.5, 0.5, {
            name = "smash",
            heading = 0,
                debugPoly = false,
                minZ =  -49.2- 1,
                maxZ =  -49.2 + 1,
            }, {
                options = {
                    {
                        type = "client",
                        event = "Polar-Meth:client:smash",
                        icon = "fa-solid fa-bolt",
                        label = "Smash Tray",
                    }
                },
                distance = 1.5
            })
        

   
        exports['qb-target']:AddBoxZone("bag", vector3(988.92, -140.77, -49.2), 0.5, 0.5, {
            name = "bag",
            heading = 0,
                debugPoly = false,
                minZ =  -49.2- 1,
                maxZ =  -49.2 + 1,
            }, {
                options = {
                    {
                        type = "client",
                        event = "Polar-Meth:client:bag",
                        icon = "fa-solid fa-bolt",
                        label = "Bag",
                    }
                },
                distance = 1.5
            })

    
        
   

end)

function targets()



    exports['qb-target']:AddBoxZone("enterlab", Config.LabLocation, 0.3, 0.3, {
        name = "enterlab",
        heading = 0,
            debugPoly = false,
            minZ =  35.32- 1,
            maxZ =  37.32 + 1,
        }, {
            options = {
                {
                    type = "client",
                    event = "Polar-Meth:client:enter",
                    icon = "fa-solid fa-bolt",
                    label = "Enter",
                }
            },
            distance = 1.5
        })

        exports['qb-target']:AddBoxZone("exitlab", Config.InsideLabLocation, 0.15, 0.15, {
            name = "exitlab",
            heading = 0,
                debugPoly = false,
                minZ =  -46.0 - 0.15,
                maxZ = -46.0 + 0.15,
            }, {
                options = {
                    {
                        type = "client",
                        event = "Polar-Meth:client:exit",
                        icon = "fa-solid fa-bolt",
                        label = "Exit",
                    }
                },
                distance = 1.5
            })
end
    
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        targets()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    targets()
    
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

RegisterNetEvent('Polar-Meth:client:Mix', function()
    


        mixmeth()
       
   

end)

function animation()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)

end
function endanimation()
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
end

function mixmeth()

    local ing1 =  QBCore.Functions.HasItem(Config.Ing1) 
    local ing2 =  QBCore.Functions.HasItem(Config.Ing2) 
    local ing3 =  QBCore.Functions.HasItem(Config.Ing3) 
    local ing4 =  QBCore.Functions.HasItem(Config.Ing4) 
    


    if not cooldown then 
       
          
                if ing1 then 
                    if ing2 then 
                        if ing3 then 
                            if ing4 then 
                            if Config.Debug then print('mixing progressbar') end

                            -- cooldown
                           


        if not Config.UseScene then

          

            animation()
            QBCore.Functions.Progressbar("mix", "Mixing Ingredients...", bar, false, true, {
    
            -- what is disabled
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,

        },{},

            {}, {}, function() -- Done
                percents = true
                endanimation()
            TriggerServerEvent('Polar-Meth:server:RemoveIngredients')
            QBCore.Functions.Notify('The Mixer Has Started!', green, alerttime)
            if Config.Debug then print('mixing started') end
            
            cooldown = true
            percentage()
            cooldown1()
            end, function()
            QBCore.Functions.Notify('Canceled', red, alerttime)

            endanimation()
            if Config.Debug then print('canceled') end
 
       
           



        end) 
        end
            if Config.UseScene then
            local playerPed = PlayerPedId()
            
            local sceneCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            if Config.UseCam then
            RenderScriptCams(true, false, 0, 1, 0)
            SetCamCoord(sceneCam, 975.15, -143.58, -49.05)
            PointCamAtEntity(sceneCam, playerPed, 0.0, 0.0, 0.0, 1)
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
            NetworkAddPedToSynchronisedScene(playerPed, cookingScene, "anim@amb@business@meth@meth_monitoring_cooking@cooking@", "chemical_pour_short_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
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
            
            percents = true
            TriggerServerEvent('Polar-Meth:server:RemoveIngredients')
            QBCore.Functions.Notify('The Mixer Has Started!', green, alerttime)
            if Config.Debug then print('mixing started') end
            cooldown = true
            percentage()
           
            cooldown1()
            end
           
    
        else
            QBCore.Functions.Notify('Youre Missing Key Ingredient #4', red, alerttime)
        end
    -- ing3
        else
            QBCore.Functions.Notify('Youre Missing Key Ingredient #3', red, alerttime)
        end
            -- ing2
        else
            QBCore.Functions.Notify('Youre Missing Key Ingredient #2', red, alerttime)
        end
            -- ing1
        else
            QBCore.Functions.Notify('Youre Missing the Main Key Ingredient', red, alerttime)
        end

            -- cooldown
       else
           QBCore.Functions.Notify('The Mixer has Overheated', red, alerttime)
        end
  
    end



RegisterNetEvent('Polar-Meth:client:Temperature', function()
    local random2 = math.random(2,10)
    local random = math.random(10,20)
  if not temp then
    if not percents then
    if mix then
        --FreezeEntityPosition(PlayerPedId(), true)
        animation()
        exports['Polar-UI']:Circle(function(success)
            if success then
                QBCore.Functions.Notify('Temperature is Okay', green, alerttime)
                Wait(1000)
                exports['Polar-UI']:Circle(function(success)
                    if success then
                        QBCore.Functions.Notify('Temperature is Decent', green, alerttime)
                        Wait(1000)
                        exports['Polar-UI']:Scrambler(function(success)
                            if success then
                                temp = true
                                QBCore.Functions.Notify('The Temperature is Perfect', green, alerttime)
                                Wait(alerttime)
                                QBCore.Functions.Notify('Now Smash the Tray', green, alerttime)
                                temp4 = true
                                TriggerServerEvent('Polar-Meth:server:TrayAdd')
                            else
                                temp = true
                                QBCore.Functions.Notify('The Temperature is too high!', red, alerttime)
                                Wait(alerttime)
                                QBCore.Functions.Notify('Now Smash the Tray', green, alerttime)
                                temp3 = true
                                TriggerServerEvent('Polar-Meth:server:TrayAdd')
                            end
                        end, Config.RandomScrambler2[math.random(1, #Config.RandomScrambler2- 1 )], math.random(Config.ScramblerSecondMin2 + 1,Config.ScramblerSecondMax2 + 1),  math.random(Config.ScramblerMirrorMin2,Config.ScramblerMirrorMax2)) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
                    else
                        temp = true
                        QBCore.Functions.Notify('The Temperature is too Low!', red, alerttime)
                        Wait(alerttime)
                        QBCore.Functions.Notify('Now Smash the Tray', green, alerttime)
                        temp2 = true
                        TriggerServerEvent('Polar-Meth:server:TrayAdd')
                    end
                end, random2, random) -- NumberOfCircles, MS
            else
                temp = true
                QBCore.Functions.Notify('The Temperature is Way Too High!', red, alerttime)
                Wait(alerttime)
                QBCore.Functions.Notify('Now Smash the Tray', green, alerttime)
                temp1 = true
                TriggerServerEvent('Polar-Meth:server:TrayAdd')
            end
        end, random2, random) -- NumberOfCircles, MS
    else
        QBCore.Functions.Notify('You have to Mix the Ingredients first!', red, alerttime)
    end
      -- cooldown
    else
        QBCore.Functions.Notify('You Need to Wait for Mixing to Finish', red, alerttime)
    end
    else
        QBCore.Functions.Notify('You Already Set the Temperature', red, alerttime)
    end
    
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('Polar-Meth:client:smash', function()
    local hashammer = QBCore.Functions.HasItem(Config.BreakItem) 
    local hastray = QBCore.Functions.HasItem(Config.TrayItem) 
    if hashammer then
    if hastray then
    if not percents then
    if not smash then
    if mix then
    if temp then
        -- shit reward
        animation()
        TriggerServerEvent('Polar-Meth:server:TrayRemove')
        QBCore.Functions.Progressbar("smashing", "Smashing Tray...", bar, false, true, {
    
            -- what is disabled
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,

        },{},
            {}, {}, function() -- Done
            smash = true
            QBCore.Functions.Notify('You Smashed the Tray', green, alerttime)
            Wait(2500)
            QBCore.Functions.Notify('Now Bag the Methamphetamine', green, alerttime)
            endanimation()
            if Config.Debug then print('tray smashed') end
        end, function()
            
            endanimation()
            QBCore.Functions.Notify('Canceled', red)
            if Config.Debug then print('canceled') end
            
       
        
        end)    


   
    else -- if temp is not true
        QBCore.Functions.Notify('You Need to Check the Temperature', red, alerttime)
    end

    else -- if mix is not true
        QBCore.Functions.Notify('You have to Mix the Ingredients first!', red, alerttime)
    end
    else -- if mix is not true
        QBCore.Functions.Notify('You have already Smashed the Meth', red, alerttime)
    end
    else -- if mix is not true
        QBCore.Functions.Notify('You Need to Wait for Mixing to Finish', red, alerttime)
    end
    else -- if mix is not true
        QBCore.Functions.Notify('You Dont Have a Tray', red, alerttime)
    end
    else -- if mix is not true
        QBCore.Functions.Notify('You Dont Have a Hammer', red, alerttime)
    end
end)
                                     
RegisterNetEvent('Polar-Meth:client:bag', function()
    local bagitem = QBCore.Functions.HasItem(Config.BagItem)
if not bag then
    if not percents then
    if mix then
        if temp then
            if smash then
                if bagitem then
                    if Config.Debug then print('start bagging') end
                
            if not Config.UseScene then
            QBCore.Functions.Progressbar("temp1", "Bagging Methamphetamine...", bar, false, true, {
    
                -- what is disabled
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
    
            },{}, {}, {}, function() -- Done
                endanimation()
                givestuff()
                end, function()
                    mix = false
    temp = false
    temp1 = false
    temp2 = false
    temp3 = false
    temp4 = false
    smash = false
    bag = false
    cooldown = false
    percents = false
                    endanimation()
                QBCore.Functions.Notify('Canceled', red)
                if Config.Debug then print('canceled') end
    
           
            
            end) 

            end



           
            if Config.UseScene then
                local playerPed = PlayerPedId()
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
	SetEntityHeading(playerPed, 0.86)
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
	NetworkAddPedToSynchronisedScene(playerPed, packageScene, animDict, "break_weigh_v3_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
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
                givestuff()
                mix = false
                temp = false
                temp1 = false
                temp2 = false
                temp3 = false
                temp4 = false
                smash = false
                bag = false
                cooldown = false
                percents = false
            end













      
        else -- if smash is not true
            QBCore.Functions.Notify('You Need A Bag', red, alerttime)
        end
        else -- if smash is not true
            QBCore.Functions.Notify('You Need to Smash the Tray', red, alerttime)
        end

    
        else -- if temp is not true
            QBCore.Functions.Notify('You Need to Check the Temperature', red, alerttime)
        end
        
       
        else -- if mix is not true
            QBCore.Functions.Notify('You have to Mix the Ingredients first!', red, alerttime)
        end
    else -- if mix is not true
        QBCore.Functions.Notify('You Need to Wait for Mixing to Finish', red, alerttime)
    end
        else -- if mix is not true
            QBCore.Functions.Notify('You Already Bagged the Meth', red, alerttime)
        end
        
end)





local unlocked = false

--------------- TELEPORT ----------------------
RegisterNetEvent('Polar-Meth:client:enter', function()
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
RegisterNetEvent('Polar-Meth:client:exit', function()
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







----------------- GIVE ITEMS ----------------------

function givestuff()

    TriggerServerEvent('Polar-Meth:server:BagItem')
    bag = true
    QBCore.Functions.Notify('You Bagged Methamphetamine', green, alerttime)
    if Config.Debug then print('rewards giving') end
    if temp1 then
    if Config.Buffs then
        if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
    TriggerServerEvent('Polar-Meth:server:reward1luck')
        else
            --QBCore.Functions.Notify('You Bagged 1', green, alerttime)
            TriggerServerEvent('Polar-Meth:server:reward1')
        end
    end
    elseif temp2 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
        TriggerServerEvent('Polar-Meth:server:reward2luck')
            else
                --QBCore.Functions.Notify('You Bagged 2', green, alerttime)
                TriggerServerEvent('Polar-Meth:server:reward2')
            end
        end
    elseif temp3 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
        TriggerServerEvent('Polar-Meth:server:reward3luck')
            else
                --QBCore.Functions.Notify('You Bagged 3', green, alerttime)
                TriggerServerEvent('Polar-Meth:server:reward3')
            end
        end
    elseif temp4 then
        if Config.Buffs then
            if exports['ps-buffs']:HasBuff(Config.LuckBuff) then
        TriggerServerEvent('Polar-Meth:server:reward4luck')
            else
                --QBCore.Functions.Notify('You Bagged 4', green, alerttime)
                TriggerServerEvent('Polar-Meth:server:reward4')
            end
        end
    elseif not temp then
        QBCore.Functions.Notify('Canceled', red)
    end






end











function percentage()
    
    QBCore.Functions.Notify('5% Finished', red)
        Wait(Config.Time)
    QBCore.Functions.Notify('10% Finished', green)
        Wait(Config.Time)
    QBCore.Functions.Notify('15% Finished', red)
        Wait(Config.Time)
    QBCore.Functions.Notify('20% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('25% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('30% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('35% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('40% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('45% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('50% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('55% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('60% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('65% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('70% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('75% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('80% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('85% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('90% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('95% Finished', red)
       Wait(Config.Time)
    QBCore.Functions.Notify('100% Finished', green)
       Wait(Config.Time)
    QBCore.Functions.Notify('Now go to the Temperature Monitor', green, alerttime)
    percents = false
    mix = true
end








function cooldown1()

    cooldown = true
    Wait(Config.PlayerCooldown * 60000)
    
    mix = false
    temp = false
    temp1 = false
    temp2 = false
    temp3 = false
    temp4 = false
    smash = false
    bag = false
    cooldown = false
    percents = false
end
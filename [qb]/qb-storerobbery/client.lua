

QBCore = exports['qb-core']:GetCoreObject()

local currentRegister = 0
local currentSafe = 0
local copsCalled = false
local CurrentCops = 0
local PlayerJob = {}
local SafeCracked = false
local Cracked = false
local openingDoor = false
local finished = false
local modelSpawn = nil

--// THREADS \\ --
CreateThread(function()
    for k, _ in pairs(Config.Safes) do
        exports['qb-target']:AddCircleZone(Config.Safes[k], vector3(Config.Safes[k][1].xyz), 1.0, {
            name = Config.Safes[k],
            debugPoly = false,
        }, {
            options = {
                {
                    type = "client",
                    event = "qb-storerobbery:client:checkmoney",
                    icon = "fas fa-lock",
                    label = "Break Open",
                },
                {
                    type = "client",
                    event = "qb-storerobbery:client:collectsafe",
                    icon = "fas fa-lock",
                    label = "Grab Goods",
                   
                },
            },
            distance = 2.0
        })
    end
end)

CreateThread(function()
    Wait(1000)
    if QBCore.Functions.GetPlayerData().job ~= nil and next(QBCore.Functions.GetPlayerData().job) then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

CreateThread(function()
    while true do
        Wait(1000 * 60 * 2)
        if copsCalled then
            copsCalled = false
        end
    end
end)
--// THREADS \\ --

--// EVENTS \\ --
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)
local cooldown = false
function p(currentRegister)

    local times = math.random(7500,12500)
    Wait(5)

    QBCore.Functions.Progressbar("power_hack", "Grabbing Money...", times, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@heists@ornate_bank@grab_cash_heels",
        anim = "grab",
        flags = 16,
    }, {

       model = "prop_cs_heist_bag_02",
       bone = 57005,
       coords = { x = -0.005, y = 0.00, z = -0.16 },
       rotation = { x = 250.0, y = -30.0, z = 0.0 },


    }, {}, function()
        
        TriggerServerEvent('qb-storerobbery:server:takeMoney', currentRegister, true) 
        StopAnimTask(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0)
		grabmoney(currentRegister)

    end, function()
      
        StopAnimTask(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0)
		
    end)



end
local amount = 0
function grabmoney(currentRegister)

    if amount <  5 then
        print(amount)
        if amount == 0 then
            amount = 1
        elseif amount == 1 then
            amount = 2
        elseif amount == 2 then
            amount = 3
        elseif amount == 3 then
            amount = 4
        elseif amount == 4 then
            amount = 5
        end
       
        p(currentRegister)

    else
        amount = 0
        SetPedComponentVariation((PlayerPedId()), 5, 47, 0, 0)
      
        currentRegister = 0
    end
	  

end
function minigame(currentRegister)
    animation()
    exports['Polar-UI']:Circle(function(success)
        if success then
            print("success")
            if currentRegister ~= 0 then
                TriggerServerEvent('qb-storerobbery:server:setRegisterStatus', currentRegister)
            end
            QBCore.Functions.Notify('Till Lockpicked', "success", 3500)
            endanimation()
            Wait(1000)
            grabmoney(currentRegister)
            
            
        else
           redo()
          
           currentRegister = 0
        end
    end, 5, 60) -- NumberOfCircles, MS

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
function redo()
    QBCore.Functions.Notify('You Dropped the Lockpick', "error", 3500)
   
    QBCore.Functions.Progressbar("crafting", "Setting Up Lockpick Again...  ", 15000, false, true, 
    {disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
    {}, {}, {}, 
    function() -- Done

    
    QBCore.Functions.Notify('Lockpick Setup', "success", 3500)

    minigame()
    
  
    end, function()
    endanimation()
    local chance = math.random(1,100)

    if chance < 25 then
        QBCore.Functions.Notify('You Dropped the Lockpick', "error", 3500)
    elseif chance < 50 then
        QBCore.Functions.Notify('Your Hands Got Sweaty', "error", 3500)
    elseif chance < 75 then
        QBCore.Functions.Notify('Those Gloves give it hard Grip', "error", 3500)
    else
        QBCore.Functions.Notify('You Snapped your Lockpick', "error", 3500)
       
           
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
                TriggerServerEvent('hud:server:gain:stress', math.random(10, 15))
              

    end

   

    end)  


end

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)

    TriggerEvent('Polar-Stores:Client:UseLockpick', isAdvanced)

end)
RegisterNetEvent('Polar-Stores:Client:UseLockpick', function(isAdvanced)
    usingAdvanced = isAdvanced
    if not usingAdvanced then
    QBCore.Functions.TriggerCallback('Polar-Stores:Server:Cooldown', function(CooldownCheck)
        cooldown = CooldownCheck
        end)
        QBCore.Functions.TriggerCallback('Polar-Stores:Server:GetPolice', function(c)
            CurrentCops = c
            end)
            
        if not cooldown then 
            TriggerServerEvent('Polar-Stores:Server:Cooldown2')
            TriggerServerEvent('Polar-Stores:Server:UnCooldown')
    for k, v in pairs(Config.Registers) do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = #(pos - Config.Registers[k][1].xyz)
        if dist <= 1 and not Config.Registers[k].robbed then
          
            if CurrentCops >= Config.MinimumStoreRobberyPolice then
                
                callcops()
                animation()
                QBCore.Functions.Progressbar("crafting", "Setting Up Lockpick...  ", 15000, false, true, 
                {disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
                {}, {}, {}, 
                function() -- Done
                endanimation()
                currentRegister = k
                minigame(currentRegister)
                if not IsWearingHandshoes() then
                    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                end
                end, function()
                endanimation()
                -- cancel notification
                local chance = math.random(1,100)

                if chance < 25 then
                    QBCore.Functions.Notify('You Dropped the Lockpick', "error", 3500)
                elseif chance < 50 then
                    QBCore.Functions.Notify('Your Hands Got Sweaty', "error", 3500)
                elseif chance < 75 then
                    QBCore.Functions.Notify('Those Gloves give it hard Grip', "error", 3500)
                else
                    QBCore.Functions.Notify('You Snapped your Lockpick', "error", 3500)
                  
                       
                            TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
                            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
                            TriggerServerEvent('hud:server:gain:stress', math.random(10, 15))
                          
            
                   
                end
                end)  
            

            else
                QBCore.Functions.Notify("Ask Wade where the Cops at", "error")
            end
        end
    end
    else
        QBCore.Functions.Notify("Ask Wade why the Stores have a Extra Lock", "error")
    end
    end
end)

RegisterNetEvent('qb-storerobbery:client:checkmoney', function()
    TriggerServerEvent('qb-storerobbery:server:CheckItem')
end)

RegisterNetEvent('qb-storerobbery:client:hacksafe', function()
    QBCore.Functions.TriggerCallback('Polar-Stores:Server:GetPolice', function(c)
        CurrentCops = c
        end)
    local pos = GetEntityCoords(PlayerPedId())
        for safe,_ in pairs(Config.Safes) do
        local dist = #(pos - Config.Safes[safe][1].xyz)
        if dist < 1.0 then
            if CurrentCops >= Config.MinimumStoreRobberyPolice then
                if Config.Safes[safe].robbed then
                    QBCore.Functions.Notify("Look's empty!", "error")
                elseif Cracked then
                    QBCore.Functions.Notify("Security lock active!", "error")
                elseif not Config.Safes[safe].robbed then
                    TriggerServerEvent("QBCore:Server:RemoveItem", "safecracker", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["safecracker"], "remove")
                    MemoryGame()
                else
                    QBCore.Functions.Notify("HOW?! Contact a Staff Member", "error")
                end
            else
            QBCore.Functions.Notify("Ask Wade where the Cops at", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-storerobbery:client:collectsafe', function()
    QBCore.Functions.TriggerCallback('Polar-Stores:Server:Unlocked', function(bool)
            u = bool
        if u then
            CollectSafeMoney()
        else
            QBCore.Functions.Notify("Safe isnt Unlocked", "error")
        end
    end)
end)

RegisterNetEvent('qb-storerobbery:client:setRegisterStatus', function(batch, val)
    -- Has to be a better way maybe like adding a unique id to identify the register
    if(type(batch) ~= "table") then
        Config.Registers[batch] = val
    else
        for k, v in pairs(batch) do
            Config.Registers[k] = batch[k]
        end
    end
end)

RegisterNetEvent('qb-storerobbery:client:setSafeStatus', function(safe, bool)
    Config.Safes[safe].robbed = bool
end)

--// EVENTS \\ --


function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true

    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function setupRegister()
    QBCore.Functions.TriggerCallback('qb-storerobbery:server:getRegisterStatus', function(Registers)
        for k, v in pairs(Registers) do
            Config.Registers[k].robbed = Registers[k].robbed
        end
    end)
end

function setupSafes()
    QBCore.Functions.TriggerCallback('qb-storerobbery:server:getSafeStatus', function(Safes)
        for k, v in pairs(Safes) do
            Config.Safes[k].robbed = Safes[k].robbed
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(100)
    end
end



function callcops()
    if not copsCalled then
        copsCalled = true
    exports['ps-dispatch']:StoreRobbery(camId)

    end

end
function MemoryGame()
    local pos = GetEntityCoords(PlayerPedId())
    for safe,_ in pairs(Config.Safes) do

        local dist = #(pos - Config.Safes[safe][1].xyz)

        if dist < 3 then
            if dist < 1.0 then

                if not Config.Safes[safe].robbed and not SafeCracked then
                    if CurrentCops >= Config.MinimumStoreRobberyPolice then

                        currentSafe = safe

                        if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                        end
                        
                     
                           
            local gridSizemin = 30
            local gridSizemax = 30
            local timeLimitmin = 15000
            local timeLimitmax = 17500

            local live = math.random(3,3)

            Wait(5)
            local settings = {gridSize = math.random(gridSizemin,gridSizemax), lives = live, timeLimit = math.random(timeLimitmin,timeLimitmax)}
            Wait(5)

            exports["Polar-Minigames"]:StartMinigame(function(success)
                if success then
                 
                   
                            
              
                                if math.random(1, 100) <= 35 then
                                    TriggerServerEvent('hud:server:gain:stress', math.random(5, 8))
                                end
    
                                Cracked = true
                                copsCalled = false
    
                                if currentSafe ~= 0 then
                                    if not Config.Safes[currentSafe].robbed then
                                            callcops()
                                            QBCore.Functions.Notify("Safe Cracked, Itll unlock in 5 Minutes!")
                                            TriggerServerEvent('Polar-Stores:Server:StartUnlock')
                                        if dist < 50 then
                                            SafeCracked = true
                                            Cracked = false
                                            QBCore.Functions.Notify("Grab the loot", "success")
                                        else
                                            SafeCracked = false
                                            Cracked = false
                                            QBCore.Functions.Notify("Moved too far from the safe!")
                                        end
                                    end
                                end
                                
                            else
                                if math.random(1, 100) <= 75 then
                                    TriggerServerEvent('hud:server:gain:stress', math.random(15, 20))
                                end
    
                                SafeCracked = false
                                Cracked = false
                                QBCore.Functions.Notify("You failed!")
                            end
                       

                  
                end, "path", settings)
                    else
                        QBCore.Functions.Notify("Ask Wade where the Cops at", "error")
                    end
                else
                    QBCore.Functions.Notify("Already Opened", "error")
                end

            end
        end

    end
end
function p1(currentSafe)

    local times = math.random(25000,35500)
    Wait(5)

    QBCore.Functions.Progressbar("power_hack", "Grabbing Money...", times, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@heists@ornate_bank@grab_cash_heels",
        anim = "grab",
        flags = 16,
    }, {

       model = "prop_cs_heist_bag_02",
       bone = 57005,
       coords = { x = -0.005, y = 0.00, z = -0.16 },
       rotation = { x = 250.0, y = -30.0, z = 0.0 },


    }, {}, function()
      
        StopAnimTask(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0)
		grabsafe(currentSafe)

    end, function()
      
        StopAnimTask(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0)
		
    end)



end
local amount = 0
function grabsafe(currentSafe)

    if amount <  5 then
        print(amount)
        if amount == 0 then
            amount = 1
        elseif amount == 1 then
            amount = 2
        elseif amount == 2 then
            amount = 3
        elseif amount == 3 then
            amount = 4
        elseif amount == 4 then
            amount = 5
        end
        TriggerServerEvent("qb-storerobbery:server:SafeReward", currentSafe)
        p1(currentSafe)

    else
        amount = 0
        SetPedComponentVariation((PlayerPedId()), 5, 47, 0, 0)
      
        currentSafe = 0

	  
    end
end
function CollectSafeMoney()
    local pos = GetEntityCoords(PlayerPedId())
    for safe, _ in pairs(Config.Safes) do
        local dist = #(pos - Config.Safes[safe][1].xyz)
        if dist < 3 then
            if dist < 1.0 then
                --if SafeCracked then
                    if CurrentCops >= Config.MinimumStoreRobberyPolice then
                        currentSafe = safe
                        -- // FINGYPRINTS \\ --
                        if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                        end
                        -- // COLLECTION \\ --
                        if currentSafe ~= 0 then
                            --if SafeCracked then
                    
                                TriggerServerEvent("qb-storerobbery:server:setSafeStatus", currentSafe)
                                currentSafe = 0
                                QBCore.Functions.Notify("Grabbed the loot", "success")
                                grabsafe(currentSafe)
                                SafeCracked = false
                                Cracked = false
                            --else
                            --    QBCore.Functions.Notify("It's still locked!", "error")
                            --    SafeCracked = false
                            --    Cracked = false
                           -- end
                        end
                        -- // COLLECTION \\ --
                    else
                        QBCore.Functions.Notify("Ask Wade where the Cops at", "error")
                    end
               -- else
                 --   QBCore.Functions.Notify("The Safe is Locked", "error")
               -- end
            end
        end
    end
end

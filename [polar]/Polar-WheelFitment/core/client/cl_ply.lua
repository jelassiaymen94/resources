local QBCore = exports['qb-core']:GetCoreObject()

local PlayerData = {}
local cfg_wheelFitmentPos = vector3(-194.17, -1327.06, 31.30)
local cfg_wheelFitmentHeading = 92.58
local cfg_framework = 'qb'
local cfg_scanVehicleTimer = 10000
DecorRegister("fox-wheelfitment_applied", 2)
DecorRegister("fox-wheelfitment_w_width", 1)
DecorRegister("fox-wheelfitment_w_fl", 1)
DecorRegister("fox-wheelfitment_w_fr", 1)
DecorRegister("fox-wheelfitment_w_rl", 1)
DecorRegister("fox-wheelfitment_w_rr", 1)

DecorRegister("fox-wheelfitment_w_kf", 1)
DecorRegister("fox-wheelfitment_w_kr", 1)


function getjob()
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
  
    if PlayerJob == 'bennys' then
        return true
    end
end
local boxZone = nil
--[[
cl_ply.lua
]] -- #[Local Variables]#--
local plyVehFitments = {}
local vehiclesToCheckFitment = {}
local didPlyAdjustFitments = false
local performVehicleCheck = true
local isWheelFitmentInUse = false
local currentFitmentsToSet = {width = 0, fl = 0, fr = 0, rl = 0, rr = 0 , kf = 0 ,kr = 0}
local isPlyWhitelisted = true
local inZone = false
local devmode = true

-- #[Local Functions]#--
local function roundNum(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function isNear(pos1, pos2, distMustBe)
    local diff = #(pos2 - pos1)
    return (diff < (distMustBe))
end

-- #[Global Functions]#--
function SyncWheelFitment()
    if isPlyWhitelisted then
        local plyPed = PlayerPedId()
        local plyVeh = GetVehiclePedIsIn(plyPed, false)

        if didPlyAdjustFitments then
            if not DecorExistOn(plyVeh, "fox-wheelfitment_applied") then
                DecorSetBool(plyVeh, "fox-wheelfitment_applied", true)
            end

            DecorSetFloat(plyVeh, "fox-wheelfitment_w_width", roundNum(GetVehicleWheelWidth(plyVeh), 2))
            DecorSetFloat(plyVeh, "fox-wheelfitment_w_fl", roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2))
            DecorSetFloat(plyVeh, "fox-wheelfitment_w_fr", roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2))
            DecorSetFloat(plyVeh, "fox-wheelfitment_w_rl", roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2))
            DecorSetFloat(plyVeh, "fox-wheelfitment_w_rr", roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2))
            
           
            DecorSetFloat(plyVeh, "fox-wheelfitment_w_kf", roundNum(GetVehicleWheelYRotation(plyVeh,0), 2))
            DecorSetFloat(plyVeh, "fox-wheelfitment_w_kr", roundNum(GetVehicleWheelYRotation(plyVeh,2), 2))
           
          

          
                
                local plate = QBCore.Functions.GetPlate(plyVeh)
                QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:saveWheelfitment', function(result)
                end, plate, currentFitmentsToSet)

                didPlyAdjustFitments = false
           
        
                currentFitmentsToSet = {width = 0, fl = 0, fr = 0, rl = 0, rr = 0 , kf = 0 ,kr = 0}
        
                performVehicleCheck = true
        
                checkVehicleFitment()
        
                FreezeEntityPosition(plyVeh, false)
                SetEntityCollision(plyVeh, true, true)
        
                QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:setIsWheelFitmentInUse', function(result)
                   
                end, false)
                
                   
              
                
        
            
            end
                   
                    
    end
end

function AdjustWheelFitment(state, wheel, amount)
    if isPlyWhitelisted then
    
        if amount == -1 then
            amount = -1.00
        elseif amount == 1 then
            amount = 1.00
        elseif amount == 0 then
            amount = 0.00
        end

        if state then
            if wheel == "w_fl" then
                wheel = 0

                currentFitmentsToSet.fl = amount
            elseif wheel == "w_fr" then
                wheel = 1

                currentFitmentsToSet.fr = amount
            elseif wheel == "w_rl" then
                wheel = 2

                currentFitmentsToSet.rl = amount
            elseif wheel == "w_rr" then
                wheel = 3

                currentFitmentsToSet.rr = amount
            elseif wheel == "w_kf" then
                wheel = 0

                currentFitmentsToSet.kf = amount
            elseif wheel == "w_kr" then
                wheel = 2

                currentFitmentsToSet.kr = amount
            end

            



            if not didPlyAdjustFitments then
                didPlyAdjustFitments = true
            end
        else
            if not didPlyAdjustFitments then
                didPlyAdjustFitments = true
            end

            currentFitmentsToSet.width = amount
        end
    end
end

function checkVehicleFitment()
    vehiclesToCheckFitment = {}

    local vehicles = GetGamePool("CVehicle")

    for _, veh in ipairs(vehicles) do
        local plyPed = PlayerPedId()
        local plyPos = GetEntityCoords(plyPed)
       
        if isNear(plyPos, GetEntityCoords(veh), 150) then
           
            if DecorExistOn(veh, "fox-wheelfitment_applied") then
                vehiclesToCheckFitment[#vehiclesToCheckFitment + 1] = {
                    vehicle = veh,
                    w_width = DecorGetFloat(veh, "fox-wheelfitment_w_width"),
                    w_fl = DecorGetFloat(veh, "fox-wheelfitment_w_fl"),
                    w_fr = DecorGetFloat(veh, "fox-wheelfitment_w_fr"),
                    w_rl = DecorGetFloat(veh, "fox-wheelfitment_w_rl"),
                    w_rr = DecorGetFloat(veh, "fox-wheelfitment_w_rr"),
                    w_kf = DecorGetFloat(veh, "fox-wheelfitment_w_kf"),
                    w_kr = DecorGetFloat(veh, "fox-wheelfitment_w_kr"),
                }
            end
        end
    end
end

-- #[Citizen Threads]#--
Citizen.CreateThread(function()
    

   
        QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:getIsWheelFitmentInUse1', function(result) 
        isWheelFitmentInUse = result end)
        QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:checkIfWhitelisted', function(result)
        isPlyWhitelisted = result end)
  


    Wait(100)

     boxZone = BoxZone:Create(cfg_wheelFitmentPos, 4.8, 6.2, {
        name="fox-wheelfitment:zone1",
        offset={0.0, 0.0, 0.0},
        scale={1.0, 1.0, 1.0},
        debugPoly=false,
    })

    boxZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
      
        if isPointInside then
            Citizen.CreateThread(function()
                local plyPed = PlayerPedId()
                inZone = true
                while inZone do
          
                    if IsPedInAnyVehicle(plyPed, false) and not isWheelFitmentInUse and devmode then
                       
                        if not isMenuShowing then
                           
                            local plyPos = GetEntityCoords(plyPed, false)
                            
                           -- DrawMarker(20, cfg_wheelFitmentPos.x, cfg_wheelFitmentPos.y, cfg_wheelFitmentPos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
        
                            if isNear(plyPos, cfg_wheelFitmentPos, 2.0) then
                                
                               
                                    if getjob() then
                                Draw3DText(cfg_wheelFitmentPos.x, cfg_wheelFitmentPos.y, cfg_wheelFitmentPos.z, "[Press ~p~E~w~ - Adjust Wheel Fitment]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                                        
                                if IsControlJustReleased(0, 38) then -- Key: E
                                 
                                    local slider_wWidth = {}
                                    local slider_wfFL = {}
                                    local slider_wfFR = {}
                                    local slider_wfRL = {}
                                    local slider_wfRR = {}
                                    local slider_KF = {}
                                    local slider_KR = {}
                                    local sliderStartPos = {}
                                    local plyVeh = GetVehiclePedIsIn(plyPed, false)
        
                                    performVehicleCheck = false
        
                                    SetEntityCoords(plyVeh, cfg_wheelFitmentPos)
                                    SetEntityHeading(plyVeh, cfg_wheelFitmentHeading)
                                    FreezeEntityPosition(plyVeh, true)
                                    SetEntityCollision(plyVeh, false, true)
                                    
                                   
                                    QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:setIsWheelFitmentInUse', function() end,true)
                                    
                               
        
                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wWidth[#slider_wWidth + 1] = roundNum(i, 2)
        
                                        if math.abs(i - roundNum(GetVehicleWheelWidth(plyVeh), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wWidth
                                        end
                                    end
        
                                    for i = 0.0, -1.56, -0.01 do
                                        slider_wfFL[#slider_wfFL + 1] = roundNum(i, 2)
        
                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 0), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfFL
                                        end
                                    end
        
                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wfFR[#slider_wfFR + 1] = roundNum(i, 2)
        
                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 1), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfFR
                                        end
                                    end
        
                                    for i = 0.0, -1.56, -0.01 do
                                        slider_wfRL[#slider_wfRL + 1] = roundNum(i, 2)
        
                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 2), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfRL
                                        end
                                    end
        
                                    for i = 0.0, 1.56, 0.01 do
                                        slider_wfRR[#slider_wfRR + 1] = roundNum(i, 2)
        
                                        if math.abs(i - roundNum(GetVehicleWheelXOffset(plyVeh, 3), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_wfRR
                                        end
                                    end

                                    for i = 0.0, 0.45, 0.01 do
                                        slider_KF[#slider_KF + 1] = roundNum(i, 2)
        
                                        if math.abs(i - roundNum(GetVehicleWheelYRotation(plyVeh,0), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_KF
                                        end
                                    end

                                    for i = 0.0, -0.45, -0.01 do
                                        slider_KR[#slider_KR + 1] = roundNum(i, 2)
        
                                     
                                        if math.abs(i - roundNum(GetVehicleWheelYRotation(plyVeh,2), 2)) < 0.00000001 then
                                            sliderStartPos[#sliderStartPos + 1] = #slider_KR
                                         
                                        end
                                    end
        
                                    currentFitmentsToSet.width = GetVehicleWheelWidth(plyVeh)
                                    currentFitmentsToSet.fl = GetVehicleWheelXOffset(plyVeh, 0)
                                    currentFitmentsToSet.fr = GetVehicleWheelXOffset(plyVeh, 1)
                                    currentFitmentsToSet.rl = GetVehicleWheelXOffset(plyVeh, 2)
                                    currentFitmentsToSet.rr = GetVehicleWheelXOffset(plyVeh, 3)
                                    currentFitmentsToSet.kf = GetVehicleWheelYRotation(plyVeh,0)
                                    currentFitmentsToSet.kr = GetVehicleWheelYRotation(plyVeh,2)
                                
                                    checkVehicleFitment()
        
                                    DisplayMenu(true, slider_wWidth, slider_wfFL, slider_wfFR, slider_wfRL, slider_wfRR,slider_KF ,slider_KR ,sliderStartPos)
                                    --else
                                    --    QBCore.Functions.Notify('You are not a Mechanic', "error") 
                                    end
                                end
                            end
                        end
                    end
                    Citizen.Wait(0)
                end
            end)
        else
            inZone = false
        end
    end)
  

end)

Citizen.CreateThread(function()
    while true do
        if performVehicleCheck then
            for _, vehData in ipairs(vehiclesToCheckFitment) do
             
                if vehData.vehicle ~= nil and DoesEntityExist(vehData.vehicle) then
                   
                    if GetVehicleWheelWidth(vehData.vehicle) ~=vehData.w_width then
                      SetVehicleWheelWidth(vehData.vehicle, vehData.w_width)
                    end
                    if GetVehicleWheelXOffset(vehData.vehicle, 0) ~= vehData.w_fl then
                       
                        SetVehicleWheelXOffset(vehData.vehicle, 0, vehData.w_fl)
                        SetVehicleWheelXOffset(vehData.vehicle, 1, vehData.w_fr)
                        SetVehicleWheelXOffset(vehData.vehicle, 2, vehData.w_rl)
                        SetVehicleWheelXOffset(vehData.vehicle, 3, vehData.w_rr)
                       
                      
                    end
                    vehData.w_kf = math.abs(vehData.w_kf)
                    SetVehicleWheelYRotation(vehData.vehicle,0,-vehData.w_kf)
                    SetVehicleWheelYRotation(vehData.vehicle,1,vehData.w_kf)
                    SetVehicleWheelYRotation(vehData.vehicle,2,vehData.w_kr)
                    SetVehicleWheelYRotation(vehData.vehicle,3,-vehData.w_kr)
                  

                end
            end
        else
            if isMenuShowing then
            
                local plyPed = PlayerPedId()
                local plyVeh = GetVehiclePedIsIn(plyPed, false)
               
               
                SetVehicleWheelWidth(plyVeh, currentFitmentsToSet.width)
                SetVehicleWheelXOffset(plyVeh, 0, currentFitmentsToSet.fl)
                SetVehicleWheelXOffset(plyVeh, 1, currentFitmentsToSet.fr)
                SetVehicleWheelXOffset(plyVeh, 2, currentFitmentsToSet.rl)
                SetVehicleWheelXOffset(plyVeh, 3, currentFitmentsToSet.rr)
                currentFitmentsToSet.kf = math.abs(currentFitmentsToSet.kf)
                SetVehicleWheelYRotation(plyVeh,0,-currentFitmentsToSet.kf)
                SetVehicleWheelYRotation(plyVeh,1,currentFitmentsToSet.kf)
                SetVehicleWheelYRotation(plyVeh,2,currentFitmentsToSet.kr)
                SetVehicleWheelYRotation(plyVeh,3,-currentFitmentsToSet.kr)
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if performVehicleCheck then
         
            checkVehicleFitment()
        end

        Citizen.Wait(cfg_scanVehicleTimer)
    end
end)









-- #[Event Handlers]#--
RegisterNetEvent("fox-wheelfitment_cl:applySavedWheelFitment")
AddEventHandler("fox-wheelfitment_cl:applySavedWheelFitment", function(wheelFitments, plyVeh)
    performVehicleCheck = false

    wheelFitments.kf = math.abs(wheelFitments.kf)
    
    SetVehicleWheelWidth(plyVeh, wheelFitments.width)
    SetVehicleWheelXOffset(plyVeh, 0, wheelFitments.fl)
    SetVehicleWheelXOffset(plyVeh, 1, wheelFitments.fr)
    SetVehicleWheelXOffset(plyVeh, 2, wheelFitments.rl)
    SetVehicleWheelXOffset(plyVeh, 3, wheelFitments.rr)
    SetVehicleWheelYRotation(plyVeh,0,-wheelFitments.kf)
    SetVehicleWheelYRotation(plyVeh,1,wheelFitments.kf)
    SetVehicleWheelYRotation(plyVeh,2,wheelFitments.kr)
    SetVehicleWheelYRotation(plyVeh,3,-wheelFitments.kr)

    if not DecorExistOn(plyVeh, "fox-wheelfitment_applied") then
        DecorSetBool(plyVeh, "fox-wheelfitment_applied", true)
    end

    DecorSetFloat(plyVeh, "fox-wheelfitment_w_width", wheelFitments.width)
    DecorSetFloat(plyVeh, "fox-wheelfitment_w_fl", wheelFitments.fl)
    DecorSetFloat(plyVeh, "fox-wheelfitment_w_fr", wheelFitments.fr)
    DecorSetFloat(plyVeh, "fox-wheelfitment_w_rl", wheelFitments.rl)
    DecorSetFloat(plyVeh, "fox-wheelfitment_w_rr", wheelFitments.rr)
    DecorSetFloat(plyVeh, "fox-wheelfitment_w_kf", wheelFitments.kf)
    DecorSetFloat(plyVeh, "fox-wheelfitment_w_kr", wheelFitments.kr)


    

    performVehicleCheck = true
    checkVehicleFitment()
end)

RegisterNetEvent("fox-wheelfitment_cl:forceMenuClose")
AddEventHandler("fox-wheelfitment_cl:forceMenuClose", function()
    if isMenuShowing then
        local plyPed = PlayerPedId()
        local plyVeh = GetVehiclePedIsIn(plyPed, false)

        if plyVeh ~= 0 or plyVeh ~= nil then
            SetEntityCoords(plyVeh, cfg_wheelFitmentPos)
            SetEntityHeading(plyVeh, cfg_wheelFitmentHeading)
            FreezeEntityPosition(plyVeh, false)
            SetEntityCollision(plyVeh, true, true)
        end
    end

    QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:setIsWheelFitmentInUse', function() end,false)
    SyncWheelFitment()
    DisplayMenu(false)
end)
RegisterNetEvent('fox-wheelfitment_cl:WidebodyCharger')
AddEventHandler("fox-wheelfitment_cl:WidebodyCharger", function()
    currentFitmentsToSet.width = 1.51
    currentFitmentsToSet.fl = -0.8
    currentFitmentsToSet.fr = 0.8
    currentFitmentsToSet.rl = -0.83
    currentFitmentsToSet.rr = 0.83
    currentFitmentsToSet.kf = 0
    currentFitmentsToSet.kr = 0

    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local plate = QBCore.Functions.GetPlate(plyVeh)
    QBCore.Functions.TriggerCallback('fox-wheelfitment_sv:saveWheelfitment', function(result)
    end, plate, currentFitmentsToSet)

  

    didPlyAdjustFitments = false

   

    performVehicleCheck = true


    TriggerEvent('fox-wheelfitment_cl:applySavedWheelFitment', currentFitmentsToSet, plyVeh)

   -- SetVehicleWheelWidth(plyVeh, currentFitmentsToSet.width)
   -- SetVehicleWheelXOffset(plyVeh, 0, currentFitmentsToSet.fl)
  --  SetVehicleWheelXOffset(plyVeh, 1, currentFitmentsToSet.fr)
  --  SetVehicleWheelXOffset(plyVeh, 2, currentFitmentsToSet.rl)
   -- SetVehicleWheelXOffset(plyVeh, 3, currentFitmentsToSet.rr)
    
    currentFitmentsToSet = {width = 0, fl = 0, fr = 0, rl = 0, rr = 0 , kf = 0 ,kr = 0}
end)
RegisterCommand("leavefitment", function()
    TriggerEvent("fox-wheelfitment_cl:forceMenuClose")
end)
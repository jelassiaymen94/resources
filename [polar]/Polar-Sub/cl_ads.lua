local QBCore = exports['qb-core']:GetCoreObject()

local INPUT_AIM = 0
local INPUT_AIM = 0
local UseFPS = false
local justpressed = 0
local disabled = false
local pressed = 0
local FPS = false
local has = 0
-- this prevents certain camera modes
local disable = 0
CreateThread( function()

  while true do    
    
    Wait(1)
--[[

        if IsControlPressed(0, INPUT_AIM) then
          justpressed = justpressed + 1
        end

        if IsControlJustReleased(0, INPUT_AIM) then
           
        	if justpressed < 15 then
        		UseFPS = true
        	end
        	justpressed = 0
        end

        if GetFollowPedCamViewMode() == 1 or GetFollowVehicleCamViewMode() == 1 then
        	Wait(1)
        	SetFollowPedCamViewMode(0)
        	SetFollowVehicleCamViewMode(0)
        end


        if UseFPS then
        	if GetFollowPedCamViewMode() == 0 or GetFollowVehicleCamViewMode() == 0 then
        		Wait(1)
        		
        		SetFollowPedCamViewMode(4)
        		SetFollowVehicleCamViewMode(4)
        	else
        		Wait(1)
        		
        		SetFollowPedCamViewMode(0)
        		SetFollowVehicleCamViewMode(0)
        	end
    		UseFPS = false
        end
]]
        -- stops melee bs
        if IsPedArmed(ped,1) or not IsPedArmed(ped,7) then
            if IsControlJustPressed(0,24) or IsControlJustPressed(0,141) or IsControlJustPressed(0,142) or IsControlJustPressed(0,140)  then
               disable = 50
            end
        end

        if disable > 0 then
            disable = disable - 1
            DisableControlAction(0,24)
            DisableControlAction(0,140)
            DisableControlAction(0,141)
            DisableControlAction(0,142)
        end


        





  end

end)

CreateThread(function()
    while true do
        Wait(1)
        -- disable weapon smacking
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        else
            Wait(1500)
        end
    end
end)


CreateThread(function()
    while true do 
        Wait(1)

            if IsControlPressed(0, 68) then
                
            pressed = pressed + 1
            has = has + 1
            end
          
           
            

            if IsControlJustPressed(0, 68) then
                FPS = true
                --print(pressed)
              if pressed > 15 then
              
             
              end
              pressed = 0
            end
            
            if FPS then
                FPS = false
                
                if IsPedArmed(PlayerPedId(), 4) then
              --SetFollowPedCamViewMode(4)
                SetFollowVehicleCamViewMode(4)
               
           
               
                end
               -- print(FPS)
                
            end
           
    end
end)
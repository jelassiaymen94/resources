local currentViewMode = 0

local keyName = "UNKNOWN" 
local control = 0 

CreateThread(function()
    while true do
        Wait(100)
        for i = 0, 358 do
            if GetLabelText(GetControlInstructionalButton(0, i, 0)) == "CYCLE_CAMERA" then
                keyName = GetControlInstructionalButton(0, i, 0)
                control = i
                break
            end
        end
        if IsControlJustReleased(0, control) then
            print("Player pressed 'Cycle Camera' keybind (Control: " .. control .. ")")
        end
    end
end)


function mode()
    local player = PlayerPedId()
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()
           -- print(newViewMode)
            if newViewMode ~= 4 then
                if newViewMode == 0 then
                elseif newViewMode ~= 0 then
                    if currentViewMode == 4 then 
                        SetFollowPedCamViewMode(0)
                        currentViewMode = 0
                    elseif currentViewMode == 0 then
                        SetFollowPedCamViewMode(4)
                        currentViewMode = 4
                    end  
                end
            end
        end
    end
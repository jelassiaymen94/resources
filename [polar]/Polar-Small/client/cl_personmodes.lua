local keyName = "UNKNOWN" 
local control = 0 

CreateThread(function()
    while true do
        for i = 0, 358 do
            if GetLabelText(GetControlInstructionalButton(0, i, 0)) == "CYCLE_CAMERA" then
                keyName = GetControlInstructionalButton(0, i, 0)
                control = i
                break
            end
        end
        Wait(10000)
    end
end)
CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustReleased(0, control) then
            local currentMode = GetFollowPedCamViewMode()
            print(currentMode)
            if currentMode ~= 4 then 
                DisableControlAction(0, control, true)
                SetFollowPedCamViewMode(4)
                Wait(100)
                print(GetFollowPedCamViewMode())
                EnableControlAction(0, control, true)
            end
        end
    end
end)
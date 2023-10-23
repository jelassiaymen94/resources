local currentViewMode = 0

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
        if IsControlJustReleased(0, control) then
            mode()
        end
        Wait(10)
    end
end)


function mode()
    local modes = GetFollowPedCamViewMode()
    print(modes)
    if modes ~= 4 then
        SetFollowPedCamViewMode(4)
    end
end
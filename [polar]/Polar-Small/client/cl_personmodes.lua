local currentViewMode = 0

local keyName = "UNKNOWN" 
local control = 0 

CreateThread(function()
    while true do
        Wait(1)
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

local switch = false

function mode()
        local player = PlayerPedId()
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()
            if switch then
                SetFollowPedCamViewMode(0)
                switch = false
            else
                SetFollowPedCamViewMode(4)
                switch = true
            end
        end
end
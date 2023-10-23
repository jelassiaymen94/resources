local currentViewMode = 0

CreateThread(function()
    while true do
        Wait(1)
        local player = PlayerPedId()
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()

            if newViewMode == currentViewMode then
                currentViewMode = (currentViewMode == 4) and 0 or 4
                SetFollowPedCamViewMode(currentViewMode)
            else
                if newViewMode >= 1 and newViewMode <= 3 then
                    currentViewMode = (currentViewMode == 4) and 0 or 4
                    SetFollowPedCamViewMode(currentViewMode)
                else
                    currentViewMode = newViewMode
                end
            end
        end
    end
end)
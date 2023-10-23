local currentViewMode = 0 -- Initial view mode (0 for third-person)

CreateThread(function()
    while true do
        Wait(1)
        local player = PlayerPedId()
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()

            if newViewMode == currentViewMode then
                -- Toggle between view mode 4 (first-person) and view mode 0 (third-person)
                currentViewMode = (currentViewMode == 4) and 0 or 4
                SetFollowPedCamViewMode(currentViewMode)
            else
                currentViewMode = newViewMode
            end
        end
    end
end)
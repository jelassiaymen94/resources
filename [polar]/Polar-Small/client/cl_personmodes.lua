CreateThread(function()
    local currentViewMode = 0  -- Initial view mode (0 for third-person)
    local player = PlayerPedId()
    while true do
        Wait(10)
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()
            if newViewMode ~= currentViewMode then
                SetFollowPedCamViewMode(currentViewMode)
            end
        end
    end
end)
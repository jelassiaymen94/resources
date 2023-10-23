
local currentViewMode = 0 


CreateThread(function()
    while true do
        Wait(10)
        local player = PlayerPedId()
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()
            if newViewMode ~= currentViewMode then
                SetFollowPedCamViewMode(currentViewMode)
            end
        end
    end
end)
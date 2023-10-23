CreateThread(function()
    while true do
        Wait(1)  
        local player = PlayerId()
        local currentViewMode = GetFollowPedCamViewMode()
        if currentViewMode ~= 4 and currentViewMode ~= 2 then
            SetFollowPedCamViewMode(4)
        end
    end
end)
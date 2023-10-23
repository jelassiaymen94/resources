local currentViewMode = 0

CreateThread(function()
    while true do
        Wait(1)
        local player = PlayerPedId()
        if DoesEntityExist(player) and not IsEntityDead(player) then
            local newViewMode = GetFollowPedCamViewMode()
            if newViewMode ~= 0 then
                if newViewMode == 0 then
                elseif newViewMode ~= 4 then
                    if currentViewMode == 4 then 
                        print('set 0')
                        SetFollowPedCamViewMode(0)
                        currentViewMode = 0
                    elseif currentViewMode == 0 then
                        print('set 4')
                        SetFollowPedCamViewMode(4)
                        currentViewMode = 4
                    end  
                end
            end
        end
    end
end)
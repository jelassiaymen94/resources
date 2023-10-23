


local walkStyle = "default"  -- The default walk style to set after firing a gun

CreateThread(function()
    while true do
        Wait(100)
        local player = PlayerPedId()
        
        if DoesEntityExist(player) and not IsEntityDead(player) then
            if IsPedShooting(player) then  -- Check if the player shoots
                if GetPedConfigFlag(player, 59) then
                    print('was shooting')
                    --SetPedConfigFlag(player, 36, true)  -- Reset the walk style
                end
                if GetPedConfigFlag(player, 183) then
                    print('is agitated')
                end
            end
        end
        for i = 0, 457 do
            if GetPedConfigFlag(player, i) then
                print('player flag true = ' .. i)
            end
        end
    end 
end)


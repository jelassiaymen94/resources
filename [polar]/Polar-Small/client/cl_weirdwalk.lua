local lastFlags = {} -- Table to store the last known flag values

CreateThread(function()
    while true do
        Wait(1000)  -- Adjust the check interval as needed

        local player = PlayerId()
        local flagChanged = false

        for i = 0, 457 do
            local flagValue = GetPedConfigFlag(player, i)

            if lastFlags[i] == nil then
                lastFlags[i] = flagValue
            elseif lastFlags[i] ~= flagValue then
                print('Flag ' .. i .. ' changed to ' .. tostring(flagValue))
                lastFlags[i] = flagValue
                flagChanged = true
            end
        end

        if flagChanged then
            -- Handle the case where any flag changed
        end
    end
end)
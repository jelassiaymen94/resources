local playerFlags = {}

CreateThread(function()
    local player = PlayerId()

    for i = 0, 457 do
        if GetPedConfigFlag(player, i) then
            playerFlags[i] = true
        end
    end

    while true do
        Wait(100)  -- Adjust the check interval as needed

        for i = 0, 457 do
            local flagValue = GetPedConfigFlag(player, i)

            if flagValue and not playerFlags[i] then
                playerFlags[i] = true
                print('Flag ' .. i .. ' changed to true')
            elseif not flagValue and playerFlags[i] then
                playerFlags[i] = false
                print('Flag ' .. i .. ' changed to false')
            end
        end
    end
end)
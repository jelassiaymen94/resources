CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if IsPedUsingActionMode(ped) then
            SetPedUsingActionMode(ped, -1, -1, 1)
        end
    end
end)
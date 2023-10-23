Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15)
        local ped = PlayerPedId()
        if IsPedUsingActionMode(ped) then
            SetPedUsingActionMode(ped, -1, -1, 1)
        end
    end
end)
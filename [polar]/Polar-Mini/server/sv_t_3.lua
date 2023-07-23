
--[[CreateThread(function()
    while true do 
    Wait(300000) -- 5 mins
    local whip = GetAllVehicles()
    for _, car in ipairs(whip) do
        local driver = GetPedInVehicleSeat(car, -1)
        if not IsPedAPlayer(driver) then DeleteEntity(car) end
    end
    end
end)]]

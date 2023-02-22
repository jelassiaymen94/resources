local QBCore = exports['qb-core']:GetCoreObject()

--[[
CreateThread( function()
    while true do 
        Wait( 0 )
        local ped = GetPlayerPed()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local speed = GetEntitySpeed(vehicle)
            if ped then
                if math.floor(speed*3.1) == 276 then
                    cruise = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(), false))
                    SetEntityMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(), false), cruise)
                end
            end
        end
end)]]
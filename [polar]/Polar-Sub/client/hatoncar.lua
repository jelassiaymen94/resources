local QBCore = exports['qb-core']:GetCoreObject()
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        start()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    start()
    
end)
local lastVehicle = nil

CreateThread(function()
    while true do
        Wait(0)
        
        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
            if vehicle ~= lastVehicle then
                lastVehicle = vehicle
                local var = GetPedPropIndex(ped, 0)
                print(var)
                Wait(50)
                SetPedPropIndex(ped, 0, var, 0, 2)
            end
        else
            lastVehicle = nil
        end
    end
end)


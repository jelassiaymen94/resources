local QBCore = exports['qb-core']:GetCoreObject()
local inBenny = false

CreateThread(function()
    while true do
        Wait(1000)
        if not IsPedInAnyVehicle(PlayerPedId()) and inBenny then         
            exports['qb-radialmenu']:AddOption(5)
        end
    end
end)

RegisterNetEvent("Polar-Bennys:client:repair", function()
    SendNUIMessage({sound = "wrench", volume = 0.5})
    QBCore.Functions.Progressbar("repair_car", "Repairing Vehicle...", 15000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('iens:repaira')
        TriggerEvent('vehiclemod:client:fixEverything')
    end)
end)
local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent("Polar-Bennys:Client:Repair", function()
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







local Downbenny = PolyZone:Create({
    vector2(789.39, -835.61),
    vector2(789.39, -771.21),
    vector2(851.52, -771.21),
    vector2(851.52, -835.61)
  }, {
	debugPoly=false,
    name="downbenny",
    --minZ = 30.89,
    --maxZ = 31.06,
})

Downbenny:onPlayerInOut(function(isPointInside)
    if isPointInside then
       
        if IsPedInAnyVehicle(PlayerPedId()) then 
            pp = exports['qb-radialmenu']:AddOption( {
                id = 'downbenny',
                title = 'Repair',
                icon = 'bolt',
                type = 'server',
                --job = 'police',
                event = 'Polar-Bennys:Server:Repair',
                shouldClose = true
            }, pp)
        end
    else
       
        exports['qb-radialmenu']:RemoveOption(pp)
    end
end)
local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    shops()
end)

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



local pp = nil
local ppe = nil

function shops()


local paleto = PolyZone:Create({
    vector2(109.85, 6614.02),
    vector2(122.35, 6624.62),
    vector2(111.36, 6634.47),
    vector2(99.24, 6622.35)
  }, {
	debugPoly=false,
    name="paletobenny",
    --minZ = 30.89,
    --maxZ = 31.06,
})

paleto:onPlayerInOut(function(isPointInside)
    if isPointInside then
      
        if IsPedInAnyVehicle(PlayerPedId(), false) then 
            pp = exports['qb-radialmenu']:AddOption( {
                id = 'paletobenny',
                title = 'Repair',
                icon = 'bolt',
                type = 'server',
                --job = 'police',
                event = 'Polar-Bennys:Server:Repair',
                shouldClose = true
            }, pp)
        end
    else
        if pp == nil then return end
        exports['qb-radialmenu']:RemoveOption(pp)
    end
end)






local sandybenny = PolyZone:Create({
    vector2(1168.56, 2647.73),
    vector2(1168.94, 2627.65),
    vector2(1193.56, 2629.55),
    vector2(1192.42, 2647.35)
  }, {
	debugPoly=false,
    name="sandy",
    --minZ = 30.89,
    --maxZ = 31.06,
})

sandybenny:onPlayerInOut(function(isPointInside)
    if isPointInside then
      
        if IsPedInAnyVehicle(PlayerPedId(), false) then 
            ppe = exports['qb-radialmenu']:AddOption( {
                id = 'sandy',
                title = 'Repair',
                icon = 'bolt',
                type = 'server',
                --job = 'police',
                event = 'Polar-Bennys:Server:Repair',
                shouldClose = true
            }, ppe)
        end
    else
        if ppe == nil then return end
        exports['qb-radialmenu']:RemoveOption(ppe)
    end
end)


end
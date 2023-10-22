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
    vector2(90.15, 6602.65),
    vector2(104.55, 6589.77),
    vector2(121.97, 6604.92),
    vector2(106.44, 6617.80)
  }, {
	debugPoly=false,
    name="paletobenny",
    --minZ = 30.89,
    --maxZ = 31.06,
})

paleto:onPlayerInOut(function(isPointInside)
    if isPointInside then
       print('paleto')
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
    vector2(1170.08, 2637.12),
    vector2(1170.83, 2623.11),
    vector2(1190.91, 2623.11),
    vector2(1189.39, 2637.50)
  }, {
	debugPoly=false,
    name="sandy",
    --minZ = 30.89,
    --maxZ = 31.06,
})

sandybenny:onPlayerInOut(function(isPointInside)
    if isPointInside then
       print('sandy')
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
local QBCore = exports["qb-core"]:GetCoreObject()



local inHelicopter = false
CreateThread(function()
    while true do
        if IsPedInAnyVehicle(PlayerPedId(),false) and not inHelicopter then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local class = GetVehicleClass(veh)
            if class == 15 or class == 16 then
                inHelicopter = true
                SetAudioSubmixEffectParamInt(0, 0, `enabled`, 1)
            end
        end
        if not IsPedInAnyVehicle(PlayerPedId(), false) and inHelicopter then
            inHelicopter = false
            SetAudioSubmixEffectParamInt(0, 0, `enabled`, 0)
        end
        Wait(500)
    end
end)

QBCore = exports['qb-core']:GetCoreObject()

local busy = false
RegisterNetEvent("Polar-Crafting:Client:Busy", function() busy = false end)

RegisterNetEvent('Polar-Crafting:Client:Transfer', function(data)
    if not busy then
        busy = true
        TriggerServerEvent('Polar-Crafting:Server:Hitup', data)
    else
        QBCore.Functions.Notify('Youre Busy', 'error', 2500)
        if Config.Debug then print('Youre Busy') end
    end
end)


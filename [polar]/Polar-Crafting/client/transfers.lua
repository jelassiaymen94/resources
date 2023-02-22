
QBCore = exports['qb-core']:GetCoreObject()

local busy = false
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()

    if Config.Debug then print('Crafting Script Started') end
    Wait(1500)
    
    
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    
end)


RegisterNetEvent("Polar-Crafting:Client:Busy", function()

    print('unbusy')
    busy = false


end)
RegisterNetEvent('Polar-Crafting:Client:Transfer', function(data)
    if not busy then
        busy = true
    TriggerServerEvent('Polar-Crafting:Server:Hitup', data.item)
    else
        QBCore.Functions.Notify('Youre Busy', 'error', 2500)
        if Config.Debug then print('Youre Busy') end
    end
end)


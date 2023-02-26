local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("sjpill", function(source)
    TriggerClientEvent("Polar-Sub:client:superjump", source)
end)
RegisterNetEvent('Polar-Sub:server:superjump', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('sjpill', 1)
end)
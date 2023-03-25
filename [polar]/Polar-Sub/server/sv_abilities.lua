local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("sjpill", function(source)
    TriggerClientEvent("Polar-Sub:Client:superjump", source)
end)
RegisterNetEvent('Polar-Sub:Server:superjump', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('sjpill', 1)
end)
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('DD-taser:Server:jhkjkl', function()
    local x = QBCore.Functions.GetPlayer(source)
    x.Functions.RemoveItem('taser_cardridge', 1)
end)
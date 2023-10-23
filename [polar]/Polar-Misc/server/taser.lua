local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('taser:server:remove', function()
    local x = QBCore.Functions.GetPlayer(source)
    x.Functions.RemoveItem('taser_cardridge', 1)
end)
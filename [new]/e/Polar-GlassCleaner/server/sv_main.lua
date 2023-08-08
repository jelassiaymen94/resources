local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-GlassCleaner:Server:Pay', function(target)
    if target ~= nil then
        local amount = math.random(20,100)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount, "Window Cleaning")
        TriggerClientEvent('QBCore:Notify', src, "You Got $" .. amount .. " for Cleaning Windows!", "success", 2500)
    end
end)
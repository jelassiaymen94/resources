local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-Mini:Server:SetTruckerExp', function(exp)
    
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local data = Player.PlayerData.metadata["trucker"] or 0
   -- TriggerClientEvent('QBCore:Notify', src, " " .. data .. " is your Total Exp", green, alerttime)
    local pp = (data + exp)
    Player.Functions.SetMetaData('trucker', pp)

end)

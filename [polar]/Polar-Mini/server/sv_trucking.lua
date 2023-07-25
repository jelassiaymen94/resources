local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-Mini:Server:SetTruckerExp', function(exp)
    
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local data = Player.PlayerData.metadata["trucker"] or 0
   -- TriggerClientEvent('QBCore:Notify', src, " " .. data .. " is your Total Exp", green, alerttime)
    local pp = (data + exp)
    Player.Functions.SetMetaData('trucker', pp)

end)



--- PLAYER CHECK


local players = 0

local amount = nil
QBCore.Functions.CreateCallback('Polar-Mini:Server:CheckPlayers', function(source, cb)
	local amount2 = players or 0
    cb(amount2)
end)
RegisterNetEvent('Polar-Mini:Server:Amount', function(amount)
    
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local amount2 = amount + math.random(2,10)
    Player.Functions.AddMoney("cash", amount2)

end)

RegisterNetEvent('Polar-Mini:Server:RemoveJob', function(latest)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob(latest, 0)

end)
RegisterNetEvent('Polar-Mini:Server:GiveJob', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('trucker', 0)

end)

RegisterNetEvent('Polar-Mini:Server:SetPlayerUp', function(amount)

    local amount2 = amount + players

    players = amount2


end)

RegisterNetEvent('Polar-Mini:Server:SetPlayerDown', function(amount)

    local amount2 = players - amount

    players = amount2



end)



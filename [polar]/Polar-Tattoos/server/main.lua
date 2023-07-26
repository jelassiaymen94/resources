local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('Polar-Tattoos:GetPlayerTattoos', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        MySQL.query('SELECT tattoos FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = Player.PlayerData.citizenid
        }, function(result)
            if result[1].tattoos then
                cb(json.decode(result[1].tattoos))
            else
                cb()
            end
        end)
    else
        cb()
    end
end)

QBCore.Functions.CreateCallback('Polar-Tattoos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.money.bank >= price then
        Player.Functions.RemoveMoney('bank', price)
        TriggerClientEvent('QBCore:Notify', source, "You Bought The " .. tattooName .. " Tattoo For $" .. price, "success", 2500)

    table.insert(tattooList, tattoo)

    MySQL.query('UPDATE players SET tattoos = @tattoos WHERE citizenid = @citizenid', {
        ['@tattoos'] = json.encode(tattooList),
        ['@citizenid'] = Player.PlayerData.citizenid
    })

     cb(true)

    TriggerClientEvent('Polar-Tattoos:Client:ApplyTatoo', source, tattoo, tattooList)
    else
        TriggerClientEvent('QBCore:Notify', source, "not enough cash", "error")
    end
end)




RegisterNetEvent("Polar-Tattoos:Server:RemoveTattoo", function(tattooList)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    MySQL.query('UPDATE players SET tattoos = @tattoos WHERE citizenid = @citizenid', {
        ['@tattoos'] = json.encode(tattooList),
        ['@citizenid'] = Player.PlayerData.citizenid
    })
end)




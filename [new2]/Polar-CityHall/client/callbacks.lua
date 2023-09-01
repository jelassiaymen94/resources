RegisterNuiCallback('close', function(data, cb)
    NUI:Close()
    cb('ok')
end)

RegisterNuiCallback('ApplyJob', function(data, cb)
    TriggerServerEvent('Polar-CityHall:server:ApplyJob', data.id)
    cb('ok')
end)

RegisterNuiCallback('BuyIdentity', function(data, cb)
    TriggerServerEvent('Polar-CityHall:server:BuyIdentity', data.id)
    cb('ok')
end)
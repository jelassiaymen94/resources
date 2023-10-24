RegisterCommand("migratehouses", function()
    TriggerServerEvent('housing:server:migratehouses')
end)


lib.callback.register('housing:client:getclientdata', function(data)
    return {
        street = GetStreetNameFromHashKey(GetStreetNameAtCoord(data.coords.x, data.coords.y, data.coords.z)),
        region = GetLabelText(GetNameOfZone(data.coords.x, data.coords.y, data.coords.z))
    }
end)

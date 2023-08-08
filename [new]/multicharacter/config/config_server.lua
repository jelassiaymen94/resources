Config.Slots = 5

Config.EnableStarterItems = false
Config.StarterItems = {
    {name = 'bread', count = 15},
    {name = 'water', count = 15},
}

Config.EnableStarterMoney = false
Config.StarterMoney = {
    {account = 'cash', amount = 1000},
    {account = 'bank', amount = 5000},
}

openSpawnSelector = function(src, cData)
        DoScreenFadeOut(800)
        TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
end
local QBCore = exports[Config.Core]:GetCoreObject()





RegisterNetEvent('Polar-Paleto:Server:SetupPile1', function()
    paletoprop11()
    paletoprop12()
   -- paletoprop13()
   -- paletoprop14()
   -- paletoprop15()
end)





local paletoprop11 = nil
RegisterNetEvent('Polar-Paleto:Server:Setpaletoprop11', function(prop) paletoprop11 = prop end)
RegisterNetEvent('Polar-Paleto:Server:Synapsepaletoprop11', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(paletoprop11)
end)

local paletoprop12 = nil
RegisterNetEvent('Polar-Paleto:Server:Setpaletoprop12', function(prop) paletoprop12 = prop end)
RegisterNetEvent('Polar-Paleto:Server:Synapsepaletoprop12', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(paletoprop12)
end)

local paletoprop13 = nil
RegisterNetEvent('Polar-Paleto:Server:Setpaletoprop13', function(prop) paletoprop13 = prop end)
RegisterNetEvent('Polar-Paleto:Server:Synapsepaletoprop13', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(paletoprop13)
end)

local paletoprop14 = nil
RegisterNetEvent('Polar-Paleto:Server:Setpaletoprop14', function(prop) paletoprop14 = prop end)
RegisterNetEvent('Polar-Paleto:Server:Synapsepaletoprop14', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(paletoprop14)
end)

local paletoprop15 = nil
RegisterNetEvent('Polar-Paleto:Server:Setpaletoprop15', function(prop) paletoprop15 = prop end)
RegisterNetEvent('Polar-Paleto:Server:Synapsepaletoprop15', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(paletoprop15)
end)
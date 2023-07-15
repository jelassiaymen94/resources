if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end





RegisterNetEvent('Polar-Pacific:Server:SetupPile1', function()
    Pacificprop11()
    Pacificprop12()
   -- Pacificprop13()
   -- Pacificprop14()
   -- Pacificprop15()
end)





local Pacificprop11 = nil
RegisterNetEvent('Polar-Pacific:Server:SetPacificprop11', function(prop) Pacificprop11 = prop end)
RegisterNetEvent('Polar-Pacific:Server:SynapsePacificprop11', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(Pacificprop11)
end)

local Pacificprop12 = nil
RegisterNetEvent('Polar-Pacific:Server:SetPacificprop12', function(prop) Pacificprop12 = prop end)
RegisterNetEvent('Polar-Pacific:Server:SynapsePacificprop12', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(Pacificprop12)
end)

local Pacificprop13 = nil
RegisterNetEvent('Polar-Pacific:Server:SetPacificprop13', function(prop) Pacificprop13 = prop end)
RegisterNetEvent('Polar-Pacific:Server:SynapsePacificprop13', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(Pacificprop13)
end)

local Pacificprop14 = nil
RegisterNetEvent('Polar-Pacific:Server:SetPacificprop14', function(prop) Pacificprop14 = prop end)
RegisterNetEvent('Polar-Pacific:Server:SynapsePacificprop14', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(Pacificprop14)
end)

local Pacificprop15 = nil
RegisterNetEvent('Polar-Pacific:Server:SetPacificprop15', function(prop) Pacificprop15 = prop end)
RegisterNetEvent('Polar-Pacific:Server:SynapsePacificprop15', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(Pacificprop15)
end)
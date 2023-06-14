local QBCore = exports[Config.Core]:GetCoreObject()





RegisterNetEvent('Polar-fleeca:Server:SetupPile1', function()
    fleecaprop11()
    fleecaprop12()
   -- fleecaprop13()
   -- fleecaprop14()
   -- fleecaprop15()
end)





local fleecaprop11 = nil
RegisterNetEvent('Polar-fleeca:Server:Setfleecaprop11', function(prop) fleecaprop11 = prop end)
RegisterNetEvent('Polar-fleeca:Server:Synapsefleecaprop11', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(fleecaprop11)
end)

local fleecaprop12 = nil
RegisterNetEvent('Polar-fleeca:Server:Setfleecaprop12', function(prop) fleecaprop12 = prop end)
RegisterNetEvent('Polar-fleeca:Server:Synapsefleecaprop12', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(fleecaprop12)
end)

local fleecaprop13 = nil
RegisterNetEvent('Polar-fleeca:Server:Setfleecaprop13', function(prop) fleecaprop13 = prop end)
RegisterNetEvent('Polar-fleeca:Server:Synapsefleecaprop13', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(fleecaprop13)
end)

local fleecaprop14 = nil
RegisterNetEvent('Polar-fleeca:Server:Setfleecaprop14', function(prop) fleecaprop14 = prop end)
RegisterNetEvent('Polar-fleeca:Server:Synapsefleecaprop14', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(fleecaprop14)
end)

local fleecaprop15 = nil
RegisterNetEvent('Polar-fleeca:Server:Setfleecaprop15', function(prop) fleecaprop15 = prop end)
RegisterNetEvent('Polar-fleeca:Server:Synapsefleecaprop15', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(fleecaprop15)
end)
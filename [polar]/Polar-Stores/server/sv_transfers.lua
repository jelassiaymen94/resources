
local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent('Polar-stores:Server:SetupGrab1', function()
    storesprop1()
    storesprop2()
    storesprop3()
    storesprop4()
    storesprop5()
end)


RegisterNetEvent('Polar-stores:Server:SetupPickup1', function()
    storesprop6()
    storesprop7()
    storesprop8()
    storesprop9()
    storesprop10()
end)





RegisterNetEvent('Polar-stores:Server:SetupPile1', function()
    storesprop11()
end)






local props = {}

RegisterNetEvent('Polar-stores:Server:SetstoresProp', function(door, prop) props[door] = prop end)
RegisterNetEvent('Polar-stores:Server:Synapse', function(door)  local src = source local Player = QBCore.Functions.GetPlayer(src)
   if Config.Debug then print(door) print(props[door]) end
    hiya(props[door])
end)












local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent('Polar-stores:Server:SetupGrab1', function(store)
    storesprop1(store)
    storesprop2(store)
    storesprop3(store)
    storesprop4(store)
    storesprop5(store)
end)


RegisterNetEvent('Polar-stores:Server:SetupPickup1', function(store)
    storesprop6(store)
    storesprop7(store)
    storesprop8(store)
    storesprop9(store)
    storesprop10(store)
end)





RegisterNetEvent('Polar-stores:Server:SetupPile1', function(store)
    storesprop11(store)
end)






local props = {}

RegisterNetEvent('Polar-stores:Server:SetstoresProp', function(door, prop) props[door] = prop end)
RegisterNetEvent('Polar-stores:Server:Synapse', function(door)  local src = source local Player = QBCore.Functions.GetPlayer(src)
   if Config.Debug then print(door) print(props[door]) end
    hiya(props[door])
end)











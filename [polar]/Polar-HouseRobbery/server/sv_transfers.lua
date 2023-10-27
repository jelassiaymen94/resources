
local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent('Polar-HouseRobbery:Server:SetupGrab1', function(house)
    print('setup grab')
    houseprop1(house)
    houseprop2(house)
    houseprop3(house)
    houseprop4(house)
    houseprop5(house)
end)

RegisterNetEvent('Polar-HouseRobbery:Server:SetupPickup1', function(house)
    print('setup pickup')
    houseprop6(house)
    houseprop7(house)
    houseprop8(house)
    houseprop9(house)
    houseprop10(house)
end)









local props = {}

RegisterNetEvent('Polar-HouseRobbery:Server:SetHouseProp', function(door, prop) props[door] = prop end)
RegisterNetEvent('Polar-HouseRobbery:Server:Synapse', function(door)  local src = source local Player = QBCore.Functions.GetPlayer(src)
   if Config.Debug then print(door) print(props[door]) end
    hiya(props[door])
end)











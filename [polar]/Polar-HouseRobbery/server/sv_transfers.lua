
local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent('Polar-HouseRobbery:Server:SetupGrab1', function(house)
    houseprop1(house)
    houseprop2(house)
    houseprop3(house)
    houseprop4(house)
    houseprop5(house)

    houseprop21(house)
    houseprop22(house)
    houseprop23(house)
    houseprop24(house)
    houseprop25(house)
end)

RegisterNetEvent('Polar-HouseRobbery:Server:SetupPickup1', function(house)
    houseprop6(house)
    houseprop7(house)
    houseprop8(house)
    houseprop9(house)
    houseprop10(house)

    houseprop16(house)
    houseprop17(house)
   -- houseprop18(house)
    --houseprop19(house)
   -- houseprop20(house)
end)



RegisterNetEvent('Polar-HouseRobbery:Server:SetupPiles1', function(house)
    houseprop11(house)
    houseprop12(house)
    houseprop13(house)
    houseprop14(house)
    houseprop15(house)

 --   houseprop26(house)
 --   houseprop27(house)
 --   houseprop28(house)
 --   houseprop29(house)
 --   houseprop30(house)
end)






local props = {}

RegisterNetEvent('Polar-HouseRobbery:Server:SetHouseProp', function(name, prop) props[name] = prop end)
RegisterNetEvent('Polar-HouseRobbery:Server:Synapse', function(name)  local src = source local Player = QBCore.Functions.GetPlayer(src)
   if Config.Debug then print(name) print(props[name]) end
    hiya(props[name])
end)











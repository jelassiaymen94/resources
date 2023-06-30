if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end





RegisterNetEvent('Polar-BobCat:Server:SetupPile1', function()
    BobCatprop11()
    BobCatprop12()
   -- BobCatprop13()
   -- BobCatprop14()
   -- BobCatprop15()
end)





local BobCatprop11 = nil
RegisterNetEvent('Polar-BobCat:Server:SetBobCatprop11', function(prop) BobCatprop11 = prop end)
RegisterNetEvent('Polar-BobCat:Server:SynapseBobCatprop11', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(BobCatprop11)
end)

local BobCatprop12 = nil
RegisterNetEvent('Polar-BobCat:Server:SetBobCatprop12', function(prop) BobCatprop12 = prop end)
RegisterNetEvent('Polar-BobCat:Server:SynapseBobCatprop12', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(BobCatprop12)
end)

local BobCatprop13 = nil
RegisterNetEvent('Polar-BobCat:Server:SetBobCatprop13', function(prop) BobCatprop13 = prop end)
RegisterNetEvent('Polar-BobCat:Server:SynapseBobCatprop13', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(BobCatprop13)
end)

local BobCatprop14 = nil
RegisterNetEvent('Polar-BobCat:Server:SetBobCatprop14', function(prop) BobCatprop14 = prop end)
RegisterNetEvent('Polar-BobCat:Server:SynapseBobCatprop14', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(BobCatprop14)
end)

local BobCatprop15 = nil
RegisterNetEvent('Polar-BobCat:Server:SetBobCatprop15', function(prop) BobCatprop15 = prop end)
RegisterNetEvent('Polar-BobCat:Server:SynapseBobCatprop15', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    pile(BobCatprop15)
end)
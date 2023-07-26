if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end
local QBCore = exports[Config.Core]:GetCoreObject()


RegisterNetEvent('Polar-Pacific:Server:SetupTrolly1', function()
    Pacificprop16()
    Pacificprop17()
    Pacificprop18()
    Pacificprop19()
  --  Pacificprop20()
  -- Pacificprop26()
  --  Pacificprop27()
   -- Pacificprop28()
   -- Pacificprop29()
  --  Pacificprop30()
end)


RegisterNetEvent('Polar-Pacific:Server:SetupGrab1', function()
    Pacificprop1()
    Pacificprop2()
    Pacificprop3()
    Pacificprop4()
    Pacificprop5()
    Pacificprop31()
    Pacificprop32()
    Pacificprop33()
    Pacificprop34()
    Pacificprop35()
    -- Pacificprop36()
   -- Pacificprop37)
  --  Pacificprop38()
  --  Pacificprop39()
   -- Pacificprop40()
end)


RegisterNetEvent('Polar-Pacific:Server:SetupPickup1', function()
    Pacificprop6()
    Pacificprop7()
    Pacificprop8()
    Pacificprop9()
    Pacificprop10()
    Pacificprop21()
    Pacificprop22()
   --  Pacificprop23()
   --  Pacificprop24()
    -- Pacificprop25()
end)





RegisterNetEvent('Polar-Pacific:Server:SetupPile1', function()
    Pacificprop11()
    Pacificprop12()
   -- Pacificprop13()
   -- Pacificprop14()
   -- Pacificprop15()
end)





RegisterNetEvent('Polar-Pacific:Server:SetupPainting1', function()

    Pacificprop40()
    Pacificprop41()
    Pacificprop42()
  --  Pacificprop43()
  --  Pacificprop44()
  --  Pacificprop45()

end)


RegisterNetEvent('Polar-Pacific:Server:SetupCase1', function()

    Pacificprop45()
    Pacificprop46()
  --  Pacificprop47()
 --   Pacificprop48()
   -- Pacificprop49()
    -- Pacificprop50()

end)






local props = {}

RegisterNetEvent('Polar-Pacific:Server:SetPacificProp', function(door, prop) props[door] = prop end)
RegisterNetEvent('Polar-Pacific:Server:Synapse', function(door)  local src = source local Player = QBCore.Functions.GetPlayer(src)
   if Config.Debug then print(door) print(props[door]) end
    hiya(props[door])
end)











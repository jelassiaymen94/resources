if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end



RegisterNetEvent('Polar-Paleto:Server:SetupTrolly1', function()
    paletoprop16()
    paletoprop17()
    paletoprop18()
    paletoprop19()
  --  paletoprop20()
  -- paletoprop26()
  --  paletoprop27()
   -- paletoprop28()
   -- paletoprop29()
  --  paletoprop30()
end)


RegisterNetEvent('Polar-Paleto:Server:SetupGrab1', function()
    paletoprop1()
    paletoprop2()
    paletoprop3()
    paletoprop4()
    paletoprop5()
    paletoprop31()
    paletoprop32()
    paletoprop33()
    paletoprop34()
    paletoprop35()
    -- paletoprop36()
   -- paletoprop37)
  --  paletoprop38()
  --  paletoprop39()
   -- paletoprop40()
end)


RegisterNetEvent('Polar-Paleto:Server:SetupPickup1', function()
    paletoprop6()
    paletoprop7()
    paletoprop8()
    paletoprop9()
    paletoprop10()
    paletoprop21()
    paletoprop22()
   --  paletoprop23()
   --  paletoprop24()
    -- paletoprop25()
end)





RegisterNetEvent('Polar-Paleto:Server:SetupPile1', function()
    paletoprop11()
    paletoprop12()
   -- paletoprop13()
   -- paletoprop14()
   -- paletoprop15()
end)




RegisterNetEvent('Polar-Paleto:Server:SetupPainting1', function()

    paletoprop40()
    paletoprop41()
    paletoprop42()
    paletoprop43()
  --  paletoprop44()
  --  paletoprop45()

end)


RegisterNetEvent('Polar-Paleto:Server:SetupCase1', function()

    paletoprop45()
    paletoprop46()
    paletoprop47()
    paletoprop48()
   -- paletoprop49()
    -- paletoprop50()

end)






local props = {}

RegisterNetEvent('Polar-Paleto:Server:SetPaletoProp', function(door, prop) props[door] = prop end)
RegisterNetEvent('Polar-Paleto:Server:Synapse', function(door)  local src = source local Player = QBCore.Functions.GetPlayer(src)
   if Config.Debug then print(door) print(props[door]) end
    hiya(props[door])
end)











local QBCore = exports['qb-core']:GetCoreObject()
    

    CreateThread(function()

        -- altruist camp
        local altruist = AddBlipForCoord(vector3(-1119.58, 4927.58, 218.5))
        SetBlipSprite (altruist, 269)
        SetBlipDisplay(altruist, 6) 
        SetBlipScale  (altruist, 0.6)
        SetBlipAsShortRange(altruist, true)
        SetBlipColour(altruist, 16)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("The Altruists")
        EndTextCommandSetBlipName(altruist)


         -- boilingbroke
         local boilingbroke = AddBlipForCoord(vector3(1697.24, 2581.79, 52.81))
         SetBlipSprite (boilingbroke, 430)
         SetBlipDisplay(boilingbroke, 6) 
         SetBlipScale  (boilingbroke, 0.6)
         SetBlipAsShortRange(boilingbroke, true)
         SetBlipColour(boilingbroke, 6)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Boilingbroke Penitentiary")
         EndTextCommandSetBlipName(boilingbroke)
 

         -- mine
         local mine = AddBlipForCoord(vector3(-594.96, 2091.3, 131.47))
         SetBlipSprite (mine, 770)
         SetBlipDisplay(mine, 6) 
         SetBlipScale  (mine, 0.6)
         SetBlipAsShortRange(mine, true)
         SetBlipColour(mine, 81)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Abandoned Mineshaft")
         EndTextCommandSetBlipName(mine)
 

         -- pawnshop
         local pawnshop = AddBlipForCoord(vector3(172.54, -1317.18, 0.38))
         SetBlipSprite (pawnshop, 431)
         SetBlipDisplay(pawnshop, 6) 
         SetBlipScale  (pawnshop, 0.6)
         SetBlipAsShortRange(pawnshop, true)
         SetBlipColour(pawnshop, 5)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Pawnshop")
         EndTextCommandSetBlipName(pawnshop)
         --[[

         -- weazle news
         local weazle = AddBlipForCoord(vector3(-566.9029, -932.2872, -36.8306))
         SetBlipSprite (weazle, 590)
         SetBlipDisplay(weazle, 6) 
         SetBlipScale  (weazle, 0.6)
         SetBlipAsShortRange(weazle, true)
         SetBlipColour(weazle, 55)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Weazel News")
         EndTextCommandSetBlipName(weazle)

         -- VU
         local vu = AddBlipForCoord(vector3(129.0987, -1299.3462, 29.2327))
         SetBlipSprite (vu, 121)
         SetBlipDisplay(vu, 6) 
         SetBlipScale  (vu, 0.7)
         SetBlipAsShortRange(vu, true)
         SetBlipColour(vu, 45)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Vanilla Unicorn")
         EndTextCommandSetBlipName(vu)

         -- pizza this
         local pizzathis = AddBlipForCoord(vector3(797.0662, -739.9894, -77.6257))
         SetBlipSprite (pizzathis, 681)
         SetBlipDisplay(pizzathis, 6) 
         SetBlipScale  (pizzathis, 0.6)
         SetBlipAsShortRange(pizzathis, true)
         SetBlipColour(pizzathis, 60)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Pizza This!")
         EndTextCommandSetBlipName(pizzathis)

         -- taco
         local taco = AddBlipForCoord(vector3(11.2888, -1607.3955, 29.3974))
         SetBlipSprite (taco, 209)
         SetBlipDisplay(taco, 6) 
         SetBlipScale  (taco, 0.6)
         SetBlipAsShortRange(taco, true)
         SetBlipColour(taco, 27)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Cousin's Tacos")
         EndTextCommandSetBlipName(taco)

         -- maxdamage
         local maxdamage = AddBlipForCoord(vector3(17.3019, -1115.8473, 29.7912))
         SetBlipSprite (maxdamage, 556)
         SetBlipDisplay(maxdamage, 6) 
         SetBlipScale  (maxdamage, 0.6)
         SetBlipAsShortRange(maxdamage, true)
         SetBlipColour(maxdamage, 78)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Max Damage")
         EndTextCommandSetBlipName(maxdamage)
         
         local ntos = AddBlipForCoord(vector3(-471.2943, -864.6298, 23.9640))
         SetBlipSprite (ntos, 566)
         SetBlipDisplay(ntos, 6) 
         SetBlipScale  (ntos, 0.6)
         SetBlipAsShortRange(ntos, true)
         SetBlipColour(ntos, 59)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("New Times Overhaul Systems")
         EndTextCommandSetBlipName(ntos)
         
         -- Event 3082.7336, -4813.3213, 16.0881
         local event = AddBlipForCoord(vector3(1101.3811, 2120.0151, 52.8638))
         SetBlipSprite (event, 419)
         SetBlipDisplay(event, 6) 
         SetBlipScale  (event, 0.6)
         SetBlipAsShortRange(event, true)
         SetBlipColour(event, 59)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Dirt Bike Race by S.A.M.S.!")
         EndTextCommandSetBlipName(event)
         ]]
         -- churhc of rockford
         local blip = AddBlipForCoord(vector3(-766.1784, -24.1005, 21.0794))
         SetBlipSprite (blip, 279)
         SetBlipDisplay(blip, 6) 
         SetBlipScale  (blip, 0.6)
         SetBlipAsShortRange(blip, true)
         SetBlipColour(blip, 50)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentString("Church of Rockford")
         EndTextCommandSetBlipName(blip)

         --[[
         local blip = AddBlipForCoord(vector3(-816.96, -702.77, 0.06))
         SetBlipSprite (blip, 671)
         SetBlipDisplay(blip, 6) 
         SetBlipScale  (blip, 0.5)
         SetBlipAsShortRange(blip, true)
         SetBlipColour(blip, 1)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Wu Chang Records")
         EndTextCommandSetBlipName(blip)
         
         -- Brick House Law
         local blip = AddBlipForCoord(vector3(-1039.6254, -758.0851, 19.8388))
         SetBlipSprite (blip, 408)
         SetBlipDisplay(blip, 6) 
         SetBlipScale  (blip, 0.7)
         SetBlipAsShortRange(blip, true)
         SetBlipColour(blip, 1)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Brick House Law")
         EndTextCommandSetBlipName(blip)
         ]]

         -- davis pd
         local blip = AddBlipForCoord(vector3(382.32, -1618.85, 29.29))
         SetBlipSprite (blip, 188)
         SetBlipDisplay(blip, 6) 
         SetBlipScale  (blip, 0.8)
         SetBlipAsShortRange(blip, true)
         SetBlipColour(blip, 3)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Davis Police Department")
         EndTextCommandSetBlipName(blip)































      end)




   



RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
   PlayerJob = QBCore.Functions.GetPlayerData().job
   if PlayerJob.name ~= "police" then 
      policeblips()
   else
   end
      clothingblip()
      supermarket()
      garages()
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
   PlayerJob = QBCore.Functions.GetPlayerData().job
   --PlayerJob = JobInfo
     
   if PlayerJob.name == "police" then
       policeblips()

   else
     
   end
end)






 

































   






    
    

  
 
 

   
function FindNearestStore(playerPos, stores)
   local nearestStore = nil
   local nearestDistance = nil

   for _, store in ipairs(stores) do
       local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, store.x, store.y, store.z)
       if not nearestDistance or distance < nearestDistance then
           nearestStore = store
           nearestDistance = distance
       end
   end

   return nearestStore
end
function CreateBlipForLocation(coords, sprite, scale, color, text)
   local blip = AddBlipForCoord(coords)
   SetBlipSprite(blip, sprite)
   SetBlipScale(blip, scale)
   SetBlipColour(blip, color)
   SetBlipDisplay(blip, 6)
   SetBlipAsShortRange(blip, true)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentString(text)
   EndTextCommandSetBlipName(blip)
   return blip
end
function GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2)
   return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
end


local bennysgarages = {
   vector3(109.49, 6623.03, 31.79),
   vector3(1179.85, 2642.36, 37.81)


}




local supermarketstores = {

   vector4(24.91, -1346.86, 29.5, 268.37),
   vector4(-3039.64, 584.78, 7.91, 21.88),
   vector4(-3242.73, 1000.46, 12.83, 2.08),
   vector4(1728.44, 6415.4, 35.04, 243.26),
   vector4(1697.96, 4923.04, 42.06, 326.61),
   vector4(1960.26, 3740.6, 32.34, 300.45),
   vector4(2677.97, 3279.95, 55.24, 325.89),
   vector4(2556.8, 381.27, 108.62, 359.15),
   vector4(373.08, 326.75, 103.57, 253.14),
   vector4(161.2, 6641.74, 31.7, 221.02),


}



local clothing = {
   vector3(-1448.72, -238.91, 49.81),
   vector3(1693.54, 4830.79, 42.07),
   vector3(-1199.32, -769.85, 17.31),
   vector3(426.22, -798.37, 29.49),
   vector3(-165.53, -302.4, 39.73),
   vector3(74.64, -1400.79, 29.38),
   vector3(-829.6, -1076.86, 11.33),
   vector3(-1450.711, -236.83, 48.809),
   vector3(11.15, 6517.19, 31.88),
   vector3(612.51, 2756.6, 42.09),
   vector3(1188.79, 2710.86, 38.22),
   vector3(-3166.18, 1048.37, 20.86),
   vector3(-1107.81, 2705.86, 19.11),
   vector3(129.91, -218.86, 54.56), 
}

local boats = {
   vector3(-914.95, 5797.57, 0.41),
   vector3(916.11, 3655.86, 32.49),
   vector3(643.17, -1828.23, 9.08),
}


function policeblips()
   CreateThread(function()
      while true do
          Wait(1000) 
          local playerPos = GetEntityCoords(PlayerPedId())
          local nearestStore = FindNearestStore(playerPos, boats)
          if boatblip then
              RemoveBlip(boatblip)
              boatblip = nil
          end
          if nearestStore then
               boatblip = CreateBlipForLocation(vec3(nearestStore.x, nearestStore.y, nearestStore.z), 404, 0.6, 3, "Police Boat")
          end
      end
   end)
end

function clothingblip()
   CreateThread(function()
   while true do
       Wait(1000) 
       local playerPos = GetEntityCoords(PlayerPedId())
       local nearestStore = FindNearestStore(playerPos, clothing)
       if storeBlip then
           RemoveBlip(storeBlip)
           storeBlip = nil
       end
       if nearestStore then
           storeBlip = CreateBlipForLocation(vec3(nearestStore.x, nearestStore.y, nearestStore.z), 366, 0.6, 47, "Clothing Store")
       end
   end
end)
end
function supermarket()
   CreateThread(function()
   while true do
       Wait(1000) 
       local playerPos = GetEntityCoords(PlayerPedId())
       local nearestStore = FindNearestStore(playerPos, supermarketstores)
       if storeBlips then
           RemoveBlip(storeBlips)
           storeBlips = nil
       end
       if nearestStore then
           storeBlips = CreateBlipForLocation(vec3(nearestStore.x, nearestStore.y, nearestStore.z), 628, 0.6, 2, "24/7 Supermarket")
       end
   end
end)
end
function garages()
   CreateThread(function()
      while true do
          Wait(1000) 
          local playerPos = GetEntityCoords(PlayerPedId())
          local nearestStore = FindNearestStore(playerPos, bennysgarages)
          if bennysblip then
              RemoveBlip(bennysblip)
              bennysblip = nil
          end
          if nearestStore then
            bennysblip = CreateBlipForLocation(vec3(nearestStore.x, nearestStore.y, nearestStore.z), 402, 0.6, 2, "Repair")
          end
      end
   end)
end
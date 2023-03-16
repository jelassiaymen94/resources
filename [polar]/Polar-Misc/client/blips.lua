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

         -- wu chang
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



         -- MrsMonkeyDelivery
         local blip = AddBlipForCoord(vector3(385.7248, -772.6353, 29.2921))
         SetBlipSprite (blip, 671)
         SetBlipDisplay(blip, 6) 
         SetBlipScale  (blip, 0.5)
         SetBlipAsShortRange(blip, true)
         SetBlipColour(blip, 8)
         BeginTextCommandSetBlipName("STRING")
         AddTextComponentSubstringPlayerName("Mrs. Monkey's Deliveries")
         EndTextCommandSetBlipName(blip)
































      end)



CreateThread(function()








end)


CreateThread(function()
   Wait(1000)
   if QBCore.Functions.GetPlayerData().job ~= nil and next(QBCore.Functions.GetPlayerData().job) then
       PlayerJob = QBCore.Functions.GetPlayerData().job
       if PlayerJob == 'police' then
         
         pd()

       end
   end
end)

function pd()





   local blip = AddBlipForCoord(vector3(643.17, -1828.23, 9.08))
   SetBlipSprite (blip, 404)
   SetBlipDisplay(blip, 6) 
   SetBlipScale  (blip, 0.6)
   SetBlipAsShortRange(blip, true)
   SetBlipColour(blip, 3)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentSubstringPlayerName("Police Boat")
   EndTextCommandSetBlipName(blip)


   local blip = AddBlipForCoord(vector3(916.11, 3655.86, 32.49))
   SetBlipSprite (blip, 404)
   SetBlipDisplay(blip, 6) 
   SetBlipScale  (blip, 0.6)
   SetBlipAsShortRange(blip, true)
   SetBlipColour(blip, 3)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentSubstringPlayerName("Police Boat")
   EndTextCommandSetBlipName(blip)




   local blip = AddBlipForCoord(vector3(-914.95, 5797.57, 0.41))
   SetBlipSprite (blip, 404)
   SetBlipDisplay(blip, 6) 
   SetBlipScale  (blip, 0.6)
   SetBlipAsShortRange(blip, true)
   SetBlipColour(blip, 3)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentSubstringPlayerName("Police Boat")
   EndTextCommandSetBlipName(blip)




end
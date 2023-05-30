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
   else
   policeblips()
   end
   supermarket()
   clothing()
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
   PlayerJob = QBCore.Functions.GetPlayerData().job
   --PlayerJob = JobInfo
     
   if PlayerJob.name == "police" then
       policeblips()

   else
      removepoliceblips()
      exports['qb-core']:HideText()
   end
end)

function removepoliceblips()

   RemoveBlip(currentblip)


end

function policeblips()
CreateThread(function()
   local currentblip = 0
   while true do
      local coords = GetEntityCoords(PlayerPedId())
      local closest = 1000
      local closestCoords 
      
      for i = 1, #Config.BoatBlips do
         local cads = Config.BoatBlips[i].coords
         local dstcheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, cads.x, cads.y, cads.z, false)

         if dstcheck < closest then
            closest = dstcheck
            closestCoords = cads
          
         end
      end
      if DoesBlipExist(currentblip) then
         RemoveBlip(currentblip)
      end
      currentblip = CreateBlip(closestCoords)
      Wait(10000)
    end
end)
end
function CreateBlip(coords)
	local blip = AddBlipForCoord(coords)
	SetBlipSprite(blip, 404)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 3)
	SetBlipDisplay(blip, 6)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Police Boat")
	EndTextCommandSetBlipName(blip)
	return blip
end




















function supermarket()
CreateThread(function()
      
      local currentblip = 0
      while true do
         local coords = GetEntityCoords(PlayerPedId())
         local closest = 1000
         local closestCoords 
         
         for i = 1, #Config.SuperMarket do
            local cads = Config.SuperMarket[i].coords
            local dstcheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, cads.x, cads.y, cads.z, false)
            --print(cads)
            if dstcheck < closest then
               closest = dstcheck
               closestCoords = cads
               --print(closestCoords)
            end
         end
         if DoesBlipExist(currentblip) then
            RemoveBlip(currentblip)
         end
         currentblip = CreateBlip2(closestCoords)
         Wait(10000)
       end
   end)
end
   function CreateBlip2(coords)
      local blip = AddBlipForCoord(coords)
      SetBlipSprite(blip, 628)
      SetBlipScale(blip, 0.6)
      SetBlipColour(blip, 2)
      SetBlipDisplay(blip, 6)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("24/7 Supermarket")
      EndTextCommandSetBlipName(blip)
      return blip
   end
   
















   

function clothing()
   CreateThread(function()
      
      local currentblip = 0
      while true do
         local coords = GetEntityCoords(PlayerPedId())
         local closest = 1000
         local closestCoords 
         
         for i = 1, #Config.Clothing do
            local cads = Config.Clothing[i].coords
            local dstcheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, cads.x, cads.y, cads.z, false)
            --print(cads)
            if dstcheck < closest then
               closest = dstcheck
               closestCoords = cads
               --print(closestCoords)
            end
         end
         if DoesBlipExist(currentblip) then
            RemoveBlip(currentblip)
         end
         currentblip = CreateBlip3(closestCoords)
         Wait(10000)
       end
   end)




end
function CreateBlip3(coords)
   local blip = AddBlipForCoord(coords)
   SetBlipSprite(blip, 366)
   SetBlipScale(blip, 0.6)
   SetBlipColour(blip, 47)
   SetBlipDisplay(blip, 6)
   SetBlipAsShortRange(blip, true)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentString("Clothing Store")
   EndTextCommandSetBlipName(blip)
   return blip
end
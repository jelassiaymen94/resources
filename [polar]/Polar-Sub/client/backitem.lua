local QBCore = exports['qb-core']:GetCoreObject()
--[[
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        startcircle()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
   
    startcircle()
end)


-- Check if the player has the weapons in their inventory and on their back
-- Define the attachment points for the player's back
local attachmentPoints = {
  { bone = 24818, x = 0.1, y = -0.125, z = 0.1, occupied = false, weapon = nil },
  { bone = 24818, x = 0.1, y = -0.125, z = 0.0, occupied = false, weapon = nil },
  { bone = 24818, x = 0.1, y = -0.125, z = -0.1, occupied = false, weapon = nil },
  -- Add more attachment points as necessary
}

-- Define the names of the weapons you want to check for and their corresponding models
local weaponModels = {
  ['weapon_assaultrifle'] = 'w_ar_assaultrifle',
  ['weapon_assaultrifle2'] = 'w_ar_assaultrifle2',
  -- Add more weapons and models as necessary
}
function startcircle()
-- Check if the player has the weapons in their inventory and on their back
CreateThread(function()
  Wait(100)
  while true do
    Wait(100)
    for weaponName, weaponModel in pairs(weaponModels) do
      local hasItem = QBCore.Functions.HasItem(weaponName)
      local playerPed = PlayerPedId()
      local equippedWeapon = GetSelectedPedWeapon(playerPed)
      local weaponOnBack = false
    
      for i = 1, #attachmentPoints do
        if attachmentPoints[i].weapon == weaponName then
          weaponOnBack = true
          if not hasItem or equippedWeapon == GetHashKey(weaponName) then
          
            local boneIndex = GetPedBoneIndex(playerPed, attachmentPoints[i].bone)
            local attachment = GetClosestObjectOfType(0.1, -0.125, 0.1, 0.5, weaponModel, false, false, false)
            print(weaponModel)
            print(attachment)
            
           
            DeleteObject(attachment) 
       
            
            
            attachmentPoints[i].occupied = false
            attachmentPoints[i].weapon = nil
          end
        end
      end

      if hasItem and not weaponOnBack then
        local attachmentPoint = nil
        for i = 1, #attachmentPoints do
          if not attachmentPoints[i].occupied and not attachmentPoints[i].weapon then
            attachmentPoint = attachmentPoints[i]
            attachmentPoint.occupied = true
            attachmentPoint.weapon = weaponName
            break
          end
        end

        if attachmentPoint then
         

          local boneIndex = GetPedBoneIndex(playerPed, attachmentPoint.bone)
          local modelHash = GetHashKey(weaponModel)
          RequestModel(modelHash)
          while not HasModelLoaded(modelHash) do
           Wait(100)
          end
         
          local attachment = CreateObject(modelHash, 0.0, 0.0, 0.0, true, true, false)
          print(attachment)
        
          AttachEntityToEntity(attachment, playerPed, boneIndex, attachmentPoint.x, attachmentPoint.y, attachmentPoint.z, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
         
          -- put on back
        else
          -- too many
          
        end
       
          
        
      elseif not hasItem and weaponOnBack then
         print('weapon moved to floor')
        for i = 1, #attachmentPoints do
          
          if attachmentPoints[i].weapon == weaponName then
            print(attachmentPoints[i].weapon)
            local boneIndex = GetPedBoneIndex(playerPed, attachmentPoints[i].bone)
            local attachment = GetClosestObjectOfType(0.0, 0.0, 0.0, 0.5, weaponModel, false, false, false)
            print(attachment)
            DeleteObject(attachment) 
            attachmentPoints[i].occupied = false
            attachmentPoints[i].weapon = nil
            break
          end
        end
      end
    end
  end
  
end)
end


]]
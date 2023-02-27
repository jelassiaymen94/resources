local QBCore = exports['qb-core']:GetCoreObject()
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
       
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
   
    
end)

-- Define the attachment points for the player's back
local attachmentPoints = {
    { bone = 24818, x = 0.1, y = 0.1, z = 0.0, occupied = false },
    { bone = 24818, x = 0.2, y = 0.1, z = 0.0, occupied = false },
    { bone = 24818, x = 0.3, y = 0.1, z = 0.0, occupied = false },
    -- Add more attachment points as necessary
  }
  
  -- Define the name of the weapon you want to check for
  local weaponName = 'WEAPON_PISTOL' -- Replace this with the name of your desired weapon
  
  -- Check if the player has the weapon in their inventory and on their back
  CreateThread(function()
    while true do
      local hasItem = QBCore.Functions.HasItem(weaponName)
      local playerPed = PlayerPedId()
      local equippedWeapon = GetSelectedPedWeapon(playerPed)
      local weaponOnBack = false
  
      for i = 1, #attachmentPoints do
        local weapon = GetPedDrawableVariation(playerPed, attachmentPoints[i].bone)
        if weapon == GetHashKey(weaponName) then
          weaponOnBack = true
          if equippedWeapon == GetHashKey(weaponName) then
            local boneIndex = GetPedBoneIndex(playerPed, attachmentPoints[i].bone)
            local attachment = GetClosestObjectOfType(0.0, 0.0, 0.0, 0.5, GetHashKey(weaponName), false, false, false)
            DeleteEntity(attachment)
            attachmentPoints[i].occupied = false
          end
        end
      end
  
      if hasItem and not weaponOnBack then
        local attachmentPoint = nil
        for i = 1, #attachmentPoints do
          if not attachmentPoints[i].occupied then
            attachmentPoint = attachmentPoints[i]
            attachmentPoint.occupied = true
            break
          end
        end
  
        if attachmentPoint then
          local boneIndex = GetPedBoneIndex(playerPed, attachmentPoint.bone)
          local weaponHash = GetHashKey(weaponName)
          local scaleform = RequestScaleformMovie('weapon')
          local attachment = CreateObject(weaponHash, 0.0, 0.0, 0.0, true, true, false)
          AttachEntityToEntity(attachment, playerPed, boneIndex, attachmentPoint.x, attachmentPoint.y, attachmentPoint.z, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
          
        else
          
        end
      end
  
      Wait(100)
    end
  end)
  
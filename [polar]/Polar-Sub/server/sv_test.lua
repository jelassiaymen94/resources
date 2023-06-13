AddEventHandler("weaponDamageEvent", function(sender, data)
    local attackerId = GetPlayerServerId(sender)
    local weaponHash = GetHashKey(data.weapon)
  
  --  if weaponHash ~= 0 then
      print("Player " .. attackerId .. " fired weapon with hash: " .. weaponHash)
      -- Add your code here for when a weapon is fired

      
  --  end
end)

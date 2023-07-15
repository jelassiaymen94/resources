if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Props') end props() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if Config.Debug then print('Player Loaded Props Starting') end props() end)

local keypad1 = nil
local keypad2 = nil
local keypad3 = nil
local keypad4 = nil

local dkeypad1 = nil
local dkeypad2 = nil
local dkeypad3 = nil
local dkeypad4 = nil

function props()
   local kp1 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),Config.doorcard1Eye, false, false, false) SetEntityHeading(kp1, 315.93) -- left double
   local kp2 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.doorcard2Eye, false, false, false) SetEntityHeading(kp2, 45.7) -- right double

   keypad1 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.Door1Eye, false, false, false) SetEntityHeading(keypad1, 225.7) -- right double
   keypad2 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.Door2Eye, false, false, false) SetEntityHeading(keypad2, 225.7) -- right double
   keypad3 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.Door3Eye, false, false, false) SetEntityHeading(keypad3, 45.7) -- right double
   
   
   Wait(50) FreezeEntityPosition(kp1, true)   
   Wait(50) FreezeEntityPosition(kp2, true)   
   Wait(50) FreezeEntityPosition(keypad1, true)   
   Wait(50) FreezeEntityPosition(keypad2, true)   
   Wait(50) FreezeEntityPosition(keypad3, true)   
   Wait(50) FreezeEntityPosition(keypad4, true)   
  -- Wait(5000) switch(keypad3, Config.Door3Eye, 3)

end
RegisterNetEvent('Polar-Pacific:Client:DestroyPad', function(number)
   if number == 'Pacificdoor1' then switch(keypad1, Config.Door1Eye, 1) end
   if number == 'Pacificdoor2' then switch(keypad2, Config.Door2Eye, 2) end
   if number == 'Pacificdoor3' then switch(keypad3, Config.Door3Eye, 3) end
end)
function switch(prop, location, number)
 
   if number == 1 then
      if DoesEntityExist(keypad1) then DeleteEntity(keypad1) end
      local dkeypad1 =  CreateObject(GetHashKey("ch_prop_fingerprint_damaged_01"),  location, false, false, false) SetEntityHeading(dkeypad1, 225.7) -- right double
      Wait(50) FreezeEntityPosition(dkeypad1, true)  
   elseif number == 2 then
      if DoesEntityExist(keypad2) then DeleteEntity(keypad2) end
      local dkeypad2 =  CreateObject(GetHashKey("ch_prop_fingerprint_damaged_01"),  location, false, false, false) SetEntityHeading(dkeypad2, 225.7) -- right double
      Wait(50) FreezeEntityPosition(dkeypad2, true)  
   elseif number == 3 then
      DeleteEntity(keypad3)
      local dkeypad3 =  CreateObject(GetHashKey("ch_prop_fingerprint_damaged_01"),  location, false, false, false) SetEntityHeading(dkeypad3, 40.7) -- right double
      Wait(50) FreezeEntityPosition(dkeypad3, true)  
   
   else print('no switch')
   
   end

  
end




RegisterNetEvent('Polar-Pacific:Client:ResetPropsKeypads', function()
   
   if DoesEntityExist(keypad1) then DeleteEntity(keypad1) end
   if DoesEntityExist(keypad2) then DeleteEntity(keypad2) end
   if DoesEntityExist(keypad3) then DeleteEntity(keypad3) end
   if DoesEntityExist(keypad4) then DeleteEntity(keypad4) end
   if DoesEntityExist(dkeypad1) then DeleteEntity(dkeypad1) end
   if DoesEntityExist(dkeypad2) then DeleteEntity(dkeypad2) end
   if DoesEntityExist(dkeypad3) then DeleteEntity(dkeypad3) end
   if DoesEntityExist(dkeypad4) then DeleteEntity(dkeypad4) end
   
end)
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

local gen1 = nil
local gen2 = nil

function props()
   local kp1 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),Config.doorcard1Eye, false, false, false) SetEntityHeading(kp1, 0.0) -- left double
   local kp2 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.doorcard2Eye, false, false, false) SetEntityHeading(kp2, 45.7) -- right double

   keypad1 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.Door1Eye, false, false, false) SetEntityHeading(keypad1, 85.0) -- right double
   keypad2 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.Door2Eye, false, false, false) SetEntityHeading(keypad2, 352.0) -- right double
   keypad3 =  CreateObject(GetHashKey("ch_prop_fingerprint_scanner_error_01b"),  Config.Door3Eye, false, false, false) SetEntityHeading(keypad3, 45.7) -- right double
   
   gen1 =  CreateObject(GetHashKey("prop_generator_04"),  vector3(871.11, -2134.3, 29.59), false, false, false) SetEntityHeading(gen1, 355.0) -- generator
   Wait(50) FreezeEntityPosition(gen1, true)   
   gen2 = CreateObject(GetHashKey("prop_pineapple"),  Config.StartThirdEye, false, false, false) SetEntityHeading(gen1, 355.0) -- generator 
   Wait(50) FreezeEntityPosition(gen2, true)   

   local table = CreateObject(GetHashKey("prop_tea_trolly"),  vector3(896.53, -2119.45, 30.23), false, false, false) SetEntityHeading(table, 90.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   local table = CreateObject(GetHashKey("prop_tea_trolly"),  vector3(898.75, -2126.65, 30.23), false, false, false) SetEntityHeading(table, 90.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   local table = CreateObject(GetHashKey("prop_mb_crate_01b"),  vector3(883.36, -2113.41, 30.23), false, false, false) SetEntityHeading(table, 175.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   local table = CreateObject(GetHashKey("prop_mb_crate_01b"),  vector3(878.25, -2133.0, 30.23), false, false, false) SetEntityHeading(table, 355.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   local table = CreateObject(GetHashKey("ba_prop_battle_bag_01b"), vector3(877.78, -2130.6, 30.23), false, false, false) SetEntityHeading(table, 355.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
  
   local table = CreateObject(GetHashKey("prop_mb_crate_01b"),  vector3(891.96, -2112.02, 30.23), false, false, false) SetEntityHeading(table, 355.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   
   local table = CreateObject(GetHashKey("ba_prop_battle_bag_01b"),  vector3(879.48, -2107.66, 30.23), false, false, false) SetEntityHeading(table, 90.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   
   local table = CreateObject(GetHashKey("v_corp_cashtrolley"),  vector3(882.74, -2116.86, 30.23), false, false, false) SetEntityHeading(table, 90.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   local table = CreateObject(GetHashKey("v_corp_cashtrolley_2"),  vector3(882.56, -2118.24, 30.23), false, false, false) SetEntityHeading(table, 90.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
   local table = CreateObject(GetHashKey("prop_cash_trolly"),  vector3(875.34, -2113.9, 30.23), false, false, false) SetEntityHeading(table, 90.0) -- generator 
   Wait(50) FreezeEntityPosition(table, true)   
 

   
   local table = CreateObject(GetHashKey("prop_barrel_exp_01a"), vector3(893.27, -2136.61, 30.23), false, false, false) SetEntityHeading(table, 355.0) -- generator 
   local table = CreateObject(GetHashKey("w_arena_airmissile_01a"), vector3(874.55, -2118.91, 31.5), false, false, false) SetEntityHeading(table, 355.0) -- generator 
   local table = CreateObject(GetHashKey("bkr_prop_bkr_cash_scatter_01"), vector3(880.74, -2118.14, 30.23), false, false, false) SetEntityHeading(table, 355.0) -- generator 
   
   
  
   
   Wait(50) FreezeEntityPosition(kp1, true)   
   Wait(50) FreezeEntityPosition(kp2, true)   
   Wait(50) FreezeEntityPosition(keypad1, true)   
   Wait(50) FreezeEntityPosition(keypad2, true)   
   Wait(50) FreezeEntityPosition(keypad3, true)   
   Wait(50) FreezeEntityPosition(keypad4, true)   
  -- Wait(5000) switch(keypad3, Config.Door3Eye, 3)

end
RegisterNetEvent('Polar-BobCat:Client:DestroyPad', function(number)
   if number == 'BobCatdoor1' then switch(keypad1, Config.Door1Eye, 1) end
   if number == 'BobCatdoor2' then switch(keypad2, Config.Door2Eye, 2) end
   if number == 'BobCatdoor3' then switch(keypad3, Config.Door3Eye, 3) end
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




RegisterNetEvent('Polar-BobCat:Client:ResetPropsKeypads', function()
   
   if DoesEntityExist(keypad1) then DeleteEntity(keypad1) end
   if DoesEntityExist(keypad2) then DeleteEntity(keypad2) end
   if DoesEntityExist(keypad3) then DeleteEntity(keypad3) end
   if DoesEntityExist(keypad4) then DeleteEntity(keypad4) end
   if DoesEntityExist(dkeypad1) then DeleteEntity(dkeypad1) end
   if DoesEntityExist(dkeypad2) then DeleteEntity(dkeypad2) end
   if DoesEntityExist(dkeypad3) then DeleteEntity(dkeypad3) end
   if DoesEntityExist(dkeypad4) then DeleteEntity(dkeypad4) end
   
end)
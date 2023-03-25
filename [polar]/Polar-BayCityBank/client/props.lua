local QBCore = exports[Config.Core]:GetCoreObject()
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Props') end props() end end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) if Config.Debug then print('Player Loaded Props Starting') end props() end)
function props() if Config.UseProps then if Config.Debug then print('Props 1 Enabled') end Wait(50)
    local prop =  CreateObject(GetHashKey("h4_prop_h4_ld_keypad_01b"),vector3(-1294.28, -835.41, 17.15), false, false, false) SetEntityHeading(prop, 126.48)  -- back double
    local prop =  CreateObject(GetHashKey("h4_prop_h4_ld_keypad_01b"),vector3(-1297.04, -826.44, 17.15), false, false, false) SetEntityHeading(prop, 306.93) -- left double
    local prop =  CreateObject(GetHashKey("h4_prop_h4_fingerkeypad_01a"),  vector3(-1299.6, -828.32, 17.3), false, false, false) SetEntityHeading(prop, 125.7) -- right double
    local prop =  CreateObject(GetHashKey("bkr_prop_fakeid_tablet_01a"),  vector3(-1289.91, -835.15, 16.95), false, false, false) SetEntityHeading(prop, 125.7) -- right double
   
   
    -- Wait(5000) DeleteEntity(prop)
   Wait(50) FreezeEntityPosition(prop, true)   
else if Config.Debug then print('Props 1 not Enabled') end 
end end

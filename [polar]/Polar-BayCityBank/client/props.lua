local QBCore = exports[Config.Core]:GetCoreObject()
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Targets') end
    props()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100) if Config.Debug then print('Player Loaded Targets Starting') end
    props()
end)
function props() if Config.UseProps then if Config.Debug then print('Props 1 Enabled') end Wait(50)
    -- back double
    local prop =  CreateObject(GetHashKey("h4_prop_h4_ld_keypad_01b"),vector3(-1294.27, -835.41, 17.15), false, false, false)     
    SetEntityHeading(prop, 126.48)
    -- left double
    local prop =  CreateObject(GetHashKey("h4_prop_h4_ld_keypad_01b"),vector3(-1297.04, -826.44, 17.15), false, false, false)     
    SetEntityHeading(prop, 306.93)
    -- right double
    local prop =  CreateObject(GetHashKey("h4_prop_h4_ld_keypad_01b"),  vector3(-1299.62, -828.32, 17.15), false, false, false)     
    SetEntityHeading(prop, 125.7)
  
    Wait(5000)
    DeleteEntity(prop)
   


    Wait(50) FreezeEntityPosition(prop, true)   
else if Config.Debug then print('Props 1 not Enabled') end 
end end

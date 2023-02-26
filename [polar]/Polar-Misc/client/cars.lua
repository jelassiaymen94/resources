local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    --traderpeds()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
       -- peds()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
   -- peds()
    
end)
-- vector3(1305.74, 241.73, -49.06)
--[[
CreateThread(function()
   

    local lift = createobject
    -- imp_prop_impexp_carrack
   
   -- local prop =  CreateObject(GetHashKey("imp_prop_impexp_carrack"),vector3(138.68, -3047.09, 6.04), true, false, false) 
   -- local prop =  CreateObject(GetHashKey("imp_prop_impexp_carrack"),vector3(144.44, -3047.06, 6.04), true, false, false) 
    --local prop =  CreateObject(GetHashKey("imp_prop_impexp_carrack"),vector3(146.1, -3046.98, 6.04), true, false, false) 
    Wait(50)
    FreezeEntityPosition(prop, true)

    Wait(500)

    cars()


   
end)

function cars()
  --[[  local car = `r32`
    RequestModel(car)
    while not HasModelLoaded(car) do
        Wait(0)
    end
    veh = CreateVehicle(car, 151.2, -3031.52, 6.04, 58.38, false, false)
    SetModelAsNoLongerNeeded(car)
    SetVehicleOnGroundProperly(veh)
    SetEntityInvincible(veh, true) 
    SetVehicleModKit(veh, 0)
    SetVehicleNumberPlateText(veh, "JAPANZI")
    SetVehicleNumberPlateTextIndex(veh, 3)
    ------ row

    QBCore.Functions.SpawnVehicle('r32', function(veh)
        SetEntityHeading(veh, 58.38)
        SetVehicleNumberPlateText(veh, "JAPANZI")
        FreezeEntityPosition(veh, true)

    end, vector3(151.2, -3031.52, 6.04), false)

  

    QBCore.Functions.SpawnVehicle('r35', function(veh)
        SetEntityHeading(veh, 58.38)
        SetVehicleNumberPlateText(veh, "PHORARI")
        FreezeEntityPosition(veh, true)

    end, vector3(151.26, -3035.34, 6.04), false)

    

    QBCore.Functions.SpawnVehicle('488misha', function(veh)
        SetEntityHeading(veh, 58.38)
        SetVehicleNumberPlateText(veh, "VROOOM")
        FreezeEntityPosition(veh, true)

    end, vector3(151.24, -3039.03, 6.04), false)

   

    QBCore.Functions.SpawnVehicle('m4', function(veh)
        SetEntityHeading(veh, 58.38)
        SetVehicleNumberPlateText(veh, "VROOOM")
        FreezeEntityPosition(veh, true)

    end, vector3(151.05, -3042.43, 6.04), false)


   

    QBCore.Functions.SpawnVehicle('m5e60', function(veh)
        SetEntityHeading(veh, 58.38)
        SetVehicleNumberPlateText(veh, "R33")
        FreezeEntityPosition(veh, true)

    end, vector3(151.14, -3045.74, 6.04), false)



    ------ ontop addon lifters
    QBCore.Functions.SpawnVehicle('69charger', function(veh)
        SetEntityHeading(veh, 0)
        SetVehicleNumberPlateText(veh, "SPINNIN")
        FreezeEntityPosition(veh, true)

    end, vector3(144.56, -3047.71, 8.88), false)
   

    QBCore.Functions.SpawnVehicle('66fastback', function(veh)
        SetEntityHeading(veh, 0)
        SetVehicleNumberPlateText(veh, "OLDBITCH")
        FreezeEntityPosition(veh, true)

    end, vector3(138.73, -3047.44, 8.88), false)

    



    -------- normal lift



    
    QBCore.Functions.SpawnVehicle('F10M5RC', function(veh)
        SetEntityHeading(veh, 148.4)
        FreezeEntityPosition(veh, true)

    end, vector3(141.5, -3014.34, 8.93), false)

    

   QBCore.Functions.SpawnVehicle('bdragon', function(veh)
        SetEntityHeading(veh, 0)
        SetVehicleNumberPlateText(veh, "HATCHBAK")
        FreezeEntityPosition(veh, true)

    end, vector3(124.68, -3041.34, 9.0), false)
   

    QBCore.Functions.SpawnVehicle('exor', function(veh)
        SetEntityHeading(veh, 0)
        SetVehicleNumberPlateText(veh, "HATCHBAK")
        FreezeEntityPosition(veh, true)

    end, vector3(125.45, -3035.05, 6.18), false)
    
end
]]

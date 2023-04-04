local QBCore = exports['qb-core']:GetCoreObject()
local model1 = GetHashKey('prop_drop_armscrate_01')
local model2 = GetHashKey('prop_drop_armscrate_01')
local size = 1.5
local planes = 'cargoplane'
local speed = 100
local server = false
CreateThread(function()
  
 
end)

RegisterNetEvent('Polar-Sub:Client:StartDrop', function(planepos, dest)
    print('drop starting')
    RequestModel(planes)
    while not HasModelLoaded(planes) do
        Wait(0)
    end
    print(planepos)
    local plane = CreateVehicle(planes, planepos.x, planepos.y, planepos.z + 1000, 0.0, server, server)
    local destinationBlip = AddBlipForEntity(plane)
    SetBlipSprite (destinationBlip, 307)
    SetBlipColour(destinationBlip, 46)
    SetBlipFlashesAlternate(destinationBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Air Drop")
    EndTextCommandSetBlipName(destinationBlip)
    while GetDistanceBetweenCoords(GetEntityCoords(plane), dest.x, dest.y, dest.z, true) > 50 do
        Wait(1)
        local planeCoords = GetEntityCoords(plane)
        local planeHeading = GetEntityHeading(plane)
        local destinationHeading = GetHeadingFromVector_2d(dest.x - planeCoords.x, dest.y - planeCoords.y)
        local difference = destinationHeading - planeHeading
        if difference > 180 then
            difference = difference - 360
        elseif difference < -180 then
            difference = difference + 360
        end
        local pitch = math.max(-20, math.min(20, -(planeCoords.z - dest.z) / 10))
        SetEntityRotation(plane, pitch, 0, destinationHeading, 2, true)
        SetEntityVelocity(plane, GetEntityForwardVector(plane) * speed)
    end
  --  DeleteEntity(plane)

    RequestModel(model1) while not HasModelLoaded(model1) do Wait(10) end
    RequestModel(model2) while not HasModelLoaded(model2) do Wait(10) end

    SetVehicleDoorOpen(plane, 7, false, true)

    Wait(500) local planeCoords = GetEntityCoords(plane) 
    local obj1 = CreateObject(model1, planeCoords.x, planeCoords.y, planeCoords.z - 30, server, server)
    exports['qb-target']:AddTargetModel(obj1, {  options = { {  event = 'Polar-Sub:Client:Crate1',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj1, vector3(0.0, 0.0, -0.1))
    local crateblip = AddBlipForEntity(obj1) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
    
    Wait(500) local planeCoords = GetEntityCoords(plane) 
    local obj2 = CreateObject(model2, planeCoords.x, planeCoords.y, planeCoords.z - 30, server, server)
    exports['qb-target']:AddTargetModel(obj2, {  options = { {  event = 'Polar-Sub:Client:Crate2',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj2, vector3(0.0, 0.0, -0.1))
    local crateblip = AddBlipForEntity(obj2) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
  


    Wait(30000)
    RemoveBlip(destinationBlip)
   

   -- CreateThread(function() while true do Wait(100) if not Config.Prop then DeleteEntity(obj) break end end end) 
    --Wait(120000)
    --RemoveBlip(crateblip)
end)




RegisterNetEvent('Polar-Sub:Client:Crate1', function()  TriggerServerEvent('Polar-Sub:Server:Crate1') end)
RegisterNetEvent('Polar-Sub:Client:Crate2', function()  TriggerServerEvent('Polar-Sub:Server:Crate2') end)










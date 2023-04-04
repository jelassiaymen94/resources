local QBCore = exports['qb-core']:GetCoreObject()
local model1 = GetHashKey('prop_drop_armscrate_01')
local model2 = GetHashKey('prop_drop_armscrate_01')
local model3 = GetHashKey('prop_drop_armscrate_01')
local model4 = GetHashKey('prop_drop_armscrate_01')
local model5 = GetHashKey('prop_drop_armscrate_01')
local model6 = GetHashKey('prop_drop_armscrate_01')
local model7 = GetHashKey('prop_drop_armscrate_01')
local model8 = GetHashKey('prop_drop_armscrate_01')
local size = 1.5
local planes = 'cargoplane'
local speed = 100
local server = false
CreateThread(function()
  
 
end)

RegisterNetEvent('Polar-Sub:Client:StartDrop', function(planepos, dest)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedAtCoord('exp_grd_flare', dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
 
    print('drop starting')
    RequestModel(planes)
    while not HasModelLoaded(planes) do
        Wait(0)
    end
    print(planepos)
    local plane = CreateVehicle(planes, planepos.x, planepos.y, planepos.z + 1000, 0.0, server, server)
    ControlLandingGear(plane, 3)
    local crateblip = AddBlipForCoord(vec3(dest.x, dest.y, dest.z)) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Drop Location") EndTextCommandSetBlipName(crateblip)
    local destinationBlip = AddBlipForEntity(plane)
    SetBlipSprite (destinationBlip, 307)
    SetBlipColour(destinationBlip, 46)
    SetBlipFlashesAlternate(destinationBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Cargo Plane")
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

    SetVehicleDoorOpen(plane, 2, false, false)

 
   
    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj1 = CreateObject(model1, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj1, {  options = { {  event = 'Polar-Sub:Client:Crate1',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj1, vector3(0.0, 0.0, -5.1))
   -- local crateblip = AddBlipForEntity(obj1) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
    
    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj2 = CreateObject(model2, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj2, {  options = { {  event = 'Polar-Sub:Client:Crate2',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj2, vector3(0.0, 0.0, -0.1))
   -- local crateblip = AddBlipForEntity(obj2) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
  
    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj3 = CreateObject(model3, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj3, {  options = { {  event = 'Polar-Sub:Client:Crate3',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj3, vector3(0.0, 0.0, -0.1))
  --  local crateblip = AddBlipForEntity(obj3) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
  
    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj4 = CreateObject(model4, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj4, {  options = { {  event = 'Polar-Sub:Client:Crate4',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj4, vector3(0.0, 0.0, -0.1))
  --  local crateblip = AddBlipForEntity(obj4) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
        
    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj5 = CreateObject(model6, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj5, {  options = { {  event = 'Polar-Sub:Client:Crate5',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj5, vector3(0.0, 0.0, -0.1))
   -- local crateblip = AddBlipForEntity(obj5) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
    
    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj6 = CreateObject(model6, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj6, {  options = { {  event = 'Polar-Sub:Client:Crate6',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj6, vector3(0.0, 0.0, -0.1))
   -- local crateblip = AddBlipForEntity(obj6) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj6, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)

    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj7 = CreateObject(model7, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj7, {  options = { {  event = 'Polar-Sub:Client:Crate7',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj7, vector3(0.0, 0.0, -0.1))
  --  local crateblip = AddBlipForEntity(obj7) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj7, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)

    Wait(1500) local planeCoords = GetEntityCoords(plane) 
    local obj8 = CreateObject(model8, planeCoords.x, planeCoords.y, planeCoords.z - 20, server, server)
    exports['qb-target']:AddTargetEntity(obj8, {  options = { {  event = 'Polar-Sub:Client:Crate8',  icon = 'fa-solid fa-star',  label = 'Grab Crate', } }, distance = 1.5,  })
    SetEntityVelocity(obj8, vector3(0.0, 0.0, -0.1))
  --  local crateblip = AddBlipForEntity(obj8) SetBlipSprite (crateblip, 306) SetBlipColour(crateblip, 46) SetBlipFlashesAlternate(crateblip, true) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName("Crate") EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core') while not HasNamedPtfxAssetLoaded('core') do Wait(10) end UseParticleFxAssetNextCall("core")  SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)  StartParticleFxLoopedOnEntity('exp_grd_flare', obj8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
   

    SetVehicleDoorShut(plane, 2, false, false)
    
    Wait(30000)
    RemoveBlip(destinationBlip)
    Wait(120000)
    RemoveBlip(crateblip)

   -- CreateThread(function() while true do Wait(100) if not Config.Prop then DeleteEntity(obj) break end end end) 
    --Wait(120000)
    --RemoveBlip(crateblip)
end)




RegisterNetEvent('Polar-Sub:Client:Crate1', function() animation() TriggerServerEvent('Polar-Sub:Server:Crate1') end)
RegisterNetEvent('Polar-Sub:Client:Crate2', function()    animation() TriggerServerEvent('Polar-Sub:Server:Crate2') end)
RegisterNetEvent('Polar-Sub:Client:Crate3', function()    animation()TriggerServerEvent('Polar-Sub:Server:Crate3') end)
RegisterNetEvent('Polar-Sub:Client:Crate4', function()    animation()TriggerServerEvent('Polar-Sub:Server:Crate4') end)
RegisterNetEvent('Polar-Sub:Client:Crate5', function()    animation() TriggerServerEvent('Polar-Sub:Server:Crate5') end)
RegisterNetEvent('Polar-Sub:Client:Crate6', function()   animation() TriggerServerEvent('Polar-Sub:Server:Crate6') end)
RegisterNetEvent('Polar-Sub:Client:Crate7', function()   animation() TriggerServerEvent('Polar-Sub:Server:Crate7') end)
RegisterNetEvent('Polar-Sub:Client:Crate8', function()   animation() TriggerServerEvent('Polar-Sub:Server:Crate8') end)

function  animation()
     local ped = PlayerPedId()
  loadAnimDict('amb@medic@standing@kneel@base')
  loadAnimDict('anim@gangops@facility@servers@bodysearch@')
  TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
  TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
  Wait(30000)
  ClearPedTasks(ped)
end










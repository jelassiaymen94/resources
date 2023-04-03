local QBCore = exports['qb-core']:GetCoreObject()
local model = GetHashKey('prop_drop_armscrate_01')
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
   
    
    local loc = 50
    Wait(500) local planeCoords = GetEntityCoords(plane) 
    object(1, vec3(planeCoords.x, planeCoords.y, planeCoords.z))
    Wait(500) local planeCoords = GetEntityCoords(plane)
    object(2, vec3(planeCoords.x, planeCoords.y, planeCoords.z))
    Wait(500) local planeCoords = GetEntityCoords(plane)
    object(3, vec3(planeCoords.x, planeCoords.y, planeCoords.z))
    Wait(500) local planeCoords = GetEntityCoords(plane)
    object(4, vec3(planeCoords.x, planeCoords.y, planeCoords.z))
    Wait(500) local planeCoords = GetEntityCoords(plane)
    object(5, vec3(planeCoords.x, planeCoords.y, planeCoords.z))
  
    

    Wait(30000)
    RemoveBlip(destinationBlip)
   

   -- CreateThread(function() while true do Wait(100) if not Config.Prop then DeleteEntity(obj) break end end end) 
    --Wait(120000)
    --RemoveBlip(crateblip)
end)


function object(numba, dest)
    local numbha = numba
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end
    local obj = CreateObject(model, dest.x, dest.y, dest.z - 30, server, server)
    exports['qb-target']:AddTargetModel(obj, {
        options = {
            {
                event = 'Polar-Sub:Client:Crate',
                icon = 'fa-solid fa-star',
                label = 'Grab Crate',
                product = numbha
            }
        },
        distance = 1.5, 
    })
    SetEntityVelocity(obj, vector3(0.0, 0.0, -0.1))
    local crateblip = AddBlipForEntity(obj)
    SetBlipSprite (crateblip, 306)
    SetBlipColour(crateblip, 46)
    SetBlipFlashesAlternate(crateblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Crate")
    EndTextCommandSetBlipName(crateblip)
    RequestNamedPtfxAsset('core')
    while not HasNamedPtfxAssetLoaded('core') do Wait(10) end
    UseParticleFxAssetNextCall("core")
    SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)
    StartParticleFxLoopedOnEntity('exp_grd_flare', obj, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size, 0.0, 0.0, 0.0)
end


RegisterNetEvent('Polar-Sub:Client:Crate', function(data) local n = data.product print(n) TriggerServerEvent('Polar-Sub:Server:Crate') end)









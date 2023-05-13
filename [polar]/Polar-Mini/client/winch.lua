local QBCore = exports['qb-core']:GetCoreObject()













local ropeEntity = nil
local attachedEntity = nil
local isRopeAttached = false

function AttachRopeToVehicle(vehicle)
    if isRopeAttached then
        return
    end
    
    local playerPed = PlayerPedId()
    local vehiclePos = GetEntityCoords(vehicle)
    local playerPos = GetEntityCoords(playerPed)
    local ropePos = vector3(vehiclePos.x, vehiclePos.y, playerPos.z)
    
    local ropeLength = #(playerPos - ropePos)
    ropeEntity = AddRope(ropePos.x, ropePos.y, ropePos.z, 0.0, 0.0, 0.0, ropeLength, 1, ropeLength, 0.0, false, false, false, 5.0, false, 0)
    
    AttachEntitiesToRope(ropeEntity, playerPed, GetEntityBoneIndexByName(playerPed, "SKEL_ROOT"), vehicle, GetEntityBoneIndexByName(vehicle, "chassis"))
    
    SetRopeLengthChangeRate(ropeEntity, -5.0) -- Adjust the rate as desired
    
    attachedEntity = vehicle
    isRopeAttached = true
end

function DetachRope()
    if not isRopeAttached then
        return
    end
    
    DeleteEntity(ropeEntity)
    DetachRopeFromEntity(attachedEntity, ropeEntity)
    
    ropeEntity = nil
    attachedEntity = nil
    isRopeAttached = false
end

CreateThread(function()
    while true do
        Wait(0)
        
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if IsControlJustPressed(0, 51) and DoesEntityExist(vehicle) and GetVehicleClass(vehicle) ~= 7 then -- Key: E
            if isRopeAttached then
                DetachRope()
            else
                AttachRopeToVehicle(vehicle)
            end
        end
    end
end)
-- Define the trucking job
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local TruckingJob = {}
TruckingJob.DeliveryBlip = nil
TruckingJob.DeliveryMarker = nil
TruckingJob.IsDelivering = false
TruckingJob.CurrentDelivery = nil

-- Configurable variables
local DeliveryLocations = {
    {x = 123.45, y = 67.89, z = 100.0},
    {x = 321.98, y = 54.32, z = 200.0},
    -- Add more delivery locations here
}

local DeliveryMarkerSize = {x = 2.5, y = 2.5, z = 0.5}
local DeliveryMarkerColor = {r = 0, g = 255, b = 0, a = 100}

-- Trucking job functions
function StartTruckingJob()
    TruckingJob.IsDelivering = true
    TruckingJob.CurrentDelivery = GenerateRandomDelivery()

    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0},
        multiline = true,
        args = {'Trucking', 'You have a new delivery!'}
    })

    SetDeliveryBlip()
    SetDeliveryMarker()
end

function EndTruckingJob()
    TruckingJob.IsDelivering = false
    RemoveDeliveryBlip()
    RemoveDeliveryMarker()

    -- Additional cleanup or reward logic can be added here
end

function GenerateRandomDelivery()
    return DeliveryLocations[math.random(1, #DeliveryLocations)]
end

-- Blip and marker functions
function SetDeliveryBlip()
    if TruckingJob.DeliveryBlip ~= nil then
        RemoveDeliveryBlip()
    end

    TruckingJob.DeliveryBlip = AddBlipForCoord(TruckingJob.CurrentDelivery.x, TruckingJob.CurrentDelivery.y, TruckingJob.CurrentDelivery.z)
    SetBlipSprite(TruckingJob.DeliveryBlip, 1)
    SetBlipColour(TruckingJob.DeliveryBlip, 5)
    SetBlipRoute(TruckingJob.DeliveryBlip, true)
    SetBlipRouteColour(TruckingJob.DeliveryBlip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Trucking Delivery")
    EndTextCommandSetBlipName(TruckingJob.DeliveryBlip)
end

function RemoveDeliveryBlip()
    if TruckingJob.DeliveryBlip ~= nil then
        RemoveBlip(TruckingJob.DeliveryBlip)
        TruckingJob.DeliveryBlip = nil
    end
end

function SetDeliveryMarker()
    if TruckingJob.DeliveryMarker ~= nil then
        RemoveDeliveryMarker()
    end

    TruckingJob.DeliveryMarker = CreateMarker(1, TruckingJob.CurrentDelivery.x, TruckingJob.CurrentDelivery.y, TruckingJob.CurrentDelivery.z - 0.95, 0, 0, 0, 0, 0, 0, DeliveryMarkerSize.x, DeliveryMarkerSize.y, DeliveryMarkerSize.z, DeliveryMarkerColor.r, DeliveryMarkerColor.g, DeliveryMarkerColor.b, DeliveryMarkerColor.a, false, true, 2, nil, nil, false)
end

function RemoveDeliveryMarker()
    if TruckingJob.DeliveryMarker ~= nil then
        RemoveMarker(TruckingJob.DeliveryMarker)
        TruckingJob.DeliveryMarker = nil
    end
end

-- Event handlers
RegisterNetEvent('trucking:startJob')
AddEventHandler('trucking:startJob', function()
    StartTruckingJob()
end)

RegisterNetEvent('trucking:completeJob')
AddEventHandler('trucking:completeJob', function()
    EndTruckingJob()
end)

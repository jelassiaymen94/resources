local blip = nil
local QBCore = exports['qb-core']:GetCoreObject()

function GenerateBlip(data)
    blip = AddBlipForCoord(data.Coords.x, data.Coords.y, data.Coords.z)
    SetBlipSprite(blip, data.SpriteId)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, data.Scale)
    SetBlipColour(blip, data.Color)
    SetBlipAsShortRange(blip, data.ShortRange)
    SetBlipAlpha(blip, data.Alpha)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.Name)
    EndTextCommandSetBlipName(blip)
end

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
        if blip ~= nil then
             RemoveBlip(blip)
        end
   end
end)
local blipname = {
    enabled = true,
    Name = "City Hall",
    SpriteId = 487,
    Color = 0,
    Scale = 0.65,
    ShortRange = true,
    Alpha = 255,
    Coords = vector3(-551.9, -200.5, 37.23)
}
CreateThread(function()
    GenerateBlip(blipname)
end)
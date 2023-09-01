local blip = nil

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
    Name = "Cityhall",
    SpriteId = 487,
    Color = 2,
    Scale = 1.3,
    ShortRange = true,
    Alpha = 255,
    Coords = vector3(-266.88833618164, -961.62231445313, 31.227128982544)
}
CreateThread(function()
    GenerateBlip(blipname)
end)
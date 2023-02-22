local QBCore = exports['qb-core']:GetCoreObject()
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        start()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    start()
    
end)
RegisterNetEvent('Polar-Sub:Client:Inventory', function(size, weight)

   
end)
function start()

for i = 1, #Config.Stashes do
-- test stashhouse
weight = Config.Stashes[i].weight * 1000
exports['qb-target']:AddBoxZone(Config.Stashes[i].numba, Config.Stashes[i].coords, 1.5, 2.0, { name=Config.Stashes[i].numba, heading = 0.0, debugPoly=Config.Debug, minZ=Config.Stashes[i].min, maxZ=Config.Stashes[i].max},
{ options = { {  event = "Polar-Sub:Client:Stash", icon = "fas fa-box-open", label = 'Open', stash = "Storage" .. Config.Stashes[i].numba .. " ", other = {slots = Config.Stashes[i].slots, maxweight = weight}, coords = Config.Stashes[i].coords, }, },  distance = 2.0 })
RegisterNetEvent('Polar-Sub:Client:Stash', function(data)  TriggerServerEvent("inventory:server:OpenInventory", "stash", ""..data.stash, data.other) TriggerEvent("inventory:client:SetCurrentStash", ""..data.stash) end)

end
end
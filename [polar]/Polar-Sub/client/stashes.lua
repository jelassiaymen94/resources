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


RegisterNetEvent('Polar-Sub:Client:Stash', function(data) TriggerEvent("inventory:client:SetCurrentStash", data.stash) TriggerServerEvent("inventory:server:OpenInventory", "stash", data.stash, {maxweight = data.weight, slots = data.slots}) end)

function start()

for i = 1, #Config.Stashes do

    local weight2 = Config.Stashes[i].weight * 1000
    exports['qb-target']:AddBoxZone(Config.Stashes[i].numba, Config.Stashes[i].coords, 1.5, 2.0, { name=Config.Stashes[i].numba, heading = 0.0, debugPoly=Config.Debug, minZ=Config.Stashes[i].min, maxZ=Config.Stashes[i].max},
    { options = { {  event = "Polar-Sub:Client:Stash", icon = "fas fa-box-open", label = 'Open', stash = "Storage " .. Config.Stashes[i].numba .. " ", slots = Config.Stashes[i].slots, weight = weight2, coords = Config.Stashes[i].coords, }, },  distance = 2.0 })

end

for i = 1, #Config.GangStashes do
    
    local weight2 = Config.GangStashes[i].weight * 1000
    exports['qb-target']:AddBoxZone(Config.GangStashes[i].numba, Config.GangStashes[i].coords, 1.5, 2.0, { name=Config.GangStashes[i].numba, heading = 0.0, debugPoly=Config.Debug, minZ=Config.GangStashes[i].min, maxZ=Config.GangStashes[i].max},
    { options = { {  event = "Polar-Sub:Client:Stash", icon = "fas fa-box-open", label = 'Open', gang = Config.GangStashes[i].gang, stash = "Storage " .. Config.GangStashes[i].numba .. " ", slots = Config.GangStashes[i].slots, weight = weight2, coords = Config.GangStashes[i].coords, }, },  distance = 2.0 })
    
end

for i = 1, #Config.JobStashes do
    
    local weight2 = Config.JobStashes[i].weight * 1000
    exports['qb-target']:AddBoxZone(Config.JobStashes[i].numba, Config.JobStashes[i].coords, 1.5, 2.0, { name=Config.JobStashes[i].numba, heading = 0.0, debugPoly=Config.Debug, minZ=Config.JobStashes[i].min, maxZ=Config.JobStashes[i].max},
    { options = { {  event = "Polar-Sub:Client:Stash", icon = "fas fa-box-open", label = 'Open', job = Config.JobStashes[i].job, stash = "Storage " .. Config.JobStashes[i].numba .. " ", slots = Config.JobStashes[i].slots, weight = weight2, coords = Config.JobStashes[i].coords, }, },  distance = 2.0 })
    
end




end

CreateThread(function()
local kitchen = true
exports['qb-target']:AddBoxZone("kitchendoor", vector3(-1299.18, -821.76, 17.25), 1, 1, { name = "kitchendoor", heading = 28.69, debug = true, minZ = 16.5, maxZ =  17.5,}, 
{ options = {{ event = "qb-bankrobbery:PaletoDrill", canInteract = function() if kitchen then return true end end, icon = "fas fa-bolt", label = "Lockpick Door", excludejob = 'police'}}, distance = 2.5 }) 
end)
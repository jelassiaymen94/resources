local QBCore = exports[Config.Core]:GetCoreObject()
local Check = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:Check", function(source, cb) cb(Check) end)
RegisterNetEvent('Polar-Weed:Server:UnDoCheck', function() Check = false end)
RegisterNetEvent('Polar-Weed:Server:ForceCheck', function() Check = true end)

local QBCore = exports['qb-core']:GetCoreObject()




RegisterNetEvent('Polar-GlassCleaner:Server:TargetRemove', function(target) TriggerClientEvent('Polar-GlassCleaner:Client:TargetRemove', -1, target)   end)
RegisterNetEvent('Polar-GlassCleaner:Server:TargetAdd', function(target) TriggerClientEvent('Polar-GlassCleaner:Client:TargetAdd', -1, target)   end)
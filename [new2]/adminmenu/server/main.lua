QBCore = exports['qb-core']:GetCoreObject()

lib.addCommand('admin', {
    help = 'Open the admin menu',
    restricted = 'qbcore.mod'
}, function(source)
    TriggerClientEvent('adminmenu:client:OpenUI', source)
end)
-- Callbacks

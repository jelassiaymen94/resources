local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('grapple:createRope')
AddEventHandler('grapple:createRope', function(grappleid, dest)
    TriggerClientEvent('grapple:ropeCreated', source, grappleid, dest)
end)

RegisterServerEvent('grapple:destroyRope')
AddEventHandler('grapple:destroyRope', function(grappleid)
    TriggerClientEvent('grapple:ropeDestroyed:'..tostring(grappleid), source)
end)


QBCore.Functions.CreateUseableItem("wgrapplegun", function(source)
    TriggerClientEvent('grapple:useGrapple', source)
end)


local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    --spawnpeds()
    
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
       -- spawnpeds()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    --spawnpeds()
    
end)
---- Super jump OP client.lua
RegisterNetEvent('Polar-Sub:client:superjump')
AddEventHandler('Polar-Sub:client:superjump', function()
    QBCore.Functions.Progressbar("use_superjump", "Poppin Pills", 3500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_suicide",
        anim = "pill_fp",
        flags = 49,
    }, {}, {}, function() -- Done
        TriggerServerEvent("Polar-Sub:server:superjump")
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['superjump'], 'remove')
       -- QBCore.Functions.Notify('Super Jump Power Started', 'success')
        local superJump = true
        CreateThread(function()
            while superJump do
                SetSuperJumpThisFrame(PlayerId(), 1000)
                Wait(5)
            end
        end)

        CreateThread(function()
            Wait(30000) -- Wait for 30 seconds (30 seconds = 30000 milliseconds)
            superJump = false
            --QBCore.Functions.Notify('Super Jump Power Ended', 'error')
        end)
    end, function() -- Cancel
        QBCore.Functions.Notify('Canceled..', 'error')
    end)
end)
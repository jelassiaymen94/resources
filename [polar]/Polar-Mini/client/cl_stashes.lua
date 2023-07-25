QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('Polar-Mini:Client:CreateStash', function(stashname, tier)
    



end)
RegisterNetEvent('Polar-Mini:Client:OpenStash', function(stashname)

    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashname)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    TriggerEvent("inventory:client:SetCurrentStash", stashname)



end)
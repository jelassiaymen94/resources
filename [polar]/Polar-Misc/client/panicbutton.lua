local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()


end)


RegisterNetEvent('police:client:SendPoliceEmergencyAlert', function()

    button()
   
end)
RegisterKeyMapping('panicbutton', 'Panic Button', 'keyboard', 'o')
RegisterCommand("panicbutton", function(source) 
    
  button()
    
end)

function button()

    local src = source
    --local isDead = QBCore.Functions.GetPlayerData().metadata["isdead"]
    PlayerJob = QBCore.Functions.GetPlayerData().job.name
    PlayerJobDuty = QBCore.Functions.GetPlayerData().job.onduty
  
        if PlayerJob == "police" and PlayerJobDuty == true then
            exports['ps-dispatch']:OfficerDown()
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25.0, "panicbutton", 0.15)
            --TriggerServerEvent('InteractSound_SV:PlayAtCoord', vec3(1878.16, 3721.33, 33.0), 50, 'warehousealert', 0.35)
        end
        if PlayerJob == "ambulance" and PlayerJobDuty == true then
            exports['ps-dispatch']:EmsDown()
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25.0, "panicbutton", 0.15)
        end


end
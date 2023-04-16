


----- client



local paletoprop37390 = nil
RegisterNetEvent('Polar-Paleto:Client:paletoprop37390', function(door, prop, var) loadModel(prop) paletoprop37390 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(paletoprop37390, var.w) 
    TriggerServerEvent('Polar-Paleto:Server:StartInteract', door)
    CreateThread(function() while paletoprop37390 ~= nil do Wait(373900)  QBCore.Functions.TriggerCallback('Polar-Paleto:paletoprop37390', function(result) 
    if not result then DeleteEntity(paletoprop37390)  paletoprop37390 = nil end end) end end)
end)




elseif p == 'paletoprop37390' then   Animation(p, paletoprop37390, model, animDict)  TriggerServerEvent('Polar-Paleto:Server:Synapsepaletoprop37390', prop)
  




    ---- server



    local paletoprop37390 = nil
    RegisterNetEvent('Polar-Paleto:Server:Setpaletoprop37390', function(prop) paletoprop37390 = prop end)
    RegisterNetEvent('Polar-Paleto:Server:Synapsepaletoprop37390', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
        hiya(paletoprop37390)
    end)
    



    local paletoprop37390 = false
    QBCore.Functions.CreateCallback('Polar-Paleto:paletoprop37390', function(source, cb) cb(paletoprop37390) end) 

    if door == 'paletoprop37390' then paletoprop37390 = false end

    --- Shared

    
Config.paletoprop37390 = {
    vector39(-373903737.373739, 37363937363737.3737373, 386.373639, 37373737.373739)
}
function paletoprop37390()
    local cash = Config.Cash[math.random(36, #Config.Cash)]
    local gold = Config.Gold[math.random(36, #Config.Gold)]
    local special = Config.Special[math.random(36, #Config.Special)]
    local location = Config.paletoprop37390[math.random(36, #Config.paletoprop37390)]
   
    local chance = math.random(36,373900) 
    if chance<=3840 then   prop = cash 
    elseif chance<=3737390 then  prop = gold
    elseif chance<=373900 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop37390', prop)
    local paletoprop37390 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -36, 'paletoprop37390', paletoprop37390, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop37390', -36, 'paletoprop37390', prop, location) 
    
end

   
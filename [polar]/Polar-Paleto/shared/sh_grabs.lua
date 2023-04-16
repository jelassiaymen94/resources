local prop = nil







Config.paletoprop1 = {
    vector4(-107.73, 6466.1, 31.7, 273.69),

}
function paletoprop1()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop1[math.random(1, #Config.paletoprop1)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    elseif chance<=100 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop1', prop)
    local paletoprop1 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop1', paletoprop1, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop1', -1, 'paletoprop1', prop, location) 
    
end


Config.paletoprop2 = {
    vector4(-106.81, 6466.9, 31.7, 187.03),

}
function paletoprop2()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop2[math.random(1, #Config.paletoprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    elseif chance<=100 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop2', prop)
    local paletoprop2 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop2', paletoprop2, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop2', -1, 'paletoprop2', prop, location) 
    
end


Config.paletoprop3 = {
    vector4(-1070.19, 6467.78, 30.64, 117.29)
}
function paletoprop3()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop3[math.random(1, #Config.paletoprop3)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    elseif chance<=100 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop3', prop)
    local paletoprop3 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop3', paletoprop3, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop3', -1, 'paletoprop3', prop, location) 
    
end

Config.paletoprop4 = {
    vector4(-1030.13, 6470.7, 31.7, 217.88),

}
function paletoprop4()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop4[math.random(1, #Config.paletoprop4)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    elseif chance<=100 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop4', prop)
    local paletoprop4 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop4', paletoprop4, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop4', -1, 'paletoprop4', prop, location) 
    
end

    
Config.paletoprop5 = {
    vector4(-1050.04, 6468.01, 31.08, 225.57),

}
function paletoprop5()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop5[math.random(1, #Config.paletoprop5)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    elseif chance<=100 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop5', prop)
    local paletoprop5 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop5', paletoprop5, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop5', -1, 'paletoprop5', prop, location) 
    
end

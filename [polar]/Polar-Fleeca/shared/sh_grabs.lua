local prop = nil



-- 1-6 and 31-40



Config.fleecaprop1 = {
    vector4(-107.73, 6466.1, 32.7, 273.69),

}
function fleecaprop1()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop1[math.random(1, #Config.fleecaprop1)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop1', prop)
    local fleecaprop1 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop1', fleecaprop1, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop1', -1, 'fleecaprop1', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.fleecaprop2 = {
    vector4(-106.81, 6466.9, 32.7, 187.03),

}
function fleecaprop2()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop2[math.random(1, #Config.fleecaprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop2', prop)
    local fleecaprop2 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop2', fleecaprop2, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop2', -1, 'fleecaprop2', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.fleecaprop3 = {
    vector4(-1070.19, 6467.78, 30.64, 117.29)
}
function fleecaprop3()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop3[math.random(1, #Config.fleecaprop3)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop3', prop)
    local fleecaprop3 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop3', fleecaprop3, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop3', -1, 'fleecaprop3', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.fleecaprop4 = {
    vector4(-1030.13, 6470.7, 31.7, 217.88),

}
function fleecaprop4()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop4[math.random(1, #Config.fleecaprop4)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop4', prop)
    local fleecaprop4 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop4', fleecaprop4, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop4', -1, 'fleecaprop4', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

    
Config.fleecaprop5 = {
    vector4(-1050.04, 6468.01, 31.08, 225.57),

}
function fleecaprop5()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop5[math.random(1, #Config.fleecaprop5)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop5', prop)
    local fleecaprop5 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop5', fleecaprop5, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop5', -1, 'fleecaprop5', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.fleecaprop31 = {
    vector4(-114.09, 6471.44, 32.69, 16.24),
    vector4(-113.13, 6472.56, 32.69, 93.0),

}
function fleecaprop31()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop31[math.random(1, #Config.fleecaprop31)]
   
    local chance = math.random(1,100) 
    if chance<=60 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop31', prop)
    local fleecaprop31 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop31', fleecaprop31, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop31', -1, 'fleecaprop31', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.fleecaprop32 = {
    vector4(-103.83, 6470.11, 32.69, 204.38),
    vector4(-98.29, 6469.73, 32.68, 7.65),


}
function fleecaprop32()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop32[math.random(1, #Config.fleecaprop32)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=85 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop32', prop)
    local fleecaprop32 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop32', fleecaprop32, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop32', -1, 'fleecaprop32', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.fleecaprop33 = {
    vector4(-94.65, 6467.59, 32.69, 231.38),
    vector4(-106.41, 6461.34, 32.69, 80.23),
    

}
function fleecaprop33()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop33[math.random(1, #Config.fleecaprop33)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop33', prop)
    local fleecaprop33 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop33', fleecaprop33, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop33', -1, 'fleecaprop33', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.fleecaprop34 = {
    vector4(-107.72, 6478.95, 32.68, 36.88),
    vector4(-108.65, 6478.16, 32.69, 84.88),
    vector4(-98.93, 6464.41, 32.27, 54.38),

}
function fleecaprop34()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop34[math.random(1, #Config.fleecaprop34)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop34', prop)
    local fleecaprop34 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop34', fleecaprop34, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop34', -1, 'fleecaprop34', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.fleecaprop35 = {
   vector4(-91.36, 6465.49, 32.42, 190.58),
   vector4(-95.66, 6463.77, 32.43, 100.15),
   vector4(-98.17, 6458.93, 32.27, 163.0),

}
function fleecaprop35()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop35[math.random(1, #Config.fleecaprop35)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<= 75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop35', prop)
    local fleecaprop35 = true
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop35', fleecaprop35, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop35', -1, 'fleecaprop35', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

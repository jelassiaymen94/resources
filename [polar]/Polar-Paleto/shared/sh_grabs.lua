local prop = nil



-- 1-6 and 31-40



Config.paletoprop1 = {
    vector4(-107.73, 6466.1, 32.7, 273.69),

}
function paletoprop1()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop1[math.random(1, #Config.paletoprop1)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop1', prop)
    local paletoprop1 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop1', paletoprop1, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop1', -1, 'paletoprop1', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.paletoprop2 = {
    vector4(-106.81, 6466.9, 32.7, 187.03),

}
function paletoprop2()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop2[math.random(1, #Config.paletoprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop2', prop)
    local paletoprop2 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop2', paletoprop2, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop2', -1, 'paletoprop2', prop, vec4(location.x, location.y, location.z-1, location.w))
    
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
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop3', prop)
    local paletoprop3 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop3', paletoprop3, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop3', -1, 'paletoprop3', prop, vec4(location.x, location.y, location.z-1, location.w))
    
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
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop4', prop)
    local paletoprop4 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop4', paletoprop4, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop4', -1, 'paletoprop4', prop, vec4(location.x, location.y, location.z-1, location.w))
    
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
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop5', prop)
    local paletoprop5 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop5', paletoprop5, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop5', -1, 'paletoprop5', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.paletoprop31 = {
    vector4(-114.09, 6471.44, 32.69, 16.24),
    vector4(-113.13, 6472.56, 32.69, 93.0),

}
function paletoprop31()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop31[math.random(1, #Config.paletoprop31)]
   
    local chance = math.random(1,100) 
    if chance<=60 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop31', prop)
    local paletoprop31 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop31', paletoprop31, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop31', -1, 'paletoprop31', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.paletoprop32 = {
    vector4(-103.83, 6470.11, 32.69, 204.38),
    vector4(-98.29, 6469.73, 32.68, 7.65),


}
function paletoprop32()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop32[math.random(1, #Config.paletoprop32)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=85 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop32', prop)
    local paletoprop32 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop32', paletoprop32, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop32', -1, 'paletoprop32', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.paletoprop33 = {
    vector4(-94.65, 6467.59, 32.69, 231.38),
    vector4(-106.41, 6461.34, 32.69, 80.23),
    

}
function paletoprop33()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop33[math.random(1, #Config.paletoprop33)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop33', prop)
    local paletoprop33 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop33', paletoprop33, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop33', -1, 'paletoprop33', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.paletoprop34 = {
    vector4(-107.72, 6478.95, 32.68, 36.88),
    vector4(-108.65, 6478.16, 32.69, 84.88),
    vector4(-98.93, 6464.41, 32.27, 54.38),

}
function paletoprop34()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop34[math.random(1, #Config.paletoprop34)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop34', prop)
    local paletoprop34 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop34', paletoprop34, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop34', -1, 'paletoprop34', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.paletoprop35 = {
   vector4(-91.36, 6465.49, 32.42, 190.58),
   vector4(-95.66, 6463.77, 32.43, 100.15),
   vector4(-98.17, 6458.93, 32.27, 163.0),

}
function paletoprop35()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop35[math.random(1, #Config.paletoprop35)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<= 75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop35', prop)
    local paletoprop35 = true
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop35', paletoprop35, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:paletoprop35', -1, 'paletoprop35', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

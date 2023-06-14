local prop = nil


-- pickups are 6-10 and 21 - 25

Config.fleecaprop6 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    vector4(-99.03, 6472.54, 32.1, 276.78),


}
function fleecaprop6()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop6[math.random(1, #Config.fleecaprop6)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop6', prop)
    local fleecaprop6 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop6', fleecaprop6, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop6', -1, 'fleecaprop6', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.fleecaprop7 = {
   vector4(-102.3, 6474.21, 32.08, 14.04),
   vector4(-105.08, 6468.01, 32.08, 244.05),

}
function fleecaprop7()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop7[math.random(1, #Config.fleecaprop7)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop7', prop)
    local fleecaprop7 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop7', fleecaprop7, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop7', -1, 'fleecaprop7', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.fleecaprop8 = {
    vector4(-98.48, 6462.07, 31.63, 153.75),
    vector4(-97.36, 6463.53, 31.63, 334.86),
    vector4(-104.61, 6461.07, 32.1, 351.37),

}
function fleecaprop8()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop8[math.random(1, #Config.fleecaprop8)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop8', prop)
    local fleecaprop8 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop8', fleecaprop8, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop8', -1, 'fleecaprop8', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.fleecaprop9 = {
    vector4(-92.83, 6464.61, 32.13, 187.6),
    vector4(-95.62, 6464.51, 31.63, 189.22),
   

}
function fleecaprop9()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop9[math.random(1, #Config.fleecaprop9)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop9', prop)
    local fleecaprop9 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop9', fleecaprop9, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop9', -1, 'fleecaprop9', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end








--- shelf
Config.fleecaprop10 = {
    vector4(-106.4, 6480.79, 31.94, 23.65),
    vector4(-95.78, 6465.86, 32.36, 223.99), 

    
}
function fleecaprop10()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.fleecaprop10[math.random(1, #Config.fleecaprop10)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop10', prop)
    local fleecaprop10 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop10', fleecaprop10, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop10', -1, 'fleecaprop10', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.fleecaprop21 = {
    vector4(-107.35, 6479.68, 32.37, 66.21),
   

    
}
function fleecaprop21()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.fleecaprop21[math.random(1, #Config.fleecaprop21)]
   
    local chance = math.random(1,210) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop21', prop)
    local fleecaprop21 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop21', fleecaprop21, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop21', -1, 'fleecaprop21', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.fleecaprop22 = {
    vector4(-102.56, 6459.26, 31.93, 267.8)
   
    
}
function fleecaprop22()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.fleecaprop22[math.random(1, #Config.fleecaprop22)]
   
    local chance = math.random(1,220) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop22', prop)
    local fleecaprop22 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop22', fleecaprop22, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop22', -1, 'fleecaprop22', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end
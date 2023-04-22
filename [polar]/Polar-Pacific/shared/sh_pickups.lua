local prop = nil


-- pickups are 6-10 and 21 - 25

Config.Pacificprop6 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    vector4(-99.03, 6472.54, 32.1, 276.78),


}
function Pacificprop6()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop6[math.random(1, #Config.Pacificprop6)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop6', prop)
    local Pacificprop6 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop6', Pacificprop6, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop6', -1, 'Pacificprop6', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.Pacificprop7 = {
   vector4(-102.3, 6474.21, 32.08, 14.04),
   vector4(-105.08, 6468.01, 32.08, 244.05),

}
function Pacificprop7()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop7[math.random(1, #Config.Pacificprop7)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop7', prop)
    local Pacificprop7 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop7', Pacificprop7, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop7', -1, 'Pacificprop7', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.Pacificprop8 = {
    vector4(-98.48, 6462.07, 31.63, 153.75),
    vector4(-97.36, 6463.53, 31.63, 334.86),
    vector4(-104.61, 6461.07, 32.1, 351.37),

}
function Pacificprop8()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop8[math.random(1, #Config.Pacificprop8)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop8', prop)
    local Pacificprop8 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop8', Pacificprop8, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop8', -1, 'Pacificprop8', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.Pacificprop9 = {
    vector4(-92.83, 6464.61, 32.13, 187.6),
    vector4(-95.62, 6464.51, 31.63, 189.22),
   

}
function Pacificprop9()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop9[math.random(1, #Config.Pacificprop9)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop9', prop)
    local Pacificprop9 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop9', Pacificprop9, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop9', -1, 'Pacificprop9', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end








--- shelf
Config.Pacificprop10 = {
    vector4(-106.4, 6480.79, 31.94, 23.65),
    vector4(-95.78, 6465.86, 32.36, 223.99), 

    
}
function Pacificprop10()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.Pacificprop10[math.random(1, #Config.Pacificprop10)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop10', prop)
    local Pacificprop10 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop10', Pacificprop10, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop10', -1, 'Pacificprop10', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.Pacificprop21 = {
    vector4(-107.35, 6479.68, 32.37, 66.21),
   

    
}
function Pacificprop21()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.Pacificprop21[math.random(1, #Config.Pacificprop21)]
   
    local chance = math.random(1,210) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop21', prop)
    local Pacificprop21 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop21', Pacificprop21, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop21', -1, 'Pacificprop21', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.Pacificprop22 = {
    vector4(-102.56, 6459.26, 31.93, 267.8)
   
    
}
function Pacificprop22()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.Pacificprop22[math.random(1, #Config.Pacificprop22)]
   
    local chance = math.random(1,220) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop22', prop)
    local Pacificprop22 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop22', Pacificprop22, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop22', -1, 'Pacificprop22', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end
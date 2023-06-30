local prop = nil


-- pickups are 6-10 and 21 - 25

Config.Pacificprop6 = {
    vector4(240.02, 217.44, 106.69, 68.43),


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
    vector4(239.33, 218.63, 106.69, 153.22),

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
    vector4(238.69, 220.12, 106.69, 70.7),
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
    vector4(250.77, 222.01, 106.29, 359.19),
   

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
    vector4(254.23, 219.07, 106.29, 246.25),

    
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
    vector4(257.84, 211.76, 106.69, 284.95),

    
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
    vector4(248.82, 209.48, 106.29, 12.31),
   
    
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
local prop = nil



-- 1-6 and 31-40



Config.Pacificprop1 = {
    vector4(253.36, 216.38, 107.28, 212.16),
    vector4(264.73, 220.54, 102.58, 315.79),
    vector4(264.2, 213.73, 102.53, 249.38),

}
function Pacificprop1()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop1[math.random(1, #Config.Pacificprop1)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop1', prop)
    local Pacificprop1 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop1', Pacificprop1, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop1', -1, 'Pacificprop1', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.Pacificprop2 = {
    vector4(254.95, 215.8, 107.28, 104.32),
    vector4(250.65, 230.66, 107.17, 344.88),

}
function Pacificprop2()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop2[math.random(1, #Config.Pacificprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop2', prop)
    local Pacificprop2 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop2', Pacificprop2, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop2', -1, 'Pacificprop2', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.Pacificprop3 = {

    vector4(249.31, 216.53, 107.28, 343.13),
    vector4(243.36, 225.66, 107.28, 177.23),
    vector4(264.41, 213.47, 102.53, 20.64),
}
function Pacificprop3()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop3[math.random(1, #Config.Pacificprop3)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop3', prop)
    local Pacificprop3 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop3', Pacificprop3, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop3', -1, 'Pacificprop3', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.Pacificprop4 = {
   
    vector4(249.02, 219.15, 107.28, 196.01),
    vector4(243.95, 229.69, 107.18, 245.55),


}
function Pacificprop4()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop4[math.random(1, #Config.Pacificprop4)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop4', prop)
    local Pacificprop4 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop4', Pacificprop4, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop4', -1, 'Pacificprop4', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

    
Config.Pacificprop5 = {
   vector4(243.77, 219.62, 107.28, 285.62),
   vector4(246.96, 224.4, 107.28, 155.26),

}
function Pacificprop5()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop5[math.random(1, #Config.Pacificprop5)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop5', prop)
    local Pacificprop5 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop5', Pacificprop5, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop5', -1, 'Pacificprop5', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end
--------------------------------------------------------------------------------------------------------------

Config.Pacificprop31 = {
    vector4(245.2, 219.27, 107.28, 14.68),
    vector4(252.14, 222.56, 107.28, 151.43),

}
function Pacificprop31()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop31[math.random(1, #Config.Pacificprop31)]
   
    local chance = math.random(1,100) 
    if chance<=60 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop31', prop)
    local Pacificprop31 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop31', Pacificprop31, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop31', -1, 'Pacificprop31', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.Pacificprop32 = {
    vector4(248.08, 218.46, 107.28, 241.24),
    vector4(264.62, 212.51, 111.18, 165.14),


}
function Pacificprop32()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop32[math.random(1, #Config.Pacificprop32)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=85 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop32', prop)
    local Pacificprop32 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop32', Pacificprop32, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop32', -1, 'Pacificprop32', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.Pacificprop33 = {
    vector4(250.42, 217.07, 107.28, 57.77),
    vector4(264.05, 212.05, 111.18, 316.27),
    

}
function Pacificprop33()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop33[math.random(1, #Config.Pacificprop33)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop33', prop)
    local Pacificprop33 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop33', Pacificprop33, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop33', -1, 'Pacificprop33', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.Pacificprop34 = {
    vector4(245.5, 219.41, 107.28, 112.53),
    vector4(262.94, 210.12, 111.17, 327.58),

}
function Pacificprop34()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop34[math.random(1, #Config.Pacificprop34)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop34', prop)
    local Pacificprop34 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop34', Pacificprop34, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop34', -1, 'Pacificprop34', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.Pacificprop35 = {
    vector4(243.8, 219.95, 107.28, 210.93),
    vector4(261.04, 205.57, 111.18, 306.4),

}
function Pacificprop35()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop35[math.random(1, #Config.Pacificprop35)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<= 75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop35', prop)
    local Pacificprop35 = true
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop35', Pacificprop35, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop35', -1, 'Pacificprop35', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

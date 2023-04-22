local prop = nil



-- 1-6 and 31-40



Config.Pacificprop1 = {
    vector4(-107.73, 6466.1, 32.7, 273.69),

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
    vector4(-106.81, 6466.9, 32.7, 187.03),

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
    vector4(-1070.19, 6467.78, 30.64, 117.29)
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
    vector4(-1030.13, 6470.7, 31.7, 217.88),

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
    vector4(-1050.04, 6468.01, 31.08, 225.57),

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


Config.Pacificprop31 = {
    vector4(-114.09, 6471.44, 32.69, 16.24),
    vector4(-113.13, 6472.56, 32.69, 93.0),

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
    vector4(-103.83, 6470.11, 32.69, 204.38),
    vector4(-98.29, 6469.73, 32.68, 7.65),


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
    vector4(-94.65, 6467.59, 32.69, 231.38),
    vector4(-106.41, 6461.34, 32.69, 80.23),
    

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
    vector4(-107.72, 6478.95, 32.68, 36.88),
    vector4(-108.65, 6478.16, 32.69, 84.88),
    vector4(-98.93, 6464.41, 32.27, 54.38),

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
   vector4(-91.36, 6465.49, 32.42, 190.58),
   vector4(-95.66, 6463.77, 32.43, 100.15),
   vector4(-98.17, 6458.93, 32.27, 163.0),

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

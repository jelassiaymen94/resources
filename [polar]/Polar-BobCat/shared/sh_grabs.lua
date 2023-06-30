local prop = nil



-- 1-6 and 31-40



Config.BobCatprop1 = {
    vector4(876.47, -2119.7, 32.02, 162.76),
    
}
function BobCatprop1()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop1[math.random(1, #Config.BobCatprop1)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop1', prop)
    local BobCatprop1 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop1', BobCatprop1, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop1', -1, 'BobCatprop1', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.BobCatprop2 = {
    vector4(875.47, -2115.91, 32.38, 89.48),

}
function BobCatprop2()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop2[math.random(1, #Config.BobCatprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop2', prop)
    local BobCatprop2 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop2', BobCatprop2, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop2', -1, 'BobCatprop2', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.BobCatprop3 = {
    vector4(878.08, -2109.3, 32.38, 320.91),
}
function BobCatprop3()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop3[math.random(1, #Config.BobCatprop3)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop3', prop)
    local BobCatprop3 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop3', BobCatprop3, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop3', -1, 'BobCatprop3', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.BobCatprop4 = {
    vector4(878.74, -2109.36, 32.38, 49.59),

}
function BobCatprop4()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop4[math.random(1, #Config.BobCatprop4)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop4', prop)
    local BobCatprop4 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop4', BobCatprop4, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop4', -1, 'BobCatprop4', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

    
Config.BobCatprop5 = {
    vector4(875.47, -2115.91, 32.38, 51.41),

}
function BobCatprop5()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop5[math.random(1, #Config.BobCatprop5)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop5', prop)
    local BobCatprop5 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop5', BobCatprop5, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop5', -1, 'BobCatprop5', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end


Config.BobCatprop31 = {
    vector4(874.36, -2124.45, 32.03, 99.98),

}
function BobCatprop31()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop31[math.random(1, #Config.BobCatprop31)]
   
    local chance = math.random(1,100) 
    if chance<=60 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop31', prop)
    local BobCatprop31 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop31', BobCatprop31, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop31', -1, 'BobCatprop31', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.BobCatprop32 = {
    vector4(896.46, -2119.36, 32.06, 71.27),


}
function BobCatprop32()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop32[math.random(1, #Config.BobCatprop32)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=85 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop32', prop)
    local BobCatprop32 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop32', BobCatprop32, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop32', -1, 'BobCatprop32', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.BobCatprop33 = {
    vector4(898.89, -2126.97, 32.06, 217.56),
    

}
function BobCatprop33()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop33[math.random(1, #Config.BobCatprop33)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop33', prop)
    local BobCatprop33 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop33', BobCatprop33, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop33', -1, 'BobCatprop33', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.BobCatprop34 = {
    vector4(909.06, -2116.11, 32.02, 284.14),

}
function BobCatprop34()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop34[math.random(1, #Config.BobCatprop34)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop34', prop)
    local BobCatprop34 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop34', BobCatprop34, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop34', -1, 'BobCatprop34', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

Config.BobCatprop35 = {
    vector4(913.68, -2115.54, 31.67, 345.17),

}
function BobCatprop35()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop35[math.random(1, #Config.BobCatprop35)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<= 75 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop35', prop)
    local BobCatprop35 = true
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop35', BobCatprop35, prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop35', -1, 'BobCatprop35', prop, vec4(location.x, location.y, location.z-1, location.w))
    
end

local prop = nil

local cash = nil
local gold = nil
local special = nil


-- 1-6 and 31-40




Config.paletoprop1 = {
    vector4(1408.175, 1143.564, 114.5336, 180.0), --- locations, can be multiple but chooses 1 at random

}
function paletoprop1() -- should be same as door = 
    local door = 'paletoprop1' -- name 

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop1[math.random(1, #Config.paletoprop1)]



    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=35 then   
        prop = cash -- 35%
    elseif chance<=95 then  
        prop = gold -- 70%
    else   
        prop = special -- 5%
    end 
   
  
   
    bruh(door, prop, location)
end







Config.paletoprop2 = {
    vector4(-106.81, 6466.9, 32.7, 187.03),

}
function paletoprop2()
    local door = 'paletoprop2'

    local location = Config.paletoprop2[math.random(1, #Config.paletoprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

   
   
    bruh(door, prop, location)

end









Config.paletoprop3 = {
    vector4(-103.1, 6470.74, 32.7, 194.94)
}
function paletoprop3()
    
    local location = Config.paletoprop3[math.random(1, #Config.paletoprop3)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop3'

    bruh(door, prop, location)
end











Config.paletoprop4 = {
    vector4(-114.09, 6471.44, 32.69, 16.24),

}
function paletoprop4()
    
    local location = Config.paletoprop4[math.random(1, #Config.paletoprop4)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    
    local door = 'paletoprop4'
   
    bruh(door, prop, location) 
end

    
Config.paletoprop5 = {
    vector4(-1050.04, 6468.01, 31.08, 225.57), -- ????????

}
function paletoprop5()
    
    local location = Config.paletoprop5[math.random(1, #Config.paletoprop5)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop5'
   
    bruh(door, prop, location)
end


Config.paletoprop31 = {
    vector4(-113.13, 6472.56, 32.69, 93.0),

}
function paletoprop31()
    
    local location = Config.paletoprop31[math.random(1, #Config.paletoprop31)]
   
    local chance = math.random(1,100) 
    if chance<=60 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop31'
   
    bruh(door, prop, location) 
end

Config.paletoprop32 = {
    vector4(-103.83, 6470.11, 32.69, 204.38),
    vector4(-98.29, 6469.73, 32.68, 7.65),


}
function paletoprop32()
    
    local location = Config.paletoprop32[math.random(1, #Config.paletoprop32)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=85 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop32'
   
    bruh(door, prop, location) 
end

Config.paletoprop33 = {
    vector4(-94.65, 6467.59, 32.69, 231.38),
    vector4(-106.41, 6461.34, 32.69, 80.23),
    

}
function paletoprop33()
    
    local location = Config.paletoprop33[math.random(1, #Config.paletoprop33)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop33'
  
    bruh(door, prop, location)
end

Config.paletoprop34 = {
    vector4(-107.72, 6478.95, 32.68, 36.88),
    vector4(-108.65, 6478.16, 32.69, 84.88),
    vector4(-98.93, 6464.41, 32.27, 54.38),

}
function paletoprop34()
    
    local location = Config.paletoprop34[math.random(1, #Config.paletoprop34)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop34'
  
    bruh(door, prop, location) 
end

Config.paletoprop35 = {
   vector4(-91.36, 6465.49, 32.42, 190.58),
   vector4(-95.66, 6463.77, 32.43, 100.15),
   vector4(-98.17, 6458.93, 32.27, 163.0),

}
function paletoprop35()
    
    local location = Config.paletoprop35[math.random(1, #Config.paletoprop35)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<= 75 then  prop = gold
    else   prop = special
    end 

    local door = 'paletoprop35'
  
    bruh(door, prop, location)
end
















function bruh(door, prop, location)
    TriggerEvent('Polar-Paleto:Server:SetPaletoProp', door, prop)
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
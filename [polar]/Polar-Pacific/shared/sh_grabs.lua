local prop = nil

local cash = nil
local gold = nil
local special = nil


-- 1-6 and 31-40




Config.Pacificprop1 = {
    vector4(253.36, 216.38, 107.28, 212.16),
    vector4(264.73, 220.54, 102.58, 315.79),
    vector4(264.2, 213.73, 102.53, 249.38), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop1() -- should be same as door = 
    local door = 'Pacificprop1' -- name 

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop1[math.random(1, #Config.Pacificprop1)]



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







Config.Pacificprop2 = {
    vector4(254.95, 215.8, 107.28, 104.32),
    vector4(250.65, 230.66, 107.17, 344.88),

}
function Pacificprop2()
    local door = 'Pacificprop2'

    local location = Config.Pacificprop2[math.random(1, #Config.Pacificprop2)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

   
   
    bruh(door, prop, location)

end









Config.Pacificprop3 = {
    vector4(249.31, 216.53, 107.28, 343.13),
    vector4(243.36, 225.66, 107.28, 177.23),
    vector4(264.41, 213.47, 102.53, 20.64),
}
function Pacificprop3()
    
    local location = Config.Pacificprop3[math.random(1, #Config.Pacificprop3)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop3'

    bruh(door, prop, location)
end











Config.Pacificprop4 = {
    vector4(249.02, 219.15, 107.28, 196.01),
    vector4(243.95, 229.69, 107.18, 245.55),

}
function Pacificprop4()
    
    local location = Config.Pacificprop4[math.random(1, #Config.Pacificprop4)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    
    local door = 'Pacificprop4'
   
    bruh(door, prop, location) 
end

    
Config.Pacificprop5 = {
    vector4(243.77, 219.62, 107.28, 285.62),
   vector4(246.96, 224.4, 107.28, 155.26),

}
function Pacificprop5()
    
    local location = Config.Pacificprop5[math.random(1, #Config.Pacificprop5)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop5'
   
    bruh(door, prop, location)
end


Config.Pacificprop31 = {
    vector4(245.2, 219.27, 107.28, 14.68),
    vector4(252.14, 222.56, 107.28, 151.43),

}
function Pacificprop31()
    
    local location = Config.Pacificprop31[math.random(1, #Config.Pacificprop31)]
   
    local chance = math.random(1,100) 
    if chance<=60 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop31'
   
    bruh(door, prop, location) 
end

Config.Pacificprop32 = {
    vector4(248.08, 218.46, 107.28, 241.24),
    vector4(264.62, 212.51, 111.18, 165.14),


}
function Pacificprop32()
    
    local location = Config.Pacificprop32[math.random(1, #Config.Pacificprop32)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=85 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop32'
   
    bruh(door, prop, location) 
end

Config.Pacificprop33 = {
    vector4(250.42, 217.07, 107.28, 57.77),
    vector4(264.05, 212.05, 111.18, 316.27),
    

}
function Pacificprop33()
    
    local location = Config.Pacificprop33[math.random(1, #Config.Pacificprop33)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop33'
  
    bruh(door, prop, location)
end

Config.Pacificprop34 = {
    vector4(245.5, 219.41, 107.28, 112.53),
    vector4(262.94, 210.12, 111.17, 327.58),

}
function Pacificprop34()
    
    local location = Config.Pacificprop34[math.random(1, #Config.Pacificprop34)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop34'
  
    bruh(door, prop, location) 
end

Config.Pacificprop35 = {
    vector4(243.8, 219.95, 107.28, 210.93),
    vector4(261.04, 205.57, 111.18, 306.4),
    
}
function Pacificprop35()
    
    local location = Config.Pacificprop35[math.random(1, #Config.Pacificprop35)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<= 75 then  prop = gold
    else   prop = special
    end 

    local door = 'Pacificprop35'
  
    bruh(door, prop, location)
end
















function bruh(door, prop, location)
    TriggerEvent('Polar-Pacific:Server:SetPacificProp', door, prop)
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
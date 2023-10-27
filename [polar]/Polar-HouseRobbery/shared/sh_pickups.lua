local prop = nil

local cash = nil
local gold = nil
local special = nil





Config.houseprop6 = {
    vector4(-164.51, 483.62, 134.52, 217.12),
    
}
Config.houseprop7 = {
    vector4(-163.20, 485.08, 133.87, 243.52),
    
}

Config.houseprop8 = {
    vector4(-168.74, 479.01, 134.32, 170.68),
    
}

Config.houseprop9 = {
    vector4(-163.15, 480.04, 134.32, 248.87),
    
}

Config.houseprop10 = {
    vector4(-167.25, 487.82, 133.84, 0.75),
    vec4(-166.65, 489.80, 133.87, 236.10),
    
}
Config.houseprop16 = {
    vector4(-167.69, 481.16, 137.72, 257.96),
    vec4(-168.57, 494.10, 134.03, 209.04),
    
}


Config.houseprop17 = {
    vector4(-171.64, 484.94, 137.44, 62.96),
    vector4(-162.91, 482.90, 134.55, 346.82),
    
}






function houseprop6(house)
    local door = 'houseprop6'

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]

    local location = Config.houseprop6[math.random(1, #Config.houseprop6)]
   
   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=90 then   
       prop = cash -- 70%
   elseif chance<=95 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  
    
    pbruh(door, prop, location)  

end

-- back room
function houseprop7(house)
    local door = 'houseprop7'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop7[math.random(1, #Config.houseprop7)]
   
    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=90 then   
        prop = cash -- 70%
    elseif chance<=95 then  
        prop = gold -- 9%
    else   
        prop = special -- 1%
    end 
   
    
    pbruh(door, prop, location) 

end

function houseprop8(house)
    local door = 'houseprop8'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop8[math.random(1, #Config.houseprop8)]

    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=90 then   
        prop = cash -- 70%
    elseif chance<=99 then  
        prop = gold -- 9%
    else   
        prop = special -- 1%
    end 
   
 
    pbruh(door, prop, location) 

end




function houseprop9(house)
    local door = 'houseprop9'
    
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop9[math.random(1, #Config.houseprop9)]

   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=90 then   
       prop = cash -- 70%
   elseif chance<=99 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  
    pbruh(door, prop, location) 

end






function houseprop10(house)
    local door = 'houseprop10'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
   

    local location = Config.houseprop10[math.random(1, #Config.houseprop10)]

   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=90 then   
       prop = cash -- 70%
   elseif chance<=99 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  
   
    pbruh(door, prop, location)

end





function houseprop16(house)
    local door = 'houseprop16'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
   

    local location = Config.houseprop16[math.random(1, #Config.houseprop16)]

   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=90 then   
       prop = cash -- 70%
   elseif chance<=99 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  
   
    pbruh(door, prop, location)

end



function houseprop17(house)
    local door = 'houseprop17'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
   

    local location = Config.houseprop17[math.random(1, #Config.houseprop17)]

   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=90 then   
       prop = cash -- 70%
   elseif chance<=99 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  
   
    pbruh(door, prop, location)

end









function pbruh(door, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', door, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-HouseRobbery:Client:PickupTarget", false, 2.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
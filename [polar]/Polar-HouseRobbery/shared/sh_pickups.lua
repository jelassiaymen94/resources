local prop = nil

local cash = nil
local gold = nil
local special = nil





Config.houseprop6 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    
}
function houseprop6(store)
    local door = 'houseprop6'

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]

    local location = Config.houseprop6[math.random(1, #Config.houseprop6)]
   
   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=80 then   
       prop = cash -- 70%
   elseif chance<=95 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  
    
    pbruh(door, prop, location)  

end
Config.houseprop7 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    
}
-- back room
function houseprop7(store)
    local door = 'houseprop7'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop7[math.random(1, #Config.houseprop7)]
   
    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=85 then   
        prop = cash -- 70%
    elseif chance<=95 then  
        prop = gold -- 9%
    else   
        prop = special -- 1%
    end 
   
    
    pbruh(door, prop, location) 

end

Config.houseprop8 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    
}

function houseprop8(store)
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




Config.houseprop9 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    
}

function houseprop9(store)
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




Config.houseprop10 = {
    vector4(-99.41, 6471.49, 32.08, 95.21),
    
}


function houseprop10(store)
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











function pbruh(door, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', door, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-HouseRobbery:Client:Target", false, 2.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
local prop = nil

local cash = nil
local gold = nil
local special = nil




Config.houseprop1 = {
    vector4(-169.52, 493.38, 138.59, 95.21),
}
Config.houseprop2 = {
    vector4(-166.19, 493.73, 138.59, 294.78),
    
}
Config.houseprop3 = {
    vector4(-164.61, 495.53, 138.59, 271.54),
}
Config.houseprop4 = {
    vector4(-167.28, 488.55, 138.23, 318.01),
}
Config.houseprop5 = {
    vector4(-172.03, 487.29, 138.23, 24.24),
}
Config.houseprop21 = {
    vec4(-176.17, 493.56, 130.81, 89.70),
}
Config.houseprop22 = {
    vec4(-169.46, 494.34, 130.76, 292.41),
}
Config.houseprop23 = {
    vec4(-169.64, 499.24, 131.01, 300.89),
}
Config.houseprop24 = {
    vec4(-175.72, 490.01, 130.76, 119.44),
}
Config.houseprop25 = {
    vec4(-165.90, 496.26, 134.52, 26.74),
}

function houseprop1(house) -- should be same as door = 
    local door = 'houseprop1' -- name 

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop1[math.random(1, #Config.houseprop1)]


    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=88 then   
        prop = cash -- 70%
    elseif chance<=99 then  
        prop = gold -- 9%
    else   
        prop = special -- 1%
    end 
   
  
   
    bruh(door, prop, location)
end




function houseprop2(house)
    local door = 'houseprop2'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop2[math.random(1, #Config.houseprop2)]
 -- chances calculation for probability
 local chance = math.random(1,100) 
 if chance<=88 then   
     prop = cash -- 70%
 elseif chance<=99 then  
     prop = gold -- 9%
 else   
     prop = special -- 1%
 end 

  
   
    bruh(door, prop, location)

end




function houseprop3(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop3[math.random(1, #Config.houseprop3)]
   
   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=88 then   
       prop = cash -- 70%
   elseif chance<=99 then  
       prop = gold -- 9%
   else   
       prop = special -- 1%
   end 
  

    local door = 'houseprop3'

    bruh(door, prop, location)
end




-- back room

function houseprop4(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.houseprop4[math.random(1, #Config.houseprop4)]
   
   
  -- chances calculation for probability
  local chance = math.random(1,100) 
  if chance<=88 then   
      prop = cash -- 70%
  elseif chance<=99 then  
      prop = gold -- 9%
  else   
      prop = special -- 1%
  end 
 
    
    local door = 'houseprop4'
   
    bruh(door, prop, location) 
end


function houseprop5(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop5[math.random(1, #Config.houseprop5)]
    local chance = math.random(1,100) 
    if chance<=88 then   prop = cash
    elseif chance<=99 then   prop = gold
    else      prop = special  end 
    local door = 'houseprop5'
    bruh(door, prop, location)
end

function houseprop21(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop21[math.random(1, #Config.houseprop21)]
    local chance = math.random(1,100) 
    if chance<=88 then   prop = cash
    elseif chance<=99 then   prop = gold
    else      prop = special  end 
    local door = 'houseprop21'
    bruh(door, prop, location)
end
function houseprop22(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop22[math.random(1, #Config.houseprop22)]
    local chance = math.random(1,100) 
    if chance<=88 then   prop = cash
    elseif chance<=99 then   prop = gold
    else      prop = special  end 
    local door = 'houseprop22'
    bruh(door, prop, location)
end
function houseprop23(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop23[math.random(1, #Config.houseprop23)]
    local chance = math.random(1,100) 
    if chance<=88 then   prop = cash
    elseif chance<=99 then   prop = gold
    else      prop = special  end 
    local door = 'houseprop23'
    bruh(door, prop, location)
end
function houseprop24(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop24[math.random(1, #Config.houseprop24)]
    local chance = math.random(1,100) 
    if chance<=88 then   prop = cash
    elseif chance<=99 then   prop = gold
    else      prop = special  end 
    local door = 'houseprop24'
    bruh(door, prop, location)
end
function houseprop25(house)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.houseprop25[math.random(1, #Config.houseprop25)]
    local chance = math.random(1,100) 
    if chance<=88 then   prop = cash
    elseif chance<=99 then   prop = gold
    else      prop = special  end 
    local door = 'houseprop25'
    bruh(door, prop, location)
end




function bruh(door, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', door, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z-1, location.w), "Polar-HouseRobbery:Client:Target", false, 1.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
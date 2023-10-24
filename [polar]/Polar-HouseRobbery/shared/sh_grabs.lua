local prop = nil

local cash = nil
local gold = nil
local special = nil





function houseprop1(store) -- should be same as door = 
    local door = 'houseprop1' -- name 

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Names[store]["GrabLocations1"][math.random(1, #Config.Names[store]["GrabLocations1"])]


    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=90 then   
        prop = cash -- 70%
    elseif chance<=99 then  
        prop = gold -- 9%
    else   
        prop = special -- 1%
    end 
   
  
   
    bruh(door, prop, location)
end




function houseprop2(store)
    local door = 'houseprop2'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations2"][math.random(1, #Config.Names[store]["GrabLocations2"])]
 -- chances calculation for probability
 local chance = math.random(1,100) 
 if chance<=90 then   
     prop = cash -- 70%
 elseif chance<=99 then  
     prop = gold -- 9%
 else   
     prop = special -- 1%
 end 

  
   
    bruh(door, prop, location)

end




function houseprop3(store)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations3"][math.random(1, #Config.Names[store]["GrabLocations3"])]
   
   -- chances calculation for probability
   local chance = math.random(1,100) 
   if chance<=90 then   
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

function houseprop4(store)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations4"][math.random(1, #Config.Names[store]["GrabLocations4"])]
   
   
  -- chances calculation for probability
  local chance = math.random(1,100) 
  if chance<=70 then   
      prop = cash -- 70%
  elseif chance<=95 then  
      prop = gold -- 9%
  else   
      prop = special -- 1%
  end 
 
    
    local door = 'houseprop4'
   
    bruh(door, prop, location) 
end

    
function houseprop5(store)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations5"][math.random(1, #Config.Names[store]["GrabLocations5"])]
   
   
    -- chances calculation for probability
    local chance = math.random(1,100) 
    if chance<=90 then   
        prop = cash -- 70%
    elseif chance<=99 then  
        prop = gold -- 9%
    else   
        prop = special -- 1%
    end 
   

    local door = 'houseprop5'
   
    bruh(door, prop, location)
end










function bruh(door, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', door, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z-1, location.w), "Polar-HouseRobbery:Client:Target", false, 1.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
local prop = nil

local cash = nil
local gold = nil
local special = nil



-- back room
function storesprop6(store)
    local door = 'storesprop6'

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]

    local location = Config.Names[store]["PickupLocations1"][math.random(1, #Config.Names[store]["PickupLocations1"])]
   
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

-- back room
function storesprop7(store)
    local door = 'storesprop7'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["PickupLocations2"][math.random(1, #Config.Names[store]["PickupLocations2"])]
   
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



function storesprop8(store)
    local door = 'storesprop8'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["PickupLocations3"][math.random(1, #Config.Names[store]["PickupLocations3"])]

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




function storesprop9(store)
    local door = 'storesprop9'
    
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["PickupLocations4"][math.random(1, #Config.Names[store]["PickupLocations4"])]

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







function storesprop10(store)
    local door = 'storesprop10'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
   

    local location = Config.Names[store]["PickupLocations5"][math.random(1, #Config.Names[store]["PickupLocations5"])] 

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
    TriggerEvent('Polar-stores:Server:SetstoresProp', door, prop)
    TriggerClientEvent('Polar-stores:Client:AddTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-stores:Client:PickupTarget", false)
    TriggerClientEvent('Polar-stores:Client:storesProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
local prop = nil

local cash = nil
local gold = nil
local special = nil





function storesprop1(store) -- should be same as door = 
    local door = 'storesprop1' -- name 

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Names[store]["GrabLocations1"][math.random(1, #Config.Names[store]["GrabLocations1"])]


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




function storesprop2(store)
    local door = 'storesprop2'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations2"][math.random(1, #Config.Names[store]["GrabLocations2"])]

    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

   
   
    bruh(door, prop, location)

end




function storesprop3(store)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations3"][math.random(1, #Config.Names[store]["GrabLocations3"])]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'storesprop3'

    bruh(door, prop, location)
end





function storesprop4(store)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations4"][math.random(1, #Config.Names[store]["GrabLocations4"])]
   
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    
    local door = 'storesprop4'
   
    bruh(door, prop, location) 
end

    
function storesprop5(store)
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["GrabLocations5"][math.random(1, #Config.Names[store]["GrabLocations5"])]
   
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 

    local door = 'storesprop5'
   
    bruh(door, prop, location)
end










function bruh(door, prop, location)
    TriggerEvent('Polar-stores:Server:SetstoresProp', door, prop)
    TriggerClientEvent('Polar-stores:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z-1, location.w), "Polar-stores:Client:Target", false)
    TriggerClientEvent('Polar-stores:Client:storesProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
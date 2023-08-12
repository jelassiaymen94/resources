local prop = nil

local cash = nil
local gold = nil
local special = nil




function storesprop6(store)
    local door = 'storesprop6'

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]

    local location = Config.Names[store]["PickupLocations1"][math.random(1, #Config.Names[store]["PickupLocations1"])]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else prop = special
    end 
    
    pbruh(door, prop, location)  

end


function storesprop7(store)
    local door = 'storesprop7'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["PickupLocations2"][math.random(1, #Config.Names[store]["PickupLocations2"])]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    
    pbruh(door, prop, location) 

end



function storesprop8(store)
    local door = 'storesprop8'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["PickupLocations3"][math.random(1, #Config.Names[store]["PickupLocations3"])]

    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else  prop = special
    end 
 
    pbruh(door, prop, location) 

end




function storesprop9(store)
    local door = 'storesprop9'
    
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local location = Config.Names[store]["PickupLocations4"][math.random(1, #Config.Names[store]["PickupLocations4"])]

    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
   
    pbruh(door, prop, location) 

end







function storesprop10(store)
    local door = 'storesprop10'
    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]
 
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]

    local location = Config.Names[store]["PickupLocations5"][math.random(1, #Config.Names[store]["PickupLocations5"])] 

    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
   
    pbruh(door, prop, location)

end











function pbruh(door, prop, location)
    TriggerEvent('Polar-stores:Server:SetstoresProp', door, prop)
    TriggerClientEvent('Polar-stores:Client:AddTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-stores:Client:PickupTarget", false)
    TriggerClientEvent('Polar-stores:Client:storesProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
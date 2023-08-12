local prop = nil
local item = nil
local amount = nil

local special = nil




local z = 30.63



function storesprop11(store)
    local door = 'storesprop11'

    special = Config.Special[math.random(1, #Config.Special)]

    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
 
    
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
   
   
    local location = Config.Names[store]["PileLocations"][math.random(1, #Config.Names[store]["PileLocations"])]
  
    ppbruh(door, prop, location)
end













function ppbruh(door, prop, location)
    TriggerEvent('Polar-stores:Server:SetstoresProp', door, prop) 
    TriggerClientEvent('Polar-stores:Client:AddPickupTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-stores:Client:PickupTarget", true)
    TriggerClientEvent('Polar-stores:Client:storesProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
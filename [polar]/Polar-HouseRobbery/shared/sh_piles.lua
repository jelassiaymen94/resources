





Config.houseprop11 = {
    vector4(-114.04, 6470.48, 31.63, 100.76),
   

}
Config.houseprop12 = {
    vector4(-114.04, 6470.48, 31.63, 100.76),
   

}
Config.houseprop13 = {
    vector4(-114.04, 6470.48, 31.63, 100.76),
   

}


function houseprop11()
    local door = 'houseprop11'

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
   
   
    local location = Config.houseprop11[math.random(1, #Config.houseprop11)]
    
    ppbruh(door, prop, location)
end







function houseprop12()
    local door = 'houseprop12'

 
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
   
   
    local location = Config.houseprop12[math.random(1, #Config.houseprop12)]
    
    ppbruh(door, prop, location)
end








function houseprop13()
    local door = 'houseprop13'


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
   
   
    local location = Config.houseprop13[math.random(1, #Config.houseprop13)]
    
    ppbruh(door, prop, location)
end












function ppbruh(door, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', door, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-HouseRobbery:Client:PickupTarget", true, 2.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
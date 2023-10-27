local prop = nil





Config.houseprop11 = {
    vector4(-164.32, 486.41, 133.84, 126.86),
   

}
Config.houseprop12 = {
    vector4(-174.93, 489.41, 130.04, 290.44),
   

}
Config.houseprop13 = {
    vector4(-170.65, 494.58, 130.04, 156.46),
   

}


function houseprop11()
    local name = 'houseprop11'

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
    
    ppbruh(name, prop, location)
end







function houseprop12()
    local name = 'houseprop12'

 
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
    
    ppbruh(name, prop, location)
end








function houseprop13()
    local name = 'houseprop13'


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
    
    ppbruh(name, prop, location)
end












function ppbruh(name, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', name, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, name, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-HouseRobbery:Client:PickupTarget", true, 2.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, name, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
local prop = nil
local item = nil
local amount = nil

local special = nil




local z = 30.63





Config.Pacificprop11 = {
    vector4(252.8, 207.93, 106.29, 331.45),
    vector4(247.99, 227.66, 106.29, 248.68),
}
Config.Pacificprop12 = {
    vector4(251.2, 228.12, 106.29, 65.62),
    vector4(253.1, 222.94, 106.29, 158.34),

}
Config.Pacificprop13 = {
    vector4(264.78, 215.18, 101.68, 152.95),
    vector4(253.77, 216.15, 101.68, 156.57),

}
function Pacificprop11()
    local door = 'Pacificprop11'

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
   
   
    local location = Config.Pacificprop11[math.random(1, #Config.Pacificprop11)]
    
    ppbruh(door, prop, location)
end


function Pacificprop12()
    local door = 'Pacificprop12'

    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
 
    local location = Config.Pacificprop12[math.random(1, #Config.Pacificprop12)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    
   
    ppbruh(door, prop, location)
end

function Pacificprop13()
    local door = 'Pacificprop13'

    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
 
    local location = Config.Pacificprop13[math.random(1, #Config.Pacificprop12)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    
   
    ppbruh(door, prop, location)
end














function ppbruh(door, prop, location)
    TriggerEvent('Polar-Pacific:Server:SetPacificProp', door, prop)
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), true)
    TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
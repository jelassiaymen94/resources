local prop = nil
local item = nil
local amount = nil

local special = nil




local z = 30.63





Config.paletoprop11 = {
    vector4(-114.04, 6470.48, 31.63, 100.76),
    vector4(-96.67, 6466.37, 31.63, 82.95)

}
Config.paletoprop12 = {
    vector4(-97.96, 6463.83, 31.63, 1.53)

}

function paletoprop11()
    local door = 'paletoprop11'

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
   
   
    local location = Config.paletoprop11[math.random(1, #Config.paletoprop11)]
    
    ppbruh(door, prop, location)
end


function paletoprop12()
    local door = 'paletoprop12'

    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
 
    local location = Config.paletoprop12[math.random(1, #Config.paletoprop12)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    
   
    ppbruh(door, prop, location)
end













function ppbruh(door, prop, location)
    TriggerEvent('Polar-Paleto:Server:SetPaletoProp', door, prop)
    TriggerClientEvent('Polar-Paleto:Client:AddPickupTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w), true)
    TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
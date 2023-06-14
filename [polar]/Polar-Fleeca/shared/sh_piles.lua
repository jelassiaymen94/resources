local prop = nil
local item = nil
local amount = nil

function pile(prop)
    if prop ==    'ex_cash_pile_005' then item = 'band' amount = 5 give(item, amount)
    elseif prop == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' amount = 5 give(item, amount)
else
    print('' .. prop .. ' does not have a giveitem')
    end
end


local z = 30.63






Config.fleecaprop11 = {
    vector4(-114.04, 6470.48, 31.63, 100.76),
    vector4(-96.67, 6466.37, 31.63, 82.95)

}
function fleecaprop11()
    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop11[math.random(1, #Config.fleecaprop11)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop11', prop)
    local fleecaprop11 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop11', fleecaprop11, prop, vec4(location.x, location.y, z, location.w), true)
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop11', -1, 'fleecaprop11', prop, vec4(location.x, location.y, z, location.w)) 
    

end

Config.fleecaprop12 = {
    vector4(-97.96, 6463.83, 31.63, 1.53)

}
function fleecaprop12()
    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.fleecaprop12[math.random(1, #Config.fleecaprop12)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop12', prop)
    local fleecaprop12 = true
    TriggerClientEvent('Polar-fleeca:Client:AddPickupTarget', -1, 'fleecaprop12', fleecaprop12, prop, vec4(location.x, location.y, z, location.w), true)
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop12', -1, 'fleecaprop12', prop, vec4(location.x, location.y, z, location.w)) 
    

end








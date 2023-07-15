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






Config.Pacificprop11 = {
    vector4(-114.04, 6470.48, 31.63, 100.76),
    vector4(-96.67, 6466.37, 31.63, 82.95)

}
function Pacificprop11()
    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop11[math.random(1, #Config.Pacificprop11)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop11', prop)
    local Pacificprop11 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop11', Pacificprop11, prop, vec4(location.x, location.y, z, location.w), true)
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop11', -1, 'Pacificprop11', prop, vec4(location.x, location.y, z, location.w)) 
    

end

Config.Pacificprop12 = {
    vector4(-97.96, 6463.83, 31.63, 1.53)

}
function Pacificprop12()
    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.Pacificprop12[math.random(1, #Config.Pacificprop12)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop12', prop)
    local Pacificprop12 = true
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, 'Pacificprop12', Pacificprop12, prop, vec4(location.x, location.y, z, location.w), true)
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop12', -1, 'Pacificprop12', prop, vec4(location.x, location.y, z, location.w)) 
    

end








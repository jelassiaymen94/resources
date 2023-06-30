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


local z = 30.23






Config.BobCatprop11 = {
    vector4(894.97, -2130.35, 31.45, 89.35),
    vector4(890.26, -2120.35, 31.23, 42.89),
}
function BobCatprop11()
    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop11[math.random(1, #Config.BobCatprop11)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop11', prop)
    local BobCatprop11 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop11', BobCatprop11, prop, vec4(location.x, location.y, z, location.w), true)
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop11', -1, 'BobCatprop11', prop, vec4(location.x, location.y, z, location.w)) 
    

end

Config.BobCatprop12 = {
    vector4(885.2, -2120.04, 31.23, 84.19),
    vector4(886.17, -2122.32, 31.23, 209.63),

}
function BobCatprop12()
    local cashprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = cashprops[math.random(1, #cashprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop12[math.random(1, #Config.BobCatprop12)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop12', prop)
    local BobCatprop12 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop12', BobCatprop12, prop, vec4(location.x, location.y, z, location.w), true)
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop12', -1, 'BobCatprop12', prop, vec4(location.x, location.y, z, location.w)) 
    

end








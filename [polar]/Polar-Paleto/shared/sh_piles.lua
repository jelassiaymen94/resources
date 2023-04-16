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

-- piles are 11-15


Config.paletoprop11 = {
    vector4(-104.16, 6473.67, 30.63, 245.47)

}
function paletoprop11()
    local pileprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = pileprops[math.random(1, #pileprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop11[math.random(1, #Config.paletoprop11)]
   
    local chance = math.random(1,100) 
    if chance<=74 then   prop = pileprop 
    elseif chance<=100 then  prop = goldprop
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop11', prop)
    local paletoprop11 = true
    TriggerClientEvent('Polar-Paleto:Client:AddPickupTarget', -1, 'paletoprop11', paletoprop11, prop, location, true)
    TriggerClientEvent('Polar-Paleto:Client:paletoprop11', -1, 'paletoprop11', prop, location) 
    

end








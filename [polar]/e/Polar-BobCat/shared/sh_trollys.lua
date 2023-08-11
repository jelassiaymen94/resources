local prop = nil
local item = nil
local amount = nil

local z = 30.23

-- trollys are 16-20 and 26-30

Config.BobCatprop16 = {
    vector4(891.02, -2123.24, 30.0, 78.12),
}
function BobCatprop16()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.BobCatprop16[math.random(1, #Config.BobCatprop16)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop16', prop)
    local BobCatprop16 = true 
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop16', BobCatprop16, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop16', -1, 'BobCatprop16', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.BobCatprop17 = {
    vector4(888.42, -2121.18, 30.0, 175.08),
   
}
function BobCatprop17()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.BobCatprop17[math.random(1, #Config.BobCatprop17)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop17', prop)
    local BobCatprop17 = true 
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop17', BobCatprop17, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop17', -1, 'BobCatprop17', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.BobCatprop18 = {
    vector4(895.32, -2129.07, 30.0, 261.83),
   
}
function BobCatprop18()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.BobCatprop18[math.random(1, #Config.BobCatprop18)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop18', prop)
    local BobCatprop18 = true 
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop18', BobCatprop18, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop18', -1, 'BobCatprop18', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.BobCatprop19 = {
    
    vector4(909.53, -2112.59, 30.0, 40.67),

}
function BobCatprop19()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.BobCatprop19[math.random(1, #Config.BobCatprop19)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop19', prop)
    local BobCatprop19 = true 
    TriggerClientEvent('Polar-BobCat:Client:AddTarget', -1, 'BobCatprop19', BobCatprop19, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop19', -1, 'BobCatprop19', prop, vec4(location.x, location.y, z, location.w)) 
end 

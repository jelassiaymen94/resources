local prop = nil
local item = nil
local amount = nil



-- trollys are 16-20 and 26-30

Config.paletoprop16 = {
    vector4(-101.22, 6472.76, 30.64, 304.65)

}
function paletoprop16()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.paletoprop16[math.random(1, #Config.paletoprop16)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop16', prop)
    local paletoprop16 = true 
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop16', paletoprop16, prop, location) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop16', -1, 'paletoprop16', prop, location) 
end 

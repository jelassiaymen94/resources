local prop = nil
local item = nil
local amount = nil

local z = 30.63

-- trollys are 16-20 and 26-30

Config.paletoprop16 = {
    vector4(-107.71, 6475.53, 31.63, 134.05),
    vector4(-96.18, 6469.22, 31.63, 133.1),
}
function paletoprop16()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.paletoprop16[math.random(1, #Config.paletoprop16)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop16', prop)
    local paletoprop16 = true 
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop16', paletoprop16, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop16', -1, 'paletoprop16', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.paletoprop17 = {
    vector4(-105.94, 6459.06, 31.63, 317.11),
    vector4(-101.13, 6462.21, 31.63, 227.35),
}
function paletoprop17()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.paletoprop17[math.random(1, #Config.paletoprop17)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop17', prop)
    local paletoprop17 = true 
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop17', paletoprop17, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop17', -1, 'paletoprop17', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.paletoprop18 = {
    vector4(-96.24, 6462.03, 31.63, 133.65),
    vector4(-106.96, 6476.39, 31.63, 307.38),
   
}
function paletoprop18()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.paletoprop18[math.random(1, #Config.paletoprop18)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop18', prop)
    local paletoprop18 = true 
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop18', paletoprop18, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop18', -1, 'paletoprop18', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.paletoprop19 = {
    vector4(-97.6, 6460.17, 31.63, 312.72),
    vector4(-117.56, 6470.5, 31.63, 319.72),

}
function paletoprop19()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.paletoprop19[math.random(1, #Config.paletoprop19)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop19', prop)
    local paletoprop19 = true 
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, 'paletoprop19', paletoprop19, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Paleto:Client:paletoprop19', -1, 'paletoprop19', prop, vec4(location.x, location.y, z, location.w)) 
end 

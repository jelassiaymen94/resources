local prop = nil
local item = nil
local amount = nil

local z = 30.63

-- trollys are 16-20 and 26-30

Config.fleecaprop16 = {
    vector4(-107.71, 6475.53, 31.63, 134.05),
    vector4(-96.18, 6469.22, 31.63, 133.1),
}
function fleecaprop16()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.fleecaprop16[math.random(1, #Config.fleecaprop16)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop16', prop)
    local fleecaprop16 = true 
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop16', fleecaprop16, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop16', -1, 'fleecaprop16', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.fleecaprop17 = {
    vector4(-105.94, 6459.06, 31.63, 317.11),
    vector4(-101.13, 6462.21, 31.63, 227.35),
}
function fleecaprop17()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.fleecaprop17[math.random(1, #Config.fleecaprop17)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop17', prop)
    local fleecaprop17 = true 
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop17', fleecaprop17, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop17', -1, 'fleecaprop17', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.fleecaprop18 = {
    vector4(-96.24, 6462.03, 31.63, 133.65),
    vector4(-106.96, 6476.39, 31.63, 307.38),
   
}
function fleecaprop18()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.fleecaprop18[math.random(1, #Config.fleecaprop18)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop18', prop)
    local fleecaprop18 = true 
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop18', fleecaprop18, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop18', -1, 'fleecaprop18', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.fleecaprop19 = {
    vector4(-97.6, 6460.17, 31.63, 312.72),
    vector4(-117.56, 6470.5, 31.63, 319.72),

}
function fleecaprop19()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.fleecaprop19[math.random(1, #Config.fleecaprop19)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-fleeca:Server:Setfleecaprop19', prop)
    local fleecaprop19 = true 
    TriggerClientEvent('Polar-fleeca:Client:AddTarget', -1, 'fleecaprop19', fleecaprop19, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-fleeca:Client:fleecaprop19', -1, 'fleecaprop19', prop, vec4(location.x, location.y, z, location.w)) 
end 

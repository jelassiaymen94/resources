local prop = nil
local item = nil
local amount = nil

local z = 30.63

-- trollys are 16-20 and 26-30

Config.Pacificprop16 = {
    vector4(-107.71, 6475.53, 31.63, 134.05),
    vector4(-96.18, 6469.22, 31.63, 133.1),
}
function Pacificprop16()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.Pacificprop16[math.random(1, #Config.Pacificprop16)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop16', prop)
    local Pacificprop16 = true 
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop16', Pacificprop16, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop16', -1, 'Pacificprop16', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.Pacificprop17 = {
    vector4(-105.94, 6459.06, 31.63, 317.11),
    vector4(-101.13, 6462.21, 31.63, 227.35),
}
function Pacificprop17()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.Pacificprop17[math.random(1, #Config.Pacificprop17)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop17', prop)
    local Pacificprop17 = true 
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop17', Pacificprop17, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop17', -1, 'Pacificprop17', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.Pacificprop18 = {
    vector4(-96.24, 6462.03, 31.63, 133.65),
    vector4(-106.96, 6476.39, 31.63, 307.38),
   
}
function Pacificprop18()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.Pacificprop18[math.random(1, #Config.Pacificprop18)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop18', prop)
    local Pacificprop18 = true 
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop18', Pacificprop18, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop18', -1, 'Pacificprop18', prop, vec4(location.x, location.y, z, location.w)) 
end 

Config.Pacificprop19 = {
    vector4(-97.6, 6460.17, 31.63, 312.72),
    vector4(-117.56, 6470.5, 31.63, 319.72),

}
function Pacificprop19()
    local cash = 'ch_prop_ch_cash_trolly_01a'
    local gold = 'ch_prop_gold_trolly_01a'
    local diamonds = 'ch_prop_diamond_trolly_01a'
    local location = Config.Pacificprop19[math.random(1, #Config.Pacificprop19)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 
    TriggerEvent('Polar-Pacific:Server:SetPacificprop19', prop)
    local Pacificprop19 = true 
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, 'Pacificprop19', Pacificprop19, prop, vec4(location.x, location.y, z, location.w)) 
    TriggerClientEvent('Polar-Pacific:Client:Pacificprop19', -1, 'Pacificprop19', prop, vec4(location.x, location.y, z, location.w)) 
end 

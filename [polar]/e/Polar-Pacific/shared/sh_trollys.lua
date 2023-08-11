local prop = nil
local item = nil
local amount = nil

local z = 30.63

-- trollys are 16-20 and 26-30
local cash = 'ch_prop_ch_cash_trolly_01a'
local gold = 'ch_prop_gold_trolly_01a'
local diamonds = 'ch_prop_diamond_trolly_01a'


Config.Pacificprop16 = {
    vector4(263.6, 214.39, 101.68, 65.15),
    vector4(255.19, 228.61, 106.29, 156.82),
}
function Pacificprop16()
    local door = 'Pacificprop16'

   
    local location = Config.Pacificprop16[math.random(1, #Config.Pacificprop16)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

Config.Pacificprop17 = {
    vector4(265.15, 212.12, 101.68, 29.59),
    vector4(262.93, 216.16, 101.68, 203.56),
}
function Pacificprop17()
    local door = 'Pacificprop17'

    local location = Config.Pacificprop17[math.random(1, #Config.Pacificprop17)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

Config.Pacificprop18 = {
    vector4(262.56, 225.72, 101.68, 156.4),
    vector4(251.53, 222.87, 101.68, 240.61),
   
}
function Pacificprop18()
    local door = 'Pacificprop18'

    local location = Config.Pacificprop18[math.random(1, #Config.Pacificprop18)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

Config.Pacificprop19 = {
    vector4(249.35, 218.29, 101.68, 291.23),
    vector4(251.13, 223.05, 101.68, 246.81),

}
function Pacificprop19()
    local door = 'Pacificprop19'

    local location = Config.Pacificprop19[math.random(1, #Config.Pacificprop19)]
    local chance = math.random(1,100) if chance<=40 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

























function tbruh(door, prop, location)
    TriggerEvent('Polar-Pacific:Server:SetPacificProp', door, prop)
    TriggerClientEvent('Polar-Pacific:Client:SetTrollyProp', -1, door, prop)
    TriggerClientEvent('Polar-Pacific:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z, location.w))
    TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
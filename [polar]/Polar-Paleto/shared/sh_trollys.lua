local prop = nil
local item = nil
local amount = nil

local z = 30.63

-- trollys are 16-20 and 26-30
local cash = 'ch_prop_ch_cash_trolly_01a'
local gold = 'ch_prop_gold_trolly_01a'
local diamonds = 'ch_prop_diamond_trolly_01a'


Config.paletoprop16 = {
    vector4(-107.71, 6475.53, 31.63, 134.05),
    vector4(-96.18, 6469.22, 31.63, 133.1),
}
function paletoprop16()
    local door = 'paletoprop16'

   
    local location = Config.paletoprop16[math.random(1, #Config.paletoprop16)]
    local chance = math.random(1,100) if chance<=75 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

Config.paletoprop17 = {
    vector4(-105.94, 6459.06, 31.63, 317.11),
    vector4(-101.13, 6462.21, 31.63, 227.35),
}
function paletoprop17()
    local door = 'paletoprop17'

    local location = Config.paletoprop17[math.random(1, #Config.paletoprop17)]
    local chance = math.random(1,100) if chance<=75 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

Config.paletoprop18 = {
    vector4(-96.24, 6462.03, 31.63, 133.65),
    vector4(-106.96, 6476.39, 31.63, 307.38),
   
}
function paletoprop18()
    local door = 'paletoprop18'

    local location = Config.paletoprop18[math.random(1, #Config.paletoprop18)]
    local chance = math.random(1,100) if chance<=75 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

Config.paletoprop19 = {
    vector4(-97.6, 6460.17, 31.63, 312.72),
    vector4(-117.56, 6470.5, 31.63, 319.72),

}
function paletoprop19()
    local door = 'paletoprop19'

    local location = Config.paletoprop19[math.random(1, #Config.paletoprop19)]
    local chance = math.random(1,100) if chance<=75 then   prop = cash  elseif chance<=90 then  prop = gold  elseif chance<=100 then   prop = diamonds end 

    tbruh(door, prop, location)
end 

























function tbruh(door, prop, location)
    TriggerEvent('Polar-Paleto:Server:SetPaletoProp', door, prop)
    TriggerClientEvent('Polar-Paleto:Client:SetTrollyProp', -1, door, prop)
    TriggerClientEvent('Polar-Paleto:Client:AddTarget', -1, door,  prop, vec4(location.x, location.y, location.z, location.w))
    TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
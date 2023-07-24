local prop = nil


-- 45 to 50

Config.paletoprop45 = {
    vector4(-106.93, 6476.12, 31.63, 312.96), --- locations, can be multiple but chooses 1 at random

}
function paletoprop45() -- should be same as door = 
    local door = 'paletoprop45' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.paletoprop45[math.random(1, #Config.paletoprop45)]
    
  
    
    bruhpppc(door, prop, location)
end


Config.paletoprop46 = {
    vector4(-116.53, 6453.41, 32.7, 357.02), --- locations, can be multiple but chooses 1 at random

}
function paletoprop46() -- should be same as door = 
    local door = 'paletoprop46' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.paletoprop46[math.random(1, #Config.paletoprop46)]
    
  
    
    bruhpppc(door, prop, location)
end

Config.paletoprop47 = {
    vector4(-120.76, 6456.69, 32.7, 59.38), --- locations, can be multiple but chooses 1 at random

}
function paletoprop47() -- should be same as door = 
    local door = 'paletoprop47' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.paletoprop47[math.random(1, #Config.paletoprop47)]
    
  
    
    bruhpppc(door, prop, location)
end

Config.paletoprop48 = {
    vector4(-123.76, 6459.15, 32.7, 51.67), --- locations, can be multiple but chooses 1 at random

}
function paletoprop48() -- should be same as door = 
    local door = 'paletoprop48' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.paletoprop48[math.random(1, #Config.paletoprop48)]
    
  
    
    bruhpppc(door, prop, location)
end


function bruhpppc(door, prop, location)
    TriggerEvent('Polar-Paleto:Server:SetPaletoProp', door, prop)
    TriggerClientEvent('Polar-Paleto:Client:AddPaintTarget', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w), true)
    if prop == 'h4_prop_h4_diamond_01a' then TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w)) TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, 'h4_prop_h4_diamond_disp_01a', vec4(location.x, location.y, location.z-1.2, location.w), true, 1)
    elseif prop == 'h4_prop_h4_necklace_01a' then TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w)) TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, 'h4_prop_h4_neck_disp_01a', vec4(location.x, location.y, location.z-1.2, location.w), true, 1) 
    else
        TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y, location.z-1.17, location.w))
    end -- itemstand
    TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, 'h4_prop_h4_glass_disp_01a', vec4(location.x, location.y, location.z-2.2, location.w), true, 2) -- displaycase
end
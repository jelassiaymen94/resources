local prop = nil


-- 45 to 50

Config.Pacificprop45 = {
    vector4(-118.95, 6455.08, 32.7, 90.0), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop45() -- should be same as door = 
    local door = 'Pacificprop45' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.Pacificprop45[math.random(1, #Config.Pacificprop45)]
    
  
    
    bruhpppc(door, prop, location)
end


Config.Pacificprop46 = {
    vector4(-116.53, 6453.41, 32.7, 357.02), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop46() -- should be same as door = 
    local door = 'Pacificprop46' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.Pacificprop46[math.random(1, #Config.Pacificprop46)]
    
  
    
    bruhpppc(door, prop, location)
end

Config.Pacificprop47 = {
    vector4(-120.76, 6456.69, 32.7, 59.38), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop47() -- should be same as door = 
    local door = 'Pacificprop47' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.Pacificprop47[math.random(1, #Config.Pacificprop47)]
    
  
    
    bruhpppc(door, prop, location)
end

Config.Pacificprop48 = {
    vector4(-123.76, 6459.15, 32.7, 51.67), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop48() -- should be same as door = 
    local door = 'Pacificprop48' -- name 

    
    prop = Config.Cases[math.random(1, #Config.Cases)]
    local location = Config.Pacificprop48[math.random(1, #Config.Pacificprop48)]
    
  
    
    bruhpppc(door, prop, location)
end



function bruhpppc(door, prop, location)
    TriggerEvent('Polar-Pacific:Server:SetPacificProp', door, prop)
    TriggerClientEvent('Polar-Pacific:Client:AddPaintTarget', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w), true)
    if prop == 'h4_prop_h4_diamond_01a' then TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w)) TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, 'h4_prop_h4_diamond_disp_01a', vec4(location.x, location.y, location.z-1.2, location.w), true, 1)
    elseif prop == 'h4_prop_h4_necklace_01a' then TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w)) TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, 'h4_prop_h4_neck_disp_01a', vec4(location.x, location.y, location.z-1.2, location.w), true, 1) 
    else
        TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y, location.z-1.17, location.w))
    end -- itemstand
    TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, 'h4_prop_h4_glass_disp_01a', vec4(location.x, location.y, location.z-2.2, location.w), true, 2) -- displaycase
end
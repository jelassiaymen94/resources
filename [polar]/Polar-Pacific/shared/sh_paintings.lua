local prop = nil


-- 40 to 45

Config.Pacificprop40 = {
    vector4(255.22, 219.58, 101.68, 340.0), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop40() -- should be same as door = 
    local door = 'Pacificprop40' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.Pacificprop40[math.random(1, #Config.Pacificprop40)]
   
  
    
    bruhppp(door, prop, location)
end



Config.Pacificprop41 = {
    vector4(262.42, 226.4, 101.68, 339.0), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop41() -- should be same as door = 
    local door = 'Pacificprop41' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.Pacificprop41[math.random(1, #Config.Pacificprop41)]
   
  
    
    bruhppp(door, prop, location)
end



Config.Pacificprop42 = {
    vector4(254.76, 215.5, 101.68, 160.0), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop42() -- should be same as door = 
    local door = 'Pacificprop42' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.Pacificprop42[math.random(1, #Config.Pacificprop42)]
   
  
    
    bruhppp(door, prop, location)
end


Config.Pacificprop43 = {
   -- vector4(-123.6, 6462.98, 31.44, 202.41), --- locations, can be multiple but chooses 1 at random

}
function Pacificprop43() -- should be same as door = 
    local door = 'Pacificprop41' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.Pacificprop43[math.random(1, #Config.Pacificprop43)]
   
  
    
    bruhppp(door, prop, location)
end


function bruhppp(door, prop, location)
    TriggerEvent('Polar-Pacific:Server:SetPacificProp', door, prop)
    TriggerClientEvent('Polar-Pacific:Client:AddPaintTarget', -1, door,  prop, vec4(location.x, location.y, location.z+0.2, location.w))
    TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y, location.z+0.2, location.w))
end
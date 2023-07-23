local prop = nil


-- 40 to 45

Config.paletoprop40 = {
    vector4(-117.19, 6458.03, 32.44, 71.38), --- locations, can be multiple but chooses 1 at random

}
function paletoprop40() -- should be same as door = 
    local door = 'paletoprop40' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.paletoprop40[math.random(1, #Config.paletoprop40)]
   
  
    
    bruhppp(door, prop, location)
end



Config.paletoprop41 = {
    vector4(-115.38, 6455.6, 32.44, 35.61), --- locations, can be multiple but chooses 1 at random

}
function paletoprop41() -- should be same as door = 
    local door = 'paletoprop41' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.paletoprop41[math.random(1, #Config.paletoprop41)]
   
  
    
    bruhppp(door, prop, location)
end



Config.paletoprop42 = {
    vector4(-121.09, 6460.88, 32.44, 148.7), --- locations, can be multiple but chooses 1 at random

}
function paletoprop42() -- should be same as door = 
    local door = 'paletoprop42' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.paletoprop42[math.random(1, #Config.paletoprop42)]
   
  
    
    bruhppp(door, prop, location)
end


Config.paletoprop43 = {
    vector4(-123.6, 6462.98, 32.44, 202.41), --- locations, can be multiple but chooses 1 at random

}
function paletoprop43() -- should be same as door = 
    local door = 'paletoprop41' -- name 

    
    prop = Config.Paintings[math.random(1, #Config.Paintings)]
    local location = Config.paletoprop43[math.random(1, #Config.paletoprop43)]
   
  
    
    bruhppp(door, prop, location)
end


function bruhppp(door, prop, location)
    TriggerEvent('Polar-Paleto:Server:SetPaletoProp', door, prop)
    TriggerClientEvent('Polar-Paleto:Client:AddPaintTarget', -1, door,  prop, vec4(location.x, location.y, location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y, location.z-1, location.w))
end
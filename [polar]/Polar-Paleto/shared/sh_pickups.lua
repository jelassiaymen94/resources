local prop = nil

local cash = nil
local gold = nil
local special = nil

-- pickups are 6-10 and 21 - 25



Config.paletoprop6 = {
   vector4(-99.41, 6471.49, 32.08, 95.21),
    vector4(-99.03, 6472.54, 32.1, 276.78),

   
}
function paletoprop6()
    local door = 'paletoprop6'

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]

    local location = Config.paletoprop6[math.random(1, #Config.paletoprop6)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else prop = special
    end 
    
    pbruh(door, prop, location)  

end

Config.paletoprop7 = {
   vector4(-102.3, 6474.21, 32.08, 14.04),
   vector4(-105.08, 6468.01, 32.08, 244.05),

}
function paletoprop7()
    local door = 'paletoprop7'

    local location = Config.paletoprop7[math.random(1, #Config.paletoprop7)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    
    pbruh(door, prop, location) 

end

Config.paletoprop8 = {
    vector4(-98.48, 6462.07, 31.63, 153.75),
    vector4(-97.36, 6463.53, 31.63, 334.86),
    vector4(-104.61, 6461.07, 32.1, 351.37),

}
function paletoprop8()
    local door = 'paletoprop8'

    local location = Config.paletoprop8[math.random(1, #Config.paletoprop8)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else  prop = special
    end 
 
    pbruh(door, prop, location) 

end

Config.paletoprop9 = {
    vector4(-92.83, 6464.61, 32.13, 187.6),
    vector4(-95.62, 6464.51, 31.63, 189.22),
   

}
function paletoprop9()
    local door = 'paletoprop9'
    
    
    local location = Config.paletoprop9[math.random(1, #Config.paletoprop9)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
   
    pbruh(door, prop, location) 

end








--- shelf
Config.paletoprop10 = {
    vector4(-106.4, 6480.79, 31.94, 23.65),
    vector4(-95.78, 6465.86, 32.36, 223.99), 

    
}
function paletoprop10()
    local door = 'paletoprop10'

    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.paletoprop10[math.random(1, #Config.paletoprop10)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
   
    pbruh(door, prop, location)

end

Config.paletoprop21 = {
    vector4(-107.35, 6479.68, 32.37, 66.21),
   

    
}
function paletoprop21()
    local door = 'paletoprop21'

    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.paletoprop21[math.random(1, #Config.paletoprop21)]
   
    local chance = math.random(1,210) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
   
    pbruh(door, prop, location) 

end

Config.paletoprop22 = {
    vector4(-102.56, 6459.26, 31.93, 267.8)
   
    
}
function paletoprop22()
    local door = 'paletoprop22'
    
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.paletoprop22[math.random(1, #Config.paletoprop22)]
   
    local chance = math.random(1,220) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    
    pbruh(door, prop, location)

end




















function pbruh(door, prop, location)
    TriggerEvent('Polar-Paleto:Server:SetPaletoProp', door, prop)
    TriggerClientEvent('Polar-Paleto:Client:AddPickupTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Paleto:Client:PaletoProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
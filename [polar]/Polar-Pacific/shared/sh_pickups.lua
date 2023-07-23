local prop = nil

local cash = nil
local gold = nil
local special = nil

-- pickups are 6-10 and 21 - 25



Config.Pacificprop6 = {
    vector4(240.02, 217.44, 106.69, 68.43),

   
}
function Pacificprop6()
    local door = 'Pacificprop6'

    cash = Config.Cash[math.random(1, #Config.Cash)]
    gold = Config.Gold[math.random(1, #Config.Gold)]
    special = Config.Special[math.random(1, #Config.Special)]

    local location = Config.Pacificprop6[math.random(1, #Config.Pacificprop6)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else prop = special
    end 
    
    pbruh(door, prop, location)  

end

Config.Pacificprop7 = {
    vector4(239.33, 218.63, 106.69, 153.22),

}
function Pacificprop7()
    local door = 'Pacificprop7'

    local location = Config.Pacificprop7[math.random(1, #Config.Pacificprop7)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    
    pbruh(door, prop, location) 

end

Config.Pacificprop8 = {
    vector4(238.69, 220.12, 106.69, 70.7),

}
function Pacificprop8()
    local door = 'Pacificprop8'

    local location = Config.Pacificprop8[math.random(1, #Config.Pacificprop8)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else  prop = special
    end 
 
    pbruh(door, prop, location) 

end

Config.Pacificprop9 = {
    vector4(250.77, 222.01, 106.29, 359.19),
   

}
function Pacificprop9()
    local door = 'Pacificprop9'
    
    
    local location = Config.Pacificprop9[math.random(1, #Config.Pacificprop9)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
   
    pbruh(door, prop, location) 

end








--- shelf
Config.Pacificprop10 = {
    vector4(254.23, 219.07, 106.29, 246.25),

    
}
function Pacificprop10()
    local door = 'Pacificprop10'

    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.Pacificprop10[math.random(1, #Config.Pacificprop10)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
   
    pbruh(door, prop, location)

end

Config.Pacificprop21 = {
    vector4(257.84, 211.76, 106.69, 284.95),
   

    
}
function Pacificprop21()
    local door = 'Pacificprop21'

    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.Pacificprop21[math.random(1, #Config.Pacificprop21)]
   
    local chance = math.random(1,210) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
   
    pbruh(door, prop, location) 

end

Config.Pacificprop22 = {
    vector4(248.82, 209.48, 106.29, 12.31),
    
}
function Pacificprop22()
    local door = 'Pacificprop22'
    
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.Pacificprop22[math.random(1, #Config.Pacificprop22)]
   
    local chance = math.random(1,220) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    
    pbruh(door, prop, location)

end




















function pbruh(door, prop, location)
    TriggerEvent('Polar-Pacific:Server:SetPacificProp', door, prop)
    TriggerClientEvent('Polar-Pacific:Client:AddPickupTarget', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-Pacific:Client:PacificProp', -1, door, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
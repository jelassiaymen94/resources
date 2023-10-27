local prop = nil

local cash = nil
local gold = nil
local special = nil





Config.houseprop11 = {
    vector4(-164.32, 486.41, 133.84, 126.86),
   

}
Config.houseprop12 = {
    vector4(-174.93, 489.41, 130.04, 290.44),
   

}
Config.houseprop13 = {
    vector4(-170.65, 494.58, 130.04, 156.46),
   

}
Config.houseprop14 = {
    vector4(-170.65, 494.58, 130.04, 156.46),
   

}
Config.houseprop15 = {
    vector4(-170.65, 494.58, 130.04, 156.46),
   

}




function houseprop11(house)
    local name = 'houseprop11'

    


cash = Config.Cash[math.random(1, #Config.Cash)]
gold = Config.Gold[math.random(1, #Config.Gold)]
special = Config.Special[math.random(1, #Config.Special)]

local location = Config.houseprop7[math.random(1, #Config.houseprop7)]

-- chances calculation for probability
local chance = math.random(1,100) 
if chance<=85 then   
    prop = cash -- 70%
elseif chance<=95 then  
    prop = gold -- 9%
else   
    prop = special -- 1%
end 
   
   
    local location = Config.houseprop11[math.random(1, #Config.houseprop11)]
    
    ppbruh(name, prop, location)
end




function houseprop12(house)
    local name = 'houseprop12'

 
    


cash = Config.Cash[math.random(1, #Config.Cash)]
gold = Config.Gold[math.random(1, #Config.Gold)]
special = Config.Special[math.random(1, #Config.Special)]

local location = Config.houseprop7[math.random(1, #Config.houseprop7)]

-- chances calculation for probability
local chance = math.random(1,100) 
if chance<=85 then   
    prop = cash -- 70%
elseif chance<=95 then  
    prop = gold -- 9%
else   
    prop = special -- 1%
end 
   
   
    local location = Config.houseprop12[math.random(1, #Config.houseprop12)]
    
    ppbruh(name, prop, location)
end








function houseprop13(house)
    local name = 'houseprop13'


    


cash = Config.Cash[math.random(1, #Config.Cash)]
gold = Config.Gold[math.random(1, #Config.Gold)]
special = Config.Special[math.random(1, #Config.Special)]

local location = Config.houseprop7[math.random(1, #Config.houseprop7)]

-- chances calculation for probability
local chance = math.random(1,100) 
if chance<=85 then   
    prop = cash -- 70%
elseif chance<=95 then  
    prop = gold -- 9%
else   
    prop = special -- 1%
end 
   
   
    local location = Config.houseprop13[math.random(1, #Config.houseprop13)]
    
    ppbruh(name, prop, location)
end



function houseprop14(house)
    local name = 'houseprop14'


    


cash = Config.Cash[math.random(1, #Config.Cash)]
gold = Config.Gold[math.random(1, #Config.Gold)]
special = Config.Special[math.random(1, #Config.Special)]

local location = Config.houseprop7[math.random(1, #Config.houseprop7)]

-- chances calculation for probability
local chance = math.random(1,100) 
if chance<=85 then   
    prop = cash -- 70%
elseif chance<=95 then  
    prop = gold -- 9%
else   
    prop = special -- 1%
end 
   
   
    local location = Config.houseprop14[math.random(1, #Config.houseprop14)]
    
    ppbruh(name, prop, location)
end




function houseprop15(house)
    local name = 'houseprop15'


    


cash = Config.Cash[math.random(1, #Config.Cash)]
gold = Config.Gold[math.random(1, #Config.Gold)]
special = Config.Special[math.random(1, #Config.Special)]

local location = Config.houseprop7[math.random(1, #Config.houseprop7)]

-- chances calculation for probability
local chance = math.random(1,100) 
if chance<=85 then   
    prop = cash -- 70%
elseif chance<=95 then  
    prop = gold -- 9%
else   
    prop = special -- 1%
end 
   
   
    local location = Config.houseprop15[math.random(1, #Config.houseprop15)]
    
    ppbruh(name, prop, location)
end








function ppbruh(name, prop, location)
    TriggerEvent('Polar-HouseRobbery:Server:SetHouseProp', name, prop)
    TriggerClientEvent('Polar-HouseRobbery:Client:AddTarget', -1, name, prop, vec4(location.x, location.y,  location.z-1, location.w), "Polar-HouseRobbery:Client:PickupTarget", true, 2.5)
    TriggerClientEvent('Polar-HouseRobbery:Client:HouseProp', -1, name, prop, vec4(location.x, location.y,  location.z-1, location.w)) 
end
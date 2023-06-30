local prop = nil


-- pickups are 6-10 and 21 - 25

Config.BobCatprop6 = {
    vector4(890.62, -2128.94, 31.23, 229.03),
    vector4(891.64, -2127.36, 31.27, 259.99),
    vector4(889.87, -2122.95, 31.23, 327.22),

}
function BobCatprop6()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop6[math.random(1, #Config.BobCatprop6)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop6', prop)
    local BobCatprop6 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop6', BobCatprop6, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop6', -1, 'BobCatprop6', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.BobCatprop7 = {
    vector4(890.43, -2131.93, 31.23, 340.13),
    vector4(885.68, -2130.58, 31.23, 87.97),
    vector4(889.66, -2126.26, 31.23, 209.75),
}
function BobCatprop7()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop7[math.random(1, #Config.BobCatprop7)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop7', prop)
    local BobCatprop7 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop7', BobCatprop7, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop7', -1, 'BobCatprop7', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.BobCatprop8 = {
    vector4(896.23, -2120.79, 31.45, 138.29),
    vector4(889.22, -2127.43, 31.23, 349.96),
    vector4(885.28, -2127.83, 31.23, 77.27),

}
function BobCatprop8()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop8[math.random(1, #Config.BobCatprop8)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop8', prop)
    local BobCatprop8 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop8', BobCatprop8, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop8', -1, 'BobCatprop8', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.BobCatprop9 = {
    vector4(891.1, -2124.17, 31.23, 275.48),
    vector4(877.46, -2118.99, 31.23, 128.31),
    vector4(888.48, -2124.18, 31.23, 10.94),

}
function BobCatprop9()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.BobCatprop9[math.random(1, #Config.BobCatprop9)]
   
    local chance = math.random(1,100) 
    if chance<=50 then   prop = cash 
    elseif chance<=95 then  prop = gold
    else   prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop9', prop)
    local BobCatprop9 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop9', BobCatprop9, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop9', -1, 'BobCatprop9', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end








--- shelf
Config.BobCatprop10 = {
    vector4(876.17, -2119.75, 31.02, 193.05),
    vector4(877.76, -2112.71, 31.02, 296.31), 
    vector4(908.62, -2114.63, 31.23, 130.93),

}
function BobCatprop10()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.BobCatprop10[math.random(1, #Config.BobCatprop10)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop10', prop)
    local BobCatprop10 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop10', BobCatprop10, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop10', -1, 'BobCatprop10', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.BobCatprop21 = {
    vector4(877.54, -2108.51, 31.23, 300.81),
    vector4(878.77, -2134.17, 31.45, 173.75),
    vector4(905.35, -2116.55, 31.23, 209.84),
    
}
function BobCatprop21()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.BobCatprop21[math.random(1, #Config.BobCatprop21)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop21', prop)
    local BobCatprop21 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop21', BobCatprop21, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop21', -1, 'BobCatprop21', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.BobCatprop22 = {
    vector4(875.23, -2121.31, 30.69, 19.02),
    vector4(876.74, -2125.67, 31.23, 298.19),
    vector4(905.67, -2115.38, 31.23, 53.89),
    vector4(891.97, -2110.35, 31.82, 326.29),
}
function BobCatprop22()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.BobCatprop22[math.random(1, #Config.BobCatprop22)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop22', prop)
    local BobCatprop22 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop22', BobCatprop22, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop22', -1, 'BobCatprop22', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end

Config.BobCatprop23 = {
    vector4(883.26, -2115.07, 31.82, 331.55),
    vector4(883.39, -2113.5, 32.41, 223.52),
    vector4(878.38, -2112.0, 31.23, 221.9),
}
function BobCatprop23()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.BobCatprop23[math.random(1, #Config.BobCatprop23)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop23', prop)
    local BobCatprop23 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop23', BobCatprop23, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop23', -1, 'BobCatprop23', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end
Config.BobCatprop24 = {
    vector4(892.05, -2111.29, 33.93, 218.0),
    vector4(891.95, -2112.28, 33.95, 293.98),
    vector4(878.27, -2132.61, 32.41, 64.81),
}
function BobCatprop24()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.BobCatprop24[math.random(1, #Config.BobCatprop24)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop24', prop)
    local BobCatprop24 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop24', BobCatprop24, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop24', -1, 'BobCatprop24', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end
Config.BobCatprop25 = {
    vector4(891.28, -2111.52, 31.82, 270.49),
    vector4(883.33, -2114.22, 32.41, 295.98),
    vector4(878.51, -2131.46, 31.82, 154.82),
}
function BobCatprop25()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.ShelfSpecial[math.random(1, #Config.ShelfSpecial)]
    local location = Config.BobCatprop25[math.random(1, #Config.BobCatprop25)]
   
    local chance = math.random(1,100) 
    if chance<=10 then   prop = cash 
    elseif chance<=25 then  prop = gold
    else  prop = special
    end 
    TriggerEvent('Polar-BobCat:Server:SetBobCatprop25', prop)
    local BobCatprop25 = true
    TriggerClientEvent('Polar-BobCat:Client:AddPickupTarget', -1, 'BobCatprop25', BobCatprop25, prop, vec4(location.x, location.y,  location.z-1, location.w))
    TriggerClientEvent('Polar-BobCat:Client:BobCatprop25', -1, 'BobCatprop25', prop, vec4(location.x, location.y,  location.z-1, location.w)) 
    

end
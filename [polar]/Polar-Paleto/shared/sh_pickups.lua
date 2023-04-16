local prop = nil


-- pickups are 6-10 and 21 - 25

Config.paletoprop6 = {
    vector4(-106.0, 6467.6, 31.09, 184.08)

}
function paletoprop6()
    local cash = Config.Cash[math.random(1, #Config.Cash)]
    local gold = Config.Gold[math.random(1, #Config.Gold)]
    local special = Config.Special[math.random(1, #Config.Special)]
    local location = Config.paletoprop6[math.random(1, #Config.paletoprop6)]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = cash 
    elseif chance<=75 then  prop = gold
    elseif chance<=100 then   prop = special
    end 
    TriggerEvent('Polar-Paleto:Server:Setpaletoprop6', prop)
    local paletoprop6 = true
    TriggerClientEvent('Polar-Paleto:Client:AddPickupTarget', -1, 'paletoprop6', paletoprop6, prop, location)
    TriggerClientEvent('Polar-Paleto:Client:paletoprop6', -1, 'paletoprop6', prop, location) 
    

end
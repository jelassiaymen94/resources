local QBCore = exports['qb-core']:GetCoreObject()


-- Headers
local Header = nil

QBCore.Functions.CreateCallback("Polar-Crafting:Server:Header", function(source, cb)
    
    local math = math.random(1,17)

    if math == 1 then
        Header = "Always check the trash cans"
    elseif math == 2 then
        Header = "Stop grinding you weirdo"
    elseif math == 3 then
        Header = "Balak is the best"
    elseif math == 4 then
        Header = "Stop crafting the next level is 500 more lockpicks away!"
    elseif math == 5 then
        Header = "Stop trying so much"
    elseif math == 6 then
        Header = "Hail to the Super Chief"
    elseif math == 7 then
        Header = "Listen to Monkey Mans new album"
    elseif math == 8 then
        Header = "When you're here, you're family!"
    elseif math == 9 then
        Header = "Why is the rum gone?"
    elseif math == 10 then
        Header = "Why you up at 4AM?"
    elseif math == 11 then
        Header = "Fuck 12"
    elseif math == 12 then
        Header = "Stay strapped or get clapped"
    elseif math == 13 then
        Header = "Did someone reboot the bench?"
    elseif math == 14 then
        Header = "Don't sneeze I need my materials"
    elseif math == 15 then
        Header = "Polar on top"
    elseif math == 16 then
        Header = "Birds arn't real"
    elseif math == 17 then
        Header = "Mrs Monkey Deliveries has what you need!"
    end

    Wait(5)

    cb(Header)

end)
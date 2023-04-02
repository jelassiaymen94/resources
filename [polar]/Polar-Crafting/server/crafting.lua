local QBCore = exports['qb-core']:GetCoreObject()

local src = source


local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)


local item = nil
local giveamount = 0
local xpamount = 0


-- XP CHECK
RegisterNetEvent('Polar-Crafting:Server:FindXp', function()

    TriggerClientEvent('Polar-Crafting:Client:Rep')
    local Player = QBCore.Functions.GetPlayer(source)
    

end)
QBCore.Functions.CreateCallback("Polar-Crafting:Server:XpCheck", function(source, cb)

   
    
    local Player = QBCore.Functions.GetPlayer(source)

   -- if not Player then return end

    --xp = 250
   

    settimeout(1000)

    cb(xp)
end)


RegisterNetEvent('Polar-Crafting:Server:IncreaseXp', function(amount)
    local inc = amount
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
  
    

   
   

end)
RegisterNetEvent('Polar-Crafting:Server:XpNil', function()

    xp = nil

end)

function next(itemname, xp, give)
 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
  

    Wait(100)
    TriggerClientEvent('Polar-Crafting:Client:StartAnim', src)
    local packageTime = 15000
   -- TriggerClientEvent('QBCore:Notify', src, "Crafting " .. give .. "", 'primary', packageTime)
    TriggerClientEvent('Polar-Crafting:Client:Anim', src, itemname)
    SetTimeout(packageTime, function()
            TriggerClientEvent('Polar-Crafting:Client:EndAnim', src)
            TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            if itemname == 'weapon_fnx45' then
                local info = {
                    serie="No Serial Number"
                }
                Player.Functions.AddItem(itemname, give, nil, info {["quality"] = 100}) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemname], "add", give)
            else
            Player.Functions.AddItem(itemname, give, nil, {["quality"] = 100}) 
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemname], "add", give)
            end
            
            local Player = QBCore.Functions.GetPlayer(src)
            local data = Player.PlayerData.metadata["craftingrep"] or 0
            TriggerClientEvent('QBCore:Notify', src, " " .. data .. " is your Total Exp", green, alerttime)
            pp = (data + xp)
            Player.Functions.SetMetaData('craftingrep', pp)
            TriggerClientEvent('QBCore:Notify', src, " " .. pp .. " is your Total Exp", green, alerttime)
            
    end)
  
end
local data = 0

RegisterNetEvent('Polar-Crafting:Server:GiveEXP', function()
    local src = source
    local ped = GetPlayerPed(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local data = Player.PlayerData.metadata["craftingrep"] or 0
end)
RegisterNetEvent('Polar-Crafting:Server:Hitup', function(bool)

    hitup(bool)

end)
function removeitem(number, xp, give, item, name1,amount1,name2,amount2,name3,amount3,name4,amount4,name5,amount5,name6,amount6
    ,name7,amount7,name8,amount8,name9,amount9,name10,amount10,name11,amount11,name12,amount12,name13,amount13,name14,amount14,name15,amount15)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local item1 = Player.Functions.GetItemByName(name1)
    local item2 = Player.Functions.GetItemByName(name2)
    local item3 = Player.Functions.GetItemByName(name3)
    local item4 = Player.Functions.GetItemByName(name4)
    local item5 = Player.Functions.GetItemByName(name5)
    local item6 = Player.Functions.GetItemByName(name6)
    local item7 = Player.Functions.GetItemByName(name7)
    local item8 = Player.Functions.GetItemByName(name8)
    local item9 = Player.Functions.GetItemByName(name9)
    local item10 = Player.Functions.GetItemByName(name10)
    local item11 = Player.Functions.GetItemByName(name11)
    local item12 = Player.Functions.GetItemByName(name12)
    local item13 = Player.Functions.GetItemByName(name13)
    local item14 = Player.Functions.GetItemByName(name14)
    local item15 = Player.Functions.GetItemByName(name15)

    if number == 1 then
        if item1 ~= nil then
            if item1.amount >= amount1 then
        
            
        
                Player.Functions.RemoveItem(name1, amount1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)
        
                
                next(item, xp, give)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            end
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
            end    
    elseif number == 2 then
        if item1 ~= nil and item2 ~= nil then
            if item1.amount >= amount1 and item2.amount >= amount2 then
        
            
        
                Player.Functions.RemoveItem(name1, amount1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)
        
                Player.Functions.RemoveItem(name2, amount2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)
        
        
                next(item, xp, give)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            end
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
            end    
    elseif number == 3 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3 then
        
            
        
                Player.Functions.RemoveItem(name1, amount1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)
        
                Player.Functions.RemoveItem(name2, amount2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)
        
                Player.Functions.RemoveItem(name3, amount3)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)
        
        
                next(item, xp, give)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            end
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
            end    
    elseif number == 4 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
            if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4 then
        
            
                Player.Functions.RemoveItem(name1, amount1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)
        
                Player.Functions.RemoveItem(name2, amount2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)
        
                Player.Functions.RemoveItem(name3, amount3)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)
        
                Player.Functions.RemoveItem(name4, amount4)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)
        
                next(item, xp, give)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            end
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
            end    
    elseif number == 5 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil then
            if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 then
        
            
                Player.Functions.RemoveItem(name1, amount1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)
        
                Player.Functions.RemoveItem(name2, amount2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)
        
                Player.Functions.RemoveItem(name3, amount3)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)
        
                Player.Functions.RemoveItem(name4, amount4)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

                Player.Functions.RemoveItem(name5, amount5)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)
        
                next(item, xp, give)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            end
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
            end   
    elseif number == 6 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
                then
            if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
                then
        
            
                Player.Functions.RemoveItem(name1, amount1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)
        
                Player.Functions.RemoveItem(name2, amount2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)
        
                Player.Functions.RemoveItem(name3, amount3)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)
        
                Player.Functions.RemoveItem(name4, amount4)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

                Player.Functions.RemoveItem(name5, amount5)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

                Player.Functions.RemoveItem(name6, amount6)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)
        
                next(item, xp, give)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            end
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
            end 
    elseif number == 7 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 8 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 9 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 10 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil and item10 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 and item10.amount >= amount10 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        Player.Functions.RemoveItem(name10, amount10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name10],"remove", amount10)
        next(item, xp, give)
        
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 11 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil and item10 ~= nil and item11 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 and item10.amount >= amount10 and item11.amount >= amount11 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        Player.Functions.RemoveItem(name10, amount10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name10],"remove", amount10)

        Player.Functions.RemoveItem(name11, amount11)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name11],"remove", amount11)
        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 12 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil and item10 ~= nil and item11 ~= nil and item12 ~= nil 
        then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 and item10.amount >= amount10 and item11.amount >= amount11 and item12.amount >= amount12 
        then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        Player.Functions.RemoveItem(name10, amount10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name10],"remove", amount10)

        Player.Functions.RemoveItem(name11, amount11)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name11],"remove", amount11)

        Player.Functions.RemoveItem(name12, amount12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name12],"remove", amount12)
        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 13 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil and item10 ~= nil and item11 ~= nil and item12 ~= nil 
        and item13 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 and item10.amount >= amount10 and item11.amount >= amount11 and item12.amount >= amount12 
    and item13.amount >= amount13 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        Player.Functions.RemoveItem(name10, amount10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name10],"remove", amount10)

        Player.Functions.RemoveItem(name11, amount11)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name11],"remove", amount11)

        Player.Functions.RemoveItem(name12, amount12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name12],"remove", amount12)

        Player.Functions.RemoveItem(name13, amount13)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name13],"remove", amount13)
        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 14 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil and item10 ~= nil and item11 ~= nil and item12 ~= nil 
        and item13 ~= nil and item14 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 and item10.amount >= amount10 and item11.amount >= amount11 and item12.amount >= amount12 
    and item13.amount >= amount13 and item14.amount >= amount14 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        Player.Functions.RemoveItem(name10, amount10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name10],"remove", amount10)

        Player.Functions.RemoveItem(name11, amount11)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name11],"remove", amount11)

        Player.Functions.RemoveItem(name12, amount12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name12],"remove", amount12)

        Player.Functions.RemoveItem(name13, amount13)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name13],"remove", amount13)

        Player.Functions.RemoveItem(name14, amount14)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name14],"remove", amount14)
        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
    elseif number == 15 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil and item5 ~= nil and item6 ~= nil 
        and item7 ~= nil  and item8 ~= nil and item9 ~= nil and item10 ~= nil and item11 ~= nil and item12 ~= nil 
        and item13 ~= nil and item14 ~= nil and item15 ~= nil then
    if item1.amount >= amount1 and item2.amount >= amount2 and item3.amount >= amount3  and item4.amount >= amount4  and item5.amount >= amount5 and item6.amount >= amount6 
    and item7.amount >= amount7 and item8.amount >= amount8  and item9.amount >= amount9 and item10.amount >= amount10 and item11.amount >= amount11 and item12.amount >= amount12 
    and item13.amount >= amount13 and item14.amount >= amount14 and item15.amount >= amount15 then

    
        Player.Functions.RemoveItem(name1, amount1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name1],"remove", amount1)

        Player.Functions.RemoveItem(name2, amount2)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name2],"remove", amount2)

        Player.Functions.RemoveItem(name3, amount3)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name3],"remove", amount3)

        Player.Functions.RemoveItem(name4, amount4)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name4],"remove", amount4)

        Player.Functions.RemoveItem(name5, amount5)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name5],"remove", amount5)

        Player.Functions.RemoveItem(name6, amount6)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name6],"remove", amount6)

        Player.Functions.RemoveItem(name7, amount7)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name7],"remove", amount7)

        Player.Functions.RemoveItem(name8, amount8)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name8],"remove", amount8)

        Player.Functions.RemoveItem(name9, amount9)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name9],"remove", amount9)

        Player.Functions.RemoveItem(name10, amount10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name10],"remove", amount10)

        Player.Functions.RemoveItem(name11, amount11)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name11],"remove", amount11)

        Player.Functions.RemoveItem(name12, amount12)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name12],"remove", amount12)

        Player.Functions.RemoveItem(name13, amount13)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name13],"remove", amount13)

        Player.Functions.RemoveItem(name14, amount14)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name14],"remove", amount14)

        Player.Functions.RemoveItem(name15, amount15)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[name15],"remove", amount15)
        next(item, xp, give)
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end
    else
        TriggerClientEvent('QBCore:Notify', src,"You dont have enough materials", red, alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src) 
    end 
        
    end
    
end















RegisterNetEvent('Polar-Crafting:Server:Start', function()
    
   
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)




 end)
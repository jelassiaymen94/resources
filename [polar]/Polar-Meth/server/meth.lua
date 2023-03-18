local QBCore = exports[Config.Core]:GetCoreObject()




RegisterNetEvent('Polar-Meth:Server:reward1', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp1luck = math.random(10,15)

    Player.Functions.AddItem(Config.Methitem, temp1luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp1luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)

RegisterNetEvent('Polar-Meth:Server:reward2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp2luck = math.random(15,25)

    Player.Functions.AddItem(Config.Methitem, temp2luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp2luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)

RegisterNetEvent('Polar-Meth:Server:reward3', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp3luck = math.random(25,35)

    Player.Functions.AddItem(Config.Methitem, temp3luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp3luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)

RegisterNetEvent('Polar-Meth:Server:reward4', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp4luck = math.random(35,50)

    Player.Functions.AddItem(Config.Methitem, temp4luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp4luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)



local unlocked = false
RegisterNetEvent('Polar-Meth:Server:Unlock', function()
    local trimes = (Config.UnlockTime * 1000)

    unlocked = true

    Wait(trimes)


    unlocked = false


end)
QBCore.Functions.CreateCallback("Polar-Crafting:Server:XpCheck", function(source, cb)

    cb(unlocked)
    
end)

RegisterNetEvent('Polar-Meth:Server:reward1luck', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp1luck = math.random(15,15)

        Player.Functions.AddItem(Config.Methitem, temp1luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp1luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)

RegisterNetEvent('Polar-Meth:Server:reward2luck', function()
    local Player = QBCore.Functions.GetPlayer(source)
   local temp2luck = math.random(20,25)

    Player.Functions.AddItem(Config.Methitem, temp2luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add')
       --  TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)

RegisterNetEvent('Polar-Meth:Server:reward3luck', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp3luck = math.random(30,35)

    Player.Functions.AddItem(Config.Methitem, temp3luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp3luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)

RegisterNetEvent('Polar-Meth:Server:reward4luck', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local temp4luck = math.random(35,40)

    Player.Functions.AddItem(Config.Methitem, temp4luck)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Methitem], 'add', temp4luck)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth")
end)








RegisterNetEvent('Polar-Meth:Server:SmashItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local luck = math.random(1,100)

    if luck <= 19 then
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.BreakItem, Config.BreakItemAmount, false) then -- rob item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BreakItem], 'remove', Config.BreakItemAmount)
        end
    end
end)

RegisterNetEvent('Polar-Meth:Server:BagItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
   

    
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.BagItem, Config.BagItemAmount, false) then -- rob item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BagItem], 'remove', Config.BagItemAmount)
        end
    
end)
RegisterNetEvent('Polar-Meth:Server:TrayRemove', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
   

    
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.TrayItem, Config.TrayItemAmount, false) then -- rob item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.TrayItem], 'remove', Config.TrayItemAmount)
        end
    
end)
RegisterNetEvent('Polar-Meth:Server:TrayAdd', function()
    local Player = QBCore.Functions.GetPlayer(source)
    

    Player.Functions.AddItem(Config.TrayItem, Config.TrayItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.TrayItem], 'add', Config.TrayItemAmount)
         TriggerEvent("qb-log:Server:CreateLog", "meth", "METH", "blue", "**" .. GetPlayerName(src) .. "** Got Meth Tray")
end)
RegisterNetEvent('Polar-Meth:Server:RemoveIngredients', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing1, Config.Ing1Amount, false) then -- rob item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing1], 'remove', Config.Ing1Amount)
        end
        Wait(150)
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing2, Config.Ing2Amount, false) then -- rob item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing2], 'remove', Config.Ing2Amount)
        end
        Wait(150)
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing3, Config.Ing3Amount, false) then -- rob item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing3], 'remove', Config.Ing3Amount)
        end
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing4, Config.Ing4Amount, false) then -- rob item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing4], 'remove', Config.Ing4Amount)
        end
end)


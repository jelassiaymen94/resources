local QBCore = exports[Config.Core]:GetCoreObject()


local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)



--TriggerServerEvent('Polar-Coke:Server:RemoveIngredients')
RegisterNetEvent('Polar-Coke:Server:RemoveIngredients', function()
        local removeluck = math.random(1,100)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end

            if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing1, Config.Ing1Amount, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing1], 'remove', Config.Ing1Amount)
            end
            Wait(300)
            if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing2, Config.Ing2Amount, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing2], 'remove', Config.Ing2Amount)
            end
            Wait(300)
            if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing3, Config.Ing3Amount, false) then --  item removed from inventory
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing3], 'remove', Config.Ing3Amount)
            end
            Wait(300)
            if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Ing4, Config.Ing4Amount, false) then --  item removed from inventory
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Ing4], 'remove', Config.Ing4Amount)
            end
    if removeluck >= 80 then
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.BreakItem, Config.BreakItemAmount, false) then -- item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BreakItem], 'remove', Config.BreakItemAmount)
        end

        TriggerClientEvent("QBCore:Notify", source, "Your Card Broke", red, alerttime)
        
    else
        TriggerClientEvent("QBCore:Notify", source, "Your Card Almost Broke", red, alerttime)
    end
end)
RegisterNetEvent('Polar-Coke:Server:RemoveLeaf', function()
    local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end

        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.LeafItem, Config.LeafItemAmount, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LeafItem], 'remove', Config.LeafItemAmount)
        end
        if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.Can, Config.CanAmount, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Can], 'remove', Config.LeafItemACanAmountmount)
        end
end)
RegisterNetEvent('Polar-Coke:Server:GivePrepare', function()

    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddItem(Config.PreparedItem, Config.PreparedItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.PreparedItem], 'add',  Config.PreparedItemAmount)
         --TriggerEvent("qb-log:Server:CreateLog", "coke", "GRABBED ITEM", "blue", "**" .. GetPlayerName(src) .. "** Grabbed Item")



end)
-- TriggerServerEvent('Polar-Coke:Server:GiveIngredients')
RegisterNetEvent('Polar-Coke:Server:GiveIngredients', function()

    local Player = QBCore.Functions.GetPlayer(source)

    --Player.Functions.AddItem(Config.Ing3, Config.Ing3Amount)
       -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Ing3], 'add',  Config.Ing3Amount)
         --TriggerEvent("qb-log:Server:CreateLog", "coke", "GRABBED ITEM", "blue", "**" .. GetPlayerName(src) .. "** Grabbed Item")



end)


RegisterNetEvent('Polar-Coke:Server:RemoveBagItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.BagItem, Config.BagItemAmount, false) then -- item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BagItem], 'remove', Config.BagItemAmount)
    end
    if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.PackagedItem, Config.PackagedItemAmount, false) then -- item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PackagedItem], 'remove', Config.PackagedItemAmount)
    end
end)

RegisterNetEvent('Polar-Coke:Server:RemovePackage', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.PackageItem, Config.PackageItemAmount, false) then -- item removed from inventory
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PackageItem], 'remove', Config.PackageItemAmount)
    end
    
end)



RegisterNetEvent('Polar-Coke:GiveLeaf', function()
    
    local Player = QBCore.Functions.GetPlayer(source)
   
    local luck = math.random(1,100)

    if luck < 85 then
        local lucl = math.random(1,100)
        if lucl < 20 then
            Player.Functions.AddItem('copper', 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.LeafItem], 'add', 1)
            TriggerEvent("qb-log:Server:CreateLog", "coke", "LEAFS", "blue", "**" .. GetPlayerName(src) .. "** Got 1 Leaf")
        else
        Player.Functions.AddItem(Config.LeafItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.LeafItem], 'add', 1)
        TriggerEvent("qb-log:Server:CreateLog", "coke", "LEAFS", "blue", "**" .. GetPlayerName(src) .. "** Got 1 Leafs")
        end
    elseif luck < 95 then
        local lucl = math.random(1,100)
        if lucl < 20 then
            Player.Functions.AddItem('copper', 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.LeafItem], 'add', 1)
            TriggerEvent("qb-log:Server:CreateLog", "coke", "LEAFS", "blue", "**" .. GetPlayerName(src) .. "** Got 1 Leaf")
        else
        Player.Functions.AddItem(Config.LeafItem, 2)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.LeafItem], 'add', 2)
        TriggerEvent("qb-log:Server:CreateLog", "coke", "LEAFS", "blue", "**" .. GetPlayerName(src) .. "** Got 2 Leafs")
        end
    elseif luck < 101 then
        local specialluck = math.random(1,100)
        if specialluck > 90 then
        Player.Functions.AddItem(Config.LeafItem, 6)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.LeafItem], 'add', 3)
        TriggerEvent("qb-log:Server:CreateLog", "coke", "LEAFS", "blue", "**" .. GetPlayerName(src) .. "** Got 3 Leafs")
        else
            Player.Functions.AddItem(Config.LeafItem, 6)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.LeafItem], 'add', 6)
            TriggerEvent("qb-log:Server:CreateLog", "coke", "LEAFS", "blue", "**" .. GetPlayerName(src) .. "** Got 6 Leafs")
        end
    end
end)









RegisterNetEvent('Polar-Coke:Server:level0', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level0 = math.random(5,10)

    Player.Functions.AddItem(Config.CokeItem, level0)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level0)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level1', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level1 = math.random(10,15)

    Player.Functions.AddItem(Config.CokeItem, level1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level1)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level2 = math.random(15,25)

    Player.Functions.AddItem(Config.CokeItem, level2)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level2)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level3', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level3 = math.random(25,35)

    Player.Functions.AddItem(Config.CokeItem, level3)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level3)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level4', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level4 = math.random(35,50)

    Player.Functions.AddItem(Config.CokeItem, level4)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level4)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)







RegisterNetEvent('Polar-Coke:Server:level0buff', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level0buff = math.random(8,10)

        Player.Functions.AddItem(Config.CokeItem, level0buff)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level0buff)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level1buff', function()
    local Player = QBCore.Functions.GetPlayer(source)
   local level1buff = math.random(10,15)

    Player.Functions.AddItem(Config.CokeItem, level1buff)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level1buff)
      TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level2buff', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level2buff = math.random(20,25)

    Player.Functions.AddItem(Config.CokeItem, level2buff)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level2buff)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level3buff', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level3buff = math.random(30,35)

    Player.Functions.AddItem(Config.CokeItem, level3buff)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level3buff)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:level4buff', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local level4buff = math.random(45,50)

    Player.Functions.AddItem(Config.CokeItem, level4buff)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CokeItem], 'add', level4buff)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Cocaine")
end)

RegisterNetEvent('Polar-Coke:Server:AddPackage', function()
    local Player = QBCore.Functions.GetPlayer(source)
   

    Player.Functions.AddItem(Config.PackageItem, Config.PackageItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.PackageItem], 'add', Config.PackageItemAmount)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Unpackaged Brick")


end)


RegisterNetEvent('Polar-Coke:Server:AddPackaged', function()

    local Player = QBCore.Functions.GetPlayer(source)
   

    Player.Functions.AddItem(Config.PackagedItem, Config.PackagedItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.PackagedItem], 'add', Config.PackagedItemAmount)
         TriggerEvent("qb-log:Server:CreateLog", "coke", "COCAINE", "blue", "**" .. GetPlayerName(src) .. "** Got Packaged Brick")



end)




local price = nil

RegisterNetEvent("Polar-Coke:Server:Check", function()

    local i = 'cokematerials'
    
    if price == nil then
        price = 5000
    elseif price == 5000 then
        price = 7500
    elseif price == 7500 then
        price = 10000
    elseif price == 10000 then
        price = 12500
    elseif price == 12500 then
        price = 15000
    elseif price >= 15000 then
        price = 15000
    end

    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
   
    if Player.Functions.RemoveMoney('cash', price) ~= true then

        TriggerClientEvent('QBCore:Notify', source, 'Not enough ' .. 'cash', 'error')
        
        if price == 15000 then
            price = 12500
        elseif price == 12500 then
            price = 10000
        elseif price == 10000 then
            price = 7500
        elseif price == 7500 then
            price = 5000
        elseif price == 5000 then
            price = nil
        elseif price >= nil then
            price = nil
        end
    
    else
    if Player.Functions.AddItem(i, 1) ~= true then

        Player.Functions.AddMoney('cash', price)
        TriggerClientEvent('QBCore:Notify', source, 'Could not give item', 'error')
           
    else

        
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[i], 'add', 1)
        TriggerClientEvent('QBCore:Notify', source, "Here's the shit, Good Luck!")

    end
    end
   

   -- TriggerClientEvent('inventory:client:ItemBox', source, i, "add")
    

   
end)

RegisterNetEvent('Polar-Coke:Server:UpdateMS', function(bool)
    
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)


    

    Player.Functions.SetMetaData('circlems', bool)


end)



RegisterNetEvent('Polar-Coke:Server:UpdateTime', function(bool)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)


    

    Player.Functions.SetMetaData('circletime', bool)

end)




QBCore.Functions.CreateUseableItem("cokebill", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
   
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebill'], "remove", 1)
            TriggerClientEvent('Polar-Coke:Client:CokeBill', source)
        end
    
end)

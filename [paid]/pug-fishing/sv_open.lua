local QBCore = exports[Config.CoreName]:GetCoreObject()

QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:StartFishing", src, item.name)
end)
QBCore.Functions.CreateUseableItem("fishingrod2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:StartFishing", src, item.name)
end)
QBCore.Functions.CreateUseableItem("fishingrod3", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:StartFishing", src, item.name)
end)
QBCore.Functions.CreateUseableItem("fishinglure", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:StartFishing", src, item.name)
end)
QBCore.Functions.CreateUseableItem("fishinglure2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:StartFishing", src, item.name)
end)
QBCore.Functions.CreateUseableItem(Config.ChestItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:OpenTreasureChest", src, item.name)
end)
QBCore.Functions.CreateUseableItem("bottlemap", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(item.name, 1)
    TriggerClientEvent("Pug:client:Openbottlemap", src, item.name)
end)
QBCore.Functions.CreateUseableItem("treasuremap", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("Pug:client:UseTreasureMap", src, item.name)
end)

QBCore.Functions.CreateCallback('Pug:ServerCB:CanCraftRod', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local item1 = Player.Functions.GetItemByName(Config.CraftRods[item].item1)
	local item2 = Player.Functions.GetItemByName(Config.CraftRods[item].item2)
    local cash = Player.PlayerData.money['cash']
    if cash >= Config.CraftRods[item].price then
        if item1 then
            if item1.amount >= Config.CraftRods[item].item1Amount then
                if item2 then
                    if item2.amount >= Config.CraftRods[item].item2Amount then
                        if Player.PlayerData.metadata["fishingrep"] >= Config.CraftRods[item].repRequired then
                            cb(true)
                        else
                            TriggerClientEvent('QBCore:Notify', src, 'You are missing '.. Config.CraftRods[item].repRequired - Player.PlayerData.metadata["fishingrep"]..' Fisshing rep', 'error')
                            cb(false)
                        end
                    else
                        TriggerClientEvent('QBCore:Notify', src, 'You are missing '.. Config.CraftRods[item].item2Amount - item2.amount..'x '..QBCore.Shared.Items[Config.CraftRods[item].item2].label, 'error')
                        cb(false)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You are missing a '.. QBCore.Shared.Items[Config.CraftRods[item].item2].label, 'error')
                    cb(false)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'You are missing '.. Config.CraftRods[item].item1Amount - item1.amount..'x '..QBCore.Shared.Items[Config.CraftRods[item].item1].label, 'error')
                cb(false)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'You are missing a '.. QBCore.Shared.Items[Config.CraftRods[item].item1].label, 'error')
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are missing $'.. Config.CraftRods[item].price - cash, 'error')
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('Pug:ServerCB:SellGems', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local Gems = Player.Functions.GetItemByName(item)
    if Gems then
        local amount = Gems.amount * math.random(Config.SellGems[item].pricemin,Config.SellGems[item].pricemax)
        Player.Functions.AddMoney('cash', amount, "buy-item")
        Player.Functions.RemoveItem(item, Gems.amount)
        TriggerClientEvent('QBCore:Notify', src, Translations.success.soldfish.. Gems.amount..'x '..QBCore.Shared.Items[item].label..' for $'..amount, 'success')
        TriggerEvent("qb-log:server:CreateLog", "jobmoneygiven", "FISHING GEMS", "blue", "**" .. GetPlayerName(src) .. "** Got " .. Gems.amount .. "for" ..amount .. "")
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('Pug:ServerCB:SellFish', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local Fish = Player.Functions.GetItemByName(item)
    if Fish then
        local amount = Fish.amount * Config.SellFishies[item].price
        Player.Functions.AddMoney('cash', amount, "buy-item")
        Player.Functions.RemoveItem(item, Fish.amount)
        TriggerClientEvent('QBCore:Notify', src, Translations.success.soldfish.. Fish.amount..'x '..QBCore.Shared.Items[item].label..' for $'..amount, 'success')
        TriggerEvent("qb-log:server:CreateLog", "jobmoneygiven", "FISHING FISH", "blue", "**" .. GetPlayerName(src) .. "** Got " .. Fish.amount .. "for" ..amount .. "")
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('Pug:server:FishingRemoveMoeny')
AddEventHandler('Pug:server:FishingRemoveMoeny', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('cash', amount, "buy-item")
    TriggerEvent("qb-log:server:CreateLog", "jobmoneyremoved", "FISHING BOUGHT ITEM", "blue", "**" .. GetPlayerName(src) .. "** Removed " .. amount .. "")
end)

RegisterServerEvent('Pug:server:GiveFish')
AddEventHandler('Pug:server:GiveFish', function(fish, amnt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if fish then
        if amnt then
            Player.Functions.AddItem(fish, amnt)
        else
            Player.Functions.AddItem(fish, 1)
        end
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[fish], "add")
        --TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING FISH ITEM", "blue", "**" .. GetPlayerName(src) .. "** Added " .. amnt .. "")
	end
end)

-- rewards table for opening a Treasure chest
RegisterServerEvent('Pug:server:GiveChestItems', function(type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local itemsfound = false
    local emerald = math.random(1,100)
    local diamond = math.random(1,100)
    local ruby = math.random(1,100)
    local sapphire = math.random(1,100)
    local captainskull = math.random(1,100)
    local chestkey = math.random(1,100)
    local rolex = math.random(1,100)
    local diamondring = math.random(1,100)
    local tresurbottle = math.random(1,100)
    local yllowdiamond = math.random(1,100)
    local pistol = math.random(1,100)
    local cash = math.random(1,100)
    local lure1 = math.random(1,100)
    local lure2 = math.random(1,100)
    local chance = 10
    if emerald <= 30 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('emerald', math.random(1,4))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['emerald'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Emerald")
    end
    if diamond <= 30 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('diamond', math.random(1,4))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['diamond'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Diamond")
    end
    if ruby <= 30 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('ruby', math.random(1,4))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['ruby'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Ruby")
    end
    if yllowdiamond <= 25 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('yellow-diamond', math.random(1,4))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['yellow-diamond'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Yellow Diamond")
    end
    if sapphire <= 30 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('sapphire', math.random(1,3))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sapphire'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Sapphire")
    end
    if pistol <= 10 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('weapon_pistol', math.random(1,4))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_pistol'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Pistol")
    end
    if captainskull <= 2 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('captainskull', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['captainskull'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Captin Skull")
    end
    if chestkey <= 1 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem(Config.ChestKey, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ChestKey], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Chest Key")
    end
    if rolex <= 30 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('rolex', math.random(1,5))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolex'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Rolex")
    end
    if diamondring <= 40 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('diamond_ring', math.random(1,7))
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['diamond_ring'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Diamond Ring")
    end
    if tresurbottle <= 1 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('bottlemap', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bottlemap'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Bottle Map")
    end
    if lure1 <= 4 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('fishinglure', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishinglure'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Fishing Lure")
    end
    if lure2 <= 1 then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        Wait(1000)
		temsfound = true
        Player.Functions.AddItem('fishinglure2', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishinglure2'], "add")
        TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added Fishing Lure 2")
    end
    if type == 'found' then -- if the chest opened was through finding it wile using the treasure map 
        chance = 55
    end
    if cash <= chance then
        TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
        local luck = math.random(500,3500)
        Wait(1000)
		temsfound = true
        Player.Functions.AddMoney('cash', luck)
        TriggerEvent("qb-log:server:CreateLog", "jobmoneygiven", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added " .. luck .. " Cash")
    end
    if type == 'found' then -- loot table for if the chest opened was through finding it wile using the treasure map 
        local brain = math.random(1,500)
        if brain == 1 then
            TriggerClientEvent('animations:client:EmoteCommandStart', src, {"pickup"})
            Wait(1000)
            temsfound = true
            Player.Functions.AddItem(Config.SuperRareitem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SuperRareitem], "add")
            TriggerEvent("qb-log:server:CreateLog", "jobitemadded", "FISHING Treasure Chest", "blue", "**" .. GetPlayerName(src) .. "** Added " .. Config.SuperRareitem .. "")
        end
        RandomizeChestLocation()
    end
	if not temsfound then
		TriggerClientEvent('QBCore:Notify', src, Translations.error.empty_chest, 'error')
	end
    TriggerClientEvent("Pug:client:DeleteOpenChest", src)
end)

QBCore.Commands.Add("fishrep", "Check your reputation", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local fishing = Player.PlayerData.metadata["fishingrep"]
    TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "Fishing reputation is "..fishing)
    TriggerEvent("qb-log:server:CreateLog", "commands", "FISHING REPUTATION", "blue", "**" .. GetPlayerName(src) .. "** Checked " .. fishing .. "")
end)
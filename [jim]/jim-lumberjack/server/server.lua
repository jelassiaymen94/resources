local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end	QBCore = exports['qb-core']:GetCoreObject() end)

QBCore.Functions.CreateUseableItem("cardhat", function(source, item) TriggerClientEvent("jim-mechanic:carboardHat", source) end)
QBCore.Functions.CreateUseableItem("walkstick", function(source, item) TriggerClientEvent("jim-lumberjack:walkstick", source) end)
for i = 1, 21 do QBCore.Functions.CreateUseableItem("origami"..i, function(source, item) TriggerClientEvent("jim-lumberjack:origamiani", source) end) end

RegisterNetEvent('jim-lumberjack:server:toggleItem', function(give, item, amount)
	local amount = amount or 1
	local remamount = amount
    local src = source
	if give == 0 or give == false then
        if QBCore.Functions.GetPlayer(src).Functions.GetItemByName(item).unique then -- If unique item, keep removing until gone
            while remamount > 0 do
                QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, 1)
                remamount -= 1
            end
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", amount) -- Show removal item box when all are removed
            return
        end
		if QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, amount) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
		end
	else
		if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, amount) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
		end
	end
	TriggerEvent("qb-log:server:CreateLog", "useable", "JIM LUMBERJACK", "yellow", "**" .. src .. "** Used" .. amount .. " " .. item .. "")
end)

---Crafting
RegisterServerEvent('jim-lumberjack:GetItem', function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	if Player.Functions.AddItem(data.item, data.craftable[data.tablenumber]["amount"] or 1) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], "add", data.craftable[data.tablenumber]["amount"] or 1)
		if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[data.item].label.."^7(^2x^6"..(data.craftable[data.tablenumber]["amount"] or 1).."^7)'") end
		for k, v in pairs(data.craftable[data.tablenumber][data.item]) do
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(k)], "remove", v)
			Player.Functions.RemoveItem(tostring(k), v)
			if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[k].label.."^7(^2x^6"..v.."^7)'") end
		end
	end
	--Try to send back to craftmenu
	TriggerClientEvent("jim-lumberjack:CraftMenu", src, data)
end)

RegisterNetEvent("jim-lumberjack:Selling", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(data.item) ~= nil then
        local amount = Player.Functions.GetItemByName(data.item).amount
        local pay = (amount * Config.SellItems[data.item])
        Player.Functions.RemoveItem(data.item, amount)
        Player.Functions.AddMoney('cash', pay)
		TriggerEvent("qb-log:server:CreateLog", "jobmoneygiven", "JIM LUMBERJACK", "red", "**" .. src .. "** Given" .. pay .. " Cash")
		TriggerEvent("qb-log:server:CreateLog", "jobitemremoved", "JIM LUMBERJACK", "black", "**" .. src .. "** Removed" .. amount .. "" .. data.item .. "")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], 'remove', amount)
    else
        TriggerClientEvent("QBCore:Notify", src, Loc[Config.Lan].error["dont_have"].." "..QBCore.Shared.Items[data.item].label, "error")
    end
end)

function HasItem(source, items, amount)
	local amount = amount or 1
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    local totalItems = #items
    local count = 0
    local kvIndex = 2

	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player has required item^7 '^3"..tostring(items).."^7'") end

	for _, itemData in pairs(Player.PlayerData.items) do
        if itemData and (itemData.name == items) then
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Item^7: '^3"..tostring(items).."^7' ^2Slot^7: ^3"..itemData.slot.." ^7x(^3"..tostring(itemData.amount).."^7)") end
			count += itemData.amount
		end
	end
	if count >= amount then
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^5FOUND^7 x^3"..count.."^7") end
		return true
	end
	if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^1NOT FOUND^7") end
    return false
end
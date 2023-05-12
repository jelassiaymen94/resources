local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end QBCore = exports['qb-core']:GetCoreObject() end)

--Create Usable Items
QBCore.Functions.CreateUseableItem("car_armor", function(source, item) TriggerClientEvent('jim-mechanic:client:applyArmour', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("turbo", function(source, item) TriggerClientEvent("jim-mechanic:client:applyTurbo", source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("headlights", function(source, item) TriggerClientEvent("jim-mechanic:client:applyXenons", source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("underglow_controller", function(source, item) TriggerClientEvent('jim-mechanic:client:neonMenu', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("toolbox", function(source, item) TriggerClientEvent('jim-mechanic:client:Menu', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("mechanic_tools", function(source, item) TriggerClientEvent('jim-mechanic:client:Repair:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("seat", function(source, item) TriggerClientEvent('jim-mechanic:client:Seat:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("internals", function(source, item) TriggerClientEvent('jim-mechanic:client:Interior:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("externals", function(source, item) TriggerClientEvent('jim-mechanic:client:Exterior:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("rims", function(source, item) TriggerClientEvent('jim-mechanic:client:Rims:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("exhaust", function(source, item) TriggerClientEvent('jim-mechanic:client:Exhaust:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("horn", function(source, item) TriggerClientEvent('jim-mechanic:client:Horn:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("paintcan", function(source, item) TriggerClientEvent('jim-mechanic:client:Paints:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("livery", function(source, item) TriggerClientEvent('jim-mechanic:client:Livery:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("tires", function(source, item) TriggerClientEvent('jim-mechanic:client:Tires:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("skirts", function(source, item) TriggerClientEvent('jim-mechanic:client:Skirts:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("spoiler", function(source, item) TriggerClientEvent('jim-mechanic:client:Spoilers:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("roof", function(source, item) TriggerClientEvent('jim-mechanic:client:Roof:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("rollcage", function(source, item) TriggerClientEvent('jim-mechanic:client:RollCage:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("hood", function(source, item) TriggerClientEvent('jim-mechanic:client:Hood:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("bumper", function(source, item) TriggerClientEvent('jim-mechanic:client:Bumpers:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("customplate", function(source, item) TriggerClientEvent('jim-mechanic:client:Plates:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("cleaningkit", function(source, item) TriggerClientEvent('jim-mechanic:client:cleanVehicle', source, true) end)
QBCore.Functions.CreateUseableItem("tint_supplies", function(source, item) TriggerClientEvent('jim-mechanic:client:Windows:Check', source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("ducttape", function(source, item) TriggerClientEvent("jim-mechanic:quickrepair", source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("bprooftires", function(source, item) TriggerClientEvent("jim-mechanic:client:applyBulletProof", source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("drifttires", function(source, item) TriggerClientEvent("jim-mechanic:client:applyDrift", source) 
--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)
QBCore.Functions.CreateUseableItem("nos", function(source, item) TriggerClientEvent("jim-mechanic:client:applyNOS", source) 
	--TriggerEvent("qb-log:server:CreateLog", "useable", "JIM MECHANIC", "black", "**" .. source .. "** Used " .. item .. "")
end)

for i = 1, 5 do
	QBCore.Functions.CreateUseableItem("suspension"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applySuspension", source, i-1) end)
	QBCore.Functions.CreateUseableItem("engine"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyEngine", source, i-1) end)

end
for i = 1, 4 do
	QBCore.Functions.CreateUseableItem("transmission"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyTransmission", source, i-1) end)

end
for i = 1, 3 do
	QBCore.Functions.CreateUseableItem("brakes"..i, function(source, item) TriggerClientEvent("jim-mechanic:client:applyBrakes", source, i-1) end)
	
end

--Item Give/Remove (for performance items)
RegisterNetEvent('jim-mechanic:server:swapItem', function(level, current, item)
	local src = source
	if level then
		QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item..level+1, 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item..level+1], "remove", 1)
	end
	if current ~= -1 then
		--if QBCore.Functions.GetPlayer(src).Functions.AddItem(item..current+1, 1) then
		--	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item..current+1], "add", 1)
		--end
	end
end)
--General give take items
RegisterNetEvent('jim-mechanic:server:toggleItem', function(give, item)
	local src = source
	if not give then
		if QBCore.Functions.GetPlayer(src).Functions.RemoveItem(item, 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", 1)
		end
	elseif give then
		if QBCore.Functions.GetPlayer(src).Functions.AddItem(item, 1) then
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", 1)
		end
	end
end)

--========================================================== REPAIRS

QBCore.Functions.CreateCallback('jim-mechanic:repairCost',function(source, cb, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	print(json.encode(data))
	if data.part == Loc[Config.Lan]["repair"].engine then
		local item = Player.Functions.GetItemByName(Config.RepairEngine)
		if item ~= nil and item.amount >= tonumber(data.cost) then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].body then
		local item = Player.Functions.GetItemByName(Config.RepairBody)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].radiator then
		local item = Player.Functions.GetItemByName(Config.RepairRadiator)
		if item ~= nil and item.amount >= tonumber(data.cost) then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].driveshaft then
		local item = Player.Functions.GetItemByName(Config.RepairAxle)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].brakes then
		local item = Player.Functions.GetItemByName(Config.RepairBrakes)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].clutch then
		local item = Player.Functions.GetItemByName(Config.RepairClutch)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].tank then
		local item = Player.Functions.GetItemByName(Config.RepairFuel)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	end
end)

RegisterServerEvent('jim-mechanic:ItemRemove', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if data.part == Loc[Config.Lan]["repair"].engine then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairEngine], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairEngine, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].body then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairBody], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairBody, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].radiator then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairRadiator], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairRadiator, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].driveshaft then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairAxle], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairAxle, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].brakes then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairBrakes], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairBrakes, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].clutch then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairClutch], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairClutch, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].tank then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairFuel], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairFuel, data.cost)
	end
end)

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
local itemcheck = true
--Check crafting recipes and their ingredients
if Config.Crafting then
	for k, v in pairs(Crafting) do for i = 1, #v do for l, b in pairs(v[i]) do if l ~= "amount" and l ~= "job" then
			if not QBCore.Shared.Items[l] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..l.."^7'") itemcheck = false end
			for j in pairs(b) do if not QBCore.Shared.Items[j] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..j.."^7'") itemcheck = false end	end	end	end	end
		end
	end
	-- Check Stores for missing items
	if Config.Stores then
		for _, v in pairs(Stores) do
			for i = 1, #v.items do if not QBCore.Shared.Items[v.items[i].name] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..v.items[i].name.."^7'") itemcheck = false end end
		end
	end
	-- Check if theres a missing item/mistake in the repair materials
	if not FreeRepair then
		if not QBCore.Shared.Items[Config.RepairEngine] then print("^5Debug^7: ^3onResourceStart^7: ^2Engine repair requested a item missing from the Shared^7: '"..Config.RepairEngine.."^7'") itemcheck = false end
		if not QBCore.Shared.Items[Config.RepairBody] then print("^5Debug^7: ^3onResourceStart^7: ^2Body repair requested a item missing from the Shared^7: '"..Config.RepairBody.."^7'") itemcheck = false end
		if useMechJob then
			if not QBCore.Shared.Items[Config.RepairRadiator] then print("^5Debug^7: ^3onResourceStart^7: ^2Radiator repair requested a item missing from the Shared^7: '^6"..Config.RepairRadiator.."^7'") itemcheck = false end
			if not QBCore.Shared.Items[Config.RepairAxle] then print("^5Debug^7: ^3onResourceStart^7: ^2Axle repair requested a item missing from the Shared^7: '^6"..Config.RepairAxle.."^7'") itemcheck = false end
			if not QBCore.Shared.Items[Config.RepairBrakes] then print("^5Debug^7: ^3onResourceStart^7: ^2Brakes repair requested a item missing from the Shared^7: '^6"..Config.RepairBrakes.."^7'") itemcheck = false end
			if not QBCore.Shared.Items[Config.RepairClutch] then print("^5Debug^7: ^3onResourceStart^7: ^2Clutch repair requested a item missing from the Shared^7: '^6"..Config.RepairClutch.."^7'") itemcheck = false end
			if not QBCore.Shared.Items[Config.RepairFuel] then print("^5Debug^7: ^3onResourceStart^7: ^2FuelTank repair requested a item missing from the Shared^7: '^6"..Config.RepairFuel.."^7'") itemcheck = false end
		end
	end
	-- Check for "mechboard" item
	if not QBCore.Shared.Items["mechboard"] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6mechboard^7'") itemcheck = false end
	for k, v in pairs(Config.JobRoles) do
		if not QBCore.Shared.Jobs[v] then print("^5Debug^7: ^3onResourceStart^7: ^4Config^7.^4Jobroles ^2tried to find the missing job^7: '^6"..v.."^7'") end
	end
	--Success message if all there.
	if Config.Debug and itemcheck then print("^5Debug^7: ^3onResourceStart^7: ^2All items found in the shared^7!") end
end)
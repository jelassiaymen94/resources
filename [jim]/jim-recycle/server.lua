

local QBCore = exports['qb-core']:GetCoreObject()

local ItemTable = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
    "rubber",
	"metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "rubber",
    "iron",
}

--- Event For Getting Recyclable Material----

RegisterServerEvent("jim-recycle:getrecyclablematerial")
AddEventHandler("jim-recycle:getrecyclablematerial", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = math.random(1, 5)
    Player.Functions.AddItem("recyclablematerial", amount, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'add', amount)
    Citizen.Wait(500)
	TriggerEvent("qb-log:server:CreateLog", "jobspam", "JIM RECYCLE", "red", "**" .. src .. "** Added 1 Recycle Boxes")
end)

----------------------------------------------------------------------------------------------------

---- Trade Event Starts Over Here ------

RegisterServerEvent("jim-recycle:TradeItems")
AddEventHandler("jim-recycle:TradeItems", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randItem = ""
	local amount = 0
	if data == 1 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 10 then
			Player.Functions.RemoveItem("recyclablematerial", 10)
			TriggerEvent("qb-log:server:CreateLog", "jobitemremoved", "JIM RECYCLE", "yellow", "**" .. src .. "** Removed 10 Recycle Boxes")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 10)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
            randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.tenmin, Config.tenmax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			else
				TriggerClientEvent('QBCore:Notify', src, "You Don't Have Enough Items")
			end
	elseif data == 2 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 100 then
			Player.Functions.RemoveItem("recyclablematerial", "100")
			TriggerEvent("qb-log:server:CreateLog", "jobitemremoved", "JIM RECYCLE", "yellow", "**" .. src .. "** Removed 100 Recycle Boxes")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 100)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax)
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil}) -- 1
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 2
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 3
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 4
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 5
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 6      
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 7
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 8
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 9
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.bulkmin, Config.bulkmax) -- 10
			Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
		else
			TriggerClientEvent('QBCore:Notify', src, "You Do Not Have Enough Items")
		end
    end
end)

---- Trade Event End Over Here ------

RegisterServerEvent("jim-recycle:Selling:All")
AddEventHandler("jim-recycle:Selling:All", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payment = 0
	for k, v in pairs(Config.Prices) do
        if Player.Functions.GetItemByName(v.name) ~= nil then
            copper = Player.Functions.GetItemByName(v.name).amount
            pay = (copper * v.amount)
            Player.Functions.RemoveItem(v.name, copper)
            Player.Functions.AddMoney('cash', pay)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.name], 'remove', copper)
        payment = payment + pay
        end
    end
    Citizen.Wait(500)
	TriggerClientEvent("QBCore:Notify", src, "Total: $"..payment, 'success')
end)

RegisterNetEvent("jim-recycle:Selling:Mat")
AddEventHandler("jim-recycle:Selling:Mat", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName(data) ~= nil then
        local amount = Player.Functions.GetItemByName(data).amount
        local pay = (amount * Config.Prices[data].amount)
        Player.Functions.RemoveItem(data, amount)
        Player.Functions.AddMoney('cash', pay)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data], 'remove', amount)
        TriggerClientEvent("QBCore:Notify", src, "Payment received", "Total: $"..pay, "error")
		TriggerEvent("qb-log:server:CreateLog", "jobmoneygiven", "JIM RECYCLE", "blue", "**" .. src .. "** ADDED CASH" .. pay .. "")
    else
        TriggerClientEvent("QBCore:Notify", src, "You don't have any "..QBCore.Shared.Items[data].label.. "", "error")
    end
    Citizen.Wait(1000)
end)


RegisterServerEvent('jim-recycle:Dumpsters:Reward')
AddEventHandler('jim-recycle:Dumpsters:Reward', function(listKey)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
        for i = 1, math.random(1, 1), 1 do
			local luck = math.random(1,100)
			if luck > 65 then
            local item = Config.DumpItems[math.random(1, #Config.DumpItems)]
            local amount = math.random(1, 1)
            Player.Functions.AddItem(item, amount, false, {["quality"] = nil})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
            Citizen.Wait(500)
			TriggerEvent("qb-log:server:CreateLog", "dumpster", "JIM RECYCLE", "red", "**" .. src .. "** ADDED " .. amount .. "" .. item .. "")
			else
				TriggerClientEvent("QBCore:Notify", src, "You found Nothing!", "error")
			end
        end
       --[[ local Luck = math.random(1, 100)
        local Odd = math.random(1, 100)
        if Luck == Odd then
        local random = math.random(1, 1) 
            Player.Functions.AddItem("male_seed", random, false, {["quality"] = nil})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["male_seed"], 'add', random)
        end
		local Luck = math.random(1, 100)
        local Odd = math.random(1, 100)
        if Luck == Odd then
        local random = math.random(1, 1) 
            Player.Functions.AddItem("female_seed", random, false, {["quality"] = nil})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["female_seed"], 'add', random)
        end
		local Luck = math.random(1, 45)
        local Odd = math.random(1, 45)
        if Luck == Odd then
        local random = math.random(1, 1) 
            Player.Functions.AddItem("phone"ss, random, false, {["quality"] = nil})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["phone"], 'add', random)
        end]]
		local Luck = math.random(1, 4000)
        local Odd = math.random(1, 4000)
        if Luck == Odd then
        local random = math.random(1, 2) 
            Player.Functions.AddItem("joint", random, false, {["quality"] = nil})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["joint"], 'add', random)
			TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "black", "**" .. src .. "** ADDED Joint" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
        end
		local Luck = math.random(1, 10000)
        local Odd = math.random(1, 10000)
        if Luck == Odd then
        local random = math.random(1, 1) 
            Player.Functions.AddItem("weapon_pistol", random, false, {["quality"] = 5})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_pistol"], 'add', random)
			TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "black", "**" .. src .. "** ADDED PISTOL" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
        end
		local Luck = math.random(1, 40000)
        local Odd = math.random(1, 40000)
        if Luck == Odd then
        local random = math.random(1, 1) 
            Player.Functions.AddItem("methkey", random, false, {["quality"] = nil})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["methkey"], 'add', random)
			TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "black", "**" .. src .. "** ADDED methkey" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
        end
		local Luck = math.random(1, 200000)
        local Odd = math.random(1, 200000)
        if Luck == Odd then
        local random = math.random(1, 1) 
            Player.Functions.AddItem("weapon_microsmg2", random, false, {["quality"] = 5})
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_microsmg2"], 'add', random)
			TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "orange", "**" .. src .. "** ADDED weapon_microsmg2" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
        end









end)

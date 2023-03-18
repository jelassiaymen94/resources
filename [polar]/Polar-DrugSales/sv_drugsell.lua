local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('Polar-Drugsales:Server:GetCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if (v.PlayerData.job.name == "police" or v.PlayerData.job.name == "bcso") and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

RegisterNetEvent('Polar-Drugsales:initiatedrug', function(ZoneDrug)	
	local luck = math.random(1,100)

	if luck < 50 then
	local penis = math.random(1,100)	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then		
		local price = ZoneDrug.price + penis			
		if Player.Functions.GetItemByName(tostring(ZoneDrug.item)) then		
			if Player.Functions.RemoveItem(tostring(ZoneDrug.item), 1) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(ZoneDrug.item)], "remove", 1)				
				Player.Functions.AddMoney("cash", price)
				TriggerEvent("qb-log:Server:CreateLog", "drugsale", "POLAR DRUGSALE", "black", "**" .. src .. "** Got " .. price .. " for selling " .. ZoneDrug.item .. " 1")
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You recieved $'..price)
				if Config.Debug then print('You got 1 '..ZoneDrug.item..' for $'..price) end
			else				
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You could not sell your '..ZoneDrug.item..'!')
			end
		else
			TriggerClientEvent('Polar-Drugsales:notify', src, 'You do not have any '..ZoneDrug.item..' to sell!')
		end		
	end
elseif luck < 75 then
	local penis = math.random(1,100)	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then		
		local two = ZoneDrug.price + ZoneDrug.price
		local price = two + penis			
		if Player.Functions.GetItemByName(tostring(ZoneDrug.item), 2) then		
			if Player.Functions.RemoveItem(tostring(ZoneDrug.item), 2) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(ZoneDrug.item)], "remove", 2)				
				Player.Functions.AddMoney("cash", price)
				TriggerEvent("qb-log:Server:CreateLog", "drugsale", "POLAR DRUGSALE", "black", "**" .. src .. "** Got " .. price .. " for selling " .. ZoneDrug.item .. " 2")
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You recieved $'..price)
				if Config.Debug then print('You got 2 '..ZoneDrug.item..' for $'..price) end
				local math = math.random(1,100)
				if math < 15 then
					
    				Player.Functions.AddItem('drugbag', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drugbag'], 'add', 1)
					log()

				end
			else				
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You could not sell your '..ZoneDrug.item..'!')
			end
		else
			TriggerClientEvent('Polar-Drugsales:notify', src, 'You do not have any '..ZoneDrug.item..' to sell!')
		end		
	end
elseif luck < 90 then
	local penis = math.random(1,100)	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then		
		local three = ZoneDrug.price + ZoneDrug.price  + ZoneDrug.price
		local price = three + penis			
		if Player.Functions.GetItemByName(tostring(ZoneDrug.item), 3) then		
			if Player.Functions.RemoveItem(tostring(ZoneDrug.item), 3) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(ZoneDrug.item)], "remove", 3)				
				Player.Functions.AddMoney("cash", price)
				TriggerEvent("qb-log:Server:CreateLog", "drugsale", "POLAR DRUGSALE", "black", "**" .. src .. "** Got " .. price .. " for selling " .. ZoneDrug.item .. " 3")
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You recieved $'..price)
				if Config.Debug then print('You got 3 '..ZoneDrug.item..' for $'..price) end
				local math = math.random(1,100)
				if math < 15 then
					
    				Player.Functions.AddItem('drugbag', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drugbag'], 'add', 1)
					log()

				end
			else				
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You could not sell your '..ZoneDrug.item..'!')
			end
		else
			TriggerClientEvent('Polar-Drugsales:notify', src, 'You do not have any '..ZoneDrug.item..' to sell!')
		end		
	end
elseif luck < 95 then
	local penis = math.random(1,100)	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then		
		local three = ZoneDrug.price + ZoneDrug.price  + ZoneDrug.price  + ZoneDrug.price
		local price = three + penis			
		if Player.Functions.GetItemByName(tostring(ZoneDrug.item), 4) then		
			if Player.Functions.RemoveItem(tostring(ZoneDrug.item), 4) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(ZoneDrug.item)], "remove", 4)				
				Player.Functions.AddMoney("cash", price)
				TriggerEvent("qb-log:Server:CreateLog", "drugsale", "POLAR DRUGSALE", "black", "**" .. src .. "** Got " .. price .. " for selling " .. ZoneDrug.item .. " 4")
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You recieved $'..price)
				if Config.Debug then print('You got 4 '..ZoneDrug.item..' for $'..price) end
				local math = math.random(1,100)
				if math < 15 then
					
    				Player.Functions.AddItem('drugbag', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drugbag'], 'add', 1)
					log()

				end
			else				
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You could not sell your '..ZoneDrug.item..'!')
			end
		else
			TriggerClientEvent('Polar-Drugsales:notify', src, 'You do not have any '..ZoneDrug.item..' to sell!')
		end		
	end
elseif luck < 101 then
	local penis = math.random(1,100)	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then		
		local three = ZoneDrug.price + ZoneDrug.price  + ZoneDrug.price  + ZoneDrug.price + ZoneDrug.price
		local price = three + penis			
		if Player.Functions.GetItemByName(tostring(ZoneDrug.item), 5) then		
			if Player.Functions.RemoveItem(tostring(ZoneDrug.item), 5) then
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(ZoneDrug.item)], "remove", 5)				
				Player.Functions.AddMoney("cash", price)
				TriggerEvent("qb-log:Server:CreateLog", "drugsale", "POLAR DRUGSALE", "black", "**" .. src .. "** Got " .. price .. " for selling " .. ZoneDrug.item .. " 5")
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You recieved $'..price)
				if Config.Debug then print('You got 5 '..ZoneDrug.item..' for $'..price) end
				local math = math.random(1,100)
				if math < 15 then
					
    				Player.Functions.AddItem('drugbag', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drugbag'], 'add', 1)
					log()

				end
			else				
				TriggerClientEvent('Polar-Drugsales:notify', src, 'You could not sell your '..ZoneDrug.item..'!')
			end
		else
			TriggerClientEvent('Polar-Drugsales:notify', src, 'You do not have any '..ZoneDrug.item..' to sell!')
		end		
	end
   



end
end)

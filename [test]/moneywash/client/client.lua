local QBCore = exports['qb-core']:GetCoreObject()


	CreateThread(function()
		for k, v in pairs(Config.Machines_QBTARGET['Washing Machines']) do
			exports['qb-target']:AddBoxZone("Washer #"..k, v.location, v.depth, v.width, {
				name = "Washer #"..k,
				heading = v.heading,
				debugPoly = false,
				minZ = v.location.z-1,
				maxZ = v.location.z+1,
				}, {
					options = { 
					{
						icon = 'fas fa-sign-in-alt',
						label = 'Wash Money',
						action = function()
							TriggerEvent('moneywash:client:openMoneyWashMenu', "Washer #"..k )
						end,
					}
				},
				distance = 1.5,
			})


			local prop =  CreateObject(GetHashKey("prop_washer_02"), vec3(v.location.x, v.location.y, v.location.z-1), false, false, false) 
			SetEntityHeading(prop, v.heading)
			Wait(50) FreezeEntityPosition(prop, true) 
		end
		
		for k, v in pairs(Config.Machines_QBTARGET['Dryers']) do
			exports['qb-target']:AddBoxZone("Dryer #"..k, v.location, v.depth, v.width, {
				name = "Dryer #"..k,
				heading = v.heading,
				debugPoly = false,
				minZ = v.location.z-1,
				maxZ = v.location.z+1,
				}, {
					options = { 
					{
						icon = 'fas fa-sign-in-alt',
						label = 'Dry Money',
						action = function()
							TriggerEvent('moneywash:client:openDryMoneyMenu', "Dryer #"..k )
						end,
					}
				},
				distance = 2.5,
			})


			local prop =  CreateObject(GetHashKey("bkr_prop_prtmachine_dryer_spin"), vec3(v.location.x, v.location.y, v.location.z-1), false, false, false) 
			SetEntityHeading(prop, v.heading)
			Wait(50) FreezeEntityPosition(prop, true) 
		end
	end)


RegisterNetEvent('moneywash:client:openMoneyWashMenu', function(args)
    local Player = QBCore.Functions.GetPlayerData()

	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil
	
	local cangrabmoney = nil
    local canwashmoney = nil

    local AvailableMoney = nil
	local AvailableMoneyText = nil

	local WashMoneyText = nil

    local WashMoneyLocked = true
    local GrabMoneyLocked = true

	local Currently_Washing = false

	local metadata = nil

    QBCore.Functions.TriggerCallback("moneywash:server:GetAvailableMoney", function(result)
        if result ~= nil then
			if result.amount ~= nil then
				if result.time_left == 0 then
					AvailableMoneyText = "Available Cash: $"..result.amount
					AvailableMoney = result.amount
					cangrabmoney = true
					Currently_Washing = true
				else
				
						AvailableMoneyText = "Currently Washing $"..result.amount.."<br><br>Time left: "..result.time_left.." seconds"
					
					AvailableMoney = 0
					cangrabmoney = false
					Currently_Washing = true
				end
				QBCore.Functions.TriggerCallback("moneywash:server:GetWashableItems", function(result)
                    if result ~= nil then
                        canwashmoney = true
                    else
                        canwashmoney = false
                    end
                end)
			end
		else
            QBCore.Functions.TriggerCallback("moneywash:server:GetWashableItems", function(result)
                if result ~= nil then
                    canwashmoney = true
                else
                    canwashmoney = false
                end
            end)
			AvailableMoneyText = "There is no cash in here"
			cangrabmoney = false
		end
	end, args, 'Wash')

    repeat
        Wait(10)
    until (cangrabmoney ~= nil) and (canwashmoney ~= nil)

    if cangrabmoney then
        GrabMoneyLocked = false
    else
        GrabMoneyLocked = true
    end

    if canwashmoney then
		if not Currently_Washing then
			WashMoneyText = "View all Items..."
        	WashMoneyLocked = false
		else
			WashMoneyText = "This machine is already in use..."
			WashMoneyLocked = true
		end
    else
		WashMoneyText = "You don't have any Items..."
        WashMoneyLocked = true
    end

	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end

	
		exports['qb-menu']:openMenu({
			{
				header = args,
				txt = "Experience level: "..level.level,
				isMenuHeader = true, -- Set to true to make a nonclickable title
			},
			{
				header = "Wash",
				isMenuHeader = WashMoneyLocked, -- Set to true to make a nonclickable title
				txt = WashMoneyText,
				params = {
					event = "moneywash:client:openWashableItemsMenu",
					args = {
						machine = args
					}
				}
			},
			{
				header = "Grab",
				isMenuHeader = GrabMoneyLocked, -- Set to true to make a nonclickable title
				txt = AvailableMoneyText,
				params = {
					event = "moneywash:client:GrabWetMoney",
					args = {
						machine = args,
						wetmoney = AvailableMoney
					}
				}
			},
			{
				header = "Close",
				params = {
					event = "qb-menu:closeMenu"
				}
			}
		})
	
end)

RegisterNetEvent('moneywash:client:openWashableItemsMenu', function(args)
	local Player = QBCore.Functions.GetPlayerData()

	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil

	local washable_items = nil

	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end

	QBCore.Functions.TriggerCallback("moneywash:server:GetWashableItems", function(result)
		if result ~= nil then
			washable_items = result
		else
			washable_items = false
		end
	end)

	repeat Wait(10) until washable_items ~= nil
	
		local WashableItemsMenu = {}

		table.insert(WashableItemsMenu, {
			header = "Items",
			txt = "Select an item that you want to wash...<br><br>About "..level.mdr.."% of the money will be destroyed in the process",
			isMenuHeader = true
		})


		for k,v in ipairs(washable_items) do
			local amount = nil

			if Config.Washable_Items[v.name].worth_type == "metadata" then
				amount = "Amount: $"..v.info[Config.Washable_Items[v.name].worth_identifier]
			else
				amount = "Amount: $"..v.amount
			end

			repeat Wait(0) until amount

			table.insert(WashableItemsMenu, {
				header = QBCore.Shared.Items[v.name]['label'],
				txt = amount,
				params = {
					event = "moneywash:client:openWashMoneyMenu",
					args = {
						oldargs = args,
						item = v
					}
				}
			})
		end

		table.insert(WashableItemsMenu, {
			header = "<-- Back",
			txt = "",
			params = {
				event = 'moneywash:client:openMoneyWashMenu',
				args = args
			}
		})

		exports['qb-menu']:openMenu(WashableItemsMenu) 
	
end)

RegisterNetEvent('moneywash:client:openWashMoneyMenu', function(args)
	local Player = QBCore.Functions.GetPlayerData()

	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil

	local value = nil

	if Config.Washable_Items[args.item.name].worth_type == "metadata" then
		value = args.item.info[Config.Washable_Items[args.item.name].worth_identifier]
	else
		value = args.item.amount
	end

	repeat Wait(0) until value

	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end


		exports['qb-menu']:openMenu({
			{
				header = "Wash $"..value,
				isMenuHeader = true, -- Set to true to make a nonclickable title
			},
			{
				header = "Wash",
				txt = "<br>Estimated wash time: "..(value/100 * Config.Wash_Time).." seconds<br><br>Estimated Clean Cash: $"..(value/100)*(100 - level.mdr),
				params = {
					event = "moneywash:client:startMoneyWash",
					args = {
						item = args.item,
						item_worth = (value/100)*(100 - level.mdr),
						washtime = (value/100 * Config.Wash_Time),
						args = args
					}
				}
			},
			{
				header = "<-- Back",
				params = {
					event = "moneywash:client:openWashableItemsMenu",
					args = args.oldargs
				}
			}
		})

end)

RegisterNetEvent('moneywash:client:startMoneyWash', function(args)
	Has_Item = false

	QBCore.Functions.TriggerCallback("moneywash:server:GetWashableItems", function(result)
		if result ~= nil then
			for k,v in pairs(result) do
				if (v.name == args.item.name) and (v.slot == args.item.slot) then
					TriggerServerEvent("moneywash:server:WashMoney", args)
					Has_Item = true
				end
			end
		end
	end)

	Wait(100)
	if not Has_Item then
		QBCore.Functions.Notify('Looks like the item you tried to wash is missing...', 'error', 3000)
	end
end)

RegisterNetEvent('moneywash:client:GrabWetMoney', function(args)
	TriggerServerEvent("moneywash:server:GrabWetMoney", args)
end)

-- Dry money
RegisterNetEvent('moneywash:client:openDryMoneyMenu', function(args)
    local Player = QBCore.Functions.GetPlayerData()

	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil
	
	local cangrabmoney = nil
    local candrymoney = nil

    local AvailableMoney = nil
	local AvailableMoneyText = nil

	local DryMoneyText = nil

    local DryMoneyLocked = true
    local GrabMoneyLocked = true

	local Currently_Drying = false

	local metadata = nil

    QBCore.Functions.TriggerCallback("moneywash:server:GetAvailableMoney", function(result)
        if result ~= nil then
			if result.amount ~= nil then
				if result.time_left == 0 then
					AvailableMoneyText = "Available Cash: $"..result.amount
					AvailableMoney = result.amount
					cangrabmoney = true
					Currently_Drying = true
				else
				
						AvailableMoneyText = "Currently Drying $"..result.amount.."<br><br>Time left: "..result.time_left.." seconds"
					
					AvailableMoney = 0
					cangrabmoney = false
					Currently_Drying = true
				end
				QBCore.Functions.TriggerCallback("moneywash:server:GetDryableItems", function(result)
                    if result ~= nil then
                        candrymoney = true
                    else
                        candrymoney = false
                    end
                end)
			end
		else
            QBCore.Functions.TriggerCallback("moneywash:server:GetDryableItems", function(result)
                if result ~= nil then
                    candrymoney = true
                else
                    candrymoney = false
                end
            end)
			AvailableMoneyText = "There is no available cash in here"
			cangrabmoney = false
		end
	end, args, 'Dry')

    repeat
        Wait(10)
    until (cangrabmoney ~= nil) and (candrymoney ~= nil)

    if cangrabmoney then
        GrabMoneyLocked = false
    else
        GrabMoneyLocked = true
    end

    if candrymoney then
		if not Currently_Drying then
			DryMoneyText = "View all Items..."
        	DryMoneyLocked = false
		else
			DryMoneyText = "This machine is already in use..."
			DryMoneyLocked = true
		end
    else
		if Currently_Drying then
			DryMoneyText = "This machine is already in use..."
			DryMoneyLocked = true
		else
			DryMoneyText = "You don't have any Items..."
        	DryMoneyLocked = true
		end

    end

	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end

	
		exports['qb-menu']:openMenu({
			{
				header = "Dry",
				isMenuHeader = DryMoneyLocked, -- Set to true to make a nonclickable title
				txt = DryMoneyText,
				params = {
					event = "moneywash:client:openDryableItemsMenu",
					args = {
						machine = args
					}
				}
			},
			{
				header = "Grab",
				isMenuHeader = GrabMoneyLocked, -- Set to true to make a nonclickable title
				txt = AvailableMoneyText,
				params = {
					event = "moneywash:client:GrabDryMoney",
					args = {
						machine = args,
						drymoney = AvailableMoney
					}
				}
			},
			{
				header = "Close",
				params = {
					event = "qb-menu:closeMenu"
				}
			}
		})
	
end)

RegisterNetEvent('moneywash:client:openDryableItemsMenu', function(args)
	local Player = QBCore.Functions.GetPlayerData()

	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil

	local dryable_items = nil

	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end

	QBCore.Functions.TriggerCallback("moneywash:server:GetDryableItems", function(result)
		if result ~= nil then
			dryable_items = result
		else
			dryable_items = false
		end
	end)

	repeat Wait(10) until dryable_items ~= nil

	local a, b = nil, nil

	function compare(a,b)
		a = a.info.worth
		b = b.info.worth

		repeat
			
		until (a ~= nil) and (b ~= nil)

		return a > b
	end

	table.sort(dryable_items, compare)


		local DryableItemsMenu = {}

		table.insert(DryableItemsMenu, {
			header = "Items",
			txt = "Select an item that you want to dry...",
			isMenuHeader = true
		})

		for k,v in ipairs(dryable_items) do
			table.insert(DryableItemsMenu, {
				header = QBCore.Shared.Items[v.name]['label'],
				txt = "Amount: $"..v.info.worth,
				params = {
					event = "moneywash:client:openDryMoneyMenu2",
					args = {
						oldargs = args,
						item = v
					}
				}
			})
		end

		table.insert(DryableItemsMenu, {
			header = "<-- Back",
			txt = "",
			params = {
				event = 'moneywash:client:openDryMoneyMenu',
				args = args
			}
		})

		exports['qb-menu']:openMenu(DryableItemsMenu) 

end)

RegisterNetEvent('moneywash:client:openDryMoneyMenu2', function(args)

		exports['qb-menu']:openMenu({
			{
				header = "Dry $"..args.item.info.worth,
				isMenuHeader = true, -- Set to true to make a nonclickable title
			},
			{
				header = "Dry",
				txt = "<br>Estimated dry time: "..(args.item.info.worth/100 * Config.Wash_Time).." seconds".."<br><br>You will receive: $"..args.item.info.worth,
				params = {
					event = "moneywash:client:startDryMoney",
					args = {
						item = args.item,
						item_worth = args.item.info.worth,
						drytime = (args.item.info.worth/100 * Config.Wash_Time),
						args = args
					}
				}
			},
			{
				header = "<-- Back",
				params = {
					event = "moneywash:client:openDryableItemsMenu",
					args = args.oldargs
				}
			}
		})

end)

RegisterNetEvent('moneywash:client:startDryMoney', function(args)
	Has_Item = false

	QBCore.Functions.TriggerCallback("moneywash:server:GetDryableItems", function(result)
		if result ~= nil then
			for k,v in pairs(result) do
				if (v.name == args.item.name) and (v.slot == args.item.slot) and (v.info.worth == args.item.info.worth) then
					TriggerServerEvent("moneywash:server:DryMoney", args)
					Has_Item = true
				end
			end
		end
	end)

	Wait(100)
	if not Has_Item then
		QBCore.Functions.Notify('Looks like the item you tried to dry is missing...', 'error', 3000)
	end
end)

RegisterNetEvent('moneywash:client:GrabDryMoney', function(args)
	TriggerServerEvent("moneywash:server:GrabDryMoney", args)
end)
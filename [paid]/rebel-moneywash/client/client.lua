local QBCore = exports['qb-core']:GetCoreObject()

if Config.UseTarget then
	CreateThread(function()
		for k, v in pairs(Config.Machines_QBTARGET['Washing Machines']) do
			exports['qb-target']:AddBoxZone("Washer #"..k, v.location, v.depth, v.width, {
				name = "Washer #"..k,
				heading = v.heading,
				debugPoly = false,
				minZ = v.minZ,
				maxZ = v.maxZ,
				}, {
					options = { 
					{
						icon = 'fas fa-sign-in-alt',
						label = 'Wash Money',
						action = function()
							TriggerEvent('rebel-moneywash:client:openMoneyWashMenu', "Washer #"..k )
						end,
					}
				},
				distance = 1.5,
			})
		end
		
		for k, v in pairs(Config.Machines_QBTARGET['Dryers']) do
			exports['qb-target']:AddBoxZone("Dryer #"..k, v.location, v.depth, v.width, {
				name = "Dryer #"..k,
				heading = v.heading,
				debugPoly = false,
				minZ = v.minZ,
				maxZ = v.maxZ,
				}, {
					options = { 
					{
						icon = 'fas fa-sign-in-alt',
						label = 'Dry Money',
						action = function()
							TriggerEvent('rebel-moneywash:client:openDryMoneyMenu', "Dryer #"..k )
						end,
					}
				},
				distance = 1.5,
			})
		end
	end)
else
	local closest_machine = nil
	local closest_type = nil

	CreateThread(function()
		while true do
			local close = false
			local PlayerCoords = GetEntityCoords(PlayerPedId())

			for k, v in pairs(Config.Machines['Washing Machines']) do
				if #(PlayerCoords - v) <= 0.4 then
					close = true
					closest_machine = "Washer #"..k
					closest_type = "Washer"
				end
			end

			for k, v in pairs(Config.Machines['Dryers']) do
				if #(PlayerCoords - v) <= 0.3 then
					close = true
					closest_machine = "Dryer #"..k
					closest_type = "Dryer"
				end
			end

			if not close then
				closest_machine = nil
				closest_type = nil
			end

			Wait(400)
		end
	end)

	CreateThread(function()
		local HasShownText
		while true do
			local WaitTime = 400

			if closest_machine then
				WaitTime = 0
				if not HasShownText then 
					HasShownText = true 
					if Config.DrawText == "qb" then
						exports['qb-core']:DrawText("[E] - Open") 
					else
						lib.showTextUI('[E] - Open')
					end
				end
				if IsControlJustPressed(0, 38) then
					if closest_type == "Washer" then
						TriggerEvent('rebel-moneywash:client:openMoneyWashMenu', closest_machine)
					else
						TriggerEvent('rebel-moneywash:client:openDryMoneyMenu', closest_machine)
					end
				end
			else
				if HasShownText then 
					HasShownText = false 
					if Config.DrawText == "qb" then
						exports['qb-core']:HideText() 
					else
						lib.hideTextUI()
					end
				end
			end

			Wait(WaitTime)
		end
	end)
end

RegisterNetEvent('rebel-moneywash:client:openMoneyWashMenu', function(args)
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

    QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetAvailableMoney", function(result)
        if result ~= nil then
			if result.amount ~= nil then
				if result.time_left == 0 then
					AvailableMoneyText = "Available Cash: $"..result.amount
					AvailableMoney = result.amount
					cangrabmoney = true
					Currently_Washing = true
				else
					if Config.Menu == "qb-menu" then
						AvailableMoneyText = "Currently Washing $"..result.amount.."<br><br>Time left: "..result.time_left.." seconds"
					else
						AvailableMoneyText = "Currently Washing $"..result.amount
						metadata = {
							["Time Left"] = result.time_left.." seconds"
						}
					end
					AvailableMoney = 0
					cangrabmoney = false
					Currently_Washing = true
				end
				QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetWashableItems", function(result)
                    if result ~= nil then
                        canwashmoney = true
                    else
                        canwashmoney = false
                    end
                end)
			end
		else
            QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetWashableItems", function(result)
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

	if Config.Menu == "qb-menu" then
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
					event = "rebel-moneywash:client:openWashableItemsMenu",
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
					event = "rebel-moneywash:client:GrabWetMoney",
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
	else
		local moneywashmenu = {}
        
		moneywashmenu[#moneywashmenu + 1] = {
			title = "Experience level: "..level.level,
		}

		if not WashMoneyLocked then
			moneywashmenu[#moneywashmenu + 1] = {
				title = 'Wash',
				description = WashMoneyText,
				arrow = true,
				event = 'rebel-moneywash:client:openWashableItemsMenu',
				args = {
					machine = args
				}
			}
		else
			moneywashmenu[#moneywashmenu + 1] = {
				title = 'Wash',
				description = WashMoneyText
			}
		end

		if not GrabMoneyLocked then
			moneywashmenu[#moneywashmenu + 1] = {
				title = 'Grab',
				description = AvailableMoneyText,
				metadata = metadata,
				arrow = true,
				event = "rebel-moneywash:client:GrabWetMoney",
				args = {
					machine = args,
					wetmoney = AvailableMoney
				}
			}
		else
			moneywashmenu[#moneywashmenu + 1] = {
				title = 'Grab',
				description = AvailableMoneyText,
				metadata = metadata,
			}

			if Currently_Washing then
				moneywashmenu[#moneywashmenu + 1] = {
					title = 'Refresh',
					description = "Refresh Timer...",
					arrow = false,
					event = "rebel-moneywash:client:openMoneyWashMenu",
					args = args
				}
			end
		end

		lib.registerContext({
			id = 'moneywashmenu1',
			title = args,
			onExit = function()
				
			end,
			options = moneywashmenu
		})

		lib.showContext('moneywashmenu1')	
	end
end)

RegisterNetEvent('rebel-moneywash:client:openWashableItemsMenu', function(args)
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

	QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetWashableItems", function(result)
		if result ~= nil then
			washable_items = result
		else
			washable_items = false
		end
	end)

	repeat Wait(10) until washable_items ~= nil

	--local a, b = nil, nil

	--function compare(a,b)
		--a = a.info[Config.Washable_Items[a.name]]
		--b = b.info[Config.Washable_Items[b.name]]

		--repeat
			
		--until (a ~= nil) and (b ~= nil)

		--return a > b
	--end

	--table.sort(washable_items, compare)

	if Config.Menu == "qb-menu" then
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
					event = "rebel-moneywash:client:openWashMoneyMenu",
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
				event = 'rebel-moneywash:client:openMoneyWashMenu',
				args = args
			}
		})

		exports['qb-menu']:openMenu(WashableItemsMenu) 
	else
		local moneywashmenu = {}
        
		moneywashmenu[#moneywashmenu + 1] = {
			title = "Select an item that you want to wash, About "..level.mdr.."% of the money will be destroyed in the process",
		}

		for k,v in ipairs(washable_items) do
			local amount = nil

			if Config.Washable_Items[v.name].worth_type == "metadata" then
				amount = "Amount: $"..v.info[Config.Washable_Items[v.name].worth_identifier]
			else
				amount = "Amount: $"..v.amount
			end

			repeat Wait(0) until amount

			moneywashmenu[#moneywashmenu + 1] = {
				title = QBCore.Shared.Items[v.name]['label'],
				description = amount,
				arrow = false,
				event = "rebel-moneywash:client:openWashMoneyMenu",
				args = {
					oldargs = args,
					item = v
				}
			}
		end

		lib.registerContext({
			id = 'moneywashmenu2',
			menu = 'moneywashmenu1',
			title = "Items",
			onExit = function()
				
			end,
			options = moneywashmenu
		})

		lib.showContext('moneywashmenu2')
	end
end)

RegisterNetEvent('rebel-moneywash:client:openWashMoneyMenu', function(args)
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

	if Config.Menu == "qb-menu" then
		exports['qb-menu']:openMenu({
			{
				header = "Wash $"..value,
				isMenuHeader = true, -- Set to true to make a nonclickable title
			},
			{
				header = "Wash",
				txt = "<br>Estimated wash time: "..(value/100 * Config.Wash_Time).." seconds<br><br>Estimated Clean Cash: $"..(value/100)*(100 - level.mdr),
				params = {
					event = "rebel-moneywash:client:startMoneyWash",
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
					event = "rebel-moneywash:client:openWashableItemsMenu",
					args = args.oldargs
				}
			}
		})
	else
		local moneywashmenu = {}
        
		moneywashmenu[#moneywashmenu + 1] = {
			title = "Wash $"..value,
			description = "Hover to see information...",
			metadata = {
				["Wash Time"] = (value/100 * Config.Wash_Time).." Seconds",
				["Estimated Clean Cash"] = "$"..(value/100)*(100 - level.mdr)
			},
			event = "rebel-moneywash:client:startMoneyWash",
			args = {
				item = args.item,
				item_worth = (value/100)*(100 - level.mdr),
				washtime = (value/100 * Config.Wash_Time),
				args = args
			}
		}

		lib.registerContext({
			id = 'moneywashmenu3',
			menu = 'moneywashmenu2',
			title = "Wash $"..value,
			onExit = function()
				
			end,
			options = moneywashmenu
		})

		lib.showContext('moneywashmenu3')
	end
end)

RegisterNetEvent('rebel-moneywash:client:startMoneyWash', function(args)
	Has_Item = false

	QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetWashableItems", function(result)
		if result ~= nil then
			for k,v in pairs(result) do
				if (v.name == args.item.name) and (v.slot == args.item.slot) then
					TriggerServerEvent("rebel-moneywash:server:WashMoney", args)
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

RegisterNetEvent('rebel-moneywash:client:GrabWetMoney', function(args)
	TriggerServerEvent("rebel-moneywash:server:GrabWetMoney", args)
end)

-- Dry money
RegisterNetEvent('rebel-moneywash:client:openDryMoneyMenu', function(args)
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

    QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetAvailableMoney", function(result)
        if result ~= nil then
			if result.amount ~= nil then
				if result.time_left == 0 then
					AvailableMoneyText = "Available Cash: $"..result.amount
					AvailableMoney = result.amount
					cangrabmoney = true
					Currently_Drying = true
				else
					if Config.Menu == "qb-menu" then
						AvailableMoneyText = "Currently Drying $"..result.amount.."<br><br>Time left: "..result.time_left.." seconds"
					else
						AvailableMoneyText = "Currently Drying $"..result.amount
						metadata = {
							["Time Left"] = result.time_left.." seconds"
						}
					end
					AvailableMoney = 0
					cangrabmoney = false
					Currently_Drying = true
				end
				QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetDryableItems", function(result)
                    if result ~= nil then
                        candrymoney = true
                    else
                        candrymoney = false
                    end
                end)
			end
		else
            QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetDryableItems", function(result)
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

	if Config.Menu == "qb-menu" then
		exports['qb-menu']:openMenu({
			{
				header = "Dry",
				isMenuHeader = DryMoneyLocked, -- Set to true to make a nonclickable title
				txt = DryMoneyText,
				params = {
					event = "rebel-moneywash:client:openDryableItemsMenu",
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
					event = "rebel-moneywash:client:GrabDryMoney",
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
	else
		local moneywashmenu = {}
        
		moneywashmenu[#moneywashmenu + 1] = {
			title = "Experience level: "..level.level
		}

		if not DryMoneyLocked then
			moneywashmenu[#moneywashmenu + 1] = {
				title = "Dry Money",
				description = DryMoneyText,
				event = "rebel-moneywash:client:openDryableItemsMenu",
				args = {
					machine = args
				}
			}
		else
			moneywashmenu[#moneywashmenu + 1] = {
				title = "Dry Money",
				description = DryMoneyText
			}
		end

		if not GrabMoneyLocked then
			moneywashmenu[#moneywashmenu + 1] = {
				title = 'Grab',
				description = AvailableMoneyText,
				metadata = metadata,
				arrow = true,
				event = "rebel-moneywash:client:GrabDryMoney",
				args = {
					machine = args,
					drymoney = AvailableMoney
				}
			}
		else
			moneywashmenu[#moneywashmenu + 1] = {
				title = 'Grab',
				description = AvailableMoneyText,
				metadata = metadata,
			}

			if Currently_Drying then
				moneywashmenu[#moneywashmenu + 1] = {
					title = 'Refresh',
					description = "Refresh Timer...",
					arrow = false,
					event = "rebel-moneywash:client:openDryMoneyMenu",
					args = args
				}
			end
		end

		lib.registerContext({
			id = 'moneydrymenu1',
			title = args,
			onExit = function()
				
			end,
			options = moneywashmenu
		})

		lib.showContext('moneydrymenu1')	
	end
end)

RegisterNetEvent('rebel-moneywash:client:openDryableItemsMenu', function(args)
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

	QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetDryableItems", function(result)
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

	if Config.Menu == "qb-menu" then
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
					event = "rebel-moneywash:client:openDryMoneyMenu2",
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
				event = 'rebel-moneywash:client:openDryMoneyMenu',
				args = args
			}
		})

		exports['qb-menu']:openMenu(DryableItemsMenu) 
	else
		local moneywashmenu = {}
        
		moneywashmenu[#moneywashmenu + 1] = {
			title = "Select an item that you want to dry..."
		}

		for k,v in ipairs(dryable_items) do
			moneywashmenu[#moneywashmenu + 1] = {
				title = QBCore.Shared.Items[v.name]['label'],
				description = "Amount: $"..v.info.worth,
				event = "rebel-moneywash:client:openDryMoneyMenu2",
				args = {
					oldargs = args,
					item = v
				}
			}
		end

		lib.registerContext({
			id = 'moneydrymenu2',
			menu = "moneydrymenu1",
			title = "Items",
			onExit = function()
				
			end,
			options = moneywashmenu
		})

		lib.showContext('moneydrymenu2')	
	end
end)

RegisterNetEvent('rebel-moneywash:client:openDryMoneyMenu2', function(args)
	if Config.Menu == "qb-menu" then
		exports['qb-menu']:openMenu({
			{
				header = "Dry $"..args.item.info.worth,
				isMenuHeader = true, -- Set to true to make a nonclickable title
			},
			{
				header = "Dry",
				txt = "<br>Estimated dry time: "..(args.item.info.worth/100 * Config.Wash_Time).." seconds".."<br><br>You will receive: $"..args.item.info.worth,
				params = {
					event = "rebel-moneywash:client:startDryMoney",
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
					event = "rebel-moneywash:client:openDryableItemsMenu",
					args = args.oldargs
				}
			}
		})
	else
		local moneywashmenu = {}

		moneywashmenu[#moneywashmenu + 1] = {
			title = "Dry $"..args.item.info.worth,
			description = "Estimated Time: "..(args.item.info.worth/100 * Config.Wash_Time).." seconds",
			event = "rebel-moneywash:client:startDryMoney",
			args = {
				item = args.item,
				item_worth = args.item.info.worth,
				drytime = (args.item.info.worth/100 * Config.Wash_Time),
				args = args
			}
		}

		lib.registerContext({
			id = 'moneydrymenu3',
			menu = "moneydrymenu2",
			title = "Dry $"..args.item.info.worth,
			onExit = function()
				
			end,
			options = moneywashmenu
		})

		lib.showContext('moneydrymenu3')	
	end
end)

RegisterNetEvent('rebel-moneywash:client:startDryMoney', function(args)
	Has_Item = false

	QBCore.Functions.TriggerCallback("rebel-moneywash:server:GetDryableItems", function(result)
		if result ~= nil then
			for k,v in pairs(result) do
				if (v.name == args.item.name) and (v.slot == args.item.slot) and (v.info.worth == args.item.info.worth) then
					TriggerServerEvent("rebel-moneywash:server:DryMoney", args)
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

RegisterNetEvent('rebel-moneywash:client:GrabDryMoney', function(args)
	TriggerServerEvent("rebel-moneywash:server:GrabDryMoney", args)
end)
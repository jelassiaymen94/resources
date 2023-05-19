local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

PlayerJob = {}
local Targets = {}
local Blips = {}
local onDuty = false
local alcoholCount = 0

local function jobCheck()
	canDo = true
	if not onDuty then triggerNotify(nil, Loc[Config.Lan].error["not_clockin"], 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "catcafe" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerData.job.name == "catcafe" then onDuty = PlayerJob.onduty end end)
end)

CreateThread(function()
	local bossroles = {}
	for k, v in pairs(QBCore.Shared.Jobs["catcafe"].grades) do
		if QBCore.Shared.Jobs["catcafe"].grades[k].isboss == true then
			if bossroles["catcafe"] then
				if bossroles["catcafe"] > tonumber(k) then bossroles["catcafe"] = tonumber(k) end
			else bossroles["catcafe"] = tonumber(k)	end
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "catcafe" then TriggerServerEvent("QBCore:ToggleDuty") end end)

			Blips[#Blips+1] = makeBlip({coords = v.blip, sprite = 621, col = v.blipcolor, scale = 0.6, disp = 6, name = v.label})
		end
	end
	--Stashes
	Targets["CatPrepared"] =
	exports['qb-target']:AddBoxZone("CatPrepared", vector3(-587.4, -1059.6, 23.45), 2.0, 2.5, { name="CatPrepared", heading = 270.0, debugPoly=Config.Debug, minZ=21.45, maxZ=23.45 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["food"], job = "catcafe", stash = "Shelf", coords = vector3(-587.4, -1059.6, 23.45), }, },  distance = 2.0 })
	--FRIDGE
	Targets["CatFridge"] =
	exports['qb-target']:AddBoxZone("CatFridge", vector3(-588.06, -1067.1, 22.34), 3.5, 1.0, { name="CatFridge", heading = 0, debugPoly=Config.Debug, minZ=19.84, maxZ=23.84 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-temperature-low", label = Loc[Config.Lan].target["fridge"], stash = "Fridge", job = "catcafe", coords = vector3(-588.06, -1067.1, 22.34), }, }, distance = 1.0 })
	Targets["CatFridge2"] =
	exports['qb-target']:AddBoxZone("CatFridge2", vector3(-590.67, -1068.1, 22.34), 2.0, 0.6, { name="CatFridge2", heading = 0, debugPoly=Config.Debug, minZ=19.84, maxZ=23.84 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-temperature-low", label = Loc[Config.Lan].target["fridge"], stash = "Fridge2", job = "catcafe", coords = vector3(-590.67, -1068.1, 22.34), }, }, distance = 1.0 })
	--WARESTORAGE
	Targets["CatStorage"] =
	exports['qb-target']:AddBoxZone("CatStorage", vector3(-598.0, -1068.47, 22.34), 4.0, 1.5, { name="CatStorage", heading = 90, debugPoly=Config.Debug, minZ=20.94, maxZ=24.94 },
		{ options = { {  event = "jim-catcafe:Shop", icon = "fas fa-box-open", label = Loc[Config.Lan].target["store"], job = "catcafe", coords = vector3(-598.0, -1068.47, 22.34), }, }, distance = 2.0 })
	Targets["CatStorage2"] =
	exports['qb-target']:AddBoxZone("CatStorage2", vector3(-598.25, -1065.61, 22.34), 4.0, 1.5, { name="CatStorage2", heading = 90, debugPoly=Config.Debug, minZ=20.94, maxZ=24.94 },
		{ options = { {  event = "jim-catcafe:Shop", icon = "fas fa-box-open", label = Loc[Config.Lan].target["store"], job = "catcafe", coords = vector3(-598.25, -1065.61, 22.34), }, }, distance = 2.0 })
	Targets["CatStorage3"] =
	exports['qb-target']:AddBoxZone("CatStorage3", vector3(-598.31, -1062.79, 22.34), 4.0, 1.5, { name="CatStorage3", heading = 90, debugPoly=Config.Debug, minZ=20.94, maxZ=24.94 },
		{ options = { {  event = "jim-catcafe:Shop", icon = "fas fa-box-open", label = Loc[Config.Lan].target["store"], job = "catcafe", coords = vector3(-598.31, -1062.79, 22.34), }, }, distance = 2.0 })
	--Sinks
	Targets["CatWash1"] =
	exports['qb-target']:AddBoxZone("CatWash1", vector3(-587.89, -1062.58, 22.36), 0.7, 0.7, { name="CatWash1", heading = 0, debugPoly=Config.Debug, minZ=19.11, maxZ=23.11 },
		{ options = { { event = "jim-catcafe:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], coords = vector3(-587.89, -1062.58, 22.36), }, }, distance = 1.5	})
	Targets["CatWash2"] =
	exports['qb-target']:AddBoxZone("CatWash2", vector3(-570.23, -1051.41, 22.34), 0.5, 0.5, { name="CatWash2", heading = 0, debugPoly=Config.Debug, minZ=21.74, maxZ=22.94, },
		{ options = { { event = "jim-catcafe:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], coords = vector3(-570.23, -1051.41, 22.34), }, }, distance = 1.2	})
	Targets["CatWash3"] =
	exports['qb-target']:AddBoxZone("CatWash3", vector3(-570.25, -1056.98, 22.34), 0.5, 0.5, { name="CatWash3", heading = 0, debugPoly=Config.Debug, minZ=21.74, maxZ=22.94, },
		{ options = { { event = "jim-catcafe:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], coords = vector3(-570.25, -1056.98, 22.34), }, }, distance = 1.2 })
	--Oven
	Targets["CatOven"] =
	exports['qb-target']:AddBoxZone("CatOven", vector3(-590.66, -1059.13, 22.34), 2.5, 0.6, { name="CatOven", heading = 0, debugPoly=Config.Debug, minZ = 19.84, maxZ = 23.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].target["oven"], job = "catcafe", craftable = Crafting.Oven, header = Loc[Config.Lan].menu["header_oven"], coords = vector3(-590.66, -1059.13, 22.34), }, }, distance = 2.0 })
	--Hob
	Targets["CatHob"] = 
	exports['qb-target']:AddBoxZone("CatHob", vector3(-591.02, -1056.56, 22.36), 1.5, 0.6, { name="CatHob", heading = 0, debugPoly=Config.Debug, minZ = 19.84, maxZ = 23.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].target["hob"], job = "catcafe", craftable = Crafting.Hob, header = Loc[Config.Lan].menu["header_hob"], coords = vector3(-591.02, -1056.56, 22.36), }, }, distance = 2.0 })

	--Pizza
	Targets["sauce"] =
	exports['qb-target']:AddBoxZone("sauce", vector3(808.1979, -759.9563, 26.7809), 1.5, 0.6, { name="sauce", heading = 0, debugPoly=Config.Debug, minZ = 25.84, maxZ = 27.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Sauce Station" --[[Loc[Config.Lan].target["pizza"] ]], job = "pizzathis", craftable = Crafting.Sauce, header = "Mama Mia!"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(808.1979, -759.9563, 26.7809), }, }, distance = 2.0 })

	Targets["grill"] =
	exports['qb-target']:AddBoxZone("grill", vector3(808.5739, -762.13050, 26.6809), 1.5, 0.6, { name="grill", heading = 0, debugPoly=Config.Debug, minZ = 25.84, maxZ = 27.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Grill Station" --[[Loc[Config.Lan].target["pizza"] ]], job = "pizzathis", craftable = Crafting.Grill, header = "Mama Mia!"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(808.5739, -762.13050, 26.6809), }, }, distance = 2.0 })

	Targets["fryer"] =
	exports['qb-target']:AddBoxZone("fryer", vector3(808.2826, -761.01, 26.6809), 1.5, 0.6, { name="fryer", heading = 0, debugPoly=Config.Debug, minZ = 25.84, maxZ = 27.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Fry Station" --[[Loc[Config.Lan].target["pizza"] ]], job = "pizzathis", craftable = Crafting.Fryer, header = "Mama Mia!"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(808.2826, -761.01, 26.6809), }, }, distance = 2.0 })

	Targets["dough"] =
	exports['qb-target']:AddBoxZone("dough", vector3(807.1060, -756.890, 26.4809), 1.5, 0.6, { name="dough", heading = 0, debugPoly=Config.Debug, minZ = 25.84, maxZ = 27.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Dough Station" --[[Loc[Config.Lan].target["pizza"] ]], job = "pizzathis", craftable = Crafting.Dough, header = "Mama Mia!"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(807.1060, -756.890, 26.4809), }, }, distance = 2.0 })

	Targets["prep"] =
	exports['qb-target']:AddBoxZone("prep", vector3(811.4525, -754.5694, 26.7808), 1.5, 0.6, { name="prep", heading = 0, debugPoly=Config.Debug, minZ = 25.84, maxZ = 27.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Prep Station" --[[Loc[Config.Lan].target["pizza"] ]], job = "pizzathis", craftable = Crafting.Prep, header = "Mama Mia!"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(811.4525, -754.5694, 26.7808), }, }, distance = 2.0 })
	
	Targets["oven"] =
	exports['qb-target']:AddBoxZone("oven", vector3(813.6337, -752.9069, 26.9808), 1.5, 0.6, { name="oven", heading = 0, debugPoly=Config.Debug, minZ = 25.84, maxZ = 27.84, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Pizza Oven" --[[Loc[Config.Lan].target["pizza"] ]], job = "pizzathis", craftable = Crafting.PizzaOven, header = "Mama Mia!"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(813.6337, -752.9069, 26.9808), }, }, distance = 2.0 })


	--VU
	Targets["vu"] =
	exports['qb-target']:AddBoxZone("vu", vector3(129.3, -1279.3, 29.5), 1.5, 0.6, { name="vu", heading = 0, debugPoly=Config.Debug, minZ = 28.184, maxZ = 30.184, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-temperature-high", label = "Kebab Station" --[[Loc[Config.Lan].target["pizza"] ]], job = "vu", craftable = Crafting.Kebab, header = "Kebab Station"--[[Loc[Config.Lan].menu["header_pizza"] ]], coords = vector3(129.3, -1279.3, 29.), }, }, distance = 2.0 })

	--Trays
	Targets["CatCounter"] =
	exports['qb-target']:AddBoxZone("CatCounter", vector3(-584.01, -1059.27, 22.34), 0.6, 1.0, { name="CatCounter", heading = 0, debugPoly=Config.Debug, minZ=22.0, maxZ=23.04 },
		{ options = { { event = "jim-catcafe:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter", coords = vector3(-584.01, -1059.27, 22.34), }, }, distance = 2.0	})
	Targets["CatCounter2"] =
	exports['qb-target']:AddBoxZone("CatCounter2", vector3(-584.04, -1062.05, 22.34), 0.6, 1.0, { name="CatCounter2", heading = 0, debugPoly=Config.Debug, minZ=22.0, maxZ=23.04 },
		{ options = { { event = "jim-catcafe:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter2", coords = vector3(-584.04, -1062.05, 22.34), }, }, distance = 2.0	})
	--Payments
	Targets["CatReceipt1"] =
	exports['qb-target']:AddBoxZone("CatReceipt1", vector3(-584.07, -1058.69, 22.34), 0.5, 1.0, { name="CatReceipt1", heading = 0, debugPoly=Config.Debug, minZ = 22.0, maxZ = 23.04, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = "catcafe", coords = vector3(-584.07, -1058.69, 22.34),
						img = "<center><p><img src=https://i.imgur.com/03eA7N0.png width=100px></p>"
					}, }, distance = 2.0 })
	Targets["CatReceipt2"] =
	exports['qb-target']:AddBoxZone("CatReceipt2", vector3(-584.09, -1061.47, 22.34), 0.5, 1.0, { name="CatReceipt2", heading = 0, debugPoly=Config.Debug, minZ = 22.0, maxZ = 23.04, },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = "catcafe", coords = vector3(-584.09, -1061.47, 22.34),
						img = "<center><p><img src=https://i.imgur.com/03eA7N0.png width=100px></p>"
					}, }, distance = 2.0 })
	--Coffee
	Targets["CatCoffee"] =
	exports['qb-target']:AddBoxZone("CatCoffee", vector3(-586.8, -1061.89, 22.34), 0.7, 0.9, { name="CatCoffee", heading = 0, debugPoly=Config.Debug, minZ=21.99, maxZ=23.19 },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].target["coffee"], job = "catcafe", craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_coffee"], coords = vector3(-586.8, -1061.89, 22.34), }, }, distance = 2.0 })
	--Chopping Board
	Targets["CatBoard"] =
	exports['qb-target']:AddBoxZone("CatBoard", vector3(-590.94, -1063.16, 22.36), 1.5, 0.6, { name="CatBoard", heading = 0, debugPoly=Config.Debug, minZ=18.96, maxZ=22.96, },
		{ options = { { event = "jim-catcafe:Crafting", icon = "fas fa-utensils", label = Loc[Config.Lan].target["food"], job = "catcafe", craftable = Crafting.ChoppingBoard, header = Loc[Config.Lan].menu["header_chop"], coords = vector3(-590.94, -1063.16, 22.36), }, }, distance = 2.0 })
	--Tables
	Targets["CatTable"] =
	exports['qb-target']:AddBoxZone("CatTable", vector3(-573.43, -1059.76, 22.49), 1.9, 1.0, { name="CatTable", heading = 91.0, debugPoly=Config.Debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table_1" }, }, distance = 2.0 })
	Targets["CatTable2"] =
	exports['qb-target']:AddBoxZone("CatTable2", vector3(-573.44, -1063.45, 22.34), 1.9, 1.0, { name="CatTable2", heading = 91.0, debugPoly=Config.Debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table_2" }, }, distance = 2.0 })
	Targets["CatTable3"] =
	exports['qb-target']:AddBoxZone("CatTable3", vector3(-573.41, -1067.09, 22.49), 1.9, 1.0, { name="CatTable3", heading = 91.0, debugPoly=Config.Debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table_3" }, }, distance = 2.0 })
	Targets["CatTable4"] =
	exports['qb-target']:AddBoxZone("CatTable4", vector3(-578.68, -1051.09, 22.35), 1.2, 0.9, { name="CatTable4", heading = 91.0, debugPoly=Config.Debug, minZ=21.49, maxZ=22.89 },
		{ options = { {  event = "jim-catcafe:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table_4" }, }, distance = 2.0 })
	--Clockin
	Targets["CatClockin"] =
	exports['qb-target']:AddBoxZone("CatClockin", vector3(-594.34, -1053.35, 22.34), 3.5, 0.5, { name="CatClockin", heading = 0, debugPoly=Config.Debug, minZ=22.19, maxZ=23.79 },
		{ options = { 	{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].target["duty"], job = "catcafe" },
						{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, },
							}, distance = 2.0 })

	Targets["CatBoss1"] =
	exports['qb-target']:AddBoxZone("CatBoss1", vector3(-596.17, -1052.6, 22.34), 0.6, 0.6, { name="CatBoss1", heading = 0, debugPoly=Config.Debug, minZ=22.19, maxZ=23.79 },
		{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, },
					}, distance = 2.0 })
	Targets["CatBoss2"] =
	exports['qb-target']:AddBoxZone("CatBoss2", vector3(-578.3, -1066.83, 26.61), 0.6, 0.6, { name="CatBoss2", heading = 0, debugPoly=Config.Debug, minZ=26.19, maxZ=27.79 },
		{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, },
					}, distance = 2.0 })
	Targets["CatBoss3"] =
	exports['qb-target']:AddBoxZone("CatBoss3", vector3(-578.15, -1061.35, 26.61), 0.6, 0.6, { name="CatBoss3", heading = 0, debugPoly=Config.Debug, minZ=26.19, maxZ=27.79 },
		{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, },
					}, distance = 2.0 })
end)

RegisterNetEvent('jim-catcafe:washHands', function(data)
	lookEnt(data.coords)
    QBCore.Functions.Progressbar('washing_hands', Loc[Config.Lan].progressbar["progress_washing"], 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		triggerNotify(nil, Loc[Config.Lan].success["washed_hands"], 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		triggerNotify(nil, Loc[Config.Lan].error["cancel"], 'error')
    end, data.icon)
end)

RegisterNetEvent('jim-catcafe:Stash', function(data) lookEnt(data.coords) TriggerServerEvent("inventory:server:OpenInventory", "stash", "CatCafe_"..data.stash) TriggerEvent("inventory:client:SetCurrentStash", "CatCafe_"..data.stash) end)

RegisterNetEvent('jim-catcafe:Shop', function(data)
	if not jobCheck() then return end
	lookEnt(data.coords)
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen" end
	TriggerServerEvent(event, "shop", "catcafe", Config.Items)
end)

RegisterNetEvent('jim-catcafe:Crafting:MakeItem', function(data)
	if data.header == Loc[Config.Lan].menu["header_coffee"] then
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	elseif data.header == Loc[Config.Lan].menu["header_hob"] then
		animDictNow = "amb@prop_human_bbq@male@base"
		animNow = "base"
	elseif data.header == Loc[Config.Lan].menu["header_pizza"] then
		animDictNow = "amb@prop_human_bbq@male@base"
		animNow = "base"
	elseif data.header == Loc[Config.Lan].menu["header_oven"] then
		animDictNow = "amb@prop_human_bbq@male@base"
		animNow = "base"
	elseif data.header == Loc[Config.Lan].menu["header_chop"] then
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	else
		animDictNow = "amb@prop_human_parking_meter@male@idle_a"
		animNow = "idle_a"
	end
	QBCore.Functions.Progressbar('making_food', Loc[Config.Lan].progressbar["progress_make"]..QBCore.Shared.Items[data.item].label, 5000, false, true,
	{ disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = 8, },
	{}, {}, function()
		TriggerServerEvent('jim-catcafe:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-catcafe:Crafting", data)
	end, function() -- Cancel
		ClearPedTasks(PlayerPedId())
		TriggerEvent('inventory:client:busy:status', false)
	end, data.item)
end)

RegisterNetEvent('jim-catcafe:client:Menu:Close', function() exports['qb-menu']:closeMenu() end)

RegisterNetEvent('jim-catcafe:Crafting', function(data)
	lookEnt(data.coords)
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				Menu[#Menu + 1] = { disabled = disable, icon = k, header = setheader, txt = settext, params = { event = "jim-catcafe:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end
		end
	end
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('jim-catcafe:client:DrinkAlcohol', function(itemName)
	if itemName == "sake" then
		TriggerEvent('animations:client:EmoteCommandStart', {"wine"})
	else
		TriggerEvent('animations:client:EmoteCommandStart', {"wine"})
	end
    QBCore.Functions.Progressbar("snort_coke", Loc[Config.Lan].progressbar["progress_drink"]..QBCore.Shared.Items[itemName].label.."..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
			AlienEffect()
        end
        if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        triggerNotify(nil, Loc[Config.Lan].progressbar["cancel"], "error")
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    local ped = PlayerPedId()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    SetPedCanRagdoll(ped, true )
    ShakeGameplayCam('DRUNK_SHAKE', 2.80)
    SetTimecycleModifier("Drunk")
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedMotionBlur(ped, true)
    SetPedIsDrunk(ped, true)
    Wait(1500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(13500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(120500)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    AnimpostfxStopAll()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(45000, 60000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('jim-catcafe:client:Drink', function(itemName)
	if itemName == "bobatea" or itemName == "bbobatea" or itemName == "gbobatea" or itemName == "obobatea" or itemName == "pbobatea" or itemName == "sleepylatte" or itemName == "chapocapp" then
		TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
	elseif itemName == "nekolatte" then
		TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
	elseif itemName == "mocha" then
		TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
	elseif itemName == "catcoffee" then
		TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
	else
		TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
	end
	QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan].progressbar["progress_drink"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
		if not QBCore.Shared.Items[itemName].thirst and not QBCore.Shared.Items[itemName].hunger then
			TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30,55))
		end
		if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

RegisterNetEvent('jim-catcafe:client:Eat', function(itemName)
	
	 TriggerEvent('animations:client:EmoteCommandStart', {"eat"})

	QBCore.Functions.Progressbar("eat_something", 'Eating '..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
		if not QBCore.Shared.Items[itemName].thirst and not QBCore.Shared.Items[itemName].hunger then
			TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(30,55))
		end
       -- TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
		if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
		if itemName == "bmochi" or itemName == "gmochi" or itemName == "omochi" or itemName == "pmochi" then exports['qb-buffs']:AddBuff("hacking", 15000)
		elseif itemName == "miso" then exports['qb-buffs']:AddBuff("luck", 15000) 
		elseif itemName == "nekodonut" then exports['qb-buffs']:AddBuff("stamina", 15000) exports['qb-buffs']:StaminaBuffEffect(15000, 1.4)
		elseif itemName == "purrito" then exports['qb-buffs']:AddBuff("intelligence", 15000)
		elseif itemName == "noodlebowl" then exports['qb-buffs']:AddBuff("strength", 15000)
		elseif itemName == "mozzarellasticks" then exports['qb-buffs']:AddBuff("swimming", 15000)   exports['qb-buffs']:SwimmingBuffEffect(15000, 1.4)
		elseif itemName == "ramen" then  exports['qb-buffs']:AddBuff("super-hunger", 15000)
		elseif itemName == "bento" then    exports['qb-buffs']:AddBuff("super-health", 15000) exports['qb-buffs']:AddHealthBuff(15000, 10)
		elseif itemName == "nekocookie" then   exports['qb-buffs']:AddBuff("super-armor", 15000)  exports['qb-buffs']:AddArmorBuff(15000, 10)
		elseif itemName == "pikachusoup" then  exports['qb-buffs']:AddBuff("super-stress", 15000) exports['qb-buffs']:AddStressBuff(15000, 10)
		elseif itemName == "ernadotaco" then  exports['qb-buffs']:AddBuff("super-thirst", 15000)
		end


		
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
end)
Crafting = {
	Tools = {
		--{ ["mechanic_tools"] = { ["iron"] = 1, } },
		--{ ["toolbox"] = { ["iron"] = 1, } },
		--{ ["ducttape"] = { ["plastic"] = 1, } },
		--{ ["paintcan"] = { ["aluminum"] = 1, } },
		--{ ["tint_supplies"] = { ["iron"] = 1, } },
		--{ ["underglow_controller"] = { ["iron"] = 1, } },
		--{ ["cleaningkit"] = { ["rubber"] = 1, } },
		{ ["newoil"] = { ["rubber"] = 2, } },
		{ ["sparkplugs"] = { ["aluminum"] = 1, } },
		{ ["carbattery"] = { ["aluminum"] = 3, ["plastic"] = 2, } },
		{ ["axleparts"] = { ["steel"] = 3, } },
		{ ["sparetire"] = { ["rubber"] = 5, } },
		{ ["screwdriverset"] = { ["carbon"] = 2, ["plastic"] = 10, ["metalscrap"] = 5 } },
				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		--{ ["cleaningkit"] = { ["rubber"] = 1, ["engine2"] = 1, ["plastic"] = 1 },
			--	["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --

	},
	Perform = {
		--[[{ ["turbo"] = { ["steel"] = 1, } },
		{ ["car_armor"] = { ["plastic"] = 1, } },
		{ ["engine1"] = { ["steel"] = 1, } },
		{ ["engine2"] = { ["steel"] = 1, } },
		{ ["engine3"] = { ["steel"] = 1, } },
		{ ["engine4"] = { ["steel"] = 1, } },
		{ ["engine5"] = { ["steel"] = 1, } },
		{ ["transmission1"] = { ["steel"] = 1, } },
		{ ["transmission2"] = { ["steel"] = 1, } },
		{ ["transmission3"] = { ["steel"] = 1, } },
		{ ["transmission4"] = { ["steel"] = 1, } },
		{ ["brakes1"] = { ["steel"] = 1, } },
		{ ["brakes2"] = { ["steel"] = 1, } },
		{ ["brakes3"] = { ["steel"] = 1, } },
		{ ["suspension1"] = { ["steel"] = 1, } },
		{ ["suspension2"] = { ["steel"] = 1, } },
		{ ["suspension3"] = { ["steel"] = 1, } },
		{ ["suspension4"] = { ["steel"] = 1, } },
		{ ["suspension5"] = { ["steel"] = 1, } },
		{ ["bprooftires"] = { ["rubber"] = 1, } },
		{ ["drifttires"] = { ["rubber"] = 1, } },
		{ ["nos"] = { ["noscan"] = 1, } },
		{ ["noscan"] = { ["steel"] = 1, } },]]
	},
	Cosmetic = {
		{ ["hood"] = { ["plastic"] = 1,["steel"] =1, } },
		{ ["roof"] = { ["iron"] = 1,["steel"] = 1, } },
		{ ["spoiler"] = { ["copper"] = 1, ["ducttape"] = 1} },
		{ ["bumper"] = { ["glass"] = 2, ["ducttape"] = 2} },
		{ ["skirts"] = {["rubber"] = 2,["ducttape"] = 1}  },
		{ ["exhaust"] = { ["aluminum"] = 1,["steel"] = 1, ["ducttape"] = 1} },
		{ ["seat"] = { ["ducttape"] = 2, } },
		{ ["livery"] = { ["paintcan"] = 1,["ducttape"] = 3  }, },
		{ ["tires"] = { ["sparetire"] = 1, ["paintcan"] = 1, ["ducttape"] = 2 } },
		{ ["horn"] = { ["aluminum"] = 1,["ducttape"] = 1 } },
		{ ["internals"] = { ["copper"] = 1,["ducttape"] = 1 } },
		{ ["externals"] = { ["glass"] = 1,["ducttape"] = 1, } },
		{ ["customplate"] = { ["iron"] = 1,["ducttape"] = 1 } },
		{ ["headlights"] = { ["plastic"] = 1,["glass"] = 1, } },
		{ ["rims"] = { ["paintcan"] = 1,["ducttape"] = 1 } },
		{ ["rollcage"] = { ["rubber"] = 1,["ducttape"] = 1, } },
		{ ["noscolour"] = { ["paintcan"] = 1,  ["tint_supplies"] = 1, } },
	},
}

Stores = {
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "mechanic_tools", price = 100, amount = 10, info = {}, type = "item", },
			{ name = "toolbox", price = 100, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 50, amount = 75, info = {}, type = "item", }, -- $100
			{ name = "cleaningkit", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "mechcoupon10", price = 5, amount = 25, info = {}, type = "item", },
			{ name = "mechcoupon15", price = 5, amount = 25, info = {}, type = "item", },
			{ name = "mechcoupon25", price = 5, amount = 25, info = {}, type = "item", },
			--{ name = "sparkplugs", price = 5, amount = 25, info = {}, type = "item", },
			--{ name = "newoil", price = 5, amount = 25, info = {}, type = "item", },
			{ name = "wires", price = 5, amount = 50, info = {}, type = "item", },

		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 12500, amount = 25, info = {}, type = "item", },
			{ name = "engine1", price = 1500, amount = 25, info = {}, type = "item", },
			{ name = "engine2", price = 3500, amount = 25, info = {}, type = "item", },
			{ name = "engine3", price = 3500, amount = 25, info = {}, type = "item", },
			{ name = "engine4", price = 3500, amount = 25, info = {}, type = "item", },
			--{ name = "engine5", price = 10000, amount = 25, info = {}, type = "item", },
			{ name = "transmission1", price = 2500, amount = 25, info = {}, type = "item", },
			{ name = "transmission2", price = 3500, amount = 25, info = {}, type = "item", },
			{ name = "transmission3", price = 3500, amount = 25, info = {}, type = "item", },
			--{ name = "transmission4", price = 8200, amount = 25, info = {}, type = "item", },
			{ name = "brakes1", price = 2500, amount = 25, info = {}, type = "item", },
			{ name = "brakes2", price = 4000, amount = 25, info = {}, type = "item", },
			--{ name = "brakes3", price = 7100, amount = 25, info = {}, type = "item", },
			--{ name = "car_armor", price = 20000, amount = 25, info = {}, type = "item", },
			{ name = "suspension1", price = 2500, amount = 25, info = {}, type = "item", },
			{ name = "suspension2", price = 3500, amount = 25, info = {}, type = "item", },
			{ name = "suspension3", price = 3500, amount = 25, info = {}, type = "item", },
			{ name = "suspension4", price = 3500, amount = 25, info = {}, type = "item", },
			--{ name = "suspension5", price = 9120, amount = 25, info = {}, type = "item", },
			--{ name = "bprooftires", price = 50000, amount = 25, info = {}, type = "item", },
			{ name = "drifttires", price = 250, amount = 25, info = {}, type = "item", },
			--{ name = "noscan", price = 5000, amount = 25, info = {}, type = "item", },
		},
	},
	StoreItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "paintcan", price = 25, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 100, amount = 25, info = {}, type = "item", },
			{ name = "stancer", price = 1250, amount = 25, info = {}, type = "item", },
			{ name = "underglow_controller", price = 100, amount = 25, info = {}, type = "item", },
			--[[{ name = "hood", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 5, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 5, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 5, amount = 50, info = {}, type = "item", },]]
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.StoreItems.slots = #Stores.StoreItems.items
for k in pairs(Stores.StoreItems.items) do Stores.StoreItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
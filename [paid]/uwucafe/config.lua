
Config = {
	Debug = false, -- false to remove green boxes
	Lan = "en",
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)
	PatHeal = 2, 			--how much you are healed by patting a cat, 2 hp seems resonable, enough not to be over powered and enough to draw people in.
							--set to 0 if you don't want to use this
	RelieveStress = 5,		-- How much stress relief per pat

	JimConsumables = false, -- Enable this to disable this scripts control of food/drink items
	JimShop = false, 		-- Enable this to use jim-shops for buying ingredients

	CheckMarks = true, -- If true this will show the player if they have the correct items to be able to craft the items

	Notify = "qb",

	--Simple Toy Reward Support
	RewardItem = "bento", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"sleepypop",
		"monkeypop",
		"chapopop",
		"funkopop_harrypotter",
		"funkopop_draco",
		"funkopop_hermione",
		"funkopop_ron",
		"funkopop_dumbledore",
		"funkopop_hedwig",
		"funkopop_hagrid",
		"funkopop_moaningmertle",
		"funkopop_voldemort",
		"funkopop_snape",
		"blakepop",
		"johnpop",
		"jessepop",
		"tommypop",
	},

	Items = {
		label = "Ingredients Storage",
		slots = 14,
		items = {
			{ name = "cafemenu", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "flour", price = 0, amount = 0, info = {}, type = "item", slot = 2, },
			{ name = "nori", price = 0, amount = 0, info = {}, type = "item", slot = 3, },
			{ name = "tofu", price = 0, amount = 0, info = {}, type = "item", slot = 4, },
			{ name = "onion", price = 0, amount = 0, info = {}, type = "item", slot = 5, },
			{ name = "boba", price = 0, amount = 0, info = {}, type = "item", slot = 6, },
			{ name = "mint", price = 0, amount = 0, info = {}, type = "item", slot = 7, },
			{ name = "orange", price = 0, amount = 0, info = {}, type = "item", slot = 8, },
			{ name = "strawberry", price = 0, amount = 0, info = {}, type = "item", slot = 9, },
			{ name = "blueberry", price = 0, amount = 0, info = {}, type = "item", slot = 10, },
			{ name = "milk", price = 0, amount = 0, info = {}, type = "item", slot = 11, },
			{ name = "rice", price = 0, amount = 0, info = {}, type = "item", slot = 12, },
			{ name = "sake", price = 0, amount = 0, info = {}, type = "item", slot = 13, },
			{ name = "noodles", price = 0, amount = 0, info = {}, type = "item", slot = 14, },
		},
	},
	Locations = {
		{	zoneEnable = true,
			job = "catcafe", -- Set this to the required job
			label = "UwU Cafe",
			zones = {
				vector2(-591.15808105469, -1087.8620605469),
				vector2(-563.33447265625, -1087.8508300781),
				vector2(-563.26678466797, -1045.1898193359),
				vector2(-618.20904541016, -1044.2902832031),
				vector2(-617.80517578125, -1079.7291259766),
				vector2(-599.44097900391, -1079.6105957031)
			},
			garage = { spawn = vector4(-594.62, -1086.59, -221.76, 220.09),
						out = vector4(-593.19, -1084.99, -222.33, 311.96),
						list = { "panto" } },
			blip = vector3(-581.06, -1066.22, 22.34),
			blipcolor = 48,
		},
	},
}
Crafting = {
	ChoppingBoard = {
		{ ['bmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['blueberry'] = 1, }, },
		{ ['gmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['mint'] = 1, }, },
		{ ['omochi'] = { ['sugar'] = 1, ['flour'] = 1, ['orange'] = 1, }, },
		{ ['pmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['strawberry'] = 1, }, },
		{ ['riceball'] = { ['rice'] = 1, ['nori'] = 1, }, },
		{ ['bento'] = { ['rice'] = 1, ['nori'] = 1, ['tofu'] = 1, }, },
		{ ['purrito'] = { ['rice'] = 1, ['flour'] = 1, ['onion'] = 1, }, },
		{ ['ernadotaco'] = { ['rice'] = 1, ['flour'] = 1, ['onion'] = 1, }, },
	},
	Oven = {
		{ ['nekocookie'] = { ['flour'] = 1, ['milk'] = 1, }, },
		{ ['ernadoedible'] = { ['flour'] = 1, ['milk'] = 1, ['marijuana'] = 1, }, },
		{ ['nekodonut'] = { ['flour'] = 1, ['milk'] = 1, }, },
		{ ['cake'] = { ['flour'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['cakepop'] = { ['flour'] = 1, ['milk'] = 1, ['sugar'] = 1, }, },
		{ ['pancake'] = { ['flour'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['pizza'] = { ['flour'] = 1, ['milk'] = 1, }, },
	},
	Coffee = {
		{ ['coffee'] = { ['coffeebean'] = 1, }, },
		{ ['sleepylatte'] = { ['boba'] = 1, ['milk'] = 1, }, },
		{ ['chapocapp'] = { ['boba'] = 1, ['milk'] = 1, }, },
		{ ['bobatea'] = { ['boba'] = 1, ['milk'] = 1, }, },
		{ ['bbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['sugar'] = 1, }, },
		{ ['gbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['obobatea'] = { ['boba'] = 1, ['milk'] = 1, ['orange'] = 1, }, },
		{ ['pbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['mocha'] = { ['milk'] = 1, ['sugar'] = 1, }, },
	},
	Hob = {
		{ ['miso'] = { ['nori'] = 1, ['tofu'] = 1, ['onion'] = 1, }, },
		{ ['ramen'] = { ['noodles'] = 1, ['onion'] = 1, }, },
		{ ['noodlebowl'] = { ['noodles'] = 1, }, },
		{ ['pikachusoup'] = { ['noodles'] = 1, ['onion'] = 1, }, },
	},
	
	--Pizza This
	Grill = {
		{ ['cookedchicken'] = { ['rawchicken'] = 1 }, },
		{ ['meatballs'] = { ['raw_beef'] = 1 }, },
		{ ['cooked_bacon'] = { ['raw_bacon'] = 1, }, },
		{ ['cooked_ham'] = { ['raw_ham'] = 1 }, },
	},
	Fryer = {
		{ ['mozzarellasticks'] = { ['mozz'] = 1, }, },
		{ ['hotwings'] = { ['cookedchicken'] = 1, }, },
	},
	Sauce = {
		{ ['sauce'] = { ['tomato'] = 1, }, },
		{ ['creamsauce'] = { ['cream'] = 1, }, },
		{ ['spaghetti'] = { ['sauce'] = 1, ['pasta'] = 1,['meatballs'] = 1, }, },
		{ ['alfredo'] = { ['creamsauce'] = 1, ['pasta'] = 1,['cookedchicken'] = 1, }, },
	},
	Dough = {
		{ ['dough'] = { ['flour'] = 1, ['milk'] = 1, }, },
	},
	Prep = {
		{ ['rawcheesepizza'] = { ['dough'] = 1, ['mozz'] = 1, ['sauce'] = 1, }, },
		{ ['rawpepperonipizza'] = { ['dough'] = 1, ['mozz'] = 1, ['sauce'] = 1, ['pepperoni'] = 1, }, },
		{ ['rawmeatpizza'] = { ['dough'] = 1, ['mozz'] = 1, ['sauce'] = 1, ['pepperoni'] = 1, ['cooked_ham'] = 1, ['cooked_bacon'] = 1, }, },
		{ ['rawveggiepizza'] = { ['dough'] = 1, ['mozz'] = 1, ['sauce'] = 1, ['chilipeppers'] = 1, }, },
	},
	PizzaOven = {
		{ ['cheesepizza'] = { ['rawcheesepizza'] = 1 }, },
		{ ['pepperonipizza'] = { ['rawpepperonipizza'] = 1 }, },
		{ ['meatpizza'] = { ['rawmeatpizza'] = 1, }, },
		{ ['veggiepizza'] = { ['rawveggiepizza'] = 1 }, },
	},

	--MISC
	Meth = {
		{ ['methylamine'] = { ['chemicals'] = 10, ['pharmaceuticals'] = 2, }, },
	},

	-- Taco Shop
	Tortilla = {
		{ ['tortilla'] = { ['flour'] = 1, ['milk'] = 1, }, },
	},
	Meat = {
		{ ['cookedchicken'] = { ['rawchicken'] = 1 }, },
		{ ['beef'] = { ['raw_beef'] = 1 }, },
		{ ['cooked_pork'] = { ['raw_pork'] = 1, }, },
	},
 
	-- VU
	Kebab = {
		{ ['cookedchicken'] = { ['rawchicken'] = 1 }, },
		{ ['cookedlamb'] = { ['rawlamb'] = 1 }, },
		{ ['chickengyro'] = { ['cookedchicken'] = 1, ['tomato'] = 1 }, },
		{ ['chickenkebab'] = { ['cookedchicken'] = 1, ['tomato'] = 1 }, },
		{ ['lambgyro'] = { ['cookedlamb'] = 1, ['tomato'] = 1 }, },
		{ ['lambkebab'] = { ['cookedlamb'] = 1, ['tomato'] = 1 }, },
	},


}

Loc = {}

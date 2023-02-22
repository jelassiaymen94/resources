# Pug fishing.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-scripts.tebex.io/category/2141020

# Installation
Make sure you have the dependencies installed
qb-lock, qb-skillbar.
# This needs to go into qb-core/server/players.lua like this https://gyazo.com/18e7a16bf70564f0125e2a93ad545915
PlayerData.metadata['fishingrep'] = PlayerData.metadata['fishingrep'] or 0

/fishrep will show players there fishingrep

# Put this in qb-shops/config.lua
Change these items to your liking

Config.Products
["gearshop"] = {
    [1] = {
        name = "diving_gear",
        price = 2500,
        amount = 10,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "jerry_can",
        price = 200,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "fishingrod",
        price = 100,
        amount = 50,
        info = {},
        type = "item",
        slot = 3,
    },
    [4] = {
        name = "fishingbait",
        price = 30,
        amount = 50,
        info = {},
        type = "item",
        slot = 4,
    },
},

config.locations
-- Older qb-shops
["seawordtourn"] = {
    ["label"] = "Fishing Shop",
    ["type"] = "sea",
    ["coords"] = {
        [1] = vector3(-335.09, 6105.62, 30.45)
    },
    ["products"] = Config.Products["gearshop"],
    ["showblip"] = false,
},

-- Newer qb-shops
Make use target option in your shops script true if you want this to be a target
Add tis to shops config
["fishingtourn"] = {
    ["label"] = "Leisure Shop",
    ["coords"] = vector4(-335.62, 6103.46, 31.44, 230.45),
    ["ped"] = 'ig_oneil',
    ["scenario"] = "WORLD_HUMAN_LEANING",
    ["radius"] = 2.5,
    ["targetIcon"] = "fas fa-leaf",
    ["targetLabel"] = "Open Leisure Shop",
    ["products"] = Config.Products["gearshop"],
    ["showblip"] = false,
    ["blipsprite"] = 52,
    ["blipcolor"] = 0
},
# put this in shared items
-- rods, lures & bait
['fishingrod'] 			 		 = {['name'] = 'fishingrod', 					['label'] = 'Fishing Rod', 				['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A fishing rod for adventures with friends!!'},
['fishingrod2'] 			 		 = {['name'] = 'fishingrod2', 					['label'] = 'Skilled Fishing Rod', 				['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'betterrod.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'This rod is better than most, but not the best.'},
['fishingrod3'] 			 		 = {['name'] = 'fishingrod3', 					['label'] = 'Professional Rod', 				['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'bestrod.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'S+ tier fishing rod!!'},
['fishinglure'] 			     = {['name'] = 'fishinglure', 					['label'] = 'Fishing Lure', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'beginnerlure.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A colorful lure'},
['fishinglure2'] 			     = {['name'] = 'fishinglure2', 					['label'] = 'Pro Fishing Lure', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'betterlure.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A realistic lure'},
['skill-reel'] 			     = {['name'] = 'skill-reel', 					['label'] = 'Skill Fishing Reel', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'skill-reel.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A skilled fishing reel.'},
['pro-reel'] 			     = {['name'] = 'pro-reel', 					['label'] = 'Pro Fishing Reel', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'pro-reel.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A professional fishing reel.'},
['fishingbait'] 			     = {['name'] = 'fishingbait', 					['label'] = 'Fish Bait', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wormbait.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Worm bait!'},

-- fish
['killerwhale'] 			     = {['name'] = 'killerwhale', 			     	['label'] = 'Killer Whale',        ['weight'] = 7000,      ['type'] = 'item',      ['image'] = 'killerwhalemeat.png',      ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'This is a whole ass Shamu.'},
['stingraymeat'] 			     = {['name'] = 'stingraymeat', 				    ['label'] = 'Stingray',            ['weight'] = 2000,      ['type'] = 'item',      ['image'] = 'stingraymeat.png',         ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Stingray Meat'},
['tigershark'] 			         = {['name'] = 'tigershark', 			     	['label'] = 'Tigershark',          ['weight'] = 7000,      ['type'] = 'item',      ['image'] = 'tigershark.png',       ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'There are bigger sharks but this is still impressive..'},
['catfish'] 			         = {['name'] = 'catfish', 				        ['label'] = 'Catfish',                  ['weight'] = 3000,      ['type'] = 'item',      ['image'] = 'catfish.png',              ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Catfish'},
["fish"] 						= {["name"] = "fish",  	     				["label"] = "Fish",	 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "fish.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Catfish", ['hunger'] = math.random(40, 50) },
['salmon'] 			             = {['name'] = 'salmon', 				        ['label'] = 'Salmon',                   ['weight'] = 2000,      ['type'] = 'item',      ['image'] = 'salmon.png',               ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Salmon Fish'},
['largemouthbass'] 			     = {['name'] = 'largemouthbass', 				['label'] = 'Largemouth Bass',          ['weight'] = 3000,      ['type'] = 'item',      ['image'] = 'largemouthbass.png',       ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Fish for Fishing.'},
['goldfish'] 			         = {['name'] = 'goldfish', 			        	['label'] = 'Goldfish',                 ['weight'] = 2000,      ['type'] = 'item',      ['image'] = 'goldfish.png',             ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Goldfish... I wonder how he got there...'},
['redfish'] 			         = {['name'] = 'redfish', 			        	['label'] = 'Redfish',                  ['weight'] = 2000,      ['type'] = 'item',      ['image'] = 'redfish.png',              ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'One fish two fish...'},
['bluefish'] 			         = {['name'] = 'bluefish', 			        	['label'] = 'Bluefish',                 ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'bluefish.png',             ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'One fish two fish redfish...'},
['stripedbass'] 			     = {['name'] = 'stripedbass', 			        ['label'] = 'Striped Bass',             ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'stripedbass.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Striped Bass'},
['rainbowtrout'] 			     = {['name'] = 'rainbowtrout', 			        ['label'] = 'Rainbow Trout',             ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'rainbow-trout.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A colorful Trout'},
['gholfish'] 			     = {['name'] = 'gholfish', 			        ['label'] = 'Ghol',             ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'ghol-fish.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A big Ghol'},
['codfish'] 			     = {['name'] = 'codfish', 			        ['label'] = 'Cod',             ['weight'] = 3000,      ['type'] = 'item',      ['image'] = 'codfish.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A cody fish'},
['eelfish'] 			     = {['name'] = 'eelfish', 			        ['label'] = 'Eel',             ['weight'] = 4000,      ['type'] = 'item',      ['image'] = 'eelfish.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An eel.. pretty useless.'},
['swordfish'] 			     = {['name'] = 'swordfish', 			        ['label'] = 'Sword Fish',             ['weight'] = 3000,      ['type'] = 'item',      ['image'] = 'swordfish.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'This has a giant ass needle for a face.'},
['tuna-fish'] 			     = {['name'] = 'tuna-fish', 			        ['label'] = 'Tuna',             ['weight'] = 2000,      ['type'] = 'item',      ['image'] = 'tuna-fish.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Chicken of the sea, but fucking massive.'},

-- chest items
['chestkey'] 			     = {['name'] = 'chestkey', 			        ['label'] = 'Key',             ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'chestkey.png',          ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A gold key.'},
['treasurechest'] 			     = {['name'] = 'treasurechest', 			        ['label'] = 'Treasure Chest',             ['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'treasurechest.png',          ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ye, Treasure mighty.'},
['bottlemap'] 			     = {['name'] = 'bottlemap', 			        ['label'] = 'Treasure Bottle',             ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'bottlemap.png',          ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'looks very old.'},
['treasuremap'] 			     = {['name'] = 'treasuremap', 			        ['label'] = 'Treasure Map',             ['weight'] = 500,      ['type'] = 'item',      ['image'] = 'treasuremap.png',          ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'This could lead somewhere...'},
["diamond"] 					 = {["name"] = "diamond", 			  	  	  	["label"] = "Diamond", 					["weight"] = 3000, 		["type"] = "item", 		["image"] = "diamond.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Shiny Diamond"},
["emerald"] 					 = {["name"] = "emerald", 			  	  	  	["label"] = "Emerald", 					["weight"] = 3000, 		["type"] = "item", 		["image"] = "emerald.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Emerald"},
["sapphire"] 			 		 = {["name"] = "sapphire", 						["label"] = "Sapphire", 				["weight"] = 2000, 		["type"] = "item", 		["image"] = "sapphire.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Gems are truly, truly, truly outrageous."},
["ruby"]						 = {["name"] = "ruby", 							["label"] = "Ruby", 					["weight"] = 2000, 		["type"] = "item", 		["image"] = "ruby.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Gems are truly, truly, truly outrageous."},
['yellow-diamond']               = {['name'] = 'yellow-diamond',                ['label'] = 'Canary Diamond',                     ['weight'] = 3000,         ['type'] = 'item',         ['image'] = 'yellow-diamond.png',                 ['unique'] = false,         ['useable'] = true,     ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Yellow is truly, truly, truly gorgeous..'},
["captainskull"]						 = {["name"] = "captainskull", 							["label"] = "Captain Skull", 					["weight"] = 4000, 		["type"] = "item", 		["image"] = "captainskull.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "An old skull of a captain!"},

# put this in qb-inventory/html/js/app.js at around line 515
} else if (itemData.name == "fishinglure") {
    $(".item-info-title").html('<p>' + itemData.label + '</p>')
    $(".item-info-description").html( // might need to come back
        "<p>" + itemData.info.uses + "% durability left.</p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
    );
} else if (itemData.name == "fishinglure2") {
    $(".item-info-title").html('<p>' + itemData.label + '</p>')
    $(".item-info-description").html( // might need to come back
        "<p>" + itemData.info.uses + "% durability left.</p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
    );
# put this in qb-inventory/server/main.lua where the /giveitem command is
elseif itemData["name"] == "fishinglure" then
    info.uses = 1000
elseif itemData["name"] == "fishinglure2" then
    info.uses = 1500

# Pug fishing. For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.

This script is partially locked using escrow encryption. Most of the script is accessable in client/open.lua, sv_open.lua, shared.lua and all html

PREVIEW HERE: https://youtu.be/iJnzHxUKRv0

This completely configurable script consist of:
● Very extensive config.lua with options to customize everything.
● Custom lang system to support multiple languages.
● 8 different massive loot tables depending on the rod or reel your using or if you are in a tournament or not.
● This script is partially locked using escrow encryption. Most of the script is accessible in client/open.lua, sv_open.lua, shared.lua and all html
● Custom tournament UI that updates live Displaying 1st, 2nd, and 3rd position and points of your competitors, your position, and your points.
● UI that updates live Displaying showing how much time until the signups finish and how long until the tournament ends.
● The option to make players require a boat to fish.
● Multiple random tournaments each tsunami.
● Dynamic fishing reputation system.
● Higher tier fishing rod crafting bench.
● Fish market sell shop.
● valuable gems sell shop.
● Fishing rod crafting bench.
● 1st, 2nd, and 3rd tournament place cash and item rewards.
● Multiple fishing rods and fishing lures with different tiers.
● Dynamic and configurable minigames for each fishing rod tier.
● Fishing Rep to be able to unlock better fishing rods.
● Configured random zones each time a tournament begins.
● Menu displays all information about players in tournament and exactly the countdown time until a new one begins.
● 100 different chest locations to find while using the map.
● 35 unique custom items with each having custom high quality pngs.
● Treasure bottle that opens into a treasure map used to find hidden treasure around the map.
● Using the treasure map will turn you in the correct direction and make you point in the correct direction of the treasure chest that can be found.
● 6 different unique hand crafted custom animations with props.
● Uses configurable polyzones to setup the tournament area.
● Support for ps-lock, other core names, and other target systems.
● 0 known scuff.
● Runs at 0.0 ms resmon
● 2 illegal fishing reels that can only be used deep sea fishing. 
● both reels have a durability that gets used up when using.

Requirements consist of:
qb-core
qb-menu
(ALL MINIGAMES ARE SUPPLIED IN THE SCRIPT)
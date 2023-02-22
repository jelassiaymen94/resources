# Description
Polar Misc Script
* **Misc Scripts for Polar**
# Dependencies
* QbCore Framework
# Installation
* **Install all dependencies**
* **Add items to your qb-core > shared > items.lua**
* **Config the Shared.Luas to your liking**













# Blips



















# Fishing

## Items (qb-core>shared>items.lua)

```lua

--Fishing--
['smallfish'] 				 	 	 = {['name'] = 'smallfish', 			  	  		['label'] = 'Very Small Fish', 			['weight'] = 250, 		['type'] = 'item', 		['image'] = 'smallfish.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A very small fish, the size of my hand'},

['fishingbait'] 				 	 	 = {['name'] = 'fishingbait', 			  	  		['label'] = 'Worms Bait', 			['weight'] = 125, 		['type'] = 'item', 		['image'] = 'fishingbait.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Worm bait'},

['fishingrod'] 				 = {['name'] = 'fishingrod', 			  	  	['label'] = 'Fishing Rod', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A very durable fishing rod, used for catching fish.'},

['trout'] 				     = {['name'] = 'trout', 			  	    	['label'] = 'Trout', 		        	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'trout.png', 		        ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A diamond seems like the jackpot to me!'},

['bass'] 				 	 = {['name'] = 'bass', 			  	  	['label'] = 'A Widemouth Bass', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'bass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A golden chain seems like the jackpot to me!'},

['mediumfish'] 				 = {['name'] = 'mediumfish', 			  	  	['label'] = 'Plain Medium Fish', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'mediumfish.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A medium sized fish'},

['largefish'] 			 	 	 = {['name'] = 'largefish', 			  			['label'] = 'Very Large Fish', 				['weight'] = 7000, 	    ['type'] = 'item', 		['image'] = 'largefish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me!'},

['whale'] 			 	 	 = {['name'] = 'whale', 			  			['label'] = 'Very Large Whale', 				['weight'] = 12500, 	    ['type'] = 'item', 		['image'] = 'whale.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me!'},
['catfish'] 			 	 	 = {['name'] = 'catfish', 			  			['label'] = 'Catfish', 				['weight'] = 2500, 	    ['type'] = 'item', 		['image'] = 'catfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me!'},
['stingray'] 			 	 	 = {['name'] = 'stingray', 			  			['label'] = 'Stingray', 				['weight'] = 2500, 	    ['type'] = 'item', 		['image'] = 'stingray.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me!'},
['salmon'] 			 	 	 = {['name'] = 'salmon', 			  			['label'] = 'Pink Salmon', 				['weight'] = 2500, 	    ['type'] = 'item', 		['image'] = 'salmon.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me!'},
['goldfish'] 			 	 	 = {['name'] = 'goldfish', 			  			['label'] = 'A Gold Fish', 				['weight'] = 7000, 	    ['type'] = 'item', 		['image'] = 'goldfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Looks pretty expensive to me!'},
```
## qb-shops
```lua
 ["fishingshop"] = {
        [1] = {
            name = "fishingrod",
            price = 250,
            amount = 25,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fishingbait",
            price = 25,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
    },




 -- Leisure Shop Locations
    ["fishingshop"] = {
        ["label"] = "Fishing Shop",
        ["coords"] = vector4(-1505.91, 1511.95, 115.29, 257.13),
        ["ped"] = 'a_m_y_beach_01', -- https://docs.fivem.net/docs/game-references/ped-models/
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-leaf",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["fishingshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipscale"] = 0.8,
        ["blipcolor"] = 0
    },
```
# Jim-Shops
## (Jim-Shops>config.lua) under Products = {
```lua
["fishingshop"] = {
			{ name = "fishingrod", price = 250, amount = 25, },
			{ name = "fishingbait", price = 25, amount = 100, },
		},
```
## (Jim-Shops>config.lua) under Config.Locations = {
```lua
    -- Fishing Shop
    ["fishingshop"] = {
        ["label"] = "Fishing Shop",
		["type"] = "items",
		["targetLabel"] = "Open",
		["model"] = {
			`mp_m_shopkeep_01`, -- https://docs.fivem.net/docs/game-references/ped-models/
			`S_F_Y_Shop_LOW`,
			`S_F_Y_SweatShop_01`,
		},
		["killable"] = true,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(24.5, -1346.19, 29.5, 266.78),
		},
        ["products"] = Config.Products["fishingshop"],
        ["blipsprite"] = 52,
		["blipcolour"] = 2,
    },
```
# Logs
## (qb-smallresources>server>logs.lua)
```lua
['fishing' = {webhook},
```

# Credits
Made by Balake#0463 @ Polar RP

Discord: https://discord.gg/TJXzEkm5Dw

Tebex: https://polar-shop.tebex.io/
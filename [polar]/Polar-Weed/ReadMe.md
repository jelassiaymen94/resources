# Description
Polar Weed Lab Script
* **EASY INSTALLATION**
* QbCore Framework

Some updates inspired from Project Sloth

# Dependencies

-  Qb-Target

-  Qb-Inventory (Can be Changed Easily)

-  Qb-Core

-  Ps-Ui

# Optional

- Ps-Dispatch

- qb-phone (Mail)

# Features

+ Mostly Unescrowed (Mostly Configerable)
+ Randomized Loot tables
+ Third Eye Corner Selling
+ Grow Weed Anywhere
+ Only can Grow on Certain Ground Types
+ 1,300,000 Weed Strains
+ 9 Weed Types

+ Smoke on the Water Shop & Sellable Shops
+ Source Products Mission
+ Search Mission Bodies
+ Randomized Mailing
+ Random Source Product Locations

+ NPC Missions
+ Weed Lab
+ 6 Sort Locations
+ Trim Ped

+ 2 Trim Locations
+ Minimum Police for Mission & Drug Selling
+ Police Multiplier for Drug Selling
+ Custom Joint


+ 24/7 Support
+ Weed Logs



# Installation

* **Install all dependencies**

* **Config the Shared.Luas to your liking**


------------------------------ WEEEEEED ----------------------------




['weed_nutrition'] 				 = {['name'] = 'weed_nutrition', 			    ['label'] = 'Fertilizer', 		['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'np_fertilizer.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Plant nutrition'},
['male_seed'] 					 = {['name'] = 'male_seed', 				    ['label'] = 'Male Seed',		 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Male Weed Seed'},
['female_seed'] 				 = {['name'] = 'female_seed', 				    ['label'] = 'Female Seed',		 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Female Weed Seed'},
['wetbud'] 						 = {['name'] = 'wetbud', 			  	  		['label'] = 'Wet Bud', 					['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'weed_og-kush_bud.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Wet Bud'},
["purifiedwater"] 		 	 = {["name"] = "purifiedwater",           		  		["label"] = "Purified Water",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "waterjug.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Household Water Jug"},
		

-- Bad Quality
['croplow'] 			 	 = {['name'] = 'croplow', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'croplow.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Shit Quality Crop'},	
['35weedlow'] 			 	 = {['name'] = '35weedlow', 				['label'] = '3.5g Low Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '35weedlow.png', 				['unique'] = false,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Spawned In'},	
['1ozlow'] 			 	 = {['name'] = '1ozlow', 				['label'] = '1oz Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '1ozlow.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	

-- Decent Quality
['cropmid'] 		 	 	 = {['name'] = 'cropmid', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'cropmid.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Decent Quality Crop'},	
['35weedmid'] 		 	 	 = {['name'] = '35weedmid', 				['label'] = '3.5g Mid Grade Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '35weedmid.png', 				['unique'] = false,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Spawned In'},	
['1ozmid'] 		 	 	 = {['name'] = '1ozmid', 				['label'] = '1oz Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '1ozmid.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	

-- Good Quality
['crophigh'] 		 	 = {['name'] = 'crophigh', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'crophigh.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Good Quality Crop'},	
['35weedhigh'] 		 	 	 = {['name'] = '35weedhigh', 				['label'] = '3.5g High Grade Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '35weedhigh.png', 				['unique'] = false,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Spawned In'},	
['1ozhigh'] 		 	 	 = {['name'] = '1ozhigh', 				['label'] = '1oz Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '1ozhigh.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	
['weedpound'] 		 	 	 = {['name'] = 'weedpound', 				['label'] = 'Pound of Weed', 			['weight'] = 10000, 		['type'] = 'item', 		['image'] = '1ozhigh.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	

-- Items
['smalljoint'] 			 	 = {['name'] = 'smalljoint', 					['label'] = 'Joint', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'smalljoint.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'You a lil bitch with this small ass joint'},	
['largejoint'] 			 	 = {['name'] = 'largejoint', 				['label'] = 'Joint', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'largejoint.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Large Ass Joint'},	
	
-- Shop Items
['burnerphone'] 			 	 = {['name'] = 'burnerphone', 					['label'] = 'Burner Phone', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'burnerphone.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Dont Call the Police'},	
['trowel'] 			 	 = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A Shitty Small handheld garden shovel'},
["lighter"] 		 	 	 = {["name"] = "lighter", 				["label"] = "Lighter", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "lighter.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Only meth heads use this kind of lighter"},
["rollingpaper"] 		         = {["name"] = "rollingpaper", 			["label"] = "Rolling Papers", 			["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "rollingpaper.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "These aint Raw Rolling Papers!!?"},
["scale"] 		 	         = {["name"] = "scale", 					["label"] = "Scale", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "scale.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "This is not what it looks like"},
['weedkey'] 			 	 = {['name'] = 'weedkey', 			    	['label'] = 'Key', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weedkey.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'This key smells like Dope'},
['scissors'] 			 	 = {['name'] = 'scissors', 			    	['label'] = 'Scissors', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'scissors.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'These Scissors have some extra Dope on them'},



------------------------------------------------------------------




* **Insert SQL**

* **qb-smallresources>server>logs**
Add ["weed"] = '',

* **qb-inventory>html>images**
Add all Images

* **qb-inventory>html/js/app.js** look for the ```function FormatItemInfo```
Add Items

        else if (itemData.name == "1ozhigh") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
      	 } else if (itemData.name == "1ozmid") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
      	
	} else if (itemData.name == "1ozlow") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
      	




# Credits
Made by Balake#0463 @ Polar Development

Discord: https://discord.gg/polar

Tebex: https://polarscripts.tebex.io/
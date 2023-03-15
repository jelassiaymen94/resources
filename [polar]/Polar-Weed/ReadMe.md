# Description
Polar Weed Lab Script
* **EASY INSTALLATION**
* QbCore Framework



# Dependencies

-  Qb-Target

-  Qb-Inventory (Can be Changed Easily)

-  Qb-Core

-  Ps-Ui

# Optional

- qb-dispatch

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

-- Bad Quality
['croplow'] 			 	 = {['name'] = 'croplow', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'croplow.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Shit Quality Crop'},	
['35weedlow'] 			 	 = {['name'] = '35weedlow', 				['label'] = '3.5g Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '35weedlow.png', 				['unique'] = true,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Spawned In'},	
['1ozlow'] 			 	 = {['name'] = '1ozlow', 				['label'] = '1oz Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '1ozlow.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	

-- Decent Quality
['cropmid'] 		 	 	 = {['name'] = 'cropmid', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'cropmid.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Decent Quality Crop'},	
['35weedmid'] 		 	 	 = {['name'] = '35weedmid', 				['label'] = '3.5g Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '35weedmid.png', 				['unique'] = true,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Spawned In'},	
['1ozmid'] 		 	 	 = {['name'] = '1ozmid', 				['label'] = '1oz Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '1ozmid.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	

-- Good Quality
['crophigh'] 		 	 = {['name'] = 'crophigh', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'crophigh.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Good Quality Crop'},	
['35weedhigh'] 		 	 	 = {['name'] = '35weedhigh', 				['label'] = '3.5g Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '35weedhigh.png', 				['unique'] = true,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Spawned In'},	
['1ozhigh'] 		 	 	 = {['name'] = '1ozhigh', 				['label'] = '1oz Weed', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = '1ozhigh.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Spawned In'},	

-- Items
['weed_seeds'] 			 	 = {['name'] = 'weed_seeds', 					['label'] = 'Seeds', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'weed_seeds.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'ooooo seeds'},	
['smalljoint'] 			 	 = {['name'] = 'smalljoint', 					['label'] = 'Joint', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'smalljoint.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'You a lil bitch with this small ass joint'},	
['largejoint'] 			 	 = {['name'] = 'largejoint', 				['label'] = 'Joint', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'largejoint.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Large Ass Joint'},	

-- Shop Items
['burnerphone'] 			 	 = {['name'] = 'burnerphone', 					['label'] = 'Burner Phone', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'burnerphone.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Dont Call the Police'},	
['trowel'] 			 	 = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A Shitty Small handheld garden shovel'},
["lighter"] 		 	 	 = {["name"] = "lighter", 				["label"] = "Lighter", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "lighter.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Only meth heads use this kind of lighter"},
["rollingpaper"] 		         = {["name"] = "rollingpaper", 			["label"] = "Rolling Papers", 			["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "rollingpaper.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "These aint Raw Rolling Papers!!?"},
["drugbag"] 		 	 	 = {["name"] = "drugbag", 				["label"] = "Baggies", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "drugbag.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Need some baggies? i got some baggies"},
["scale"] 		 	         = {["name"] = "scale", 					["label"] = "Scale", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "scale.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "This is not what it looks like"},
['weed_nutrition'] 			 = {['name'] = 'weed_nutrition', 			    ['label'] = 'Plant Fertilizer', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weed_nutrition.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'Plant nutrition'},
['purifiedwater'] 			 	 = {['name'] = 'purifiedwater', 			    	['label'] = 'Plant Water', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'purifiedwater.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'Plant water'},
['weedkey'] 			 	 = {['name'] = 'weedkey', 			    	['label'] = 'Key', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weedkey.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'This key smells like Dope'},
['scissors'] 			 	 = {['name'] = 'scissors', 			    	['label'] = 'Scissors', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'scissors.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'These Scissors have some extra Dope on them'},



* **Insert SQL**

* **qb-smallresources>server>logs**
Add ["weed"] = '',

* **qb-inventory>html>images**
Add all Images

* **qb-inventory>html/js/app.js** look for the ```function FormatItemInfo```
Add Items

          else if (itemData.name == "1ozlow") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
        } else if (itemData.name == "1ozmid") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
        } else if (itemData.name == "1ozhigh") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
        } else if (itemData.name == "35weedlow") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
        } else if (itemData.name == "35weedmid") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
        } else if (itemData.name == "35weedhigh") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>' + '<p>Color: ' + itemData.info.color + '</p>');
        }  




# Credits
Made by Balake#0463 @ Polar Development

Discord: https://discord.gg/polar

Tebex: https://polarscripts.tebex.io/
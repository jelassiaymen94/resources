# Description
Polar Weed Lab Script
* **EASY INSTALLATION**
* QbCore Framework

Some updates inspired from Project Sloth

# Dependencies

-  Qb-Target

-  ps-inventory (Can be Changed Easily)

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


------------------------------ POLAR WEED ----------------------------
['1ozlow'] 			 	 = {['name'] = '1ozlow', 				['label'] = '1oz Weed', 			['weight'] = 1800, 		['type'] = 'item', 		['image'] = '1ozlow.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Low Quality Weed Ounce '},	
['1ozmid'] 		 	 	 = {['name'] = '1ozmid', 				['label'] = '1oz Weed', 			['weight'] = 1800, 		['type'] = 'item', 		['image'] = '1ozmid.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Medium Quality Weed Ounce'},	
['1ozhigh'] 		 	 	 = {['name'] = '1ozhigh', 				['label'] = '1oz Weed', 			['weight'] = 1800, 		['type'] = 'item', 		['image'] = '1ozhigh.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Great Quality Weed Ounce'},	

['weed_nutrition'] 				 = {['name'] = 'weed_nutrition', 			    ['label'] = 'Fertilizer', 		['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'np_fertilizer.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Plant nutrition'},
['male_seed'] 					 = {['name'] = 'male_seed', 				    ['label'] = 'Male Seed',		 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Male Weed Seed'},
['female_seed'] 				 = {['name'] = 'female_seed', 				    ['label'] = 'Female Seed',		 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Female Weed Seed'},
["purifiedwater"] 		 	 = {["name"] = "purifiedwater",           		  		["label"] = "Purified Water",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "waterjug.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Household Water Jug"},
		
['wetbud'] 						 = {['name'] = 'wetbud', 			  	  		['label'] = 'Wet Bud', 					['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'wetbud.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Low Quality Wet Bud (Possible THC Levels of 1%-9%)'},
['wetbud2'] 						 = {['name'] = 'wetbud2', 			  	  		['label'] = 'Wet Bud', 					['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'wetbud.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Medium Quality Wet Bud (Possible THC Levels of 10%-20%)'},
['wetbud3'] 						 = {['name'] = 'wetbud3', 			  	  		['label'] = 'Wet Bud', 					['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'wetbud.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Good Quality Wet Bud (Possible THC Levels of 25%-45%)'},

['weedpound'] 		 	 	 = {['name'] = 'weedpound', 				['label'] = 'Pound of Weed', 			['weight'] = 10000, 		['type'] = 'item', 		['image'] = 'weedpound.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Low Quality Weed Pound, This Shit makes Hella Stank Ounces'},	
['weedpound2'] 		 	 	 = {['name'] = 'weedpound2', 				['label'] = 'Pound of Weed', 			['weight'] = 10000, 		['type'] = 'item', 		['image'] = 'weedpound.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Medium Quality Weed Pound, This Shit makes Hella Ounces'},	
['weedpound3'] 		 	 	 = {['name'] = 'weedpound3', 				['label'] = 'Pound of Weed', 			['weight'] = 10000, 		['type'] = 'item', 		['image'] = 'weedpound.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Good Quality Weed Pound, This Shit makes Hella Ounces'},	

-- Items
['smalljoint'] 			 	 = {['name'] = 'smalljoint', 					['label'] = 'Joint', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'smalljoint.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'You a lil bitch with this small ass joint'},	
['largejoint'] 			 	 = {['name'] = 'largejoint', 				['label'] = 'Joint', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'largejoint.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Large Ass Joint'},	
["lighter"] 		 	 	 = {["name"] = "lighter", 				["label"] = "Lighter", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "lighter.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Only meth heads use this kind of lighter"},
["rollingpaper"] 		         = {["name"] = "rollingpaper", 			["label"] = "Rolling Papers", 			["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "rollingpaper.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "These aint Raw Rolling Papers!!?"},
["scale"] 		 	         = {["name"] = "scale", 					["label"] = "Scale", 					["weight"] = 1000, 	    ["type"] = "item", 		["image"] = "scale.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "Its not what it looks like"},
['weedkey'] 			 	 = {['name'] = 'weedkey', 			    	['label'] = 'Key', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weedcard.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'This a Key? Stinks like Weed'},
['weedtub'] 			 	 = {['name'] = 'weedtub', 			    	['label'] = 'Planting Pot', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weedtub.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'Hmm I suppose I could plant something in here'},
------------------------------------------------------------------





* **Insert SQL**

* **qb-smallresources>server>logs**
Add ["weed"] = '',

* **ps-inventory>html>images**
Add all Images

* **ps-inventory>html/js/app.js** look for the ```function FormatItemInfo```
Add Items

        } else if (itemData.name == "1ozhigh") {
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
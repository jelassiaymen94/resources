    Step #1
    
    Put these into your shared.lua

	---- ** WEED STUFF ** ----
	['weed_nutrition'] 				 = {['name'] = 'weed_nutrition', 			    ['label'] = 'Plant Fertilizer', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'weed_nutrition.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Plant nutrition'},
	['female_seed'] 				 = {['name'] = 'female_seed', 				    ['label'] = 'Female Seed',		 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Female Weed Seed'},
	['male_seed'] 					 = {['name'] = 'male_seed', 				    ['label'] = 'Male Seed',		 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_seed.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Male Weed Seed'},
	['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['rolling_paper'] 			 	 = {['name'] = 'rolling_paper', 			  	['label'] = 'Rolling Paper', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'rolling_paper.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
	['weed_bag'] 				 	 = {['name'] = 'weed_bag', 					  	['label'] = 'Bag of Weed', 				['weight'] = 250, 		['type'] = 'item', 		['image'] = 'weed_baggy.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = '2.5 Ounces of Weed in a bag'},

	-- ** Joints
	['joint'] 						 = {['name'] = 'joint', 			  	  		['label'] = 'Joint',			 		['weight'] = 150, 		['type'] = 'item', 		['image'] = 'joint.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A joint made off Weed'},
	
	-- ** Wet Bud
	['wetbud'] 						 = {['name'] = 'wetbud', 			  	  		['label'] = 'Wet Bud', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wetbud.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Wet Bud'},

	-- ** Dry Bud
	['drybud'] 						 = {['name'] = 'drybud', 			  	  		['label'] = 'Dry Bud', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drybud.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Dry Bud'},

    Step #2 
    Run the runme.sql that was inside the file 

    Step #3
    Edit the config to your liking

    Step #4
    remember to ensure the script and HAVE FUN! 




    ##### DEPENDENCIES #####

    If the script is NOT working make sure you have the following
    qb-target (V5.0) 
    PolyZone
    QBCore latest core that uses export 
    OxMysql

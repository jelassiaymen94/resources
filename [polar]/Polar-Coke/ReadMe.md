# Description
Polar Coke Script
* **EASY INSTALLATION**
* QbCore Framework



# Dependencies

-  Qb-Target

-  Qb-Inventory (Can be Changed Easily)

-  Qb-Core

-  Polar-UI



# Features

+ Unescrowed (Fully Configerable)

+ Randomized Loot tables with Buff Options

+ Ps-Buffs Luck Buffs

+ Easy to change Minigame

+ 24/7 Support

+ Coke Logs

+ 5 Different Sets of Quality


# Installation

* **Install all dependencies**

* **Config the Shared.Luas to your liking**

["coketoy"] 				 = {["name"] = "coketoy", 			  	  		["label"] = "Imponent Rage",   		["weight"] = 5000, 		["type"] = "item", 		["image"] = "rage.png", 				["unique"] = true, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "The Best Toy on the Market!"},
['cocabrick'] 					 = {['name'] = 'cocabrick', 			 	  	  	['label'] = 'Unpackaged Brick', 				['weight'] = 10000, 		['type'] = 'item', 		['image'] = 'unpackaged.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = {accept = {'weapon_switchblade'}, reward = 'cokepowder', amount = 1, anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Cutting Brick', ['timeOut'] = 5000,}},   ['description'] = 'A highly concentrated brick of white powder'},
["cocaleaf"] 				 = {["name"] = "cocaleaf", 			  	  			["label"] = "Coca Leafs",   			["weight"] = 1000, 		["type"] = "item", 		["image"] = "cocaleaf.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "Prestiege Leafs"},
["cokepowder"] 				 = {["name"] = "cokepowder", 			  	  		["label"] = "Cocain Powder",   		["weight"] = 10000, 		["type"] = "item", 		["image"] = "coke.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	['combinable'] = {accept = {'band'}, reward = 'cokebill', amount = 1, anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Rolling Bill', ['timeOut'] = 5000,}}, ["description"] = "A big pile of the snorty good shit"},
["cokebill"] 				 = {["name"] = "cokebill", 			  	  		["label"] = "Rolled Bill",   		["weight"] = 2500, 		["type"] = "item", 		["image"] = "rolledbill.png", 				["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	["combinable"] = nil,   ["description"] = "A crisp 100$ bill with some powder inside"},
["cokebag"] 				 = {["name"] = "cokebag", 						["label"] = "Coke Bag", 	   		["weight"] = 500, 		["type"] = "item", 		["image"] = "cokebag.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A Small Bag of the White Goodness"},
["purifiedwater"] 		 	 = {["name"] = "purifiedwater",           		  		["label"] = "Purified Water",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "waterjug.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Household Water Jug"},
['cokekey'] 				 = {['name'] = 'cokekey', 						['label'] = 'Special Key', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'specialkey.png', 			    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'A Very Special Key, Secrets Hide Behind Doors...'},
["sodium_hydroxide"] 			 = {["name"] = "sodium_hydroxide", 					["label"] = "Sodium Hydroxide", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "sodium_hydroxide.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Salty Chemicals"},
['drugbag'] 				 = {['name'] = 'drugbag', 						['label'] = 'Empty Bag', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'ziplock.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'A Empty Bag'},
['bakingsoda'] 				 = {['name'] = 'bakingsoda', 						['label'] = 'Baking Soda', 			['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'bakingsoda.png', 			    	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Bake with some SODA!!'},
["bigbrick"] 				 = {["name"] = "bigbrick", 			  	  		["label"] = "Suspicious Package",   		["weight"] = 10000, 		["type"] = "item", 		["image"] = "bigbrick.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "A very Suspicious Package"},
["cokematerials"] 			 = {["name"] = "cokematerials", 					["label"] = "Ingredients", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "sodium_hydroxide.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Powdery Chemicals"},
	['visa'] 					 	 = {['name'] = 'visa', 			 	  	  		['label'] = 'Visa Card', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'visacard.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Visa can be used via ATM'},
	['weapon_switchblade'] 			 = {['name'] = 'weapon_switchblade', 	 	  	['label'] = 'Switchblade', 				['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,						['image'] = 'weapon_switchblade.png', 	['unique'] = true, 		['useable'] = false, 	['description'] = 'A knife with a blade that springs out from the handle when a button is pressed'},
	 ['jerry_can'] 			 		 = {['name'] = 'jerry_can', 					['label'] = 'Jerrycan 2100L', 			['weight'] = 5000, 	['type'] = 'item', 		['image'] = 'jerry_can.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A can full of Fuel'},

* **qb-smallresources>server>logs**

Add ["coke"] = '',

* **qb-inventory>html>images**

Add all Images



* **qb-core>server>player** add near the craftingrep metadata

 PlayerData.metadata['circlems'] = PlayerData.metadata['circlems'] or 0
    PlayerData.metadata['circletime'] = PlayerData.metadata['circletime'] or 0




# Credits
Made by Balake#0463 @ Polar Development

Discord: https://discord.gg/polar

Tebex: https://polarscripts.tebex.io/
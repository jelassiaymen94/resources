Hi, Thank you for buying ol-GangTurf

Incase of any issues or bugs, feel free to join my server and report! https://discord.gg/yUScbNBxY3

## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/qbcore-framework/qb-target/releases

qb-menu - https://github.com/qbcore-framework/qb-menu


## Insert into @qb-core/shared/items.lua 

```
	["spray"] 			   		 	 = {["name"] = "spray", 							["label"] = "Spray Can", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "spray.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["turfoption"] 			   		 = {["name"] = "turfoption", 						["label"] = "Turf Options", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "turfoption.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["sprayremover"] 			   		 = {["name"] = "sprayremover", 						["label"] = "Spray Remover", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "sprayremover.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
```

## Insert into @qb-inventory/client/main.lua

Look for this event: RegisterNUICallback("CloseInventory", function()

Insert under: elseif CurrentStash ~= nil then
```
TriggerEvent('ol-graffiti:invBeingClosed', CurrentStash)
```

And also under else: 
```
TriggerEvent('ol-graffiti:invBeingClosed', currentOtherInventory)
```
like in this picture https://cdn.discordapp.com/attachments/1004844138040135781/1004844588172849242/unknown.png

## Insert into @qb-inventory/html/js/app.js
```
else if (itemData.name == 'spray') {
  	$(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html("<p>Gang: " + itemData.info.gang + "</p>");
} 
```
like in this picture https://cdn.discordapp.com/attachments/1004844138040135781/1004844324988665936/unknown.png
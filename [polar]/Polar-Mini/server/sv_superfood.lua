local QBCore = exports['qb-core']:GetCoreObject()



AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	
		
		local food = {"sandwich","twerks_candy","snikkel_candy","tosti", "bento", "blueberry", "cake", "nekocookie", "nekodonut", "riceball", "miso", "bmochi", "pmochi", "gmochi", "omochi", "strawberry", "rice", "cakepop", "pizza", "pancake", "purrito", "noodlebowl", "ramen", "pikachusoup","ernadotaco", "mozzarellasticks", "hotwings", "meatballs", "cheesepizza", "pepperonipizza", "meatpizza", "veggiepizza", "alfredo", "spaghetti", "chickenkebab", "chickengyro", "lambgyro", "lambkebab", "chickentaco", "porktaco", "beeftaco" }
		for _, v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('superfood:client:Eat', source, item.name) end) end

		local drinks = {"coffee", "water_bottle","kurkakola", "bobatea", "bbobatea", "gbobatea", "pbobatea", "obobatea", "nekolatte", "mocha", "catcoffee", "sleepylatte", "chapocapp", "ecola", "sprunk", "ecolalight", "sprunklight" }
		for _, v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('superfood:client:Drink', source, item.name) end) end

		local alcohol = { "sake", "vodka", "beer", "whiskey" }
		for _, v in pairs(alcohol) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('superfood:client:DrinkAlcohol', source, item.name) end) end
	
        local smoke = { "cig", "cigar" }
		for _, v in pairs(smoke) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('superfood:client:smoke', source, item.name) end) end
	
end)

RegisterNetEvent('superfood:server:removeitem', function(item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	Player.Functions.RemoveItem(item, 1)
	--TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", 1)
	
end)
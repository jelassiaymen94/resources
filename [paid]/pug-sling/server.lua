local QBCore = exports['qb-core']:GetCoreObject()













local function checkItems(Player, items)
	if type(items) == 'table' then
		local count = 0
		local finalcount = 0
		for k, v in pairs(items) do
			if type(k) == 'string' then
				finalcount = 0
				for _ in pairs(items) do finalcount += 1 end
				local item = Player.Functions.GetItemByName(k)
				if item then
					if item.amount >= v then
						
							return true
						
					end
				end
			else
				finalcount = #items
				local item = Player.Functions.GetItemByName(v)
				if item then
					if needsAll then
						count += 1
						if count == finalcount then
							
							return true
						end
					else
						
						return true
					end
				end
			end
		end
	else
		local item = Player.Functions.GetItemByName(items)
		if item then
			
			return true
		end
	end
	return false
end











QBCore.Functions.CreateCallback('pug-sling:server:checkItems', function(source, cb, items)
	local Player = QBCore.Functions.GetPlayer(source)
	cb(checkItems(Player, items))
end)



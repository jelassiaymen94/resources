local QBCore = exports['qb-core']:GetCoreObject()













local function checkItems(Player, items)
	if Player == nil then return end
	
		local item = Player.Functions.GetItemByName(items)
		if item then
			
			return true
		end
	
	return false
end











QBCore.Functions.CreateCallback('pug-sling:server:checkItems', function(source, cb, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    print(item)
    for a, b in pairs(Player.PlayerData.items) do
    if b.name == item then
    	cb(true)
	else
		cb(false)
	end
	end
end)



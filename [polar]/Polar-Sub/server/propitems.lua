local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("drkey", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('Polar-Sub:Client:Item', 1, src)
      
	end
end)

QBCore.Functions.CreateUseableItem("moviekey", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('Polar-Sub:Client:Item', 2, src)
      
	end
end)
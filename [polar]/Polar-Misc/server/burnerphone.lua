local QBCore = exports['qb-core']:GetCoreObject()



QBCore.Functions.CreateUseableItem("burnerphone", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('Polar-Misc:Client:BurnerCops', src)
      
	end
end)

RegisterNetEvent('Polar-Misc:Server:Misc', function()

    local math = math.random(1,100)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if math >= 1 then

            if exports['ps-inventory']:RemoveItem(Player.PlayerData.source, 'burnerphone', 1, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['burnerphone'], 'remove', 1)
            TriggerEvent("qb-log:server:CreateLog", "weed", "REMOVED TRIM ITEM", "yellow", "**" .. GetPlayerName(src) .. "** Removed" .. 1 .. " " .. 'burnerphone' .. "s")
            end

    end

end)






QBCore.Functions.CreateCallback('Polar-Misc:Server:GetPolice', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)
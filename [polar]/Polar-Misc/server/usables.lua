local QBCore = exports['qb-core']:GetCoreObject()



QBCore.Functions.CreateUseableItem('01_monkeyman', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("Polar-MethTruck:Client:ShowMonkeyImage", source)
    end
end)


QBCore.Functions.CreateUseableItem('02_mrsmonkey', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("Mic:ToggleMic", source)
    end
end)
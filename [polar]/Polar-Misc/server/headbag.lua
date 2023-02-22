local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("headbag:getClosestPlayer", function(closestPlayer)
    getPlayer = closestPlayer;
    local name = GetPlayerName(getPlayer);
    TriggerClientEvent("StartThread", getPlayer);
end)

RegisterNetEvent("headbag:getClosestPlayer2", function()
    TriggerClientEvent("RemoveHeadBag", getPlayer);
end)

QBCore.Functions.CreateUseableItem("head_bag", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source);
    if Player.Functions.GetItemByName("head_bag") ~= nil then
        TriggerClientEvent("CheckThread", source);
    end
end)

QBCore.Commands.Add("cid", "Get your character ID", {}, false, function(source) 
    TriggerClientEvent('QBCore:Notify', source, "Character ID: "..QBCore.Functions.GetPlayer(source).PlayerData.citizenid, 'primary', 20000) 
end)
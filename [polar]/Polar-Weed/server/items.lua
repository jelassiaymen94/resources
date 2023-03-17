
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ScaleItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source) local scaleCheck = Player.Functions.GetItemByName('rollingpaper')
    if scaleCheck ~= nil then TriggerClientEvent('Polar-Weed:Client:Joint', source)
    else TriggerClientEvent('QBCore:Notify', source, "You dont have any rolling papers", 'error', 2500)
end end)
QBCore.Functions.CreateUseableItem(Config.SmallJointItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source) local LighterCheck = Player.Functions.GetItemByName(Config.Lighter) if LighterCheck ~= nil then if Player.Functions.RemoveItem(item.name, 1) then
    TriggerClientEvent('inventory:Client:ItemBox', source, QBCore.Shared.Items[Config.Lighter], "used") TriggerClientEvent('inventory:Client:ItemBox', source, QBCore.Shared.Items[item.name], "remove", 1) TriggerClientEvent('Polar-Weed:Client:SmallJoint', source) end
    else TriggerClientEvent('QBCore:Notify', source, "You don't have a Lighter", 'error', 2500) end
end)
QBCore.Functions.CreateUseableItem(Config.LargeJointItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source) local LighterCheck = Player.Functions.GetItemByName(Config.Lighter)
    if LighterCheck ~= nil then if Player.Functions.RemoveItem(item.name, 1) then
    TriggerClientEvent('inventory:Client:ItemBox', source, QBCore.Shared.Items[Config.Lighter], "used") TriggerClientEvent('inventory:Client:ItemBox', source, QBCore.Shared.Items[item.name], "remove", 1) TriggerClientEvent('Polar-Weed:Client:LargeJoint', source) end
    else TriggerClientEvent('QBCore:Notify', source, "You don't have a Lighter", 'error', 2500) end
end)
QBCore.Functions.CreateUseableItem(Config.FemaleSeed, function(source)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local tub = Player.Functions.GetItemByName(Config.TubItem)
	
    if tub ~= nil then
        TriggerClientEvent("Polar-Weed:Client:PlaceSeed", source)
    else
        TriggerClientEvent('QBCore:Notify', src, text('notub'), 'error', 2500)
    end
end)


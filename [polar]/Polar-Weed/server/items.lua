
local QBCore = exports['qb-core']:GetCoreObject()
local alreadyrolling = false
--[[
QBCore.Functions.CreateUseableItem("weed_seeds", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("Polar-Weed:Client:startPlanting", src, 'weed_seeds') 
	end 
end)
]]
QBCore.Functions.CreateUseableItem("weed_phone", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('Polar-Weed:Client:BurnerCops', src)
      
	end
end)

if Config.RemovePhoneOnUse then
RegisterNetEvent('Polar-Weed:Server:RemovePhone', function()

    local math = math.random(1,100)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if math >= 1 then

            if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, 'weed_phone', 1, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_phone'], 'remove', 1)
            TriggerEvent("qb-log:server:CreateLog", "weed", "REMOVED TRIM ITEM", "yellow", "**" .. GetPlayerName(src) .. "** Removed" .. 1 .. " " .. 'burnerphone' .. "s")
            end

    end

end)
end
QBCore.Functions.CreateUseableItem("scale", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local scaleCheck = Player.Functions.GetItemByName('rollingpaper')
    if scaleCheck ~= nil then
        TriggerClientEvent('Polar-Weed:Client:baggieMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have any rolling papers", 'error')
    end
end)
--[[
QBCore.Functions.CreateUseableItem("35weedlow", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rollingpaper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
        TriggerClientEvent('QBCore:Notify', src, "Rolling Joints", 'primary')
	    Wait(3700)
	    alreadyrolling = false
        local ha = math.random(1,3)
        Player.Functions.RemoveItem('35weedlow', 1)
        Player.Functions.RemoveItem('rollingpaper', 1)
        Player.Functions.AddItem('smalljoint', ha, slot, {["quality"] = 100})

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['35weedlow'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rollingpaper'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['smalljoint'], "add", ha)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("35weedmid", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rollingpaper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
        TriggerClientEvent('QBCore:Notify', src, "Rolling Joints", 'primary')
	    Wait(3700)
	    alreadyrolling = false
        local ha = math.random(2,4)
        Player.Functions.RemoveItem('35weedmid', 1)
        Player.Functions.RemoveItem('rollingpaper', 1)
        Player.Functions.AddItem('smalljoint', ha, slot, {["quality"] = 100})
        
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['35weedmid'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rollingpaper'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['smalljoint'], "add", ha)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("35weedhigh", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('rollingpaper')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
        TriggerClientEvent('QBCore:Notify', src, "Rolling Joints", 'primary')
	    Wait(3700)
	    alreadyrolling = false
        local ha = math.random(3,6)
        Player.Functions.RemoveItem('35weedhigh', 1)
        Player.Functions.RemoveItem('rollingpaper', 1)
        Player.Functions.AddItem('largejoint', ha, slot, {["quality"] = 100})
        
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['35weedhigh'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rollingpaper'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['largejoint'], "add", ha)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)
]]
QBCore.Functions.CreateUseableItem("smalljoint", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local LighterCheck = Player.Functions.GetItemByName('lighter')
    if LighterCheck ~= nil then
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lighter'], "used")
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['smalljoint'], "remove", 1)
            TriggerClientEvent('Polar-Weed:Client:smokeJoint', source)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have a Lighter", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("largejoint", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local LighterCheck = Player.Functions.GetItemByName('lighter')
    if LighterCheck ~= nil then
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lighter'], "used")
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['largejoint'], "remove", 1)
            TriggerClientEvent('Polar-Weed:Client:smoke3gJoint', source)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have a Lighter", 'error')
    end
end)


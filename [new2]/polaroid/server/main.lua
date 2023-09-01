local QBCore = exports['qb-core']:GetCoreObject()
local webhook = "https://discord.com/api/webhooks/1147151962987569234/IRJEaluutir9BJm-9GroIuJqsAv3U-PSnlhAXE9vUgLAZyL0Ps7ugJh1oMqhF-EUyu9C"

RegisterNetEvent("polaroid:server:getimage", function(url, name)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.Functions.RemoveItem("polaroid_paper", 1) then
        TriggerClientEvent('QBCore:Notify', src, "You don't have any polaroid paper", "error")
        return
    end

    Player.Functions.AddItem("polaroid", 1, false, {url = url, name = name, date = os.date("%d-%m-%Y")})
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["polaroid"], "add")
end)

QBCore.Functions.CreateCallback('polaroid:server:webhook', function(source, cb, args)
    cb(webhook)
end)

QBCore.Functions.CreateUseableItem('polaroid_camera', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("polaroid:client:camera", src)
    end
end)

QBCore.Functions.CreateUseableItem('polaroid', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local metadata = Config.Inventory == "ox" and "metadata" or "info"

    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("polaroid:client:showImage", src, item[metadata].url, item[metadata].name, item[metadata].date)
    end
end)

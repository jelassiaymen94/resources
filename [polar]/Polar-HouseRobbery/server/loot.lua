
local QBCore = exports['qb-core']:GetCoreObject()
    


local item = nil
local amount = nil



RegisterNetEvent('Polar-Paleto:Server:RemoveItems', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Wait(150) 
    if amount == nil then amount = 1 end
    Player.Functions.AddItem(item, amount) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
end)

function give(item, amount)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    local info = {
            worth = math.random(1000,10000)
    }
    if amount == nil then amount = 1 end
    Wait(500)
  
    if item == 'markedbills' then
        Player.Functions.AddItem(item, 1, false, info) 
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)  
    else
        Player.Functions.AddItem(item, amount) 
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
    end 
end



function hiya(name)
    if name == nil then print('ERROR') return end
    for _, data in ipairs(Config.LootProps) do        
        if data.prop == name then
            local item = data.item
            local amount = math.random(data.amountmin,data.amountmax)
            give(item, amount)
            return 
        end
    end
end






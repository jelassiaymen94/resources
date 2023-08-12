local QBCore = exports['qb-core']:GetCoreObject()


local item = nil
local item2 = nil
local item3 = nil
local item4 = nil
local amount = nil

local cashtable = {
    'markedbills',
    'dirtyband',

}
local goldtable = {
    'goldbar',
    'valuablegoods',
    'goldchip',
}

local diamondtable = {
    'diamond',
    'captainskull',
    'saphire',
    'bluediamond',
    'redruby',
    'yellow-diamond',
}
local drilltable = {
    'diamond',
    'captainskull',
    'saphire',
    'bluediamond',
    'redruby',
    'yellow-diamond',
    'goldbar',  'goldbar', 'goldbar', 'goldbar',
    'valuablegoods', 'valuablegoods', 'valuablegoods',
    'goldchip',
    'markedbills',
    'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband',
    --'',
}
RegisterNetEvent('Polar-stores:Drill', function(door)
   -- print(door)
    if door == nil then return end
   -- local times = math.random(1,5) 
    
   -- for i = 1, times do
        item = drilltable[math.random(1, #drilltable)] 
        give(item, 1)
   -- end
  
end)
local oxinv = Config.OxIventory


RegisterNetEvent('Polar-stores:Server:RemoveItems', function(item, amount) 
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Wait(150) 
    if amount == nil then amount = 1 end
    if Config.Framework == 'qb' then 
        if oxinv then
            exports.ox_inventory:AddItem(src, QBCore.Shared.Items[item], 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)  
        else
            Player.Functions.AddItem(item, amount) 
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
        end
    elseif  Config.Framework == 'esx' then 
        if oxinv then
            exports.ox_inventory:AddItem(src, QBCore.Shared.Items[item], amount)
        else
            Player.addInventoryItem(item, amount) 
        end
    end 
end)

function give(item, amount)
    print('hi')
        local src = source local Player = QBCore.Functions.GetPlayer(src)
        local info = {
            worth = math.random(1000,10000)
        }
    if amount == nil then amount = 1 end
    if Config.Framework == 'qb' then 
        if oxinv then
            exports.ox_inventory:AddItem(src, QBCore.Shared.Items[item], amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
        else
            if item == 'markedbills' then
                Player.Functions.AddItem(item, amount, false, info) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
            else
                print('hi2')
                Player.Functions.AddItem(item, amount) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
            end
        end
    elseif  Config.Framework == 'esx' then 
        if oxinv then
            exports.ox_inventory:AddItem(src, QBCore.Shared.Items[item], amount)
        else
            Player.addInventoryItem(item, amount) 
        end
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






if Config.Framework == 'qb' then
QBCore.Commands.Add("stores", "Set Player Metadata (God Only)", {}, false, function(source, args)
    TriggerEvent('Polar-stores:Server:StartTargets')
    TriggerEvent('Polar-stores:Server:StartCooldown')
    TriggerEvent('Polar-stores:Server:StartInteract', 'storesdoor1')
    TriggerEvent('Polar-stores:Server:StartInteract', 'storesdoor2')
    TriggerClientEvent('Polar-stores:Client:StartLoot', source)
end, "god") 
end

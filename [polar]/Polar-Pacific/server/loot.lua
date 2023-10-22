
if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
    
elseif Config.Framework == 'esx' then
    ESX = nil
   
end

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
    'goldbar',
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
    'goldbar',
    'markedbills',
    'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband', 'dirtyband',
    --'',
}
RegisterNetEvent('Polar-Pacific:Drill', function(door)
   -- print(door)
    if door == nil then return end
   -- local times = math.random(1,5) 
    
   -- for i = 1, times do
        item = drilltable[math.random(1, #drilltable)] 
        give(item, 1)
   -- end
  
end)
local oxinv = Config.OxIventory


RegisterNetEvent('Polar-Pacific:Server:RemoveItems', function(item, amount) 
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
  
    if name ==    'ch_prop_ch_cash_trolly_01a' then item = cashtable[math.random(1, #cashtable)] amount = math.random(1,1) local chance = math.random(1,100) if chance < 50 then give(item, amount) end
    elseif name == 'ch_prop_gold_trolly_01a' then  item = goldtable[math.random(1, #goldtable)] amount = math.random(1,1)   local chance = math.random(1,100) if chance < 30 then give(item, amount) end
    elseif name == 'ch_prop_diamond_trolly_01a'then item = diamondtable[math.random(1, #diamondtable)] amount = math.random(1,1) local chance = math.random(1,100) if chance < 15 then give(item, amount) end 
    else
       
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
end






if Config.Framework == 'qb' then
QBCore.Commands.Add("Pacific", "Set Player Metadata (God Only)", {}, false, function(source, args)
    TriggerEvent('Polar-Pacific:Server:StartTargets')
    TriggerEvent('Polar-Pacific:Server:StartCooldown')
    TriggerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor1')
    TriggerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor2')
    TriggerEvent('Polar-Pacific:Server:StartInteract', 'Pacificdoor3')
    TriggerClientEvent('Polar-Pacific:Client:StartLoot', source)
end, "god") 
end

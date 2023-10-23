local QBCore = exports['qb-core']:GetCoreObject()


local item = nil
local item2 = nil
local item3 = nil
local item4 = nil
local amount = nil



local oxinv = Config.OxIventory


RegisterNetEvent('Polar-stores:Server:RemoveItems', function(item, amount) 
    if item == nil then return end
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    Wait(150) 
    if amount == nil then amount = 1 end
   
    Player.Functions.AddItem(item, amount) 
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
       
end)
local regitems = {
    'markedbills', 'markedbills', 'markedbills', 'markedbills', 'markedbills',
    'dirtyband',   'dirtyband',   'dirtyband',   'dirtyband',   'dirtyband',
    'cash', 'cash', 'cash', 'cash', 
}
local safeitems = {
    'laptop_blue',
    'specialpick',
    'rope',
    'markedbills', 'markedbills', 'markedbills', 'markedbills', 'markedbills',
    'dirtyband',   'dirtyband',   'dirtyband',   'dirtyband',   'dirtyband',
    'goldbar',
}
RegisterNetEvent('Polar-stores:Server:Finish', function(item2, amount) 
    if item2 == nil then return end
    if amount == nil then return end
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
        Wait(150) 
    if amount == 'safes' then 
        -- register
        for i = 1, math.random(1,3) do
            Wait(500)
            local item = regitems[math.random(1, #regitems)]
            if item == 'markedbills' then 
                local info = {
                    worth = math.random(1250,2500)
                }
                Player.Functions.AddItem(item, 1, false, info) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)  
            elseif item == 'cash' then
                local am = math.random(150,500)
                Player.Functions.AddMoney(item, am)
            else
                Player.Functions.AddItem(item, 1) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)  
            end
        end
    elseif amount == 'dildo' then
        -- safe
        for i = 1, math.random(1,3) do
            local item = safeitems[math.random(1, #safeitems)]
            if item == 'markedbills' then 
                local info = {
                    worth = math.random(5000,7500)
                }
                Player.Functions.AddItem(item, 1, false, info) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)  
                local am = math.random(1500,2250)
                Player.Functions.AddMoney(item, am)
            else
                Player.Functions.AddItem(item, 1) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)  
            end
        end
    end
   
    
   
  
       
end)




function give(item, amount)
 
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    local info = {
            worth = math.random(1000,10000)
        }
    if amount == nil then amount = 1 end
 
    if item == 'markedbills' then
                Player.Functions.AddItem(item, amount, false, info) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)  
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






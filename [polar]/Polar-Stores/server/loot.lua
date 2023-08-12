local QBCore = exports['qb-core']:GetCoreObject()


local item = nil
local item2 = nil
local item3 = nil
local item4 = nil
local amount = nil



local oxinv = Config.OxIventory


RegisterNetEvent('Polar-stores:Server:RemoveItems', function(item, amount) 
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







QBCore.Commands.Add("stores", "Set Player Metadata (God Only)", {}, false, function(source, args)
    TriggerEvent('Polar-stores:Server:StartTargets')
    TriggerEvent('Polar-stores:Server:StartCooldown')
   -- TriggerEvent('Polar-stores:Server:StartInteract', 'storesdoor1')
  --  TriggerEvent('Polar-stores:Server:StartInteract', 'storesdoor2')
    TriggerClientEvent('Polar-stores:Client:StartLoot', source)
end, "god") 


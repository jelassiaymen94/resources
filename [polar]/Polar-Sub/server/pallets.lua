local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-Sub:Server:fuckyou', function(entity, item, amount)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if src then
    if entity == nil then return end
        
        if Player.Functions.AddItem(item, amount) then
                
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add',  amount)
        else
            TriggerClientEvent('QBCore:Notify', source, 'Couldnt Give Item', 'error')
        end


  
    end
end)
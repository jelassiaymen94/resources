local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('Polar-Sub:Server:RemoveCrypto', function(items, cryptos, amounts)
   
    netup(items, cryptos, amounts)

end)

RegisterNetEvent('Polar-Sub:Server:CheckCrypto', function(items, cryptos, amounts)
    local src = source
    
    if exports['qb-phone']:hasEnough(src, cryptos, amounts)  then
        TriggerClientEvent('Polar-Sub:Client:Anim2', src, items, cryptos, amounts)
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have " .. amounts .. " " .. cryptos .. " ", 'error', 3500)
    end
end)
function netup(items, cryptos, amounts)


    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local fromwho = "Crypto Exchange"
    local icon = "fa-solid fa-bolt"
    local color = "#e84118"
    local time = 3500
    
    if exports['qb-phone']:hasEnough(src, cryptos, amounts)  then

        if exports['qb-phone']:RemoveCrypto(src, cryptos, amounts)  then

            if Player.Functions.AddItem(items, 1, nil, {["quality"] = 100}) then

                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[items], "add", 1) 

                --local text = "Please come Again!"
    
                --TriggerClientEvent('Polar-Sub:Client:PhoneNotification', src, fromwho, text, icon, color, time)

            else

                TriggerClientEvent('QBCore:Notify', src, 'Could not give ' .. items .. " ", 'error')
                
            end
        else

            TriggerClientEvent('QBCore:Notify', src, "Couldn't remove " .. amounts .. " " .. cryptos .. " ", 'error', 3500)
          -- local text = "You dont have " .. amounts .. " " .. cryptos .. " "
    
           --TriggerClientEvent('Polar-Sub:Client:PhoneNotification', src, fromwho, text, icon, color, time)

        end
    else 
        TriggerClientEvent('QBCore:Notify', src, "You dont have " .. amounts .. " " .. cryptos .. " ", 'error', 3500)

      
       -- local text = "You dont have " .. amounts .. " " .. cryptos .. " "
    
       -- TriggerClientEvent('Polar-Sub:Client:PhoneNotification', src, fromwho, text, icon, color, time)

    end


end



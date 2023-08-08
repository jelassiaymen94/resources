local QBCore = exports['qb-core']:GetCoreObject()

-- SERVER SIDE

 RegisterServerEvent("ad_atmrobbery:reward")
 AddEventHandler("ad_atmrobbery:reward", function()
     local Player = QBCore.Functions.GetPlayer(source)
     local Cash = Config.Cash
     if Config.NormalCash then
    -- xPlayer.addAccountMoney(Config.NormalCashName, Cash)
     --TriggerClientEvent("esx:showNotification", source, Config.GotCash..Cash.."$")
     else
         --xPlayer.addAccountMoney(Config.BlackMoneyName, Cash)
     end
end)



RegisterServerEvent("Polar-Atm:Server:RemoveRope", function()
    local Player = QBCore.Functions.GetPlayer(source)
   -- if xPlayer.hasItem(Config.RopeItemName, Config.RopeItemCount) then
   -- xPlayer.removeInventoryItem(Config.RopeItemName, Config.RopeItemCount)
   -- TriggerClientEvent("esx:showNotification", source, Config.UseRopeNotify)
    --else
-- TriggerClientEvent("esx:showNotification", source, Config.DontHaveRope)
   -- end
end)


local QBCore = exports['qb-core']:GetCoreObject()

-- SERVER SIDE

 RegisterServerEvent("ad_atmrobbery:reward")
 AddEventHandler("ad_atmrobbery:reward", function()
     local Player = QBCore.Functions.GetPlayer(source)
     local Cash = AD.Cash
     if AD.NormalCash then
    -- xPlayer.addAccountMoney(AD.NormalCashName, Cash)
     TriggerClientEvent("esx:showNotification", source, AD.GotCash..Cash.."$")
     else
         --xPlayer.addAccountMoney(AD.BlackMoneyName, Cash)
     end
    end)

RegisterServerEvent("ad_atmrobbery:clrspawn")
AddEventHandler("ad_atmrobbery:clrspawn", function()
    TriggerClientEvent("ad_atmrobbery:clrspawn", -1)
end)

RegisterServerEvent("ad_atmrobbery:attro1")
AddEventHandler("ad_atmrobbery:attro1", function(pr1, pr2)
    TriggerClientEvent("ad_atmrobbery:attro1", -1, pr1, pr2)
end)

RegisterServerEvent("ad_atmrobbery:attro2")
AddEventHandler("ad_atmrobbery:attro2", function(dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
    TriggerClientEvent("ad_atmrobbery:attro2", -1, dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
end)

RegisterServerEvent("ad_atmrobbery:propas")
AddEventHandler("ad_atmrobbery:propas", function(psa)
    TriggerClientEvent("ad_atmrobbery:propas", -1, psa)
end)

RegisterServerEvent("ad_atmrobbery:deles")
AddEventHandler("ad_atmrobbery:deles", function(sda)
    TriggerClientEvent("ad_atmrobbery:deles", -1, sda)
end)

RegisterServerEvent("ad_atmrobbery:delesr")
AddEventHandler("ad_atmrobbery:delesr", function(rope)
    TriggerClientEvent("ad_atmrobbery:delesr", -1, rope)
end)

RegisterServerEvent("ad_atmrobbery:delesrsdsa")
AddEventHandler("ad_atmrobbery:delesrsdsa", function()
    local Player = QBCore.Functions.GetPlayer(source)
   -- if xPlayer.hasItem(AD.RopeItemName, AD.RopeItemCount) then
   -- xPlayer.removeInventoryItem(AD.RopeItemName, AD.RopeItemCount)
   -- TriggerClientEvent("esx:showNotification", source, AD.UseRopeNotify)
    --else
-- TriggerClientEvent("esx:showNotification", source, AD.DontHaveRope)
   -- end
end)
QBCore.Functions.CreateUseableItem("drill", function(source, item)
    TriggerClientEvent("ad_atmrobbery:userope", source)
end)


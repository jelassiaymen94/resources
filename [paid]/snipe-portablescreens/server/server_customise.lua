QBCore = nil
ESX = nil

CreateThread(function()
    if Config.Core == "ESX" then
        TriggerEvent(Config.Triggers["getObject"], function(obj) ESX = obj end)
    elseif Config.Core == "QBCore" then
        TriggerEvent(Config.Triggers["getObject"], function(obj) QBCore = obj end)
        if QBCore == nil then
            QBCore = exports[Config.CoreFolderName]:GetCoreObject()
        end
    end
end)

RegisterCommand("placescreen", function(source, args)
    if IsAuthorized(source) then
        if not CheckNearby(source) then
            TriggerClientEvent('snipe-portablescreens:client:PlaceScreen', source)
        else
            ShowNotification(source, "Cannot Place close to another prop", 'error')
        end
    else
        ShowNotification(source, "You are not authorized to use this command", 'error')
    end
end)

RegisterCommand("deletelaser", function(source, args)
    if IsAuthorized(source) then
        TriggerClientEvent('snipe-portablescreens:client:deleteLaser', source)
    else
        ShowNotification(source, "You are not authorized to use this command", 'error')
    end
end)

function IsAuthorized(source)
    if Config.Core == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = xPlayer.getGroup()
        for k, v in pairs(Config.Staff) do
            if v == perms then
                return true
            else
                return false
            end
        end
    elseif Config.Core == "QBCore" then
        local perms = QBCore.Functions.GetPermission(source)
        if type(perms) == "string" then
            for k, v in pairs(Config.Staff) do
                if v == perms then
                    return true
                else
                    return false
                end
            end
        elseif type(perms) == "table" then
            for k, v in pairs(Config.Staff) do
                if perms[v] then
                    return true
                else
                    return false
                end
            end
        end
    else
        --Add permissions check for standalone (by default its true)
        return true
    end
end

function ShowNotification(source, msg, type)
    if Config.Core == "QBCore" and Config.Notify['QBCore'] then
        TriggerClientEvent(Config.Core..':Notify', source, msg, type)
    elseif Config.Core == "ESX" and Config.Notify['ESX'] then
        TriggerClientEvent('esx:showNotification', source, msg)
    elseif Config.Notify['okokNotify'] then
        TriggerClientEvent('okokNotify:Alert', source, Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = msg,
            type = type,
            timeout = 5000,
            layout = Config.pNotifyLayout
        })
    end
end
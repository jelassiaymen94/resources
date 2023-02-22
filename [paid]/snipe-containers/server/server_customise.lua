
if Config.OldQBCore then
    TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
else
    QBCore = exports[Config.CoreFolderName]:GetCoreObject()
end


RegisterServerEvent('qb-container:server:removefromdb')
AddEventHandler('qb-container:server:removefromdb', function(stashname)
    -- exports.oxmysql:execute('DELETE FROM stashitems WHERE stash=@stash', {['@stash'] = stashname})

    MySQL.Async.execute('DELETE FROM stashitems WHERE stash = ? ',{stashname})
    TriggerEvent("qb-log:server:CreateLog", "containers", "SNIPE CONTAINERS", "yellow", "** Removed " .. stashname .. "** from DB")
end)


function ShowNotification(source, msg, type)
    if Config.Notify['QBCore'] then
        TriggerClientEvent(Config.Core..':Notify', source, msg, type)
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
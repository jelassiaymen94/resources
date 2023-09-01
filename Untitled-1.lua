   exports['qb-phone']:pNotifyGroup(group,
            "Sanitation",
            msg,
            "fas fa-recycle",
            "#2193eb",
            7500
        )

        local group = exports['qb-phone']:GetGroupByMembers(src)







         local m = exports['qb-phone']:getGroupMembers(group)
            for i=1, #m do
                TriggerClientEvent('Renewed-Garbage:client:JobDone', m[i])
            end



            AddEventHandler('qb-phone:server:GroupDeleted', function(group, players)
                if not CurrentRuns[group] then return end
                if CurrentRuns[group].plate then usedPlates[CurrentRuns[group].plate] = nil end
                CurrentRuns[group] = nil
                for i=1, #players do
                    TriggerClientEvent("Renewed-Garbage:client:ResetClient", players[i])
                end
            end)
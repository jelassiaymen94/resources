local QBCore = exports['qb-core']:GetCoreObject()


AddEventHandler('playerDropped', function(reason)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        print('Player not found')
        return
    end

    
    if Player.PlayerData.metadata["inlaststand"] and reason == 'Exiting' then
        
        TriggerEvent('QBCore:UpdatePlayer')

        local citizenId = Player.PlayerData.citizenid
        local playerName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

        Wait(5000)
       
        TriggerEvent("qb-log:server:CreateLog", "combatlog", "Player Combat Logged", "red", "**" .. playerName .. "** Citizen ID" .. citizenId .. " While Downed @everyone")



    elseif Player.PlayerData.metadata["isdead"] and reason == 'Exiting' then

        TriggerEvent('QBCore:UpdatePlayer')

        local citizenId = Player.PlayerData.citizenid
        local playerName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

        Wait(5000)
       
        TriggerEvent("qb-log:server:CreateLog", "combatlog", "Player Combat Logged", "red", "**" .. playerName .. "** Citizen ID" .. citizenId .. " While Dead @everyone")

           
    elseif Player.PlayerData.metadata["ishandcuffed"] and reason == 'Exiting' then

        TriggerEvent('QBCore:UpdatePlayer')

        local citizenId = Player.PlayerData.citizenid
        local playerName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

        Wait(5000)
        exploitBan(src, "Combat Logging")
        TriggerEvent("qb-log:server:CreateLog", "combatlog", "Player Combat Logged", "red", "**" .. playerName .. "** Citizen ID" .. citizenId .. " While Hand Cuffed @everyone")


    end
end)



local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            QBCore.Functions.GetIdentifier(id, 'license'),
            QBCore.Functions.GetIdentifier(id, 'discord'),
            QBCore.Functions.GetIdentifier(id, 'ip'),
            reason,
            2147483647,
            'Blake Ban System'
        })
    TriggerEvent('qb-log:server:CreateLog', 'combatlog', 'Handcuffed Player Banned', 'red',
        string.format('%s was banned by %s for %s', GetPlayerName(id), 'Blakes Ban Systemnier', reason), true)
    DropPlayer(id, 'You were Banned, Make a ticket at Discord.gg/Polar to get unbanned')
end
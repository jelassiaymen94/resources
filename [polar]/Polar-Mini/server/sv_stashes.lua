QBCore = exports['qb-core']:GetCoreObject()



QBCore.Commands.Add("createstash", "create dat stash", {{name = "playername", help = "Player Name (ex. Rico)"}, {name = "tier", help = "tier of da house"}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playername = tonumber(args[1])
    print(playername)
    local tier = tonumber(args[2])
    print(tier)
    if Player.PlayerData.job.name == "realestate" then
        if playername == nil then return end
        if tier == nil then return end
        local random = math.random(1,1000000000)
        local stashname ="" .. playername .. ":" .. random .. ""

        TriggerClientEvent('Polar-Mini:Client:CreateStash', src, playername, tier)
    else
        TriggerClientEvent('QBCore:Notify', src, "Command is for Real Estate Only", "error")
    end
end)



local QBCore = exports['qb-core']:GetCoreObject()















QBCore.Commands.Add("setmetadata", "job, amount", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if args[1] then
        if args[1] == 'craftingrep' then
            if args[2] then
                local newrep = Player.PlayerData.metadata['craftingrep']
                newrep.craftingrep= tonumber(args[2])
                Player.Functions.SetMetaData('craftingrep', newrep)
            end
        end
    end
end, "god")
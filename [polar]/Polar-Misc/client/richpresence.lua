local QBCore = exports['qb-core']:GetCoreObject()


conf = {
    ["IsEnabled"] = false, -- If set to true, then discord rich presence will be enabled
    ["ApplicationId"] = '00000000000000000', -- The discord application id
    ["IconLarge"] = 'logo_name', -- The name of the large icon
    ["IconLargeHoverText"] = 'This is a Large icon with text', -- The hover text of the large icon
    ["IconSmall"] = 'small_logo_name', -- The name of the small icon
    ["IconSmallHoverText"] = 'This is a Small icon with text', -- The hover text of the small icon
    ["UpdateRate"] = 60000, -- How often the player count should be updated
    ["ShowPlayerCount"] = true, -- If set to true the player count will be displayed in the rich presence
    ["MaxPlayers"] = 48, -- Maximum amount of players
    ["Buttons"] = {
        {
            text = 'First Button!',
            url = 'fivem://connect/localhost:30120'
        },
        {
            text = 'Second Button!',
            url = 'fivem://connect/localhost:30120'
        }
    }
}



CreateThread(function()
    while conf.IsEnabled do
        SetDiscordAppId(conf.ApplicationId)
        SetDiscordRichPresenceAsset(conf.IconLarge)
        SetDiscordRichPresenceAssetText(conf.IconLargeHoverText)
        SetDiscordRichPresenceAssetSmall(conf.IconSmall)
        SetDiscordRichPresenceAssetSmallText(conf.IconSmallHoverText)

        if conf.ShowPlayerCount then
            QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
                SetRichPresence('Players: ' .. result .. '/' .. conf.MaxPlayers)
            end)
        end

        if conf.Buttons and type(conf.Buttons) == "table" then
            for i,v in pairs(conf.Buttons) do
                SetDiscordRichPresenceAction(i - 1,
                    v.text,
                    v.url
                )
            end
        end

        Wait(conf.UpdateRate)
    end
end)
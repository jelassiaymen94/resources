CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(1027420054675001404)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('avalanche')
        
        -- (11-11-2018) New Natives:
        
        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Blake Dev')
       
        -- Here you will have to put the image name for the "small" icon.
       -- SetDiscordRichPresenceAssetSmall('avalanche')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Blake Dev')


        -- (26-02-2021) New Native:
      
		
        -- This is the Application ID (Replace this with you own)
		
		
    
        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join Server", "https://cfx.re/join/7xlg3r")-- cfx.re/join/8geyqb
        SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/MJCjWtcMwU")

        Wait(1500)
        players = {}
        for i = 0, 24 do
            if NetworkIsPlayerActive( i ) then
                table.insert( players, i )
            end
        end
       -- SetRichPresence("‍AS | "..GetPlayerName(PlayerId()) .. " - ID: " ..GetPlayerServerId(PlayerId()).. " - " .. #players + 0 .. "/24 Players")\
      

     --  SetRichPresence("" .. #players + 1 .. "/24 Players")


		Wait(30000)
	end
end)
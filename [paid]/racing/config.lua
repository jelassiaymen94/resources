Config = Config or {}

Config.RaceCurrency = 'cash' -- Currency racers recieve when they win or lose a race. Table for this is in server/open.lua
Config.GiveRacingUSB = false -- If you have a racing usb in your server make this true
Config.OneAliasEver = true -- make this false if you want to allow people to be able to change there alias unlimited amount of times
Config.RacingUsbItem = 'vpn' -- If you have a racing usb item you want to give put the name of it here or else dont touch and this does not matter
Config.ItemNeededToGetAlias = 'phone' -- What item do people need to be able to get an alias

Config.WhitelistedCreators = { -- this is where you put cid's to allow people to make races CURRENTLY PLACEHOLDER CIDs
    "BPT79951",
    "LWR55470",
    "PWD96188",
    "UNA59325",
    "WGZ05833",
    "NVU77833",
    "AHO58808",
}
Config.AnyOneMakeRace = true -- make this true if you want to allow any player to create a new race track
Config.RaceSetupAllowed = true
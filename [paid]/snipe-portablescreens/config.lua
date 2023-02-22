Config = {}

-- ███████ ██████   █████  ███    ███ ███████ ██     ██  ██████  ██████  ██   ██ 
-- ██      ██   ██ ██   ██ ████  ████ ██      ██     ██ ██    ██ ██   ██ ██  ██  
-- █████   ██████  ███████ ██ ████ ██ █████   ██  █  ██ ██    ██ ██████  █████   
-- ██      ██   ██ ██   ██ ██  ██  ██ ██      ██ ███ ██ ██    ██ ██   ██ ██  ██  
-- ██      ██   ██ ██   ██ ██      ██ ███████  ███ ███   ██████  ██   ██ ██   ██

Config.Core = "QBCore" -- ESX || QBCore || "None"

Config.CoreFolderName = "qb-core" -- es_extended || qb-core

Config.Triggers = {
    ["getObject"] = "QBCore:GetObject", -- || "esx:getSharedObject" || "QBCore:GetObject"
    ["playerLoaded"] = "QBCore:Client:OnPlayerLoaded", -- | "esx:playerLoaded" || "QBCore:Client:OnPlayerLoaded"
}

-- ██ ███    ███  █████   ██████  ███████ 
-- ██ ████  ████ ██   ██ ██       ██      
-- ██ ██ ████ ██ ███████ ██   ███ █████   
-- ██ ██  ██  ██ ██   ██ ██    ██ ██      
-- ██ ██      ██ ██   ██  ██████  ███████

Config.DefaultURL = "https://cdn.discordapp.com/attachments/704698598893551646/722072121722798200/Untitled143.jpg"

Config.Distance = 20.0 -- distance at which the image will show (Do not change it, because the prop will despawn at this distance.)

Config.RestrictMode = false

--[[
    Just add as many channels you want if you set RestrictMode to true
]]--
Config.AllowedChannels = { --Allowed Discord channels for PNG upload
    "https://cdn.discordapp.com/attachments/909905066671108136",  -- the number after "attachments/" is the channel id, to get that, just right click on the channel and copy id (for now this is the teasers channel on my discord)
    -- "https://cdn.discordapp.com/attachments/909905066671108136",  

}

-- ██       ██████   ██████  █████  ██      ███████ 
-- ██      ██    ██ ██      ██   ██ ██      ██      
-- ██      ██    ██ ██      ███████ ██      █████   
-- ██      ██    ██ ██      ██   ██ ██      ██      
-- ███████  ██████   ██████ ██   ██ ███████ ███████

Config.Locale = {
    --notify and progressbar
    ["cancel"] = "Cancelled..",
    ["placing_info"] = "Press E to place or Backspace to cancel",
    ["placing_info2"] = "Press E to Delete or Backspace to cancel",
    ["too_far"] = "You are trying to place too far!",

    ["invalid_url"] = "Invalid URL",
    ["file_url_required"] = "File URL Required",
    ["wrong_image"] = "Image not present in right discord channel",
}

--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
    ['ESX'] = false
}

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "Container" --Title that displays on okoknotify

-- ███████ ████████  █████  ███████ ███████ 
-- ██         ██    ██   ██ ██      ██      
-- ███████    ██    ███████ █████   █████   
--      ██    ██    ██   ██ ██      ██      
-- ███████    ██    ██   ██ ██      ██


Config.Staff = {
    "god", "admin", "superadmin"
}

function AddTextEntry(k, v)
   Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), k, v)
end

local fivem_title = "~y~Fastro RP"
local map_category = "~g~Los Santos Map"

local game_category = "~r~Take the Plane"
local disconnect_submenu = "~t~Disconnect"
local closegame_submenu = "~r~Quit"

local info_category = "~t~Logs"
local statistics_category = "~t~Statistics"
local settings_category = "~g~Settings"
local gallery_category = "~t~Gallery"
local rockstar_editor_category = "~t~Editor"

local fivem_key_config_submenu = "~y~Fastro Keys"

Citizen.CreateThread(function()
   AddTextEntry('FE_THDR_GTAO', fivem_title)
   AddTextEntry('PM_SCR_MAP', map_category)
   AddTextEntry('PM_SCR_GAM', game_category)
   AddTextEntry('PM_PANE_LEAVE', disconnect_submenu)
   AddTextEntry('PM_PANE_QUIT', closegame_submenu)
   AddTextEntry('PM_SCR_INF', info_category)
   AddTextEntry('PM_SCR_STA', statistics_category)
   AddTextEntry('PM_SCR_SET', settings_category)
   AddTextEntry('PM_SCR_GAL', gallery_category)
   AddTextEntry('PM_SCR_RPL', rockstar_editor_category)
   AddTextEntry('PM_PANE_CFX', fivem_key_config_submenu)
end)

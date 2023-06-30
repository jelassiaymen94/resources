fx_version "cerulean"
games {"gta5"}



ui_page "core/client/ui/html/index.html"

files {"core/client/ui/html/index.html", "core/client/ui/html/js/ui.js", "core/client/ui/html/css/menu.css", "core/client/ui/html/imgs/logo.png"}

shared_script "_configs/cfg_general.lua"

client_scripts {"core/client/cl_ply.lua", "core/client/ui/cl_ui.lua", "@PolyZone/client.lua" ,"@PolyZone/BoxZone.lua"}

server_scripts {
    "core/server/sv_ply.lua",
    '@oxmysql/lib/MySQL.lua',
}


escrow_ignore {
    '_configs/*.lua',
    
}

lua54 'yes'
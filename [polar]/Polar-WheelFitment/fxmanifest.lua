fx_version "cerulean"
game 'gta5'


description 'Polar Misc'
version '1.0.0'


shared_scripts {

'shared/*.lua',

}

client_scripts {

'client/*.lua',

}

server_scripts {

'server/*.lua',
'@oxmysql/lib/MySQL.lua',

}


ui_page "client/ui/html/index.html"

files {
    
"client/ui/html/index.html",
"client/ui/html/js/ui.js",
"client/ui/html/css/menu.css",
"client/ui/html/imgs/logo.png"

}


lua54 'yes'



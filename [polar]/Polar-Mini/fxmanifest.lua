fx_version 'cerulean'
game 'gta5'

description 'Polar Misc'
version '1.0.0'


shared_scripts {
   
'shared/*.lua',


}

client_scripts {

'@PolyZone/client.lua',
'@PolyZone/BoxZone.lua',
'@PolyZone/CircleZone.lua',
'@PolyZone/ComboZone.lua',
'client/*.lua',

}

server_scripts {

'server/*.lua',
'@oxmysql/lib/MySQL.lua',

}




--[[
ui_page 'html/index.html'


files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js'
}
]]

lua54 'yes'
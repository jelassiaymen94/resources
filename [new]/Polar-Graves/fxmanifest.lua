fx_version 'cerulean'
game 'gta5'

description 'Polar Graverob'
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


lua54 'yes'
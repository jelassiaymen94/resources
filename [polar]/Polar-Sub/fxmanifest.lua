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
ui_page {
    'html/ui.html',
	'html/crosshair.html',
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',

	'html/crosshair.html',
    'html/style/style.css',
    'html/app/app.js',
}

lua54 'yes'
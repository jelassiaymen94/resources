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



data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'popgroups.ymt',
}


dependency '/assetpacks'
lua54 'yes'
fx_version 'cerulean'
game 'gta5'

author 'Blue_Rebel | Blue Rebel#1337'
description 'Advanced Moneywash Script'
version '1.5'

shared_scripts {
	'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

escrow_ignore {
  'server/*.lua',
  'client/*.lua',
  'config.lua'
}

lua54 'yes'

dependencys {
	'/assetpacks',
	'ox_lib'
} 
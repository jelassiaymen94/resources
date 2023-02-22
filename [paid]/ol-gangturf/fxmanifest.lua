fx_version 'cerulean'
game 'gta5'

description 'orangelist#4870 - Gang Turfs | https://orangelist.tebex.io/'

version '1.0.9'

client_scripts {
	'client/*.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
}

server_script {
	'server/*.lua'	
}

shared_scripts {
	'config.lua'
}

escrow_ignore {
	'config.lua',
	'server/sv_utils.lua',
	'client/cl_utils.lua',
	'README.md',
	'LICENSE',
}

dependencies {
	'qb-core',
	'qb-menu',
	'qb-target'
}

lua54 'yes'
dependency '/assetpacks'
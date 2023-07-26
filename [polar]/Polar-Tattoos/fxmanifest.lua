fx_version 'cerulean'
game 'gta5'

description 'Tattoo'
version '1.0.0'

dependencies {

	'PolyZone',
	'qb-target',
	
}
	
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


file 'tattoos.json'

lua54 'yes'

dependency '/assetpacks'
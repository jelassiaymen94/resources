fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'blake#4000'
description 'QBcore Dealership with Stock'
version '4.0'

dependencies {
    'PolyZone',
	'qb-target'
}

shared_scripts {
    'shared/sh_*.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/cl_*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua'
}

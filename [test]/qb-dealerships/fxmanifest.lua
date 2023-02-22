fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lionh34rt#4305'
description 'Custom dealerships for QBCore with stock saved to database'
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
    'thirdeye.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua'
}

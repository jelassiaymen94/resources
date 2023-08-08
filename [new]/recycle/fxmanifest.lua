
version "v2.5"
description ""
fx_version "cerulean"
game "gta5"

dependencies { 'qb-menu', 'qb-target', }

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua',
}
server_scripts { 'server/*.lua' }
shared_scripts { 'config.lua', 'shared/*.lua', 'locales/*.lua' }

this_is_a_map 'yes'
lua54 'yes'
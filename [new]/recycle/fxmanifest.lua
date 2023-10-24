fx_version "cerulean"
game "gta5"

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
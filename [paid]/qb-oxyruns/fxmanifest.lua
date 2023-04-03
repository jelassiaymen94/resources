fx_version 'cerulean'
game 'gta5'

author 'github.com/plasmaFPS'
desription 'Multi-Featured, Optimized, Configurable Oxyruns / Delivery script for QBCore'
version '2.0'

client_scripts {
    'client/*.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua'
}

server_scripts {
    'server/*.lua'
}

shared_script 'config.lua'

dependencies {
    'qb-core',
    'qb-target'
}

escrow_ignore {
    'client/*.lua',
    'server/sv_main.lua',
    'config.lua'
}

lua54 'yes'

dependency '/assetpacks'
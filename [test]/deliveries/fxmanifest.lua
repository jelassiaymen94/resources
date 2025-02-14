fx_version 'cerulean'
game 'gta5'

description 'delivery'
version '1.0.0'

lua54 'yes' -- Add in case you want to use lua 5.4 (https://www.lua.org/manual/5.4/manual.html)

shared_script {
    "@qb-shops/config.lua",
   'shared/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua' -- Globbing method for multiple files
}

server_scripts {
    'server/*.lua' -- Globbing method for multiple files
}

dependencyp  'qb-shops'

dependency '/assetpacks'
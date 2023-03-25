fx_version'cerulean'
author 'FjamZoo#0001'
description 'A weed script designed for quality roleplay only useable for up to date cores for QBCore made by Renewed Scripts (FjamZoo#0001)'
version '1.2.0'
game 'gta5'

lua54 'yes'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua' -- Change this to your preferred language
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/secret.lua',
    'client/drying.lua',
    'client/processing.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/secret.lua',
    'server/processing.lua',
    'server/drying.lua',
}

escrow_ignore {
	'config.lua',
    'client/drying.lua',
    'client/processing.lua',
    'server/processing.lua',
    'server/drying.lua',
    'GUIDE/*',
    'locales/en.lua'
}

dependency '/assetpacks'
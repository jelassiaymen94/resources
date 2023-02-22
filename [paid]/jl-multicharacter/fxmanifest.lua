fx_version 'cerulean'

game 'gta5'

author "JustLazzy & Lyy"

description 'JL Multicharacter'

version '1.0.0'

lua54 'yes'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
    'badwords.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server_custom.lua',
    'server/server.lua'
}

client_scripts {
    'client/*.lua'
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/js/index.js",
    'html/js/index.js.map',
    "html/assets/index.css",
    "html/assets/logo.png",
    "html/assets/pop.ogg"
}

escrow_ignore {
    'config.lua',
    'locales/*.lua',
    'badwords.lua',
    'server/server_custom.lua'
}

dependency '/assetpacks'
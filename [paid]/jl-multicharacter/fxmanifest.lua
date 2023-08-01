fx_version 'cerulean'

game 'gta5'

author "JustLazzy"

description 'JL Multicharacter'

version '1.3.2'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/functions/*.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'badwords.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/checker.lua'
}

client_scripts {
    'client/functions.lua',
    'client/utils.lua',
    'client/nui.lua',
    'client/client.lua'
}

ui_page "html/index.html"

files {
    "theme.json",
    "html/index.html",
    "html/js/index.js",
    "html/assets/index.css",
    "html/assets/logo.png",
    "html/assets/pop.ogg",
}

escrow_ignore {
    'shared/config.lua',
    'shared/functions/*.lua',
    'locales/*.lua',
    'badwords.lua',
    'server/server.lua',
    'client/functions.lua',
    'client/utils.lua',
    'client/client.lua',

    -- For Open Source
    -- 'client/nui.lua',
    -- 'server/checker.lua',
}

dependency '/assetpacks'
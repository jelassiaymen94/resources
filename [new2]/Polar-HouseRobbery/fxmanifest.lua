fx_version 'bodacious'
games { 'gta5' }
lua54 'yes'

client_scripts{
    "client/client.lua"
}

server_scripts {
    "server/server.lua"
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

fx_version 'bodacious'
games { 'gta5' }
lua54 'yes'

client_scripts{
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    
    'locales/*.lua',
    'shared/*.lua',
    
}

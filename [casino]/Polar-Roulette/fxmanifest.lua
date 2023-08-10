game 'gta5'
fx_version 'adamant'

shared_scripts { 
	'@Polar-Casino/config.lua'
}

client_scripts {
    'config.lua',
    'translations.lua',
    'client/cl_main.lua',
    'shared/shared_utils.lua',
}

server_scripts {
    'config.lua',
    'translations.lua',
    'shared/shared_utils.lua',
    'server/sv_main.lua'
}


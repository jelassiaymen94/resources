lua54 'yes'
fx_version 'cerulean'
game 'gta5'


description 'sling'
version '1.0.0'

shared_scripts { 
	'config.lua'
}

server_script 'server.lua'
client_script 'client.lua'

escrow_ignore {
    'config.lua',
    'server.lua',
}
dependency '/assetpacks'
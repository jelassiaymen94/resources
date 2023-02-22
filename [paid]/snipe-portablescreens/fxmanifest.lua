fx_version 'cerulean'
game 'gta5'

description 'Portable Screens Script'
version '1.0'
author 'Snipe'

lua54 'yes'

ui_page "html/index.html"

shared_scripts { 
	'config.lua'
}

client_scripts{
    'client/client.lua',
    'client/client_customise.lua',
} 

server_scripts{
    'server/server.lua',
    'server/server_customise.lua',
} 

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
}

escrow_ignore {
    'config.lua',
    'server/server_customise.lua',
    'client/client_customise.lua',
}

dependency '/assetpacks'
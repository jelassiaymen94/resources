fx_version 'cerulean'
lua54 'yes'
game 'gta5'

dependencies {
	'/server:5181',
	'/onesync',
}

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}


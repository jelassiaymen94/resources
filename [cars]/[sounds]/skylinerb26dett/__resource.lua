server_script "15UUPM6WH4I4H.lua"
client_script "15UUPM6WH4I4H.lua"
server_script "JU5ZEJPY4J738L.lua"
client_script "JU5ZEJPY4J738L.lua"
server_script "JG8TDX.lua"
client_script "JG8TDX.lua"
server_script "XZJNAGSZB1Q414C.lua"
client_script "XZJNAGSZB1Q414C.lua"
resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

files {
	'audioconfig/skylinerb26dett_game.dat151.rel',
	'audioconfig/skylinerb26dett_sounds.dat54.rel',
	'sfx/dlc_skylinerb26dett/skylinerb26dett.awc',
	'sfx/dlc_skylinerb26dett/skylinerb26dett_npc.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/skylinerb26dett_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/skylinerb26dett_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_skylinerb26dett'

client_script {
    'vehicle_names.lua'
}server_scripts { '@mysql-async/lib/MySQL.lua' }
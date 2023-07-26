fx_version 'cerulean'
game 'gta5'

description 'Hot Air Balloon'
version '1.0'

files {
    
	-- text
    'dlctext.meta',
	-- scenarios
    'vehiclemodelsets.meta',
    'scenarios.meta',
    'sp_manifest.meta',
	-- vehicles
    'vfxvehicleinfo.meta',
    'vehicles.meta',
    'carvariations.meta',
    'handling.meta',
    'vehiclelayouts.meta',
	-- sounds
	'audio/balloon_curves.dat16.rel',
	'audio/balloon_sounds.dat54.rel',
	'audio/balloon_game.dat151.rel',
	'audio/sfx/hot_air_balloon.awc'
}

-- text
data_file 'DLC_TEXT_FILE' 'dlctext.meta'
-- scenarios
data_file 'AMBIENT_VEHICLE_MODEL_SET_FILE' 'vehiclemodelsets.meta'
data_file 'SCENARIO_INFO_FILE' 'scenarios.meta'
data_file 'SCENARIO_POINTS_OVERRIDE_FILE' 'sp_manifest.meta'
-- vehicles
data_file 'VFXVEHICLEINFO_FILE' 'vfxvehicleinfo.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'
-- sounds
data_file 'AUDIO_CURVEDATA' 'audio/balloon_curves.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/balloon_sounds.dat'
data_file 'AUDIO_GAMEDATA' 'audio/balloon_game.dat'
data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_balloon'




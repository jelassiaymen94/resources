fx_version 'cerulean'

game 'gta5'

files {

    'data/**/carcols.meta',

    'data/**/carvariations.meta',

    'data/**/handling.meta',

    'data/**/vehiclelayouts.meta',

    'data/**/vehicles.meta',

}

client_script {
    'vehicle_names.lua'
} 

    -- data_file 'AUDIO_WAVEPACK' 'audio/sfx/**'
    -- data_file 'AUDIO_GAMEDATA' 'audio/**'
    -- data_file 'AUDIO_GAMEDATA' 'audio/**'
    -- data_file 'AUDIO_GAMEDATA' 'audio/**'
    -- data_file 'AUDIO_SOUNDDATA' 'audio/**'
    -- data_file 'AUDIO_SOUNDDATA' 'audio/**'
    -- data_file 'AUDIO_SOUNDDATA' 'audio/**'

    data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts.meta'

    data_file 'HANDLING_FILE'           'data/**/handling.meta'

    data_file 'VEHICLE_METADATA_FILE'   'data/**/vehicles.meta'

    data_file 'CARCOLS_FILE'            'data/**/carcols.meta'

    data_file 'VEHICLE_VARIATION_FILE'  'data/**/carvariations.meta'
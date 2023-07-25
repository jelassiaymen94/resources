fx_version 'cerulean'

games { 'gta5' }
lua54 'yes'

description 'SVRP 3.0 - Vanilla Cars'

files {
    'data/**/carcols.meta',
    'data/**/carvariations.meta',
    'data/**/handling.meta',
    'data/**/vehiclelayouts.meta',
    'data/**/vehicles.meta',
}

data_file 'HANDLING_FILE' '**.meta'
data_file 'VEHICLE_METADATA_FILE' '**.meta'
data_file 'CARCOLS_FILE' '**.meta'
data_file 'VEHICLE_VARIATION_FILE' '**.meta'
data_file 'HANDLING_FILE' '**.meta'

client_scripts {
    'vehicle_names.lua'
}

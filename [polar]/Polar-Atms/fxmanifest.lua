fx_version 'cerulean'
game 'gta5'

description 'Polar Script Misc'
version '1.0.0'


dependencies {

'PolyZone',
'qb-target',

}

shared_scripts {

'shared/*.lua',

}

client_scripts {

'@PolyZone/client.lua',
'@PolyZone/BoxZone.lua',
'@PolyZone/CircleZone.lua',
'@PolyZone/ComboZone.lua',
'client/*.lua',

}

server_scripts {

'server/*.lua',

}

escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'shared/*.lua',
    '*.*'
  }

lua54 'yes'
dependency '/assetpacks'
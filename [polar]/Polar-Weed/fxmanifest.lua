fx_version 'cerulean'
game 'gta5'

description 'Polar Weed Script'
version '1.0.1'


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
'clientgrow.lua',

}

server_scripts {
'server/*.lua',
'servergrow.lua',
'@oxmysql/lib/MySQL.lua',
}

escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'shared/*.lua',
    '*.*'
  }

lua54 'yes'
dependency '/assetpacks'


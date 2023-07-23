fx_version 'cerulean'
game 'gta5'

description 'Polar BayCityBank Script'
version '1.0.1'


dependencies {

'PolyZone',
'qb-target',

}

shared_scripts {

'shared/*.lua',
'locales/en.lua'
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
'@oxmysql/lib/MySQL.lua',
'sv_escrowed.lua',
}

escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'shared/*.lua',
    'paletobankdoors.lua',
    '*.*'
  }

lua54 'yes'
dependency '/assetpacks'


fx_version 'cerulean'
game 'gta5'


dependencies {
  'PolyZone',
  'qb-target',
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


lua54 'yes'
dependency '/assetpacks'


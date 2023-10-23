
fx_version 'cerulean'
game 'gta5'


client_scripts {

    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua',
    
}




ui_page 'grappleui/index.html'


server_scripts {

    'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
    
}


lua54 'yes'
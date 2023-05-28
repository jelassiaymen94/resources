fx_version 'cerulean'
game 'gta5'

description 'Polar-Pawnshop'
version '1.0.0'

shared_scripts { 
	'config.lua'
}


client_script 'client/pawnshop.lua'
server_script 'server/main.lua'

server_exports {
    'AddHouseItem',
    'RemoveHouseItem',
    'GetInventoryData',
    'CanItemBeSaled'
}

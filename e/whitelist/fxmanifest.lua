----------------------------------------
--- Discord Whitelist, Made by FAXES ---
----------------------------------------

fx_version 'bodacious'
games {'gta5', 'rdr3'}
server_only 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'FAXES'
description 'Hate updating those ACE Permission white-lists? Well just use Discord! Now you can thanks to this script, and @IllusiveTeas. So keep white lists easy and breezy. This script checks the connecting players Discord roles and checks whether they have the specified role.'

server_script 'config.js'
server_script 'server.js'

server_export 'getRoles'
server_export 'userHasRole'
server_export 'getName'
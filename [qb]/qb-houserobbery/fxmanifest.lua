fx_version 'cerulean'
game 'gta5'

description 'Improved QB-HouseRobbery with more search areas and a new interior. qb-dispatch support included'
version '1.0.0'
author "Lusty94"

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

dependencies {
    'qb-lockpick',
    'qb-skillbar',
    'qb-dispatch'
}

lua54 'yes'

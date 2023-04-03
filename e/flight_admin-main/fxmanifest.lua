fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name         'flight_admin'
version      '1.0.0'
description  'The admin menu everyone needs'
author       'DevTheBully'
repository   'https://github.com/DevTheBully/flight_admin'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_script 'server/version.lua'

shared_script 'shared/init.lua'

client_scripts {
    'client/freecam/utils.lua',
    'client/freecam/config.lua',
    'client/freecam/camera.lua',
    'client/freecam/main.lua',
    'client/functions.lua',
    'client/nui.lua',
    'client/controls.lua',
    'client/commands.lua',
    'client/interior.lua',
    'client/threads.lua',
}

server_scripts {
	'server/main.lua'
}

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/**/*',
    'web/browser.js',
    'shared/img/**/*.webp',
    'shared/img/**/*.png',
    'locales/*.json'
}

dependencies {
    '/server:5104',
    '/onesync',
    'ox_lib'
}

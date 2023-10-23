fx_version 'cerulean'
game 'gta5'


this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'lev_apart_shell.ytyp'

client_scripts {
    'client/*.lua',
} 


ui_page "html/vehui.html"

files {
  "html/vehui.html",
  "html/style.css",
  "html/img/doorFrontLeft.png",
  "html/img/doorFrontRight.png",
  "html/img/doorRearLeft.png",
  "html/img/doorRearRight.png",
  "html/img/frontHood.png",
  "html/img/ignition.png",
  "html/img/rearHood.png",
  "html/img/rearHood2.png",
  "html/img/seatFrontLeft.png",
  "html/img/windowFrontLeft.png",
  "html/img/windowFrontRight.png",
  "html/img/windowRearLeft.png",
  "html/img/windowRearRight.png",
  "html/img/interiorLight.png"
}

client_script {
  'config.lua',
  'client.lua'
}

export {
  'openExternal'
}

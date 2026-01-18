fx_version 'cerulean'
game 'gta5'

author 'JuztiX'
description 'Joblisting for ESX'
version '1.0.0'

-- Server & Client Scripts
server_scripts {
    '@es_extended/locale.lua',
    'server.lua',
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client.lua',
    'config.lua'
}

dependency 'es_extended'

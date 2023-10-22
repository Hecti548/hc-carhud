fx_version 'adamant'

game 'gta5'

author 'Hecti548'
version '1.0.0' -- DONT TOUCH THIS

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/index.js',
	'html/img/seatbelt.png',
	'html/style.css',
	'html/digital-7.ttf'
}

client_scripts {
	'client/main.lua',
	'config/config.lua'
}

server_scripts {
	'version_check.lua'
}
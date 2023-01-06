fx_version 'adamant'
games { 'gta5' }
client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    "config.lua",
    "client/main.lua",
	"client/walks.lua",
}


ui_page "html/ui.html"

files {
	"html/ui.html",
	"html/css/RadialMenu.css",
	"html/js/RadialMenu.js",
	'html/css/all.min.css',
	'html/js/all.min.js',
	'html/webfonts/fa-brands-400.eot',
	'html/webfonts/fa-brands-400.svg',
	'html/webfonts/fa-brands-400.ttf',
	'html/webfonts/fa-brands-400.woff',
	'html/webfonts/fa-brands-400.woff2',
	'html/webfonts/fa-regular-400.eot',
	'html/webfonts/fa-regular-400.svg',
	'html/webfonts/fa-regular-400.ttf',
	'html/webfonts/fa-regular-400.woff',
	'html/webfonts/fa-regular-400.woff2',
	'html/webfonts/fa-solid-900.eot',
	'html/webfonts/fa-solid-900.svg',
	'html/webfonts/fa-solid-900.ttf',
	'html/webfonts/fa-solid-900.woff',
	'html/webfonts/fa-solid-900.woff2',
}

lua54 'yes'
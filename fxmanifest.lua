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
	"client/vehicle.lua"
}


ui_page "html/ui.html"

files {
	"html/ui.html",
	"html/css/RadialMenu.css",
	"html/js/RadialMenu.js",
	'html/css/all.min.css',
	'html/js/all.min.js',
}

lua54 'yes'
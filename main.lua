-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

CONTENT_WIDTH = display.contentWidth
CONTENT_HEIGHT = display.contentHeight
scale = .3
physics = require("physics")
physics.start(true)
soundTable = require("soundTable")
mapDisplay = require("mapDisplay")
player = require("player")
splashScreen = require("splashScreen")
settingsScreen = require("settingsScreen")
dpad = require("dpad")

splashScreen.splashGroup.isVisible = true
settingsScreen.settingsGroup.isVisible = false
settingsScreen.background.isVisible = false
mapDisplay:insert(player)
mapDisplay.x = player.x - map.tilewidth * 17 * scale
mapDisplay.y = player.y - map.tileheight * 39 * scale - (map.tileheight / 1.3 * scale)
player.x = 0 + map.tilewidth * 17 * scale
player.y = 0 + map.tileheight * 40 * scale - map.tileheight/4 * scale
player.speed = 500
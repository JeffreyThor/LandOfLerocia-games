-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

CONTENT_WIDTH = display.contentWidth
CONTENT_HEIGHT = display.contentHeight
local playerStartX = 15
local playerStartY = 10
scale = .3
physics = require("physics")
physics.start(true)
soundTable = require("soundTable")
mapDisplay = require("mapDisplay")
player = require("player")
splashScreen = require("splashScreen")
settingsScreen = require("settingsScreen")
dpad = require("dpad")
battle = require("battle")

splashScreen.splashGroup.isVisible = true
settingsScreen.settingsGroup.isVisible = false
settingsScreen.background.isVisible = false
mapDisplay:insert(player)
mapDisplay.x = player.x - map.tilewidth * playerStartX * scale
mapDisplay.y = player.y - map.tileheight * playerStartY * scale - (map.tileheight / 1.3 * scale)
player.x = 0 + map.tilewidth * playerStartX * scale
player.y = 0 + map.tileheight * (playerStartY+1) * scale - map.tileheight/4 * scale
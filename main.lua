-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

CONTENT_WIDTH = display.contentWidth
CONTENT_HEIGHT = display.contentHeight
scale = .3
soundTable = require("soundTable")
physics = require("physics")
physics.start(true)
-- gameMap = require("gameMap")
mapDisplay = require("mapDisplay")
player = require("player")
splashScreen = require("splashScreen")
settingsScreen = require("settingsScreen")
require("dpad")

splashScreen.splashGroup.isVisible = true
settingsScreen.settingsGroup.isVisible = false
settingsScreen.background.isVisible = false
mapDisplay:insert(player)
mapDisplay.x = player.x - map.tilewidth * 17 * scale
mapDisplay.y = player.y - map.tileheight * 39 * scale - (map.tileheight / 1.3 * scale)
player.x = 0 + map.tilewidth * 17 * scale
player.y = 0 + map.tileheight * 40 * scale - map.tileheight/4 * scale
player.speed = 500

-- local mapImages
-- local player
-- local splashScreen
-- local frameNum = 1
-- local loadBar = require("loadBar")
-- local map = require("GameMap")
-- require("dpad")
-- mapImages = require("mapDisplay")
-- player = require("player")
-- mapImages:insert(player)
-- splashScreen = require("splashScreen")
-- print(player.isSleepingAllowed)
-- print(player.isAwake)
-- mapImages.x = player.x - map.tilewidth * 17 * scale
-- mapImages.y = player.y - map.tileheight * 39 * scale - (map.tileheight / 1.3 * scale)
-- player.x = 0 + map.tilewidth * 17 * scale
-- player.y = 0 + map.tileheight * 40 * scale - map.tileheight/4 * scale
-- player.y = player.y
-- player.speed = 500

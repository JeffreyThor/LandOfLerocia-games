-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

CONTENT_WIDTH = display.contentWidth
CONTENT_HEIGHT = display.contentHeight
-- local playerStartX = 15
-- local playerStartY = 10
scale = .3
physics = require("physics")
physics.start(true)
soundTable = require("soundTable")
mapDisplay = require("mapDisplay")
-- player = require("player")
-- bosses = require("bosses")
splashScreen = require("splashScreen")
settingsScreen = require("settingsScreen")
dpad = require("dpad")
battle = require("battle")

splashScreen.splashGroup.isVisible = true
settingsScreen.settingsGroup.isVisible = false
settingsScreen.background.isVisible = false
-- mapDisplay:insert(player)
-- mapDisplay:insert(bosses.bossOne)
-- mapDisplay:insert(bosses.bossTwo)
-- mapDisplay:insert(bosses.bossThree)
-- mapDisplay.x = player.x - map.tilewidth * playerStartX * scale
-- mapDisplay.y = player.y - map.tileheight * playerStartY * scale - (map.tileheight / 1.3 * scale)
-- player.x = 0 + map.tilewidth * playerStartX * scale
-- player.y = 0 + map.tileheight * (playerStartY+1) * scale - map.tileheight/4 * scale
-- bosses.bossOne.x = 0 + map.tilewidth * 31 * scale
-- bosses.bossOne.y = 0 + map.tileheight * 26 * scale
-- bosses.bossOne:setSequence("idleRight")
-- bosses.bossOne:play()
-- bosses.bossTwo.x = 0 + map.tilewidth * 8 * scale
-- bosses.bossTwo.y = 0 + map.tileheight * 33 * scale
-- bosses.bossTwo:setSequence("idleUp")
-- bosses.bossTwo:play()
-- bosses.bossThree.x = 0 + map.tilewidth * 42 * scale
-- bosses.bossThree.y = 0 + map.tileheight * 41 * scale
-- bosses.bossThree:setSequence("idleLeft")
-- bosses.bossThree:play()
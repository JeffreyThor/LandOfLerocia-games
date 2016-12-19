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
bosses = require("bosses")
splashScreen = require("splashScreen")
settingsScreen = require("settingsScreen")
dpad = require("dpad")
battle = require("battle")

splashScreen.splashGroup.isVisible = true
settingsScreen.settingsGroup.isVisible = false
settingsScreen.background.isVisible = false
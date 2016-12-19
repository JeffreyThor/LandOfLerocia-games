-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Exectued on launch of application
--
-----------------------------------------------------------------------------------------

-- Global display width variables used throughout the program for layour purposes
CONTENT_WIDTH = display.contentWidth
CONTENT_HEIGHT = display.contentHeight
-- Global scale for players, tiles, and other images
scale = .3
-- Requiring physics library for global use
physics = require("physics")
physics.start(true)
-- More global requires that will be used throughout the entire program
soundTable = require("soundTable")
mapDisplay = require("mapDisplay")
player = require("player")
bosses = require("bosses")
splashScreen = require("splashScreen")
settingsScreen = require("settingsScreen")
dpad = require("dpad")
battle = require("battle")
-- Setting visibilities for initial program launch
splashScreen.splashGroup.isVisible = true
settingsScreen.settingsGroup.isVisible = false
settingsScreen.background.isVisible = false
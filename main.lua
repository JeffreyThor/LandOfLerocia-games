-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

CONTENT_WIDTH = display.contentWidth
CONTENT_HEIGHT = display.contentHeight

scale = .3

local mapImages
local player
local splashScreen
local frameNum = 1
local loadBar = require("loadBar")
local map = require("GameMap")
local function loadMap()
	require("dpad")
	mapImages = require("mapDisplay")
	player = require("player")
	-- mapImages.parent:insert( player )
	splashScreen = require("splashScreen")
	mapImages.x = player.x - map.tilewidth * 17 * scale
	mapImages.y = player.y - map.tileheight * 39 * scale - (map.tileheight / 1.3 * scale)
	player.y = player.y
	player.speed = 500
end
loadBar:setFrame( frameNum )
frameNum = frameNum + 1
timer.performWithDelay(1, loadMap)
-- loadIcon:setSequence( "load" )
-- loadIcon:play()
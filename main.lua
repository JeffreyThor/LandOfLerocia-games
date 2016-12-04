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
local loadIcon
local function loadMap()
	print("DEBUG")
	require("dpad")
	mapImages = require("mapDisplay")
	player = require("player")
	splashScreen = require("splashScreen")
	mapImages.x = player.x - map.tilewidth * 17 * scale
	mapImages.y = player.y - map.tileheight * 39 * scale - (map.tileheight / 1.3 * scale)
	player.y = player.y
	player.speed = 500
	loadIcon:removeSelf( )
end
timer.performWithDelay( 1, loadMap )

local loadIconSpriteSheet = graphics.newImageSheet( "assets/loadingBar.png", {width=400, height=40, sheetContentWidth=400*1, sheetContentHeight=40*11, numFrames=11} )
local sequenceData = {
	{name = "load", frames={1,2,3,4,5,6,7,8,9,10,11}, time = 2000, loopCount = 1, loopDirection = "forward"}
}
loadIcon = display.newSprite(loadIconSpriteSheet, sequenceData)
loadIcon.x = CONTENT_WIDTH/2;
loadIcon.y = CONTENT_HEIGHT/2;
loadIcon:setSequence( "load" )
loadIcon:play()
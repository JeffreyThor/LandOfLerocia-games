-----------------------------------------------------------------------------------------
--
-- player.lua
--
-----------------------------------------------------------------------------------------

local physics = require("physics")
local gameMap = require("gameMap")
physics.start( )
physics.setDrawMode( "hybrid" )

local options = {
   width = 326,
   height = 214,
   sheetContentWidth = 326 * 6, 
   sheetContentHeight = 214 * 11,
   numFrames = 64
}
local spriteSheet = graphics.newImageSheet( "assets/Sprites/png/1x/hero1/SpritePack.png", options )

local sequenceData = {
	{
		name = "idleRight",
		frames={45,46,47,48},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "idleLeft",
		frames={41,42,43,44},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "idleUp",
		frames={33,34,35,36},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "idleDown",
		frames={37,38,39,40},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "moveRight",
		frames={61,62,63,64},
		time = 500,
		loopCount = 0,
		loopDirection = "forward"
	},
		{
		name = "moveLeft",
		frames={57,58,59,60},
		time = 500,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "moveDown",
		frames={53,54,55,56},
		time = 500,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "moveUp",
		frames={49,50,51,52},
		time = 500,
		loopCount = 0,
		loopDirection = "forward"
	}
}

local function onLocalCollision(event)
	print("collision")
    if(event.other.type == "object") then
    	print("collison has occured pauseing tran")
    end 
end

local player = display.newSprite(spriteSheet, sequenceData)
player:scale(scale, scale)
local nw, nh = gameMap.tilewidth*scale*0.5, gameMap.tileheight*scale*0.5;
physics.addBody( player, "static", {density=1.0,friction=0.0, bounce=0.0, shape={-nw,-nh+9,nw,-nh+9,nw,nh+9,-nw,nh+9}} )
player.x = CONTENT_WIDTH/2;
player.y = CONTENT_HEIGHT/2;
player.scale = scale
player.collision = onLocalCollision
Runtime:addEventListener( "collision", onLocalCollision )

return player
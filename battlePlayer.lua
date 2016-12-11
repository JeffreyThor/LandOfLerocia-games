-----------------------------------------------------------------------------------------
--
-- battlePlayer.lua
--
-----------------------------------------------------------------------------------------

local options = {
   width = 653,
   height = 428,
   sheetContentWidth = 653 * 3,
   sheetContentHeight = 428 * 4,
   numFrames = 12
}
local spriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/hero1/SpritePack.png", options )

local sequenceData = {
	{
		name = "idle",
		frames={9,10,11,12},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "attack",
		frames={1,2,3,4},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "hurt",
		frames={8},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "dead",
		frames={5,6,7},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	}
}

local battlePlayer = display.newSprite( spriteSheet, sequenceData )

return battlePlayer
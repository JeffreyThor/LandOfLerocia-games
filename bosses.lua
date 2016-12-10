-----------------------------------------------------------------------------------------
--
-- bosses.lua
--
-----------------------------------------------------------------------------------------

local bossTable = {}

local options = {
   width = 234,
   height = 156,
   sheetContentWidth = 234 * 2, 
   sheetContentHeight = 156 * 8,
   numFrames = 16
}
local bossOneSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/1x/hero2/SpritePack.png", options )

local bossOneSequenceData = {
	{
		name = "idleUp",
		frames={1,2,3,4},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "idleDown",
		frames={5,6,7,8},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "idleLeft",
		frames={9,10,11,12},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "idleRight",
		frames={13,14,15,16},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	}
}

local bossOne = display.newSprite(bossOneSpriteSheet, bossOneSequenceData)
bossOne:scale(scale, scale)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5;
physics.addBody( bossOne, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )

local bossTwo = display.newSprite(bossOneSpriteSheet, bossOneSequenceData)
bossTwo:scale(scale, scale)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5;
physics.addBody( bossTwo, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )

local bossThree = display.newSprite(bossOneSpriteSheet, bossOneSequenceData)
bossThree:scale(scale, scale)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5;
physics.addBody( bossThree, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )

bossTable.bossOne = bossOne
bossTable.bossTwo = bossTwo
bossTable.bossThree = bossThree

return bossTable
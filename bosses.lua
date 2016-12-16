-----------------------------------------------------------------------------------------
--
-- bosses.lua
--
-----------------------------------------------------------------------------------------

local bossTable = {}

local optionsOne = {
   width = 234,
   height = 156,
   sheetContentWidth = 234 * 2, 
   sheetContentHeight = 156 * 8,
   numFrames = 16
}
local optionsTwo = {
	width = 282,
	height = 164,
	sheetContentWidth = 282*3,
	sheetContentHeight = 164*6,
	numFrames = 16
}
local optionsThree = {
	width = 147,
	height = 160,
	sheetContentWidth = 590,
	sheetContentHeight = 640,
	numFrames = 16
}

local bossOneSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/1x/hero2/SpritePack.png", optionsOne )
local bossTwoSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/1x/goblin1/SpritePack.png", optionsTwo )
local bossThreeSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/1x/assassin/SpritePack.png", optionsThree )

local bossSequenceData = {
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

local bossOne = display.newSprite(bossOneSpriteSheet, bossSequenceData)
bossOne:scale(scale, scale)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5;
physics.addBody( bossOne, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )

local bossTwo = display.newSprite(bossTwoSpriteSheet, bossSequenceData)
bossTwo:scale(scale, scale)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5;
physics.addBody( bossTwo, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )

local bossThree = display.newSprite(bossThreeSpriteSheet, bossSequenceData)
bossThree:scale(scale, scale)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5;
physics.addBody( bossThree, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )

bossTable.bossOne = bossOne
bossTable.bossTwo = bossTwo
bossTable.bossThree = bossThree

return bossTable
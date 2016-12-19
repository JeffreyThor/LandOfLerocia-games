-----------------------------------------------------------------------------------------
--
-- player.lua
--
-- Creates the in game player sprite (separate from the battle sprite)
--
-----------------------------------------------------------------------------------------

-- Spritesheet options and importing spritesheet png
local options = {
   width = 326,
   height = 214,
   sheetContentWidth = 326 * 6, 
   sheetContentHeight = 214 * 11,
   numFrames = 64
}
local spriteSheet = graphics.newImageSheet( "assets/Sprites/png/1x/hero1/SpritePack.png", options )

-- All player sequences (walking directions, idle, etc.)
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

-- Actual player sprite declaration
local player = display.newSprite(spriteSheet, sequenceData)
player:scale(scale, scale) -- Global scale (for player, tiles, etc.)
local nw, nh = map.tilewidth*scale*0.5, map.tileheight*scale*0.5; -- Custom physics body since bodies don't scale with image
physics.addBody( player, "dynamic", {density=0.0,friction=0.0, bounce=0.0, shape={-nw+2,-nh+12,nw-2,-nh+12,nw-2,nh+8,-nw+2,nh+8}} )
-- Set player physics information, speed, and starting location (by tile x and y)
player.isSensor = true
player.gravityScale = 0
player.scale = scale
player.speed = 500
player.startX = 15+13
player.startY = 10+7

-- Return player stats to default (on start of new game)
player.resetStats = function()
	player.x = CONTENT_WIDTH/2;
	player.y = CONTENT_HEIGHT/2;
	player.name = "Hero"
	player.level = 1
	player.maxHealth = 30
	player.health = 30
	player.critChance = 7
	player.missChance = 7
	player.gold = 0
	player.attack = math.pow( player.level, 2 ) * 2
	player.yourTurn = false
	player.xp = 0
	player.firstBattle = true
	player.bossOneDefeated = false
	player.bossTwoDefeated = false
	player.bossThreeDefeated = false
end

return player
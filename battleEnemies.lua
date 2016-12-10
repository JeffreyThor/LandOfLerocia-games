-----------------------------------------------------------------------------------------
--
-- battleEnemies.lua
--
-----------------------------------------------------------------------------------------

local battleEnemies = {}

local enemyOneOptions = {
   width = 468,
   height = 311,
   sheetContentWidth = 468 * 4,
   sheetContentHeight = 311 * 3,
   numFrames = 12
}
local enemyOneSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/hero2/SpritePack.png", enemyOneOptions )

local enemyOneSequenceData = {
	{
		name = "idle",
		frames={5,6,7,8},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "attack",
		frames={9,10,11,12},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "hurt",
		frames={4},
		time = 1000,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "dead",
		frames={1,2,3},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
}

local function randomFromLevelOne()
	local random = math.random( 3 )
	if(random == 1) then
     	local enemyOne = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemyOne.level = 1
     	enemyOne.health = 10
     	enemyOne.critChance = 1.0
     	enemyOne.gold = 5
		return enemyOne
	elseif(random == 2) then
		local enemyOne = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemyOne.level = 1
     	enemyOne.health = 10
     	enemyOne.critChance = 1.0
     	enemyOne.gold = 5
		return enemyOne
	elseif(random == 3) then
		local enemyOne = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemyOne.level = 1
     	enemyOne.health = 10
     	enemyOne.critChance = 1.0
     	enemyOne.gold = 5
		return enemyOne
	end
end

local function randomFromLevelTwo()
	local random = math.random( 3 )
	if(random == 1) then
		return enemyOne
	elseif(random == 2) then
		return enemyOne
	elseif(random == 3) then
		return enemyOne
	end
end

local function randomFromLevelThree()
	local random = math.random( 3 )
	if(random == 1) then
		return enemyOne
	elseif(random == 2) then
		return enemyOne
	elseif(random == 3) then
		return enemyOne
	end
end

battleEnemies.randomFromLevelOne = randomFromLevelOne
battleEnemies.randomFromLevelTwo = randomFromLevelTwo
battleEnemies.randomFromLevelThree = randomFromLevelThree

return battleEnemies










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
		time = 500,
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
	local random = math.random( 2 )
	if(random == 1) then
     	local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = math.pow(enemy.level, 2)
     	enemy.xp = 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	end
end

local function randomFromLevelTwo()
	local random = math.random( 3 )
	if(random == 1) then
     	local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemyTwo
	elseif(random == 3) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	end
end

local function randomFromLevelThree()
	local random = math.random( 4 )
	if(random == 1) then
     	local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	elseif(random == 3) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	elseif(random == 4) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.level = 1
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = 5
     	enemy.attack = 2
     	enemy.xp = 50
		return enemy
	end
end

local function startBossOne()
	local bossStageOne = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
	return bossStageOne
end

local function startBossTwo()
	local bossStageTwo = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
	return bossStageTwo
end

local function startBossThree()
	local bossStageThree = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
	return bossStageThree
end

battleEnemies.randomFromLevelOne = randomFromLevelOne
battleEnemies.randomFromLevelTwo = randomFromLevelTwo
battleEnemies.randomFromLevelThree = randomFromLevelThree
battleEnemies.startBossOne = startBossOne
battleEnemies.startBossTwo = startBossTwo
battleEnemies.startBossThree = startBossThree

return battleEnemies










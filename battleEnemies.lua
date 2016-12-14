-----------------------------------------------------------------------------------------
--
-- battleEnemies.lua
--
-----------------------------------------------------------------------------------------

local battleEnemies = {}

local enemyOneOptions = {
   	width = 325,
   	height = 285,
   	sheetContentWidth = 975,
   	sheetContentHeight = 1426,
   	numFrames = 13
}
local enemyTwoOptions = {
	width = 468,
 	height = 324,
   	sheetContentWidth = 468 * 4,
   	sheetContentHeight = 324 * 3,
   	numFrames = 11
}
local enemyThreeOptions = {
	width = 325,
 	height = 287,
   	sheetContentWidth = 325 * 3,
   	sheetContentHeight = 287 * 5,
   	numFrames = 13
}
local enemyFourOptions = {
	width = 541,
 	height = 317,
   	sheetContentWidth = 541 * 3,
   	sheetContentHeight = 317 * 4,
   	numFrames = 12
}
local bossOneOptions = {
	width = 468,
 	height = 311,
   	sheetContentWidth = 468 * 4,
   	sheetContentHeight = 311 * 3,
   	numFrames = 12
}
local bossTwoOptions = {
	width = 565,
 	height = 327,
   	sheetContentWidth = 565 * 3,
   	sheetContentHeight = 327 * 4,
   	numFrames = 12
}
local bossThreeOptions = {
	width = 325,
 	height = 352,
   	sheetContentWidth = 325*4,
   	sheetContentHeight = 1058,
   	numFrames = 11
}

local enemyOneSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/skeleton/SpritePack.png", enemyOneOptions )
local enemyTwoSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/viking/SpritePack.png", enemyTwoOptions )
local enemyThreeSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/witch/SpritePack.png", enemyThreeOptions )
local enemyFourSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/goblin2/SpritePack.png", enemyFourOptions )
local bossOneSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/hero2/SpritePack.png", bossOneOptions )
local bossTwoSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/goblin1/SpritePack.png", bossTwoOptions )
local bossThreeSpriteSheet = graphics.newImageSheet( "assets/Sprites/png/2x/assassin/SpritePack.png", bossThreeOptions )

local enemyOneSequenceData = {
	{
		name = "idle",
		frames={10,11,12,13},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "attack",
		frames={1,2,3,4,5},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "hurt",
		frames={6},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "dead",
		frames={6,7,8,9},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
}

local enemyTwoSequenceData = {
	{
		name = "idle",
		frames={8,9,10,11},
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
		frames={5},
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
	},
}

local enemyThreeSequenceData = {
	{
		name = "idle",
		frames={5,6,7,8},
		time = 1000,
		loopCount = 0,
		loopDirection = "forward"
	},
	{
		name = "attack",
		frames={9,10,11,12,13},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "hurt",
		frames={1},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "dead",
		frames={1,2,3,4},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
}

local enemyFourSequenceData = {
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
	},
}

local bossOneSequenceData = {
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

local bossTwoSequenceData = {
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
	},
}

local bossThreeSequenceData = {
	{
		name = "idle",
		frames={5,6,7,8},
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
		frames={9},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
	{
		name = "dead",
		frames={9,11,11},
		time = 500,
		loopCount = 1,
		loopDirection = "forward"
	},
}

local function randomFromLevelOne()
	local random = math.random( 2 )
	if(random == 1) then
     	local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.name = "Skeleton"
     	enemy.level = math.random(1,3)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyTwoSpriteSheet, enemyTwoSequenceData )
		enemy.name = "Viking"
     	enemy.level = math.random(1,3)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	end
end

local function randomFromLevelTwo()
	local random = math.random( 3 )
	if(random == 1) then
     	local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.name = "Skeleton"
     	enemy.level = math.random(3,5)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyTwoSpriteSheet, enemyTwoSequenceData )
		enemy.name = "Viking"
     	enemy.level = math.random(3,5)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 3) then
		local enemy = display.newSprite( enemyThreeSpriteSheet, enemyThreeSequenceData )
		enemy.name = "Witch"
     	enemy.level = math.random(3,5)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	end
end

local function randomFromLevelThree()
	local random = math.random( 4 )
	if(random == 1) then
     	local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
     	enemy.name = "Skeleton"
     	enemy.level = math.random(5,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyTwoSpriteSheet, enemyTwoSequenceData )
		enemy.name = "Viking"
     	enemy.level = math.random(5,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 3) then
		local enemy = display.newSprite( enemyThreeSpriteSheet, enemyThreeSequenceData )
		enemy.name = "Witch"
     	enemy.level = math.random(5,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 4) then
		local enemy = display.newSprite( enemyFourSpriteSheet, enemyFourSequenceData )
		enemy.name = "Goblin"
     	enemy.level = math.random(5,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	end
end

local function startBossOne()
	local boss = display.newSprite( bossOneSpriteSheet, bossOneSequenceData )
	boss.name = "Archer"
	boss.bossLevel = 1
	boss.level = 4
    boss.maxHealth = 300
    boss.health = 300
    boss.critChance = 7
    boss.missChance = 7
    boss.gold = boss.level * 5
    boss.attack = math.pow( boss.level, 2 )
    boss.xp = boss.level * 50
	return boss
end

local function startBossTwo()
	local boss = display.newSprite( bossTwoSpriteSheet, bossTwoSequenceData )
	boss.name = "Goblin King"
	boss.bossLevel = 2
	boss.level = 6
    boss.maxHealth = math.pow(boss.level, 2)*10
    boss.health = math.pow(boss.level, 2)*10
    boss.critChance = 7
    boss.missChance = 7
    boss.gold = boss.level * 5
    boss.attack = math.pow( boss.level, 2 )
    boss.xp = boss.level * 50
	return boss
end

local function startBossThree()
	local boss = display.newSprite( bossThreeSpriteSheet, bossThreeSequenceData )
	boss.name = "Assassin"
	boss.bossLevel = 3
	boss.level = 8
    boss.maxHealth = math.pow(boss.level, 2)*10
    boss.health = math.pow(boss.level, 2)*10
    boss.critChance = 7
    boss.missChance = 7
    boss.gold = boss.level * 5
    boss.attack = math.pow( boss.level, 2 )
    boss.xp = boss.level * 50
	return boss
end

battleEnemies.randomFromLevelOne = randomFromLevelOne
battleEnemies.randomFromLevelTwo = randomFromLevelTwo
battleEnemies.randomFromLevelThree = randomFromLevelThree
battleEnemies.startBossOne = startBossOne
battleEnemies.startBossTwo = startBossTwo
battleEnemies.startBossThree = startBossThree

return battleEnemies










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
     	enemy.name = "Enemy1"
     	enemy.level = math.random(2,3)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
		enemy.name = "Enemy2"
     	enemy.level = math.random(2,3)
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
     	enemy.name = "Enemy1"
     	enemy.level = math.random(4,5)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
		enemy.name = "Enemy2"
     	enemy.level = math.random(4,5)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemyTwo
	elseif(random == 3) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
		enemy.name = "Enemy3"
     	enemy.level = math.random(4,5)
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
     	enemy.name = "Enemy1"
     	enemy.level = math.random(6,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 2) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
		enemy.name = "Enemy2"
     	enemy.level = math.random(6,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 3) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
		enemy.name = "Enemy3"
     	enemy.level = math.random(6,7)
     	enemy.maxHealth = math.pow(enemy.level, 2)*10
     	enemy.health = math.pow(enemy.level, 2)*10
     	enemy.critChance = 7
     	enemy.missChance = 7
     	enemy.gold = enemy.level * 5
     	enemy.attack = math.pow( enemy.level, 2 )
     	enemy.xp = enemy.level * 50
		return enemy
	elseif(random == 4) then
		local enemy = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
		enemy.name = "Enemy4"
     	enemy.level = math.random(6,7)
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
	local boss = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
	boss.name = "Boss1"
	boss.bossLevel = 1
	boss.level = 4
    boss.maxHealth = math.pow(boss.level, 2)*10
    boss.health = math.pow(boss.level, 2)*10
    boss.critChance = 7
    boss.missChance = 7
    boss.gold = boss.level * 5
    boss.attack = math.pow( boss.level, 2 )
    boss.xp = boss.level * 50
	return boss
end

local function startBossTwo()
	local boss = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
	boss.name = "Boss2"
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
	local boss = display.newSprite( enemyOneSpriteSheet, enemyOneSequenceData )
	boss.name = "Boss3"
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










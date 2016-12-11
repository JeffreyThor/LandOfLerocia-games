-----------------------------------------------------------------------------------------
--
-- battle.lua
--
-----------------------------------------------------------------------------------------

local battleTable = {}

local battleGroup = display.newGroup()

local background = display.newImageRect( battleGroup, "assets/Backgrounds/battleBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
background.x = display.contentCenterX
background.y = display.contentCenterY
background.xScale = 1.2

local attackButton = display.newImage( battleGroup, "assets/Battle/attackButton.png", CONTENT_WIDTH-200, CONTENT_HEIGHT-100 )
local abilitiesButton = display.newImage( battleGroup, "assets/Battle/abilitiesButton.png", CONTENT_WIDTH-50, CONTENT_HEIGHT-100 )
local inventoryButton = display.newImage( battleGroup, "assets/Battle/inventoryButton.png", CONTENT_WIDTH-200, CONTENT_HEIGHT-50 )
local escapeButton = display.newImage( battleGroup, "assets/Battle/escapeButton.png", CONTENT_WIDTH-50, CONTENT_HEIGHT-50 )
--local battleStatsDisplay = display.newImageRect( battleGroup, "assets/Battle/battleStatsDisplay.png", 350, 150 )
local playerLevel = display.newText( battleGroup, "", 25, 25, "Breathe Fire.otf" )
local playerHealth = display.newText( battleGroup, "", 25, 50, "Breathe Fire.otf" )
local playerMaxHealth = display.newText( battleGroup, "", 25, 75, "Breathe Fire.otf" )
local playerGold = display.newText( battleGroup, "", 25, 100, "Breathe Fire.otf" )
local enemyLevel = display.newText( battleGroup, "", 50, 25, "Breathe Fire.otf" )
local enemyHealth = display.newText( battleGroup, "", 50, 50, "Breathe Fire.otf" )
local enemyMaxHealth = display.newText( battleGroup, "", 50, 75, "Breathe Fire.otf" )
local enemyGold = display.newText( battleGroup, "", 50, 100, "Breathe Fire.otf" )
playerLevel:setFillColor( 0,0,0 )
playerHealth:setFillColor( 0,0,0 )
playerMaxHealth:setFillColor( 0,0,0 )
playerGold:setFillColor( 0,0,0 )
enemyLevel:setFillColor( 0,0,0 )
enemyHealth:setFillColor( 0,0,0 )
enemyMaxHealth:setFillColor( 0,0,0 )
enemyGold:setFillColor( 0,0,0 )
--battleStatsDisplay.x = 150
--battleStatsDisplay.y = 85
local battlePlayer = require("battlePlayer")
local battleEnemies = require("battleEnemies")
battleGroup:insert(battlePlayer)
battlePlayer.x = 75
battlePlayer.y = CONTENT_HEIGHT-75
attackButton:scale(.5, .5)
abilitiesButton:scale(.5, .5)
inventoryButton:scale(.5, .5)
escapeButton:scale(.5, .5)
battlePlayer:scale(.5, .5)

battleGroup.isVisible = false

local function updateStats()
	playerLevel.text = player.level
	playerHealth.text = player.health
	playerMaxHealth.text = player.maxHealth
	playerGold.text = player.gold
	enemyLevel.text = battleEnemy.level
	enemyHealth.text = battleEnemy.health
	enemyMaxHealth.text = battleEnemy.maxHealth
	enemyGold.text = battleEnemy.gold
end

local function startBattle(level)
	if(level == "battleStage1") then
		battleEnemy = battleEnemies.randomFromLevelOne()
	elseif(level == "battleStage2") then
		battleEnemy = battleEnemies.randomFromLevelTwo()
	elseif(level == "battleStage3") then
		battleEnemy = battleEnemies.randomFromLevelThree()
	elseif(level == "bossStage1") then
		battleEnemy = battleEnemies.startBossOne()
	elseif(level == "bossStage2") then
		battleEnemy = battleEnemies.startBossTwo()
	elseif(level == "bossStage3") then
		battleEnemy = battleEnemies.startBossThree()
	end
	battleGroup:insert(battleEnemy)
	battleEnemy.x = CONTENT_WIDTH-75
	battleEnemy.y = 75
	battleEnemy:scale( .5, .5 )
	battleEnemy:setSequence( "idle" )
	battleEnemy:play()
	Runtime:addEventListener( "enterFrame", updateStats )
	-- dpad.dpadUp.isVisible = false
	-- dpad.dpadRight.isVisible = false
	-- dpad.dpadDown.isVisible = false
	-- dpad.dpadLeft.isVisible = false
	-- dpad.aButton.isVisible = false
	-- dpad.bButton.isVisible = false
	dpad.dpadGroup.isVisible = false
	timer.performWithDelay( 1000, 
		function()
			battleGroup.isVisible = true
		end)
	battlePlayer:setSequence( "idle" )
	battlePlayer:play()
	player.yourTurn = true

	local function enemyTurn()
		local attackTime = 500
		-- print(battleEnemy.level)
		-- print(battleEnemy.health)
		-- print(battleEnemy.critChance)
		-- print(battleEnemy.gold)
		if(math.random(battleEnemy.missChance) == 0) then

		elseif(math.random(battleEnemy.critChance) == 0) then
			player.health = player.health - battleEnemy.attack*2
			battlePlayer:setSequence( "hurt" )
			battlePlayer:play()
		else
			player.health = player.health - battleEnemy.attack
			battlePlayer:setSequence( "hurt" )
			battlePlayer:play()
		end
		battleEnemy:setSequence( "attack" )
		battleEnemy:play()
		if(player.health <= 0) then
			dpad.dpadGroup.isVisible = true
			battleGroup.isVisible = false
			attackButton:removeEventListener( "tap", attackButtonPressed )
			escapeButton:removeEventListener( "tap", escapeButtonPressed )
			Runtime:removeEventListener( "enterFrame", updateStats )
			battleEnemy:removeSelf()
			battleEnemy = nil
		else
			timer.performWithDelay( attackTime, 
				function()
					battleEnemy:setSequence( "idle" )
					battleEnemy:play()
					player.yourTurn = true
					battlePlayer:setSequence("idle")
					battlePlayer:play()
				end)
		end
	end

	local function afterPlayerTurn()
		battlePlayer:setSequence( "idle" )
		battlePlayer:play()
		enemyTurn()
	end

	local function attackButtonPressed()
		if(player.yourTurn) then
			if(math.random(battleEnemy.missChance) == 0) then

			elseif(math.random(battleEnemy.critChance) == 0) then
				battleEnemy.health = battleEnemy.health - player.attack*2
				battleEnemy:setSequence( "hurt" )
				battleEnemy:play()
			else
				battleEnemy.health = battleEnemy.health - player.attack
				battleEnemy:setSequence( "hurt" )
				battleEnemy:play()
			end
			battlePlayer:setSequence( "attack" )
			battlePlayer:play()
			player.yourTurn = false
			if(battleEnemy.health <= 0) then
				player.xp = math.sqrt(battleEnemy.level*1000)
				player.gold = player.gold + battleEnemy.gold
				dpad.dpadGroup.isVisible = true
				battleGroup.isVisible = false
				attackButton:removeEventListener( "tap", attackButtonPressed )
				escapeButton:removeEventListener( "tap", escapeButtonPressed )
				Runtime:removeEventListener( "enterFrame", updateStats )
				battleEnemy:removeSelf()
				battleEnemy = nil
				if(player.xp >= player.level * 20) then
					player.level = player.level + 1
					player.maxHealth = player.maxHealth + player.level * 20;
					player.health = player.maxHealth
					player.attack = math.pow( player.level, 2 ) * 1.8
					player.xp = 0
				end
			else
				timer.performWithDelay( 500, afterPlayerTurn )
			end
		end
	end

	local function escapeButtonPressed()
		if(player.yourTurn) then
			-- dpad.dpadUp.isVisible = true
			-- dpad.dpadRight.isVisible = true
			-- dpad.dpadDown.isVisible = true
			-- dpad.dpadLeft.isVisible = true
			-- dpad.aButton.isVisible = true
			-- dpad.bButton.isVisible = true
			dpad.dpadGroup.isVisible = true
			battleGroup.isVisible = false
			player.yourTurn = false
			attackButton:removeEventListener( "tap", attackButtonPressed )
			escapeButton:removeEventListener( "tap", escapeButtonPressed )
			Runtime:removeEventListener( "enterFrame", updateStats )
			battleEnemy:removeSelf()
			battleEnemy = nil
		end
	end

	attackButton:addEventListener( "tap", attackButtonPressed )
	escapeButton:addEventListener( "tap", escapeButtonPressed )

end

battleTable.startBattle = startBattle

return battleTable
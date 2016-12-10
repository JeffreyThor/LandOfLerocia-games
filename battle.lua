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

local function startBattle(level)

	if(level == "battleObject") then
		battleEnemy = battleEnemies.randomFromLevelOne()
	elseif(level == "Battle Layer 2") then
		battleEnemy = battleEnemies.randomFromLevelTwo()
	elseif(level == "Battle Layer 3") then
		battleEnemy = battleEnemies.randomFromLevelThree()
	end
	battleGroup:insert(battleEnemy)
	battleEnemy.x = CONTENT_WIDTH-75
	battleEnemy.y = 75
	battleEnemy:scale( .5, .5 )

	dpad.dpadUp.isVisible = false
	dpad.dpadRight.isVisible = false
	dpad.dpadDown.isVisible = false
	dpad.dpadLeft.isVisible = false
	dpad.aButton.isVisible = false
	dpad.bButton.isVisible = false
	battleGroup.isVisible = true
	battlePlayer:setSequence( "idle" )
	battlePlayer:play()
	player.yourTurn = true

	local function enemyTurn()
		local attackTime
		print(battleEnemy.level)
		print(battleEnemy.health)
		print(battleEnemy.critChance)
		print(battleEnemy.gold)
		attackTime = 500
		battleEnemy:setSequence( "attack" )
		battleEnemy:play()
		timer.performWithDelay( attackTime, 
			function()
				battleEnemy:setSequence( "idle" )
				battleEnemy:play()
				player.yourTurn = true
			end)
	end

	local function afterPlayerTurn()
		battlePlayer:setSequence( "idle" )
		battlePlayer:play()
		enemyTurn()
	end

	local function attackButtonPressed()
		if(player.yourTurn) then
			battlePlayer:setSequence( "attack" )
			battlePlayer:play()
			player.yourTurn = false
			timer.performWithDelay( 500, afterPlayerTurn )
		end
	end

	local function escapeButtonPressed()
		if(player.yourTurn) then
			dpad.dpadUp.isVisible = true
			dpad.dpadRight.isVisible = true
			dpad.dpadDown.isVisible = true
			dpad.dpadLeft.isVisible = true
			dpad.aButton.isVisible = true
			dpad.bButton.isVisible = true
			battleGroup.isVisible = false
			player.yourTurn = false
			battleEnemy:removeSelf()
			battleEnemy = nil
		end
	end

	attackButton:addEventListener( "tap", attackButtonPressed )
	escapeButton:addEventListener( "tap", escapeButtonPressed )

end

battleTable.startBattle = startBattle

return battleTable
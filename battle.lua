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
local battleStatsDisplay = display.newImage( battleGroup, "assets/Battle/battleStatsDisplay.png", 150, 85 )
local playerName = display.newText( battleGroup, "", 75, 25, "Breathe Fire.otf" )
local playerLevel = display.newText( battleGroup, "", 65, 70, "Breathe Fire.otf" )
local playerMaxHealth = display.newText( battleGroup, "", 115, 92, "Breathe Fire.otf" )
local playerHealth = display.newText( battleGroup, "", 80, 115, "Breathe Fire.otf" )
local playerGold = display.newText( battleGroup, "", 65, 137, "Breathe Fire.otf" )
local playerText = display.newText( battleGroup, "", 5, CONTENT_HEIGHT-100, "Breathe Fire.otf" )
local enemyName = display.newText( battleGroup, "", 225, 25, "Breathe Fire.otf" )
local enemyLevel = display.newText( battleGroup, "", 215, 70, "Breathe Fire.otf" )
local enemyMaxHealth = display.newText( battleGroup, "", 265, 92, "Breathe Fire.otf" )
local enemyHealth = display.newText( battleGroup, "", 230, 115, "Breathe Fire.otf" )
local enemyGold = display.newText( battleGroup, "", 215, 137, "Breathe Fire.otf" )
local enemyText = display.newText( battleGroup, "", CONTENT_WIDTH-135, 50, "Breathe Fire.otf" )
local levelUpText = display.newText( "Level Up!", CONTENT_WIDTH/2, CONTENT_HEIGHT/2, "Breathe Fire.otf" )
battleStatsDisplay:scale(.5, .5)
playerName:setFillColor( 0,0,0 )
playerLevel:setFillColor( 0,0,0 )
playerHealth:setFillColor( 0,0,0 )
playerMaxHealth:setFillColor( 0,0,0 )
playerGold:setFillColor( 0,0,0 )
playerText:setFillColor( 0,0,0 )
playerText:scale(2, 2)
enemyName:setFillColor( 0,0,0 )
enemyLevel:setFillColor( 0,0,0 )
enemyHealth:setFillColor( 0,0,0 )
enemyMaxHealth:setFillColor( 0,0,0 )
enemyGold:setFillColor( 0,0,0 )
enemyText:setFillColor( 0,0,0 )
enemyText:scale(2, 2)
levelUpText:setFillColor( 0,0,0 )
levelUpText:scale(3, 3)
levelUpText.alpha = 0
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
	playerName.text = player.name
	playerLevel.text = player.level
	playerHealth.text = player.health
	playerMaxHealth.text = player.maxHealth
	playerGold.text = player.gold
	enemyName.text = battleEnemy.name
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
	audio.stop(1)
	audio.play(soundTable["BattleMusic"], {loops = -1})
	battleGroup:insert(battleEnemy)
	battleEnemy.x = CONTENT_WIDTH-75
	battleEnemy.y = 75
	battleEnemy:scale( .5, .5 )
	battleEnemy:setSequence( "idle" )
	battleEnemy:play()
	enemyText.alpha = 0
	playerText.alpha = 0
	enemyText:toFront()
	playerText:toFront()
	print(battleEnemy.bossLevel)

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
		local damage = battleEnemy.attack + math.random(-battleEnemy.level, battleEnemy.level)
		if(math.random(battleEnemy.missChance) == 1) then
			playerText.text = "Miss!"
			playerText.alpha = 1
			transition.fadeOut( playerText, {time=1000} )
		elseif(math.random(battleEnemy.critChance) == 1) then
			player.health = player.health - damage*2
			battlePlayer:setSequence( "hurt" )
			battlePlayer:play()
			playerText.text = "-"..damage*2
			playerText.alpha = 1
			transition.fadeOut( playerText, {time=1000} )
		else
			player.health = player.health - damage
			battlePlayer:setSequence( "hurt" )
			battlePlayer:play()
			playerText.text = "-"..damage
			playerText.alpha = 1
			transition.fadeOut( playerText, {time=1000} )
		end
		battleEnemy:setSequence( "attack" )
		battleEnemy:play()
		if(player.health <= 0) then
			player.health = 0
			battlePlayer:setSequence( "dead" )
			battlePlayer:play()
			timer.performWithDelay( 2000, 
				function()
					audio.stop(1)
					audio.play(soundTable["OpeningDemo"], {loops = -1})
					player.x = CONTENT_WIDTH/2;
					player.y = CONTENT_HEIGHT/2;
					mapDisplay.x = player.x - map.tilewidth * player.startX * scale
					mapDisplay.y = player.y - map.tileheight * player.startY * scale - (map.tileheight / 1.3 * scale)
					player.x = 0 + map.tilewidth * player.startX * scale
					player.y = 0 + map.tileheight * (player.startY+1) * scale - map.tileheight/4 * scale
					player.health = player.maxHealth
					player.gold = 0
					dpad.dpadGroup.isVisible = true
					battleGroup.isVisible = false
					attackButton:removeEventListener( "tap", attackButtonPressed )
					escapeButton:removeEventListener( "tap", escapeButtonPressed )
					Runtime:removeEventListener( "enterFrame", updateStats )
					battleEnemy:removeSelf()
					battleEnemy = nil
				end)
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

	function attackButtonPressed()
		if(player.yourTurn) then
			local damage = player.attack + math.random(-player.level, player.level)
			if(math.random(player.missChance) == 1) then
				enemyText.text = "Miss!"
				enemyText.alpha = 1
				transition.fadeOut( enemyText, {time=1000} )
			elseif(math.random(player.critChance) == 1) then
				battleEnemy.health = battleEnemy.health - damage*2
				battleEnemy:setSequence( "hurt" )
				battleEnemy:play()
				enemyText.text = "-"..damage*2
				enemyText.alpha = 1
				transition.fadeOut( enemyText, {time=1000} )
			else
				battleEnemy.health = battleEnemy.health - damage
				battleEnemy:setSequence( "hurt" )
				battleEnemy:play()
				enemyText.text = "-"..damage
				enemyText.alpha = 1
				transition.fadeOut( enemyText, {time=1000} )
			end
			battlePlayer:setSequence( "attack" )
			battlePlayer:play()
			player.yourTurn = false
			if(battleEnemy.health <= 0) then
				battleEnemy.health = 0
				battleEnemy:setSequence( "dead" )
				battleEnemy:play()
				timer.performWithDelay( 2000, 
					function()
						audio.stop(1)
						audio.play(soundTable["OpeningDemo"], {loops = -1})
						player.xp = player.xp + math.sqrt(battleEnemy.level*1000)
						player.gold = player.gold + battleEnemy.gold
						dpad.dpadGroup.isVisible = true
						battleGroup.isVisible = false
						attackButton:removeEventListener( "tap", attackButtonPressed )
						escapeButton:removeEventListener( "tap", escapeButtonPressed )
						Runtime:removeEventListener( "enterFrame", updateStats )
						battleEnemy:removeSelf()
						battleEnemy = nil
						if(player.xp >= player.level * 20) then
							levelUpText.alpha = 1
							transition.fadeOut( levelUpText, {time=3000} )
							player.level = player.level + 1
							player.maxHealth = player.maxHealth + player.level * 20;
							player.health = player.maxHealth
							player.attack = math.pow( player.level, 2 ) * 2
							player.xp = 0
						end
					end)
			else
				timer.performWithDelay( 500, afterPlayerTurn )
			end
		end
	end

	function escapeButtonPressed()
		if(player.yourTurn) then
			-- dpad.dpadUp.isVisible = true
			-- dpad.dpadRight.isVisible = true
			-- dpad.dpadDown.isVisible = true
			-- dpad.dpadLeft.isVisible = true
			-- dpad.aButton.isVisible = true
			-- dpad.bButton.isVisible = true
			if(math.random(5) == 1) then
				playerText.text = "Can't Escape!"
				playerText.alpha = 1
				transition.fadeOut( playerText, {time=1000} )
				player.yourTurn = false
				timer.performWithDelay( 500, afterPlayerTurn )
			else
				if(battleEnemy.bossLevel == 1) then
					player.x = player.x + map.tilewidth * scale
					mapDisplay.x = mapDisplay.x - map.tilewidth * scale
				elseif(battleEnemy.bossLevel == 2) then
					player.y = player.y - map.tileheight * scale
					mapDisplay.y = mapDisplay.y + map.tileheight * scale
				elseif(battleEnemy.bossLevel == 3) then
					player.x = player.x - map.tilewidth * scale
					mapDisplay.x = mapDisplay.x + map.tilewidth * scale
				end
				audio.stop(1)
				audio.play(soundTable["OpeningDemo"], {loops = -1})
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
	end

	attackButton:addEventListener( "tap", attackButtonPressed )
	escapeButton:addEventListener( "tap", escapeButtonPressed )
	Runtime:addEventListener( "enterFrame", updateStats )

end

battleTable.startBattle = startBattle

return battleTable
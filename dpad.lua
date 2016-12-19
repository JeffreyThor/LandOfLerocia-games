-----------------------------------------------------------------------------------------
--
-- dpad.lua
--
-- All in game UI buttons, handlers, and other interactions
--
-----------------------------------------------------------------------------------------

-- dpad table and group declarations
local dpadTable = {}
local dpadGroup = display.newGroup()
local gameSettings = display.newGroup()
local characterGroup = display.newGroup()

-- dpad and other UI interaction button declarations
local dpadAction = nil
local activeAction = nil
local inGameSettings = display.newImage( dpadGroup, "assets/UI/settingsInGame.png", 0, 22 )
local characterDisplayButton = display.newImage( dpadGroup, "assets/UI/characterImage.png", 50, 22 )
local dpadLeft = display.newImage( dpadGroup, "assets/UI/leftArrow.png", 0, CONTENT_HEIGHT - 75 )
local dpadUp = display.newImage( dpadGroup, "assets/UI/upArrow.png", 50, CONTENT_HEIGHT - 125 )
local dpadRight = display.newImage( dpadGroup, "assets/UI/rightArrow.png", 100, CONTENT_HEIGHT - 75 )
local dpadDown = display.newImage( dpadGroup, "assets/UI/downArrow.png", 50, CONTENT_HEIGHT - 25 )

-- Box to surround dialog text
local textBox = display.newImageRect( dpadGroup, "assets/UI/textBox.png", CONTENT_WIDTH, 100 )
textBox.x = CONTENT_WIDTH/2
textBox.y = CONTENT_HEIGHT - 60
local textOptions = {
	parent = dpadGroup,
	text = "",
   	x = CONTENT_WIDTH/2,
   	y = CONTENT_HEIGHT-60,
   	fontSize = 16,
   	font = "Breathe Fire.otf",
   	width = CONTENT_WIDTH-40,
   	height = 80,
   	align = "left"
}
local helpText = display.newText( textOptions )
-- Character display box information
local characterDisplay = display.newImage( characterGroup, "assets/UI/CharacterScreen.png", CONTENT_WIDTH/2, CONTENT_HEIGHT/2 )
local closeCharacterDisplayButton = display.newImage( characterGroup, "assets/UI/closeButton.png", CONTENT_WIDTH/2 - characterDisplay.width/2 + 35, CONTENT_HEIGHT/2 - characterDisplay.height/2 + 35 )
local characterDisplayPlayerImage = display.newImage( characterGroup, "assets/Sprites/png/2x/hero1/IdleFront (1).png", CONTENT_WIDTH/2-75, CONTENT_HEIGHT/2-10)
characterDisplayPlayerImage:scale(.55, .55)
local characterDisplayName = display.newText( characterGroup, "", 165, CONTENT_HEIGHT - 40, "Breathe Fire.otf" )
local characterDisplayLevel = display.newText( characterGroup, "", CONTENT_WIDTH/2+164, CONTENT_HEIGHT/2 - 75, "Breathe Fire.otf" )
local characterDisplayMaxHealth = display.newText( characterGroup, "", CONTENT_WIDTH/2+165, CONTENT_HEIGHT/2 - 30, "Breathe Fire.otf" )
local characterDisplayHealth = display.newText( characterGroup, "", CONTENT_WIDTH/2+165, CONTENT_HEIGHT/2 + 10, "Breathe Fire.otf" )
local characterDisplayGold = display.newText( characterGroup, "", CONTENT_WIDTH/2+165, CONTENT_HEIGHT/2 + 55, "Breathe Fire.otf" )
characterDisplayName:scale( 2, 2 )
characterDisplayName:setFillColor( 0,0,0 )
characterDisplayLevel:setFillColor( 0,0,0 )
characterDisplayMaxHealth:setFillColor( 0,0,0 )
characterDisplayHealth:setFillColor( 0,0,0 )
characterDisplayGold:setFillColor( 0,0,0 )
helpText:setFillColor( 0,0,0 )
-- Setting general scales and visibilites
inGameSettings:scale(.5, .5)
inGameSettings.isVisible = false
characterDisplayButton:scale( .5, .5 )
characterDisplayButton.isVisible = false
dpadLeft.isVisible = false
dpadUp.isVisible = false
dpadRight.isVisible = false
dpadDown.isVisible = false
textBox.isVisible = false
helpText.isVisible = false
closeCharacterDisplayButton:scale(.5, .5)
characterGroup.isVisible = false
-- Setting map and player start points
local currentPlayerX = 0
local currentPlayerY = 0
local currentMapX = 0
local currentMapY = 0

-- Opens dialog box and sets text based on message sent as argument
local function dialog(message)
	dpadLeft.isVisible = false
	dpadUp.isVisible = false
	dpadRight.isVisible = false
	dpadDown.isVisible = false
	helpText.text = message
	textBox.isVisible = true
	helpText.isVisible = true
end
-- Closes message dialog box (on tap)
function closeBox()
	dpadLeft.isVisible = true
	dpadUp.isVisible = true
	dpadRight.isVisible = true
	dpadDown.isVisible = true
	textBox.isVisible = false
	helpText.isVisible = false
	helpText.text = ""
end
-- Function called on player collision of any object, response determined in function based on collision object
function playerCollided(event)
	print(event.other.type)
	if(event.other.type == "battleStage1" or event.other.type == "battleStage2" or event.other.type == "battleStage3") then
		player:removeEventListener( "collision", playerCollided )
		if(math.random(15) == 1) then
			dpadAction = nil
			battle.startBattle(event.other.type)
		end
	elseif(event.other.type == "bossStage1" or event.other.type == "bossStage2" or event.other.type == "bossStage3") then
		if(event.other.type == "bossStage1" and player.bossOneDefeated) then
			print("Already defeated")
		elseif(event.other.type == "bossStage2" and player.bossTwoDefeated) then
			print("Already defeated")
		elseif(event.other.type == "bossStage3" and player.bossThreeDefeated) then
			print("Already defeated")
		else
			player:removeEventListener( "collision", playerCollided )
			dpadAction = nil
			battle.startBattle(event.other.type)
		end
	elseif(event.other.type == "object") then
		timer.performWithDelay(1, 
			function()
				return resetPosition(event) 
			end)
	else
		print("collision detected, no response")
	end
end
-- Pulls player back on collision with border object (any unpassable object)
function resetPosition(event)  
	transition.cancel(player)
	transition.cancel(mapDisplay)
	mapDisplay.x = currentMapX
	mapDisplay.y = currentMapY
	player.x=currentPlayerX  
	player.y=currentPlayerY
	if (activeAction == "moveRight") then
		player:setSequence("idleRight")
	elseif (activeAction == "moveLeft") then
		player:setSequence("idleLeft")
	elseif (activeAction == "moveUp") then
		player:setSequence("idleUp")
	elseif (activeAction == "moveDown") then
		player:setSequence("idleDown")
	end
	player:removeEventListener( "collision", playerCollided )
	player:play()
	activeAction = nil
end
-- Moves player based on dpad direction pressed
function movePlayer()
	activeAction = dpadAction
	local xAmount = 0
	local yAmount = 0
	currentPlayerX = player.x
	currentPlayerY = player.y
	currentMapX = mapDisplay.x
	currentMapY = mapDisplay.y
	if (dpadAction == nil) then
		return true
	elseif (dpadAction == "moveRight") then
		xAmount = map.tilewidth
	elseif (dpadAction == "moveLeft") then
		xAmount = -map.tilewidth
	elseif (dpadAction == "moveUp") then
		yAmount = -map.tileheight
	elseif (dpadAction == "moveDown") then
		yAmount = map.tileheight
	end
	player:setSequence(dpadAction)
	player:play()
	player:addEventListener( "collision", playerCollided )
	audio.play(soundTable["Walk"])
	transition.to(player, {time=player.speed, x = (player.x+(xAmount*scale)),y=(player.y+(yAmount*scale))})
	transition.to(mapDisplay, {time = player.speed, x = (mapDisplay.x - (xAmount * scale)), y = (mapDisplay.y - (yAmount * scale)),
		onComplete = function()
			if (activeAction == "moveRight") then
				player:setSequence("idleRight")
			elseif (activeAction == "moveLeft") then
				player:setSequence("idleLeft")
			elseif (activeAction == "moveUp") then
				player:setSequence("idleUp")
			elseif (activeAction == "moveDown") then
				player:setSequence("idleDown")
			end
			player:play();
			activeAction = nil
			player:removeEventListener( "collision", playerCollided )
			movePlayer()
		end
	})
end
-- Called when left dpad button pressed
local function dpadLeftTouched(event)
	if(event.phase == "began") then
		dpadAction = "moveLeft"
		if(activeAction == nil) then
			movePlayer()
		end
	elseif(event.phase == "ended") then
		dpadAction = nil
	end
end
-- Called when up dpad button pressed
local function dpadUpTouched(event)
	if(event.phase == "began") then
		dpadAction = "moveUp"
		if(activeAction == nil) then
			movePlayer()
		end
	elseif(event.phase == "ended") then
		dpadAction = nil
	end
end
-- Called when dpad right button pressed
local function dpadRightTouched(event)
	if(event.phase == "began") then
		dpadAction = "moveRight"
		if(activeAction == nil) then
			movePlayer()
		end
	elseif(event.phase == "ended") then
		dpadAction = nil
	end
end
-- Called when dpad down button pressed
local function dpadDownTouched(event)
	if(event.phase == "began") then
		dpadAction = "moveDown"
		if(activeAction == nil) then
			movePlayer()
		end
	elseif(event.phase == "ended") then
		dpadAction = nil
	end
end

-- local function keyboardTouched(event)
-- 	if(event.phase == "down") then
-- 		if(event.keyName == "right") then
-- 			dpadAction = "moveRight"
-- 		elseif (event.keyName == "left") then
-- 			dpadAction = "moveLeft"
-- 		elseif (event.keyName == "down") then
-- 			dpadAction = "moveDown"
-- 		elseif (event.keyName == "up") then
-- 			dpadAction = "moveUp"
-- 		end

-- 		if(activeAction == nil) then
-- 			movePlayer()
-- 		end
-- 	elseif(event.phase == "up") then
-- 		dpadAction = nil
-- 	end
-- end

-- Called when gear button pressed to opens settings screen from in game
local function settingsTouched(event)
	dpadGroup.isVisible = false
	gameSettings.isVisible = false
	settingsScreen.settingsGroup.isVisible = true
	settingsScreen.background.isVisible = true
	settingsScreen.background:toFront()
	settingsScreen.settingsGroup:toFront()
end
-- Called when character button pressed to display character stats
local function characterDisplayButtonTouched()
	dpadGroup.isVisible = false
	gameSettings.isVisible = false
	characterGroup.isVisible = true
	characterDisplayName.text = player.name
	characterDisplayLevel.text = player.level
	characterDisplayHealth.text = player.health
	characterDisplayMaxHealth.text = player.maxHealth
	characterDisplayGold.text = player.gold
end
-- Closes character stats display
local function closeCharacterDisplay()
	dpadGroup.isVisible = true
	gameSettings.isVisible = true
	characterGroup.isVisible = false
end
-- Begins use of dpad for movement (separate version allows for keyboard use, this is the mobile and simulator only version)
local function useDpad()
	inGameSettings.isVisible = true
	characterDisplayButton.isVisible = true
	dpadLeft.isVisible = true
	dpadUp.isVisible = true
	dpadRight.isVisible = true
	dpadDown.isVisible = true
	dpadGroup.isVisible = true
	dpadGroup.alpha = 0
	transition.fadeIn( dpadGroup, {time = 2000} )
	player:setSequence("idleDown")
	player:play()
	player:toFront()
end

-- local function useKeyboard()
-- 	dpad.isVisible = false
-- 	dpadGroup.isVisible = true
-- 	gameSettings.isVisible = true
-- 	inGameSettings.isVisible = true
-- 	characterDisplayButton.isVisible = true
-- 	Runtime:addEventListener( "key", keyboardTouched )
-- 	player:setSequence("idleDown")
-- 	player:play()
-- 	player:toFront()
-- end

-- Event listeners for all buttons regarding UI in game
dpadLeft:addEventListener( "touch", dpadLeftTouched )
dpadUp:addEventListener( "touch", dpadUpTouched )
dpadRight:addEventListener( "touch", dpadRightTouched )
dpadDown:addEventListener( "touch", dpadDownTouched )
inGameSettings:addEventListener( "tap", settingsTouched )
characterDisplayButton:addEventListener( "tap", characterDisplayButtonTouched )
closeCharacterDisplayButton:addEventListener( "tap", closeCharacterDisplay )
textBox:addEventListener( "tap", closeBox )

-- Storing buttons in dpad table for reference outside of this module
dpadTable.settingsTouched = settingsTouched
dpadTable.useDpad = useDpad
dpadTable.useKeyboard = useKeyboard
dpadTable.gameSettings = gameSettings
dpadTable.inGameSettings = inGameSettings
dpadTable.characterDisplayButton = characterDisplayButton
dpadTable.dpadGroup = dpadGroup
dpadTable.dpadUp = dpadUp
dpadTable.dpadRight = dpadRight
dpadTable.dpadDown = dpadDown
dpadTable.dpadLeft = dpadLeft
dpadTable.textBox = textBox
dpadTable.helpText = helpText
dpadTable.dialog = dialog

-- Return dpad table to any requiring module
return dpadTable



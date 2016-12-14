-----------------------------------------------------------------------------------------
--
-- splashScreen.lua
--
-----------------------------------------------------------------------------------------

local splashTable = {}

splashGroup = display.newGroup()

local background = display.newImageRect( splashGroup, "assets/Backgrounds/LandOfLerocia.jpeg", CONTENT_WIDTH, CONTENT_HEIGHT )
background.x = display.contentCenterX
background.y = display.contentCenterY
background.xScale = 1.2

audio.play(soundTable["TitleTheme"], {loops = -1})

local newGame = display.newImage( splashGroup, "assets/UI/newGameButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4) + 40 )
local loadGame  = display.newImage( splashGroup, "assets/UI/loadGameButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(2/4) + 40 )
local settings  = display.newImage( splashGroup, "assets/UI/settingsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4) + 40 )
newGame.alpha = 0
loadGame.alpha = 0
settings.alpha = 0

transition.fadeIn( newGame, { delay = 2000, time=2000 } )
transition.fadeIn( loadGame, { delay = 2000, time=2000 } )
transition.fadeIn( settings, { delay = 2000, time=2000 } )

function startNewGame(event)
	player.resetStats()
	newGame:removeEventListener( "tap", startNewGame )
	loadGame:removeEventListener( "tap", findLoadGame )
	settings:removeEventListener( "tap", openSettings )
	mapDisplay:insert(player)
	mapDisplay:insert(bosses.bossOne)
	mapDisplay:insert(bosses.bossTwo)
	mapDisplay:insert(bosses.bossThree)
	mapDisplay.x = player.x - map.tilewidth * player.startX * scale
	mapDisplay.y = player.y - map.tileheight * player.startY * scale - (map.tileheight / 1.3 * scale)
	player.x = 0 + map.tilewidth * player.startX * scale
	player.y = 0 + map.tileheight * (player.startY+1) * scale - map.tileheight/4 * scale
	bosses.bossOne.x = 0 + map.tilewidth * (31+13) * scale
	bosses.bossOne.y = 0 + map.tileheight * (26+7) * scale
	bosses.bossOne:setSequence("idleRight")
	bosses.bossOne:play()
	bosses.bossTwo.x = 0 + map.tilewidth * (8+13) * scale
	bosses.bossTwo.y = 0 + map.tileheight * (33+7) * scale
	bosses.bossTwo:setSequence("idleUp")
	bosses.bossTwo:play()
	bosses.bossThree.x = 0 + map.tilewidth * (42+13) * scale
	bosses.bossThree.y = 0 + map.tileheight * (41+7) * scale
	bosses.bossThree:setSequence("idleLeft")
	bosses.bossThree:play()
	audio.stop(1)
	transition.fadeOut( splashGroup, {time = 2000} )
	settingsScreen.settingsGroup.isVisible = false
	settingsScreen.saveButton.isVisible = true
	settingsScreen.quitButton.isVisible = true
	settingsScreen.creditsButton.isVisible = false
	audio.play(soundTable["OpeningDemo"], {loops = -1})
	dpad.useDpad()
	dpad.dialog("Welcome to the Land Of Lerocia! This world is yours to explore, but be wary, there are people in this world who are dangerous. Do what you must to fend them off, but be careful. Now let your journey begin!")
	--dpad.useKeyboard()
	return true
end

function findLoadGame(event)
	
end

function openSettings(event)
	dpad.dpadGroup.isVisible = false
	dpad.gameSettings.isVisible = false
	dpad.dpadLeft.isVisible = false
	dpad.dpadUp.isVisible = false
	dpad.dpadRight.isVisible = false
	dpad.dpadDown.isVisible = false
	-- dpad.aButton.isVisible = false
	-- dpad.bButton.isVisible = false
	dpad.textBox.isVisible = false
	dpad.helpText.isVisible = false
	splashGroup.isVisible = false
	settingsScreen.background.isVisible = true
	settingsScreen.settingsGroup.isVisible = true
	return true
end

newGame:addEventListener( "tap", startNewGame )
loadGame:addEventListener( "tap", findLoadGame )
settings:addEventListener( "tap", openSettings )

splashTable.newGame = newGame
splashTable.loadGame = loadGame
splashTable.settings = settings
splashTable.splashGroup = splashGroup
splashTable.startNewGame = startNewGame
splashTable.findLoadGame = findLoadGame
splashTable.openSettings = openSettings
splashTable.settingsScreen = settingsScreen

return splashTable
-----------------------------------------------------------------------------------------
--
-- splashScreen.lua
--
-----------------------------------------------------------------------------------------

local splashTable = {}

--local mapImages = require("mapDisplay")
local player = require("player")
local settingsScreen = require("settingsScreen")
local optionsScreen = require("optionsScreen")
local controlsScreen = require("controlsScreen")
local soundTable = require("soundTable")

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
	audio.stop()
	transition.fadeOut( splashGroup, {time = 2000} )
	settingsScreen.settingsGroup.isVisible = false
	optionsScreen.optionsGroup.isVisible = false
	controlsScreen.controlsGroup.isVisible = false
	audio.play(soundTable["OpeningDemo"], {loops = -1})
	-- settingsScreen.creditsButton.isVisible = false
	-- settingsScreen.saveButton.isVisible = true
	-- settingsScreen.quitButton.isVisible = true
	showDpad()
	--useKeyboard()
	return true
end

function findLoadGame(event)
	
end

function openSettings(event)
	-- newGame.isVisible = false
	-- loadGame.isVisible = false
	-- settings.isVisible = false
	splashGroup.isVisible = false
	settingsScreen.settingsGroup.isVisible = true
	settingsScreen.settingsGroup:toFront()
end

newGame:addEventListener( "tap", startNewGame )
loadGame:addEventListener( "tap", findLoadGame )
settings:addEventListener( "tap", openSettings )

splashTable.splashGroup = splashGroup
splashTable.startNewGame = startNewGame
splashTable.findLoadGame = findLoadGame
splashTable.openSettings = openSettings

return splashTable
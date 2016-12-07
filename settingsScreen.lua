-----------------------------------------------------------------------------------------
--
-- settingsScreen.lua
--
-----------------------------------------------------------------------------------------

local settingsTable = {}

--local mapImages = require("mapDisplay")
-- local player = require("player")
local optionsScreen = require("optionsScreen")
local controlsScreen = require("controlsScreen")
local creditsScreen = require("creditsScreen")
local soundTable = require("soundTable")

settingsGroup = display.newGroup()

local background = display.newImageRect( settingsGroup, "assets/UI/paperBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
background.xScale = 1.2
background.x = display.contentCenterX
background.y = display.contentCenterY
local optionsButton = display.newImage( settingsGroup, "assets/UI/optionsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(0/4) + 40 )
local controlsButton = display.newImage( settingsGroup, "assets/UI/controlsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4) + 40 )
local saveButton = display.newImage( settingsGroup, "assets/UI/saveButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(2/4) + 40 )
local creditsButton = display.newImage( settingsGroup, "assets/UI/creditsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4) + 40 )
local quitButton = display.newImage( settingsGroup, "assets/UI/quitButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4) + 40 )
local backToPreviousButton = display.newImage( settingsGroup, "assets/UI/backarrow.png", 0, 22 )
saveButton.isVisible = false
quitButton.isVisible = false
backToPreviousButton:scale(.5, .5)
settingsGroup:toBack()
settingsGroup.isVisible = false
optionsScreen.optionsGroup.isVisible = false
controlsScreen.controlsGroup.isVisible = false
creditsScreen.creditsGroup.isVisible = false

local function backToPrevious(event)
	splashGroup.isVisible = true
	settingsGroup.isVisible = false
	dpadGroup.isVisible = true
	gameSettings.isVisible = true
	return true
end

local function controls(event)
	settingsGroup.isVisible = false
	controlsScreen.controlsGroup.isVisible = true
	controlsScreen.controlsGroup:toFront()
end

local function options(event)
	settingsGroup.isVisible = false
	optionsScreen.optionsGroup.isVisible = true
	optionsScreen.optionsGroup:toFront()
end

local function credits(event)
	audio.stop( 1 )
	settingsGroup.isVisible = false
	creditsScreen.creditsGroup.isVisible = true
	creditsScreen.creditsGroup:toFront()
	creditsScreen.startCredits()
	audio.play( soundTable["StaffCredits"] )
end

local function quit(event)
	audio.stop( 1 )
	dpadGroup.isVisible = false
	gameSettings.isVisible = false
	settingsGroup.isVisible = false
	splashGroup.isVisible = true
	splashGroup.alpha = 1
	splashGroup:toFront( )
	saveButton.isVisible = false
	quitButton.isVisible = false
	creditsButton.isVisible = true
	audio.play( soundTable["TitleTheme"], {loops = -1} )
	return true
end

backToPreviousButton:addEventListener( "tap", backToPrevious )
optionsButton:addEventListener( "tap", options )
controlsButton:addEventListener( "tap", controls )
creditsButton:addEventListener( "tap", credits )
quitButton:addEventListener( "tap", quit )

settingsTable.optionsButton = optionsButton
settingsTable.controlsButton = controlsButton
settingsTable.saveButton = saveButton
settingsTable.creditsButton = creditsButton
settingsTable.quitButton = quitButton
settingsTable.settingsGroup = settingsGroup
-- settingsTable.backToPrevious = backToPrevious

return settingsTable
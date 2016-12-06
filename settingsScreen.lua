-----------------------------------------------------------------------------------------
--
-- settingsScreen.lua
--
-----------------------------------------------------------------------------------------

local settingsTable = {}

--local mapImages = require("mapDisplay")
local player = require("player")

local settingsGroup = display.newGroup()
local controlsGroup = display.newGroup()

local background = display.newImageRect( settingsGroup, "assets/UI/paperBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
background.xScale = 1.2
background.x = display.contentCenterX
background.y = display.contentCenterY
local controlsButton = display.newImage( settingsGroup, "assets/UI/controlsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4) + 40 )
local saveButton = display.newImage( settingsGroup, "assets/UI/saveButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(2/4) + 40 )
local quitButton = display.newImage( settingsGroup, "assets/UI/quitButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4) + 40 )
local backToPreviousButton = display.newImage( settingsGroup, "assets/UI/backarrow.png", 0, 22 )
backToPreviousButton:scale(.5, .5)
settingsGroup:toBack()

function backToPrevious(event)
	splashGroup.isVisible = true
	settingsGroup.isVisible = false
	return true
end

backToPreviousButton:addEventListener( "tap", backToPrevious )

settingsTable.settingsGroup = settingsGroup
settingsTable.backToPrevious = backToPrevious

return settingsTable
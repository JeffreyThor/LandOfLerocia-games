-----------------------------------------------------------------------------------------
--
-- controlsScreen.lua
--
-----------------------------------------------------------------------------------------

local controlsTable = {}

local controlsGroup = display.newGroup( )

local background = display.newImageRect( controlsGroup, "assets/UI/paperBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
background.xScale = 1.2
background.x = display.contentCenterX
background.y = display.contentCenterY

local dpad = display.newImage(controlsGroup, "assets/Controller/dpad.png", CONTENT_WIDTH*(1/4), CONTENT_HEIGHT/2)
local arrowKeys = display.newImage(controlsGroup, "assets/UI/arrowKeys.png", CONTENT_WIDTH*(3/4), CONTENT_HEIGHT/2)
local backToSettingsButton = display.newImage( controlsGroup, "assets/UI/backarrow.png", 0, 22 )
arrowKeys:scale( .5, .5 )
backToSettingsButton:scale(.5, .5)

local function backToPrevious(event)
	settingsGroup.isVisible = true
	controlsGroup.isVisible = false
	return true
end

backToSettingsButton:addEventListener( "tap", backToPrevious )

controlsTable.controlsGroup = controlsGroup

return controlsTable
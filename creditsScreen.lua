-----------------------------------------------------------------------------------------
--
-- creditsScreen.lua
--
-----------------------------------------------------------------------------------------

local creditsTable = {}

local soundTable = require("soundTable")

local creditsGroup = display.newGroup()

local background = display.newImageRect( creditsGroup, "assets/UI/paperBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
background.xScale = 1.2
background.x = display.contentCenterX
background.y = display.contentCenterY

local designedBy = display.newImage( creditsGroup, "assets/Credits/designedBy.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(0/4)+40 )
local jeffreyThor = display.newImage( creditsGroup, "assets/Credits/jeffreyThor.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4)+40 )
local developedBy = display.newImage( creditsGroup, "assets/Credits/developedBy.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(2/4)+40 )
local tmp = display.newImage( creditsGroup, "assets/Credits/jeffreyThor.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4)+40 )
local tmp1 = display.newImage( creditsGroup, "assets/Credits/artworkBy.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(4/4)+40 )
local tmp2 = display.newImage( creditsGroup, "assets/Credits/gameArt2D.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(5/4)+40 )
local tmp3 = display.newImage( creditsGroup, "assets/Credits/openGameArt.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(6/4)+40 )
local tmp4 = display.newImage( creditsGroup, "assets/Credits/musicAndSounds.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(7/4)+40 )
local tmp5 = display.newImage( creditsGroup, "assets/Credits/legendOfZelda.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(8/4)+40 )
local tmp6 = display.newImage( creditsGroup, "assets/Credits/FFVIII.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(9/4)+40 )
local tmp7 = display.newImage( creditsGroup, "assets/Credits/specialThanks.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(10/4)+40 )
local tmp8 = display.newImage( creditsGroup, "assets/Credits/mazlinHigbee.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(11/4)+40 )
local tmp9 = display.newImage( creditsGroup, "assets/Credits/nickScrivani.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(12/4)+40 )
local tmp10 = display.newImage( creditsGroup, "assets/Credits/timGlendinning.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(13/4)+40 )
local tmp11 = display.newImage( creditsGroup, "assets/Credits/nickDosSantos.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(14/4)+40 )

local function backToPrevious(event)
	audio.stop( 1 )
	settingsGroup.isVisible = true
	creditsGroup.isVisible = false
	audio.play(soundTable["TitleTheme"], {loops = -1})
	return true
end

local function startCredits()
	creditsGroup.y = creditsGroup.height/2+40
	print(creditsGroup.height)
	transition.to( creditsGroup, {time=20000, y=-creditsGroup.height-40, onComplete=backToPrevious} )
end

local backToSplashButton = display.newImage( creditsGroup, "assets/UI/backarrow.png", 0, 22 )
backToSplashButton:scale(.5, .5)

backToSplashButton:addEventListener( "tap", backToPrevious )

creditsTable.creditsGroup = creditsGroup
creditsTable.startCredits = startCredits

return creditsTable
-----------------------------------------------------------------------------------------
--
-- optionsScreen.lua
--
-----------------------------------------------------------------------------------------

local optionsTable = {}

local optionsGroup = display.newGroup( )

local background = display.newImageRect( optionsGroup, "assets/UI/paperBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
background.xScale = 1.2
background.x = display.contentCenterX
background.y = display.contentCenterY

local musicMuted = false
local soundMuted = false

local muteMusicButton = display.newImage( optionsGroup, "assets/UI/muteMusicButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(0/4) + 40 )
local musicCheckSpriteSheet = graphics.newImageSheet( "assets/UI/checkBoxSpriteSheet.png", {width=29, height=26, sheetContentWidth = 29*2, sheetContentHeight = 26*1, numFrames = 2} )
local musicCheck = display.newSprite( optionsGroup, musicCheckSpriteSheet, {name="check",frames={1,2},time=0,loopCount=0,loopDirection="forward"} )
musicCheck.x = CONTENT_WIDTH/2+muteMusicButton.width/2+10
musicCheck.y = CONTENT_HEIGHT*(0/4)+40

local muteSoundButton = display.newImage( optionsGroup, "assets/UI/muteSoundButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4) + 40 )
local soundCheckSpriteSheet = graphics.newImageSheet( "assets/UI/checkBoxSpriteSheet.png", {width=29, height=26, sheetContentWidth = 29*2, sheetContentHeight = 26*1, numFrames = 2} )
local soundCheck = display.newSprite( optionsGroup, musicCheckSpriteSheet, {name="check",frames={1,2},time=0,loopCount=0,loopDirection="forward"} )
soundCheck.x = CONTENT_WIDTH/2+muteMusicButton.width/2+10
soundCheck.y = CONTENT_HEIGHT*(1/4)+40

local backToSettingsButton = display.newImage( optionsGroup, "assets/UI/backarrow.png", 0, 22 )
backToSettingsButton:scale(.5, .5)

local function backToPrevious(event)
	settingsGroup.isVisible = true
	optionsGroup.isVisible = false
	return true
end

local function muteMusic(event)
	if(musicMuted == false) then
		audio.setVolume( 0.0, { channel=1 } )
		musicMuted = true
		musicCheck:setFrame( 2 )
	elseif(musicMuted == true) then
		audio.setVolume( 1.0, { channel=1 } )
		musicMuted = false
		musicCheck:setFrame( 1 )
	end
end

local function muteSound(event)
	if(soundMuted == false) then
		audio.setVolume( 0.0, { channel=2 } )
		soundMuted = true
		soundCheck:setFrame( 2 )
	elseif(soundMuted == true) then
		audio.setVolume( 1.0, { channel=2 } )
		soundMuted = false
		soundCheck:setFrame( 1 )
	end
end

backToSettingsButton:addEventListener( "tap", backToPrevious )
muteMusicButton:addEventListener( "tap", muteMusic )
muteSoundButton:addEventListener( "tap", muteSound )

optionsTable.optionsGroup = optionsGroup

return optionsTable
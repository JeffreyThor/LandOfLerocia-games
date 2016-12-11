-----------------------------------------------------------------------------------------
--
-- settingsScreen.lua
--
-----------------------------------------------------------------------------------------

local settingsTable = {}

local background = display.newImageRect( "assets/UI/paperBackground.png", CONTENT_WIDTH, CONTENT_HEIGHT )
local creditsToSettingsButton = display.newImage( "assets/UI/backarrow.png", 0, 22 )
background.xScale = 1.2
background.x = display.contentCenterX
background.y = display.contentCenterY
local settingsGroup = display.newGroup()
local optionsGroup = display.newGroup()
local controlsGroup = display.newGroup()
local creditsGroup = display.newGroup()
settingsGroup.isVisible = false
optionsGroup.isVisible = false
controlsGroup.isVisible = false
creditsGroup.isVisible = false
creditsToSettingsButton.isVisible = false
creditsToSettingsButton:scale(.5, .5)
creditsToSettingsButton:toFront()

--Settings Group Objects

local optionsButton = display.newImage( settingsGroup, "assets/UI/optionsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(0/4) + 40 )
local controlsButton = display.newImage( settingsGroup, "assets/UI/controlsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4) + 40 )
local saveButton = display.newImage( settingsGroup, "assets/UI/saveButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(2/4) + 40 )
local creditsButton = display.newImage( settingsGroup, "assets/UI/creditsButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4) + 40 )
local quitButton = display.newImage( settingsGroup, "assets/UI/quitButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4) + 40 )
local backToSplashButton = display.newImage( settingsGroup, "assets/UI/backarrow.png", 0, 22 )
backToSplashButton:scale(.5, .5)
saveButton.isVisible = false
quitButton.isVisible = false

--Options Group Objects

local muteMusicButton = display.newImage( optionsGroup, "assets/UI/muteMusicButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(0/4) + 40 )
local musicCheckSpriteSheet = graphics.newImageSheet( "assets/UI/checkBoxSpriteSheet.png", {width=29, height=26, sheetContentWidth = 29*2, sheetContentHeight = 26*1, numFrames = 2} )
local musicCheck = display.newSprite( optionsGroup, musicCheckSpriteSheet, {name="check",frames={1,2},time=0,loopCount=0,loopDirection="forward"} )
musicCheck.x = CONTENT_WIDTH/2+muteMusicButton.width/2+10
musicCheck.y = CONTENT_HEIGHT*(0/4)+40
local musicMuted = false
local muteSoundButton = display.newImage( optionsGroup, "assets/UI/muteSoundButton.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4) + 40 )
local soundCheckSpriteSheet = graphics.newImageSheet( "assets/UI/checkBoxSpriteSheet.png", {width=29, height=26, sheetContentWidth = 29*2, sheetContentHeight = 26*1, numFrames = 2} )
local soundCheck = display.newSprite( optionsGroup, musicCheckSpriteSheet, {name="check",frames={1,2},time=0,loopCount=0,loopDirection="forward"} )
soundCheck.x = CONTENT_WIDTH/2+muteMusicButton.width/2+10
soundCheck.y = CONTENT_HEIGHT*(1/4)+40
local soundMuted = false
local optionsToSettingsButton = display.newImage( optionsGroup, "assets/UI/backarrow.png", 0, 22 )
optionsToSettingsButton:scale(.5, .5)

--Controls Group Objects

local dpadImage = display.newImage(controlsGroup, "assets/Controller/dpad.png", CONTENT_WIDTH*(1/4), CONTENT_HEIGHT/2)
local arrowKeys = display.newImage(controlsGroup, "assets/UI/arrowKeys.png", CONTENT_WIDTH*(3/4), CONTENT_HEIGHT/2)
arrowKeys:scale( .5, .5 )
local controlsToSettingsButton = display.newImage( controlsGroup, "assets/UI/backarrow.png", 0, 22 )
controlsToSettingsButton:scale(.5, .5)

--Credits Group Objects

local designedBy = display.newImage( creditsGroup, "assets/Credits/designedBy.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(0/4)+40 )
local designerOne = display.newImage( creditsGroup, "assets/Credits/jeffreyThor.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(1/4)+40 )
local developedBy = display.newImage( creditsGroup, "assets/Credits/developedBy.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(2/4)+40 )
local developerOne = display.newImage( creditsGroup, "assets/Credits/jeffreyThor.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(3/4)+40 )
local artworkBy = display.newImage( creditsGroup, "assets/Credits/artworkBy.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(4/4)+40 )
local artworkOne = display.newImage( creditsGroup, "assets/Credits/gameArt2D.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(5/4)+40 )
local artworkTwo = display.newImage( creditsGroup, "assets/Credits/openGameArt.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(6/4)+40 )
local musicAndSounds = display.newImage( creditsGroup, "assets/Credits/musicAndSounds.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(7/4)+40 )
local soundsOne = display.newImage( creditsGroup, "assets/Credits/legendOfZelda.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(8/4)+40 )
local soundsTwo = display.newImage( creditsGroup, "assets/Credits/FFVIII.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(9/4)+40 )
local specialThanks = display.newImage( creditsGroup, "assets/Credits/specialThanks.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(10/4)+40 )
local thanksOne = display.newImage( creditsGroup, "assets/Credits/mazlinHigbee.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(11/4)+40 )
local thanksTwo = display.newImage( creditsGroup, "assets/Credits/nickScrivani.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(12/4)+40 )
local thanksThree = display.newImage( creditsGroup, "assets/Credits/timGlendinning.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(13/4)+40 )
local thanksFour = display.newImage( creditsGroup, "assets/Credits/nickDosSantos.png", CONTENT_WIDTH/2, CONTENT_HEIGHT*(14/4)+40 )

--Settings Group Functions

local function backToSplash()
	background.isVisible = false
	splashGroup.isVisible = true
	settingsGroup.isVisible = false
	dpad.dpadGroup.isVisible = true
	dpad.gameSettings.isVisible = true
end

local function options()
	settingsGroup.isVisible = false
	optionsGroup.isVisible = true
end

local function controls()
	settingsGroup.isVisible = false
	controlsGroup.isVisible = true
end

local function save()

end

local function credits()
	audio.stop(1)
	settingsGroup.isVisible = false
	creditsGroup.isVisible = true
	creditsToSettingsButton.isVisible = true
	creditsGroup.y = creditsGroup.height/4
	transition.to( creditsGroup, {time=20000, y=-creditsGroup.height-40, 
		onComplete = function()
			audio.stop(1)
			settingsGroup.isVisible = true
			creditsGroup.isVisible = false
			audio.play(soundTable["TitleTheme"], {loops = -1})
		end
	} )
	audio.play(soundTable["StaffCredits"])
end

local function quit()
	audio.stop(1)
	-- dpad.dpad.isVisible = false
	player:removeSelf()
	player = nil
	bosses.bossOne:removeSelf()
	bosses.bossTwo:removeSelf()
	bosses.bossThree:removeSelf()
	dpad.inGameSettings.isVisible = false
	dpad.characterDisplayButton.isVisible = false
	saveButton.isVisible = false
	quitButton.isVisible = false
	creditsButton.isVisible = true
	settingsGroup.isVisible = false
	background.isVisible = false
	dpad.dpadGroup.isVisible = false
	dpad.gameSettings.isVisible = false
	splashGroup.isVisible = true
	splashGroup.alpha = 1
	audio.play(soundTable["TitleTheme"], {loops = -1})
end

--Options Group Functions

local function optionsToSettings()
	settingsGroup.isVisible = true
	optionsGroup.isVisible = false
end

local function muteMusic()
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

local function muteSound()
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

--Controls Group Functions

local function controlsToSettings()
	settingsGroup.isVisible = true
	controlsGroup.isVisible = false
end

--Credits Group Functions

local function creditsToSettings()
	audio.stop(1)
	creditsToSettingsButton.isVisible = false
	settingsGroup.isVisible = true
	creditsGroup.isVisible = false
	audio.play(soundTable["TitleTheme"], {loops = -1})
end

--Settings Group Event Listeners

backToSplashButton:addEventListener( "tap", backToSplash )
optionsButton:addEventListener( "tap", options )
controlsButton:addEventListener( "tap", controls )
saveButton:addEventListener( "tap", save )
creditsButton:addEventListener( "tap", credits )
quitButton:addEventListener( "tap", quit )

--Options Group Event Listeners

optionsToSettingsButton:addEventListener( "tap", optionsToSettings )
muteMusicButton:addEventListener( "tap", muteMusic )
muteSoundButton:addEventListener( "tap", muteSound )

--Controls Group Event Listeners

controlsToSettingsButton:addEventListener( "tap", controlsToSettings )

--Credits Group Event Listeners

creditsToSettingsButton:addEventListener( "tap", creditsToSettings )

settingsTable.background = background
settingsTable.settingsGroup = settingsGroup
settingsTable.saveButton = saveButton
settingsTable.quitButton = quitButton
settingsTable.creditsButton = creditsButton
settingsTable.optionsGroup = optionsGroup
settingsTable.controlsGroup = controlsGroup
settingsTable.creditsGroup = creditsGroup

return settingsTable






















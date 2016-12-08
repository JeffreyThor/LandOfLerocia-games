-----------------------------------------------------------------------------------------
--
-- dpad.lua
--
-----------------------------------------------------------------------------------------

local dpadTable = {}

local dpadGroup = display.newGroup( )
local gameSettings = display.newGroup( )

local dpadAction = nil
local activeAction = nil
local inGameSettings = display.newImage( dpadGroup, "assets/UI/settingsInGame.png", 0, 22 )
inGameSettings:scale(.5, .5)
inGameSettings.isVisible = false
local dpad = display.newImage(dpadGroup, "assets/Controller/dpad.png", 20, CONTENT_HEIGHT - 64)
dpad.isVisible = false

local function playerCollided(event)
	print("Collided")
end

function movePlayer()
	activeAction = dpadAction
	local xAmount = 0
	local yAmount = 0
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
			-- player:setLinearVelocity( 0.0, 0.0 )
			player:play();
			activeAction = nil
			movePlayer()
		end
	})
end

local function dpadTouched(event)
	if (event.phase == "began") then
		if (event.x > dpad.x + 10) then
			dpadAction = "moveRight"
		elseif (event.x < dpad.x - 10) then
			dpadAction = "moveLeft"
		elseif (event.y > dpad.y + 10) then
			dpadAction = "moveDown"
		elseif (event.y < dpad.y - 10) then
			dpadAction = "moveUp"
		end

		if (activeAction == nil) then
			movePlayer()
		end
	elseif (event.phase == "ended") then
		dpadAction = nil
	end
end

local function keyboardTouched(event)
	if(event.phase == "down") then
		if(event.keyName == "right") then
			dpadAction = "moveRight"
		elseif (event.keyName == "left") then
			dpadAction = "moveLeft"
		elseif (event.keyName == "down") then
			dpadAction = "moveDown"
		elseif (event.keyName == "up") then
			dpadAction = "moveUp"
		end

		if(activeAction == nil) then
			movePlayer()
		end
	elseif(event.phase == "up") then
		dpadAction = nil
	end
end

local function settingsTouched(event)
	dpadGroup.isVisible = false
	gameSettings.isVisible = false
	settingsScreen.settingsGroup.isVisible = true
	settingsScreen.background.isVisible = true
end

local function useDpad()
	inGameSettings.isVisible = true
	dpad.isVisible = true
	dpadGroup.isVisible = true
	player:setSequence("idleDown")
	player:play()
	player:toFront( )
end

local function useKeyboard()
	dpad.isVisible = false
	dpadGroup.isVisible = true
	gameSettings.isVisible = true
	inGameSettings.isVisible = true
	Runtime:addEventListener( "key", keyboardTouched )
	player:setSequence("idleDown")
	player:play()
	player:toFront()
end

dpad:addEventListener( "touch", dpadTouched )
inGameSettings:addEventListener( "tap", settingsTouched )

dpadTable.settingsTouched = settingsTouched
dpadTable.useDpad = useDpad
dpadTable.useKeyboard = useKeyboard
dpadTable.gameSettings = gameSettings
dpadTable.inGameSettings = inGameSettings
dpadTable.dpadGroup = dpadGroup
dpadTable.dpad = dpad

return dpadTable



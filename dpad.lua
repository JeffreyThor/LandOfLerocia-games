-----------------------------------------------------------------------------------------
--
-- dpad.lua
--
-----------------------------------------------------------------------------------------

local mapImages = require("mapDisplay")
local player = require("player")
local settingsScreen = require("settingsScreen")
local dpadAction = nil
local activeAction = nil
local inGameSettings

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

	transition.to(mapImages, {time = player.speed, x = (mapImages.x - (xAmount * scale)), y = (mapImages.y - (yAmount * scale)),
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

function settingsTouched(event)
	settingsScreen.settingsGroup.isVisible = true
	settingsScreen.settingsGroup:toFront()
end

function showDpad()
	inGameSettings = display.newImage( "assets/UI/settingsInGame.png", 0, 26 )
	local dpad = display.newImage("assets/Controller/Movement.png", 0, CONTENT_HEIGHT - 50)
	dpad:scale(scale, scale)
	dpad:addEventListener( "touch", dpadTouched )
	player:setSequence("idleDown")
	player:play()
	player:toFront( )
end

function useKeyboard()
	inGameSettings = display.newImage( "assets/UI/settingsInGame.png", 0, 26 )
	inGameSettings:addEventListener( "tap", settingsTouched )
	Runtime:addEventListener( "key", keyboardTouched )
	player:setSequence("idleDown")
	player:play()
	player:toFront( )
end





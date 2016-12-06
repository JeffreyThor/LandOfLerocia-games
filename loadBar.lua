local loadIconSpriteSheet = graphics.newImageSheet( "assets/loadingBar.png", {width=400, height=40, sheetContentWidth=400*1, sheetContentHeight=40*11, numFrames=11} )
local sequenceData = {
	{name = "load", frames={1,2,3,4,5,6,7,8,9,10,11}, time = 2000, loopCount = 1, loopDirection = "forward"}
}
local loadIcon = display.newSprite(loadIconSpriteSheet, sequenceData)
loadIcon.x = CONTENT_WIDTH/2;
loadIcon.y = CONTENT_HEIGHT/2;
-- loadIcon:setSequence( "load" )
-- loadIcon:play()
return loadIcon
-----------------------------------------------------------------------------------------
--
-- mapDisplay.lua
--
-----------------------------------------------------------------------------------------

map = require("GameMap")
local mapImages = display.newGroup()
local physics = require("physics")
local loadBar = require("loadBar")
physics.start( )

local function getTileInSet(setIndex, tileIndex)
	tileIndex = tileIndex - map.tilesets[setIndex].firstgid
	for i = 1, map.tilesets[setIndex].tilecount do
		if (map.tilesets[setIndex].tiles[i].id == tileIndex) then
			return map.tilesets[setIndex].tiles[i]
		end
	end

	return nil
end

local function getTileForIndex(index)
	if (index == 0) then
		return nil
	end

	for i = 1, #map.tilesets do
		offset = map.tilesets[i].firstgid
		if (offset > index) then
			return getTileInSet(i - 1, index)
		end
	end

	return nil
end

for layerIndex = 1, #map.layers do
	-- print("Printing layer: " .. map.layers[layerIndex].name)
	layer = map.layers[layerIndex]
	for y = 1, layer.height do
		for x = 1, layer.width do
			index = ((y-1)*layer.width) + x
			tile = getTileForIndex(layer.data[index])
			if (tile ~= nil) then
				tileImage = display.newImage(tile.image, (tile.width*(x)*scale), (tile.height*(y)*scale))
        tileImage:scale(scale, scale)
        local nw, nh = tileImage.width*scale*0.5, tileImage.height*scale*0.5;
        if (layer.name == "Tree and Fence Border Layer") then
         print("adding physics body to "..tile.image)
         physics.addBody( tileImage, "static", { desnity=1.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         tileImage.myName = "object"
        end
				mapImages:insert(tileImage)
			end
		end
	end
end

return mapImages
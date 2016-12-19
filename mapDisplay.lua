-----------------------------------------------------------------------------------------
--
-- mapDisplay.lua
--
-----------------------------------------------------------------------------------------

map = require("GameMap")
local mapImages = display.newGroup()

local function getTileInSet(setIndex, tileIndex)
	tileIndex = tileIndex - map.tilesets[setIndex].firstgid
	for i = 1, map.tilesets[setIndex].tilecount do
		if (map.tilesets[setIndex].tiles[i].id == tileIndex) then
			return map.tilesets[setIndex].tiles[i]
		end
	end

	return nil
end

-- Assumes that #map.tilesets is ordered by cooresponding `firstgid` values
local function getTileForIndex(index)
	if (index == 0) then
		return nil
	end

	for i = 1, #map.tilesets do
		if (i < #map.tilesets) then
			firstgid = map.tilesets[i + 1].firstgid
			if (firstgid > index) then
				return getTileInSet(i, index)
			end	
		end
	end

	return getTileInSet(#map.tilesets, index);
end

for layerIndex = 1, #map.layers do
	print("Printing layer: " .. map.layers[layerIndex].name)
	layer = map.layers[layerIndex]
	for y = 1, layer.height do
		for x = 1, layer.width do
			index = ((y-1)*layer.width) + x
			tile = getTileForIndex(layer.data[index])
			if (tile ~= nil) then
				tileImage = display.newImage(tile.image, (tile.width*(x)*scale), (tile.height*(y)*scale))
        		tileImage:scale(scale, scale)
        		local nw, nh = tileImage.width*scale*0.5, tileImage.height*scale*0.5;
        		if (layer.name == "Object Layer 1") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "object"
         		elseif(layer.name == "Battle Layer 1") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "battleStage1"
         		elseif(layer.name == "Battle Layer 2") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "battleStage2"
         		elseif(layer.name == "Battle Layer 3") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "battleStage3"
         		elseif(layer.name == "Boss Layer 1") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "bossStage1"
         		elseif(layer.name == "Boss Layer 2") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "bossStage2"
         		elseif(layer.name == "Boss Layer 3") then
         			physics.addBody( tileImage, "static", { density=0.0,friction=0.0, bounce=0.0, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
         			tileImage.type = "bossStage3"
        		end
				mapImages:insert(tileImage)
			end
		end
	end
end

return mapImages

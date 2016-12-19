-----------------------------------------------------------------------------------------
--
-- mapDisplay.lua
--
-- Custom parser for Tiled map editor exported lua files
--
-----------------------------------------------------------------------------------------

-- Requires Tiled lua file and creates the map display group
map = require("GameMap")
local mapImages = display.newGroup()

-- Receives a tile set and return all tiles in that set
local function getTileInSet(setIndex, tileIndex)
	tileIndex = tileIndex - map.tilesets[setIndex].firstgid
	for i = 1, map.tilesets[setIndex].tilecount do
		if (map.tilesets[setIndex].tiles[i].id == tileIndex) then
			return map.tilesets[setIndex].tiles[i]
		end
	end

	return nil
end

-- Assumes that #map.tilesets is ordered by cooresponding 'firstgid' values
local function getTileForIndex(index)
	if (index == 0) then
		return nil
	end
	-- A tiles true id will always be higher than the id of the last tile in previous set, this is used to find correct tileset
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

-- Goes through all map layers and pulls each tile image from each layer based on GameMap lua file
for layerIndex = 1, #map.layers do -- Loop through each layer of the map
	print("Printing layer: " .. map.layers[layerIndex].name) -- For developer reference to check which layers are being printed
	layer = map.layers[layerIndex] -- Sets a 'layer' variable with the index of the map layer corresponding to the current iteration of the for loop
	for y = 1, layer.height do -- Will loop through the overall height (in #tiles) of current map layer
		for x = 1, layer.width do -- Will loop through the overall width (in #tiles) of current map layer
			index = ((y-1)*layer.width) + x
			tile = getTileForIndex(layer.data[index]) -- Will go find tiles in the current layer and store entire reference to that tile
			if (tile ~= nil) then -- If a tile exists at these coordinates in this layer
				tileImage = display.newImage(tile.image, (tile.width*(x)*scale), (tile.height*(y)*scale)) -- Import and store image of current tile pulled from getTileForIndex
        		tileImage:scale(scale, scale) -- Scale tile based on global scaling (original pixel size of 128*128)
        		local nw, nh = tileImage.width*scale*0.5, tileImage.height*scale*0.5 -- Creating variables to use for custom physics body since physics bodies don't scale with the image
        		-- Physics bodies are layer dependent. All tiles in layer will be given that layers physics body whether it be for collision, battle zones, or boss tiles
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
				mapImages:insert(tileImage) -- Inserts tile in the map display group
			end
		end
	end
end

return mapImages

--[[
	Screenshot Atlas
	v1.0
	by: standardcombo
--]]

local API = {}
_G.ScreenshotAtlas = API

local IMAGE_TEMPLATE = script:GetCustomProperty("ImageTemplate")


function API.SpawnImage(gameId, screenshotIndex, atlasIndex, size)
	local imagePanel = World.SpawnAsset(IMAGE_TEMPLATE)
	
	imagePanel.width = size
	imagePanel.height = size
	
	local image = imagePanel:GetChildren()[1]
	-- Screenshot
	image:SetGameScreenshot(gameId, screenshotIndex)
	-- Width
	image.width = math.ceil(size * 3.55555)
	-- Height
	image.height = math.ceil(size * 2)
	-- X coordinate on atlas
	if atlasIndex == 1 or atlasIndex == 4 then
		image.x = 0
	
	elseif atlasIndex == 2 or atlasIndex == 5 then
		image.x = -size
	else
		image.x = -(size * 2)
	end
	-- Y coordinate on atlas
	if atlasIndex == 1 or atlasIndex == 2 or atlasIndex == 3 then
		image.y = 0
	else
		image.y = -size
	end
	
	return imagePanel
end


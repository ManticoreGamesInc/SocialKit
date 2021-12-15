
local API = {}
_G.ExternalBadges = API

local BADGE_TEMPLATE = script:GetCustomProperty("BadgeTemplate")
local GAME_ID = script:GetCustomProperty("GameId")

local badges = {}
local people = {}

local isLoaded = false


function API.GetBadges(player, size)
	while not isLoaded do
		Task.Wait()
		if not Object.IsValid(player) then return end
	end
	
	local playerName = string.lower(player.name)
	local entry = people[playerName]
	
	if not entry then return nil end
	
	local badgeImages = {}
	
	for _,badgeId in ipairs(entry) do
		local badgeData = badges[badgeId]
		if badgeData then
			local image = World.SpawnAsset(BADGE_TEMPLATE)
			table.insert(badgeImages, image)
			
			image.width = size
			image.height = size
			
			image = image:GetChildren()[1]
			
			SetupImage(image, GAME_ID, badgeData.screenshotIndex, badgeData.atlasIndex, size)
		else
			warn("Did not find data for badge " .. badgeId)
		end
	end
	return badgeImages
end


function SetupImage(image, gameId, screenshotIndex, atlasIndex, size)
	image:SetGameScreenshot(gameId, screenshotIndex)
	-- W & H
	image.width = math.ceil(size * 3.55555)
	image.height = math.ceil(size * 2)
	-- X
	if atlasIndex == 1 or atlasIndex == 4 then
		image.x = 0
	
	elseif atlasIndex == 2 or atlasIndex == 5 then
		image.x = -size
	else
		image.x = -(size * 2)
	end
	-- Y
	if atlasIndex == 1 or atlasIndex == 2 or atlasIndex == 3 then
		image.y = 0
	else
		image.y = -size
	end
end


function ParseData(data)
	badges = {}
	people = {}
	
	local badgesHead1, badgesHead2 = string.find(data, "Badges")
	local peopleHead1, peopleHead2 = string.find(data, "People")
	
	if badgesHead1 == nil or peopleHead1 == nil then return end
	
	local badgesData = string.sub(data, badgesHead2 + 1, peopleHead1 - 1)
	local peopleData = string.sub(data, peopleHead2 + 1)
	
	--print(badgesData)
	--print(peopleData)
	
	local badgeEntries = { CoreString.Split(badgesData, "\n", {removeEmptyResults = true}) }
	local peopleEntries = { CoreString.Split(peopleData, "\n", {removeEmptyResults = true}) }
	
	local params = {delimiters = {":", ","}}
	-- Parse badges
	for _,entry in ipairs(badgeEntries) do
		local badgeId, screenshotIndex, atlasIndex = CoreString.Split(entry, params)
		
		if badgeId ~= nil and screenshotIndex ~= nil and atlasIndex ~= nil then
			badgeId = CoreString.Trim(badgeId)
			screenshotIndex = CoreString.Trim(screenshotIndex)
			atlasIndex = CoreString.Trim(atlasIndex)
			
			entry = {
				screenshotIndex = tonumber(screenshotIndex),
				atlasIndex = tonumber(atlasIndex)
			}
			badges[badgeId] = entry
		end
	end
	-- Parse people
	for _,entry in ipairs(peopleEntries) do
		entry = { CoreString.Split(entry, params) }
		for i,str in ipairs(entry) do
			entry[i] = CoreString.Trim(str)
		end
		local playerName = string.lower( entry[1] )
		table.remove(entry, 1)
		
		people[playerName] = entry
	end
end

function Load()
	-- Get metadata from game description
	local gameInfo = CorePlatform.GetGameInfo(GAME_ID)
	
	ParseData(gameInfo.description)
	
	isLoaded = true
end

Load()



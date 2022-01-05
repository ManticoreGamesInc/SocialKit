--[[
	External Badges
	v1.0
	by: standardcombo
	
	External Badges depend on the 'Screenshot Atlas' component, for loading images from
	the screenshots of another published game.
	
	Optional interface: _G.RuntimeBadges.GetBadges(player)
		This function can be implemented to return a table of badge IDs, if given a player.
--]]

local API = {}
_G.ExternalBadges = API

local GAME_ID = script:GetCustomProperty("GameId")

local badges = {}
local people = {}

local isLoaded = false


function API.GetBadges(player, size)
	if not _G.ScreenshotAtlas then
		error("'External Badges' depends on the 'Screenshot Atlas' component.")
	end
	
	while not isLoaded do
		Task.Wait()
		if not Object.IsValid(player) then return end
	end
		
	local badgeImages = {}
	
	-- _G.RuntimeBadges is an interface for badges to be assigned to players at runtime.
	-- This way, there's no need to edit and republish the badges project.
	local runtimeBadgeDict = {}
	if _G.RuntimeBadges then
		local runtimeBadgeIds = _G.RuntimeBadges.GetBadges(player)
		for _,badgeId in ipairs(runtimeBadgeIds) do
			runtimeBadgeDict[badgeId] = true
			
			local image = SpawnBadgeImage(badgeId, size)
			if image then
				table.insert(badgeImages, image)
			end
		end
	end
	
	-- Load badges that are set for this player in the badges project's description.
	local playerName = string.lower(player.name)
	local entry = people[playerName]
	
	if not entry then return badgeImages end
	
	for _,badgeId in ipairs(entry) do
		-- Avoid adding duplicates
		if not runtimeBadgeDict[badgeId] then
			local image = SpawnBadgeImage(badgeId, size)
			if image then
				table.insert(badgeImages, image)
			end
		end
	end
	return badgeImages
end

function SpawnBadgeImage(badgeId, size)
	local badgeData = badges[badgeId]
	if badgeData then
		local params = {
			gameId = GAME_ID, 
			screenshotIndex = badgeData.screenshotIndex, 
			atlasIndex = badgeData.atlasIndex,
			imageSize = size
		}
		return _G.ScreenshotAtlas.SpawnImage(params)
	else
		warn("Did not find data for badge " .. badgeId)
	end
	return nil
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




local RESOURCE_NAME = script:GetCustomProperty("ResourceName")
local START_VALUE = script:GetCustomProperty("StartValue")
local SECONDS_TO_WAIT = script:GetCustomProperty("SecondsToWait")
local GAIN_AMOUNT = script:GetCustomProperty("GainAmount")


function SetupAFK(player)
	while true do
		local resValue = player:GetResource(RESOURCE_NAME)
		Events.BroadcastToPlayer(player, "AfkUpdate", SECONDS_TO_WAIT, resValue)
		
		Task.Wait(SECONDS_TO_WAIT)
		if not Object.IsValid(player) then return end
		
		player:AddResource(RESOURCE_NAME, GAIN_AMOUNT)
	end
end


function OnPlayerJoined(player)
	local data = Storage.GetPlayerData(player)
	
	local value = data[RESOURCE_NAME]
	if not value then
		value = START_VALUE
	end
	
	player:SetResource(RESOURCE_NAME, value)
	
	SetupAFK(player)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)


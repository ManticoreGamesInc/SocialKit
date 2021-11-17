
local AFK_RES_SERVER = script:GetCustomProperty("AFKResourceServer"):WaitForObject()
local PROGRESS_BAR = script:GetCustomProperty("CustomProgressBar"):WaitForObject()
local UI_TEXT = script:GetCustomProperty("UITextBox"):WaitForObject()

local RESOURCE_NAME = AFK_RES_SERVER:GetCustomProperty("ResourceName")
local SECONDS_TO_WAIT = AFK_RES_SERVER:GetCustomProperty("SecondsToWait")

local player = Game.GetLocalPlayer()
local duration = SECONDS_TO_WAIT - 1
local elapsedTime = 0


function Tick(deltaTime)
	local percent = 0
	
	if duration > 0 then
		elapsedTime = elapsedTime + deltaTime
		percent = CoreMath.Clamp(elapsedTime / duration)
	end
	
	PROGRESS_BAR:SetCustomProperty("Percent", percent)
end


function UpdateLabel(value)
	--TODO: Format with commas
	UI_TEXT.text = tostring(value)
end

function OnResourceChanged(player, resName)
	if resName ~= RESOURCE_NAME then return end
	
	local value = player:GetResource(resName)
	UpdateLabel(value)
end

player.resourceChangedEvent:Connect(OnResourceChanged)
OnResourceChanged(player, RESOURCE_NAME)


Events.Connect("AfkUpdate", function(waitTime, resValue)
	duration = waitTime
	elapsedTime = 0
	UpdateLabel(resValue)
end)


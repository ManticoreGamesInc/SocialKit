
local MAIN_PANEL = script:GetCustomProperty("MainPanel"):WaitForObject()
local OUTSIDE_BUTTON = script:GetCustomProperty("OutsideButton"):WaitForObject()
local CLOSE_BUTTON = script:GetCustomProperty("CloseButton"):WaitForObject()
local YES_BUTTON = script:GetCustomProperty("YesButton"):WaitForObject()
local DISPLAY_NAME = script:GetCustomProperty("DisplayName"):WaitForObject()
local DESCRIPTION = script:GetCustomProperty("Description"):WaitForObject()
local USES_TEXT = script:GetCustomProperty("UsesText"):WaitForObject()
local RP_ICON = script:GetCustomProperty("RPIcon"):WaitForObject()
local RP_TEXT = script:GetCustomProperty("RPText"):WaitForObject()

local OFF_Y = 850
local MOVE_SPEED = 16

local STATE_HIDDEN = 1
local STATE_IN = 2
local STATE_IDLE = 3
local STATE_OUT = 4
local currentState = STATE_HIDDEN
local elapsedTime = 0


function CompleteTransaction()
	-- TODO
end


function Show()
	SetState(STATE_IN)
end

function Hide()
	Events.Broadcast("ConfirmBuyHidden")
	SetState(STATE_OUT)
end


function OnConfirmBuy(itemData)
	DISPLAY_NAME.text = itemData.displayName
	DESCRIPTION.text = itemData.description
	USES_TEXT.text = "Uses: " .. itemData.numberOfUses
	if itemData.rpGained > 0 then
		RP_ICON.visibility = Visibility.INHERIT
		RP_TEXT.visibility = Visibility.INHERIT
		RP_TEXT.text = "+" .. itemData.rpGained
	else
		RP_ICON.visibility = Visibility.FORCE_OFF
		RP_TEXT.visibility = Visibility.FORCE_OFF
	end
	Show()
end
Events.Connect("ConfirmBuy", OnConfirmBuy)
Events.Connect("CancelBuy", Hide)


function SetState(newState)
	if newState == STATE_HIDDEN then
		MAIN_PANEL.visibility = Visibility.FORCE_OFF
		
	elseif newState == STATE_IN then
		MAIN_PANEL.visibility = Visibility.INHERIT
		UI.SetCursorVisible(true)
		UI.SetCanCursorInteractWithUI(true)
		MAIN_PANEL.y = OFF_Y
	
	elseif newState == STATE_IDLE then
		OUTSIDE_BUTTON.visibility = Visibility.INHERIT
	
	elseif newState == STATE_OUT then
		UI.SetCursorVisible(false)
		UI.SetCanCursorInteractWithUI(false)
		OUTSIDE_BUTTON.visibility = Visibility.FORCE_OFF
	end
	currentState = newState
	elapsedTime = 0
end


function Tick(deltaTime)
	elapsedTime = elapsedTime + deltaTime
	
	if currentState == STATE_IN then
		MAIN_PANEL.y = CoreMath.Lerp(MAIN_PANEL.y, 0, deltaTime * MOVE_SPEED)
		if MAIN_PANEL.y < 1 then
			MAIN_PANEL.y = 0
			SetState(STATE_IDLE)
		end
	
	elseif currentState == STATE_OUT then
		MAIN_PANEL.y = CoreMath.Lerp(MAIN_PANEL.y, OFF_Y, deltaTime * MOVE_SPEED)
		if MAIN_PANEL.y > OFF_Y - 1 then
			SetState(STATE_HIDDEN)
		end
	end
end


function OnYesPressed()
	if currentState == STATE_IDLE then
		Hide()
		CompleteTransaction()
	end
end

function OnClosePressed()
	if currentState == STATE_IDLE
	or (currentState == STATE_IN and elapsedTime >= 0.15) then
		Hide()
	end
end

OUTSIDE_BUTTON.clickedEvent:Connect(OnClosePressed)
CLOSE_BUTTON.clickedEvent:Connect(OnClosePressed)
YES_BUTTON.clickedEvent:Connect(OnYesPressed)


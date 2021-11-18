
local MAIN_PANEL = script:GetCustomProperty("MainPanel"):WaitForObject()
local OUTSIDE_BUTTON = script:GetCustomProperty("OutsideButton"):WaitForObject()
local CLOSE_BUTTON = script:GetCustomProperty("CloseButton"):WaitForObject()
local FADE_COLOR = script:GetCustomProperty("FadeColor")
local MOVE_SPEED = script:GetCustomProperty("MoveSpeed")
local OFF_Y = script:GetCustomProperty("OffScreenY")

STATE_HIDDEN = 1
STATE_IN = 2
STATE_IDLE = 3
STATE_OUT = 4
currentState = STATE_HIDDEN
elapsedTime = 0


function Show()
	SetState(STATE_IN)
end

function Hide()
	Events.Broadcast("ModalHidden", script.context)
	SetState(STATE_OUT)
end

function SetState(newState)
	if newState == STATE_HIDDEN then
		MAIN_PANEL.visibility = Visibility.FORCE_OFF
		OUTSIDE_BUTTON.visibility = Visibility.INHERIT
		
	elseif newState == STATE_IN then
		MAIN_PANEL.visibility = Visibility.INHERIT
		OUTSIDE_BUTTON.visibility = Visibility.INHERIT
		UI.SetCursorVisible(true)
		UI.SetCanCursorInteractWithUI(true)
		MAIN_PANEL.y = OFF_Y
	
	elseif newState == STATE_IDLE then
		-- do nothing
	
	elseif newState == STATE_OUT then
		UI.SetCursorVisible(false)
		UI.SetCanCursorInteractWithUI(false)
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
		UpdateFadeColor()
	
	elseif currentState == STATE_OUT then
		MAIN_PANEL.y = CoreMath.Lerp(MAIN_PANEL.y, OFF_Y, deltaTime * MOVE_SPEED)
		if MAIN_PANEL.y > OFF_Y - 1 then
			SetState(STATE_HIDDEN)
		end
		UpdateFadeColor()
	end
end


function UpdateFadeColor()
	local t = (OFF_Y - MAIN_PANEL.y) / OFF_Y
	local c = Color.Lerp(Color.New(0,0,0,0), FADE_COLOR, t)
	OUTSIDE_BUTTON:SetButtonColor(c)
end


function OnYesPressed()
	if currentState == STATE_IDLE then
		local success = CompleteTransaction()
		if success then
			Hide()
			--TODO: Buy SFX
		else
			--TODO: Error SFX
		end
	end
end

function OnClosePressed()
	if currentState == STATE_IDLE
	or (currentState == STATE_IN and elapsedTime >= 0.15) then
		Hide()
		--TODO: Click SFX
	end
end

OUTSIDE_BUTTON.clickedEvent:Connect(OnClosePressed)
CLOSE_BUTTON.clickedEvent:Connect(OnClosePressed)



local EQUIPMENT = script:FindAncestorByType("Equipment")
local IK_ROOT = script:GetCustomProperty("IKRoot"):WaitForObject()
local IK_ANCHOR = script:GetCustomProperty("IKAnchor"):WaitForObject()
local SLURP_SFX = script:GetCustomProperty("SlurpSound"):WaitForObject()
local GULP_SFX = script:GetCustomProperty("GulpSound"):WaitForObject()

local PLAYER = Game.GetLocalPlayer()

local isDrinking = false
local gulpCountdown = 0

local pressedListener = nil
local releasedListener = nil


function Tick(deltaTime)
	if isDrinking then
		gulpCountdown = gulpCountdown - deltaTime
		if gulpCountdown <= 0 then
			gulpCountdown = 1
			
			GULP_SFX:Play()
		end
	end
end


function StartDrinking()
	isDrinking = true
	gulpCountdown = 1
	
	IK_ROOT:AttachToPlayer(EQUIPMENT.owner, "head")
	_G.IkStack.Add(EQUIPMENT.owner, IK_ANCHOR)
	
	if math.random() < 0.2 then
		SLURP_SFX:Play() -- Random chance of 20% to play slurp noise
	end
end


function StopDrinking()
	isDrinking = false
	
	_G.IkStack.Remove(EQUIPMENT.owner, IK_ANCHOR)
end


function OnBindingPressed(player, action)
	if player ~= EQUIPMENT.owner then return end
	
	if action == "ability_primary" then
		StartDrinking()
	end
end
pressedListener = PLAYER.bindingPressedEvent:Connect(OnBindingPressed)


function OnBindingReleased(player, action)
	if player ~= EQUIPMENT.owner then return end
	
	if action == "ability_primary" then
		StopDrinking()
	end
end
releasedListener = PLAYER.bindingReleasedEvent:Connect(OnBindingReleased)


function OnPropertyChanged()
	if player == EQUIPMENT.owner then return end
	
	if EQUIPMENT:GetCustomProperty("IsDrinking") then
		if not isDrinking then
			StartDrinking()
		end
		
	elseif isDrinking then
		StopDrinking()
	end
end
EQUIPMENT.customPropertyChangedEvent:Connect(OnPropertyChanged)


EQUIPMENT.unequippedEvent:Connect(function(equip, player)
	if Object.IsValid(player) then
		_G.IkStack.Remove(player, IK_ANCHOR)
	end
end)


script.destroyEvent:Connect(function()
	if Object.IsValid(EQUIPMENT.owner) then
		_G.IkStack.Remove(EQUIPMENT.owner, IK_ANCHOR)
	end
	
	if Object.IsValid(IK_ROOT) then
		IK_ROOT:Destroy()
	end

	if pressedListener then
		pressedListener:Disconnect()
		pressedListener = nil
	end
	if releasedListener then
		releasedListener:Disconnect()
		releasedListener = nil
	end
end)


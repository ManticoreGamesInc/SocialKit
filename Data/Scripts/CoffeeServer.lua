
local EQUIPMENT = script.parent

local STANCE = "unarmed_carry_object_low"

local pressedListener = nil
local releasedListener = nil


function OnBindingPressed(player, action)
	if action == "ability_extra_29" then
		EQUIPMENT:Destroy()
		
	elseif action == "ability_primary" then
		EQUIPMENT:SetCustomProperty("IsDrinking", true)
	end
end


function OnBindingReleased(player, action)
	if action == "ability_primary" then
		EQUIPMENT:SetCustomProperty("IsDrinking", false)
	end
end


function OnEquippedEvent(equipment, player)
	_G.StanceStack.Add(player, STANCE, script.id)
	
	pressedListener = player.bindingPressedEvent:Connect(OnBindingPressed)
	releasedListener = player.bindingReleasedEvent:Connect(OnBindingReleased)
end
EQUIPMENT.equippedEvent:Connect(OnEquippedEvent)

function OnUnequippedEvent(equipment, player)
	if not Object.IsValid(player) then return end
	if not Object.IsValid(script) then return end
	
	_G.StanceStack.Remove(player, STANCE, script.id)
end
EQUIPMENT.unequippedEvent:Connect(OnUnequippedEvent)

script.destroyEvent:Connect(function()
	if Object.IsValid(EQUIPMENT)
	and Object.IsValid(EQUIPMENT.owner)
	and Object.IsValid(script)
	then
		_G.StanceStack.Remove(EQUIPMENT.owner, STANCE, script.id)
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


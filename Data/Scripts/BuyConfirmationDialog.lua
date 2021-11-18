
local MODAL = script:GetCustomProperty("ModalPopup"):WaitForObject()
MODAL = MODAL.context

local YES_BUTTON = script:GetCustomProperty("YesButton"):WaitForObject()
local DISPLAY_NAME = script:GetCustomProperty("DisplayName"):WaitForObject()
local DESCRIPTION = script:GetCustomProperty("Description"):WaitForObject()
local USES_TEXT = script:GetCustomProperty("UsesText"):WaitForObject()
local RP_ICON = script:GetCustomProperty("RPIcon"):WaitForObject()
local RP_TEXT = script:GetCustomProperty("RPText"):WaitForObject()
local COST_TEXT = script:GetCustomProperty("CostText"):WaitForObject()

local player = Game.GetLocalPlayer()
local itemDefinition = nil


function OnConfirmBuyInvoked(itemDefinition)
	UpdateContents(itemDefinition)
	MODAL.Show()
end

function Hide()
	MODAL.Hide()
end

function OnModalHidden(modal)
	if modal == MODAL then
		Events.Broadcast("ConfirmBuyHidden")
	end
end

Events.Connect("ConfirmBuy", OnConfirmBuyInvoked)
Events.Connect("CancelBuy", Hide)
Events.Connect("ModalHidden", OnModalHidden)


function CompleteTransaction()
	if CanAfford() then
		Events.BroadcastToServer("CompleteBuy", itemDefinition.id)
		return true
	end
	return false
end

function CanAfford()
	return itemDefinition.cost <= player:GetResource("Coins")
end


function UpdateContents(itemDef)
	itemDefinition = itemDef
	
	-- Name & Description
	DISPLAY_NAME.text = itemDefinition.displayName
	DESCRIPTION.text = itemDefinition.description
	-- Uses
	USES_TEXT.text = "Uses: " .. itemDefinition.numberOfUses
	-- RP
	if itemDefinition.rpGained > 0 then
		RP_ICON.visibility = Visibility.INHERIT
		RP_TEXT.visibility = Visibility.INHERIT
		RP_TEXT.text = "+" .. itemDefinition.rpGained
	else
		RP_ICON.visibility = Visibility.FORCE_OFF
		RP_TEXT.visibility = Visibility.FORCE_OFF
	end
	-- Cost
	COST_TEXT.text = tostring(itemDefinition.cost)
	local aproxSize = COST_TEXT:ComputeApproximateSize()
	if aproxSize then
		local coinIconWidth = 31
		COST_TEXT.x = coinIconWidth - (coinIconWidth + aproxSize.x) / 2
	else
		COST_TEXT.x = 0
	end
	if CanAfford() then
		COST_TEXT:SetColor(Color.WHITE)
	else
		COST_TEXT:SetColor(CLOSE_BUTTON:GetButtonColor())
	end
end


function OnYesPressed()
	if MODAL.currentState == MODAL.STATE_IDLE then
		local success = CompleteTransaction()
		if success then
			Hide()
			--TODO: Buy SFX
		else
			--TODO: Error SFX
		end
	end
end

YES_BUTTON.clickedEvent:Connect(OnYesPressed)


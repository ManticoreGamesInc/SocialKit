
local SHOP_ID = script:GetCustomProperty("ShopID")
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local EXIT_TRIGGER = script:GetCustomProperty("ExitTrigger"):WaitForObject()

local isInteractableLogic = TRIGGER.isInteractable

Task.Wait()

local shopDefinition = _G.Shops.GetDefinition(SHOP_ID)
local itemDefinition = _G.Consumables.GetDefinition(shopDefinition.itemId)

TRIGGER.interactionLabel = shopDefinition.displayName


function OnInteracted(trigger, player)
	Events.Broadcast("ConfirmBuy", itemDefinition)
	
	TRIGGER.isInteractable = false
end

function OnBeginOverlap(trigger, player)
	if not player:IsA("Player") then return end
	
	Events.Broadcast("ConfirmBuy", itemDefinition)
end

function OnEndOverlap(trigger, player)
	if not player:IsA("Player") then return end
	
	Events.Broadcast("CancelBuy")
	
	RestoreInteractable()
end

function RestoreInteractable()
	if isInteractableLogic then
		Task.Wait(0.2)
		TRIGGER.isInteractable = true
	end
end
Events.Connect("ConfirmBuyHidden", RestoreInteractable)


if isInteractableLogic then
	TRIGGER.interactedEvent:Connect(OnInteracted)
else
	TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
end
EXIT_TRIGGER.endOverlapEvent:Connect(OnEndOverlap)


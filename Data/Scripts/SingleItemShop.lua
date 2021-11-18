
local SHOP_ID = script:GetCustomProperty("ShopID")
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()


function OnBeginOverlap(trigger, player)
	print("OnBeginOverlap " .. tostring(player))
	
	if not player:IsA("Player") then return end
	
	local itemId = nil --TODO
	Events.Broadcast("ConfirmBuy", itemId)
end

function OnEndOverlap(trigger, player)
	if not player:IsA("Player") then return end
	
	Events.Broadcast("CancelBuy")
end

TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)

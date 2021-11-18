

function OnCompleteBuy(player, itemId)
	local itemDefinition = _G.Consumables.GetDefinition(itemId)
	if itemDefinition 
	and itemDefinition.cost <= player:GetResource("Coins")
	then
		local item = World.SpawnAsset(itemDefinition.model, {networkContext = NetworkContextType.NETWORKED})
		item:Equip(player)
		player:RemoveResource("Coins", itemDefinition.cost)
	end
end

Events.ConnectForPlayer("CompleteBuy", OnCompleteBuy)
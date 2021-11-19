--[[
	Chair - Server
	v1.0
	by: standardcombo
--]]

local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local GET_UP_PRIMARY_BINDING = script:GetCustomProperty("GetUpPrimaryBinding")
local GET_UP_SECONDARY_BINDING = script:GetCustomProperty("GetUpSecondaryBinding")

local EVENT_ID = "sit_"..ROOT.id
local STANCE = "unarmed_sit_chair_upright"

local sittingPlayer = nil
local bindingListener = nil
local originalJumpCount = 1
local getUpFBlocked = false


function GetUp()
	print("GetUp() 1")
	
	local player = sittingPlayer
	sittingPlayer = nil
	
	if not Object.IsValid(player) then return end
	
	print("GetUp() 2")
	
	player:Detach()
	_G.StanceStack.Remove(player, STANCE, script.id)
	
	player:SetWorldPosition(script:GetWorldPosition() + Vector3.UP * 10)
	
	CleanupListeners()
	
	Task.Wait(0.15)
	if not Object.IsValid(player) then return end
	player.maxJumpCount = originalJumpCount
end


function OnBindingPressed(player, action)
	if action == GET_UP_SECONDARY_BINDING
	or (action == GET_UP_PRIMARY_BINDING and not getUpFBlocked) then
		GetUp()
	end
end


function OnSit(player)
	if not Object.IsValid(player) then return end
	if Object.IsValid(sittingPlayer) then return end
	
	--print("Sit")
	
	sittingPlayer = player
	
	if player.serverUserData.chairScript then
		-- Get up from previous chair
		player.serverUserData.chairScript.context.GetUp()
	end
	player.serverUserData.chairScript = script
	
	player:SetWorldPosition(script:GetWorldPosition())
	player:SetWorldRotation(script:GetWorldRotation())
	
	player:AttachToCoreObject(script.parent)
	
	_G.StanceStack.Add(player, STANCE, script.id)
	originalJumpCount = player.maxJumpCount
	player.maxJumpCount = 0
	
	bindingListener = player.bindingPressedEvent:Connect(OnBindingPressed)
	
	getUpFBlocked = true
	Task.Wait(0.25)
	getUpFBlocked = false
end

Events.ConnectForPlayer(EVENT_ID, OnSit)


function CleanupListeners()
	if bindingListener then
		bindingListener:Disconnect()
		bindingListener = nil
	end
end

function OnPlayerLeft(player)
	if player == sittingPlayer then
		sittingPlayer = nil
		
		CleanupListeners()
	end
end

Game.playerLeftEvent:Connect(OnPlayerLeft)


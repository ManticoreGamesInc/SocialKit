
-- TODO:
--local CHAIR_MANAGER = require( script:GetCustomProperty("ChairManager") )

local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local OUTER_TRIGGER = script:GetCustomProperty("OuterTrigger"):WaitForObject()
local SIT_TRIGGER = script:GetCustomProperty("SitTrigger"):WaitForObject()

local EVENT_ID = "sit_"..ROOT.id

SIT_TRIGGER.collision = Collision.FORCE_OFF

local chairForward = script:GetWorldRotation() * Vector3.FORWARD
local chairPos = script:GetWorldPosition()


function Tick()
	if player then
		if player.animationStance == "unarmed_sit_chair_upright" then
			SIT_TRIGGER.collision = Collision.FORCE_OFF
			return
		end
		
		SIT_TRIGGER.collision = Collision.FORCE_OFF
		
		local playerForward = player:GetWorldRotation() * Vector3.FORWARD
		if chairForward .. playerForward > -0.2 then return end
		
		local v = chairPos - player:GetWorldPosition()
		v.z = 0
		local playerLookAtChair = v:GetNormalized()
		local dot = playerForward..playerLookAtChair
		--print("playerLookAtChair = ".. tostring(dot))
		if dot > 0.5 then
			SIT_TRIGGER.collision = Collision.INHERIT
		end
	end
end


function OnBeginOverlap(trigger, p)
	if p == Game.GetLocalPlayer() then
		player = p
		--CHAIR_MANAGER.AddUpdate(OnUpdate)
	end
end

function OnEndOverlap(trigger, p)
	if p == Game.GetLocalPlayer() then
		player = nil
		SIT_TRIGGER.collision = Collision.FORCE_OFF
		--CHAIR_MANAGER.RemoveUpdate(OnUpdate)
	end
end

OUTER_TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
OUTER_TRIGGER.endOverlapEvent:Connect(OnEndOverlap)


function OnInteracted(trigger, player)
	Events.BroadcastToServer(EVENT_ID)
end

SIT_TRIGGER.interactedEvent:Connect(OnInteracted)


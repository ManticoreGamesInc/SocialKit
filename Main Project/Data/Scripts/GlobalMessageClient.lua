--[[
	Global Message - Dialog
	by: standardcombo
	v1.0
--]]

local MODAL = script:GetCustomProperty("ModalPopup"):WaitForObject()
local MAIN_PANEL = MODAL:GetCustomProperty("MainPanel"):WaitForObject()

MODAL = MODAL.context

local UI_TEXT = script:GetCustomProperty("UIText"):WaitForObject()
local SHOW_DURATION = script:GetCustomProperty("ShowDuration")

local MIN_WIDTH = MAIN_PANEL.width
local PADDING = MIN_WIDTH - UI_TEXT.width

local showCount = 0


function OnShowGlobalMessage(message)
	UI_TEXT.text = message
	
	Task.Wait()
	local size = UI_TEXT:ComputeApproximateSize()
	if size then
		MAIN_PANEL.width = math.max(MIN_WIDTH, size.x + PADDING)
	end
	
	MODAL.Show()
	
	showCount = showCount + 1
	
	Task.Wait(SHOW_DURATION)
	
	showCount = showCount - 1
	
	if showCount == 0 then
		MODAL.Hide()
	end
end

Events.Connect("ShowGlobalMessage", OnShowGlobalMessage)

--[[
Game.GetLocalPlayer().bindingPressedEvent:Connect(function(player, action)
	if action == "ability_extra_0" then
		OnShowGlobalMessage("standardcombo says:\nFoo asdlkjalk asdflkjasdlkkj las jlasdjjaf a a. haslhjk lashashk lhlahl ash hsldhf l alshkh oq uqoui lj")
	end
end)--]]



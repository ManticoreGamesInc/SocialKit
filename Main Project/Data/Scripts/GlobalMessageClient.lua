--[[
	Global Message - Client
	v1.0
	by: standardcombo
	
	See the README and property tooltips for more information about this component.
--]]

local MODAL = script:GetCustomProperty("ModalPopup"):WaitForObject()
local MAIN_PANEL = MODAL:GetCustomProperty("MainPanel"):WaitForObject()

MODAL = MODAL.context

local TITLE_TEXT = script:GetCustomProperty("TitleText"):WaitForObject()
local MESSAGE_TEXT = script:GetCustomProperty("MessageText"):WaitForObject()

local SHOW_DURATION = script:GetCustomProperty("ShowDuration")
local PADDING = script:GetCustomProperty("Padding")

local MIN_WIDTH = MAIN_PANEL.width

local showCount = 0


function OnShowGlobalMessage(msg)
	title, message = CoreString.Split(msg, "\n")
	TITLE_TEXT.text = title
	MESSAGE_TEXT.text = message
	
	local size = MESSAGE_TEXT:ComputeApproximateSize()
	while size == nil do
		Task.Wait()
		size = MESSAGE_TEXT:ComputeApproximateSize()
	end
	MAIN_PANEL.width = math.max(MIN_WIDTH, size.x + PADDING)
	
	MODAL.Show()
	
	showCount = showCount + 1
	
	Task.Wait(SHOW_DURATION)
	
	showCount = showCount - 1
	
	if showCount == 0 then
		MODAL.Hide()
	end
end

Events.Connect("ShowGlobalMessage", OnShowGlobalMessage)


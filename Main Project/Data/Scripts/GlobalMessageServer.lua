--[[
	Global Message - Server
	v1.0
	by: standardcombo
	
--]]

local ADMINS_CSS = script:GetCustomProperty("Admins")

local COMMAND = "/broadcast"


-- Pre-process the list of admins who are allowed to use the commands
local ADMINS = {}
local adminTable = { CoreString.Split(ADMINS_CSS, ",") }
for _,name in ipairs(adminTable) do
	name = string.lower(CoreString.Trim(name))
	ADMINS[name] = true
end


function OnReceiveMessageHook(player, params)
	local name = string.lower(player.name)
	if not ADMINS[name] then return end
	
	local message = params.message
	local commandLen = string.len(COMMAND)
	
	if string.len(message) <= commandLen + 1 then return end
	
	local command = string.lower(string.sub(message, 1, commandLen))
	if command ~= COMMAND then return end
	
	-- Don't show the command in chat
	params.message = ""
		
	local msg = string.sub(message, commandLen + 1)
	
	-- We need to spawn task because yielding the thread is not allowed inside a hook
	Task.Spawn(function()
		if not Object.IsValid(player) then return end
		
		Send(player.name, msg)
	end)
end

Chat.receiveMessageHook:Connect(OnReceiveMessageHook)


function Send(playerName, msg)
	msg = playerName .. " says:\n" .. msg
	Events.BroadcastToAllPlayers("ShowGlobalMessage", msg)
end


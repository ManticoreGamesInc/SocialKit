--[[
	Global Message - Server
	v1.0
	by: standardcombo
	
	See the README and property tooltips for more information about this component.
--]]

local CONCURRENT_KEY = script:GetCustomProperty("ConcurrentKey")
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
	if _G.Permissions then
		if not _G.Permissions.HasPermission("Broadcast") then
			return
		end
	else
		local name = string.lower(player.name)
		if not ADMINS[name] then return end
	end
	
	local message = params.message
	local commandLen = string.len(COMMAND)
	
	if string.len(message) <= commandLen + 1 then return end
	
	local command = string.lower(string.sub(message, 1, commandLen))
	if command ~= COMMAND then return end
	
	-- Don't show the command in chat
	params.message = ""
	
	local msg = string.sub(message, commandLen + 1)
	msg = player.name .. " says:\n" .. msg
	
	-- We need to spawn task because yielding the thread is not allowed inside a hook
	Task.Spawn(function()
		Send(msg)
	end)
end

Chat.receiveMessageHook:Connect(OnReceiveMessageHook)

local SECONDS_TOLERANCE = 10


function Send(msg)
	if not CONCURRENT_KEY.isAssigned then
		DoBroadcast(msg)
	else
		local timestamp = DateTime.CurrentTime().secondsSinceEpoch
		
		-- Add the message
		while Storage.HasPendingSetConcurrentCreatorData(CONCURRENT_KEY) do
			Task.Wait(0.1)
		end
		local _, result = Storage.SetConcurrentCreatorData(CONCURRENT_KEY, function(data)
			if not data.messages then
				data.messages = {}
			else
				-- Clear previous messages that are outdated
				for ts,msg in pairs(data.messages) do
					if timestamp - ts >= SECONDS_TOLERANCE then
						data.messages[ts] = nil
					end
				end
			end
			data.messages[timestamp] = msg
			return data
		end)
		
		if result ~= StorageResultCode.SUCCESS then return end
		
		Task.Wait(5)
		
		-- Clear the message
		while Storage.HasPendingSetConcurrentCreatorData(CONCURRENT_KEY) do
			Task.Wait(0.1)
		end
		Storage.SetConcurrentCreatorData(CONCURRENT_KEY, function(data)
			data.messages[timestamp] = nil
			return data
		end)
	end
end


function DoBroadcast(msg)
	Events.BroadcastToAllPlayers("ShowGlobalMessage", msg)
end


local messagesAlreadyBroadcast = {}
function OnConcurrentDataChanged(_, data)
	if not data.messages then return end
	
	local timestamp = DateTime.CurrentTime().secondsSinceEpoch
	
	for ts,msg in pairs(data.messages) do
		alreadySentKey = tostring(ts) .. msg
		
		if timestamp - ts < SECONDS_TOLERANCE 
		and not messagesAlreadyBroadcast[alreadySentKey] then
			DoBroadcast(msg)
			messagesAlreadyBroadcast[alreadySentKey] = true
		end
	end
end

if CONCURRENT_KEY.isAssigned then
	Storage.ConnectToConcurrentCreatorDataChanged(CONCURRENT_KEY, OnConcurrentDataChanged)
	
	-- When this server instance comes online, fetch the latest data right away
	Task.Wait(1)
	local data, result = Storage.GetConcurrentCreatorData(CONCURRENT_KEY)
	if result == StorageResultCode.SUCCESS then
		OnConcurrentDataChanged(_, data)
	end
end




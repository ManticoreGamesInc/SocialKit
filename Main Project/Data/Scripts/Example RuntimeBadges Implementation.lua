
-- This is an example of how to implement the _G.RuntimeBadges interface
-- It returns fake data, giving all players the "manticore" badge.
-- To see it functioning, add it to a Client-context in the hierarchy.

local API = {}
_G.RuntimeBadges = API

function API.GetBadges(player)
	return { "manticore" }
end

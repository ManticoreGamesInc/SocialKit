--[[

Global Message
v1.0 - 2022/01/05
by: standardcombo

	Global Message is a component that allows creators to communicate with players across all
	server instances at the same time. For example, before pushing an update to your game,
	you could send a global message to players, warning that servers are about to reset.
	

SETUP
-----

	1. Add a copy of the "Global Message" template to the hierarchy.
	2. Expand the template and locate the server script.
	3. With the server script selected, edit the list of admins in the properties view.


USAGE
-----

	1. Join your game, alongside other players.
	2. Press [Enter] to open the chat window.
	3. Type the command "/broadcast", followed by the message you want to send. E.g.:
	  /broadcast Servers will reset in 5 minutes for a scheduled update. Re-join to continue playing!
	
	An orange popup box should appear at the bottom of the screen with your name and message.


CUSTOMIZATION
-------------

	The ability to send messages across all servers is a cool technology, but the way in which the
	message is displayed may not agree with the look/feel of your game, or the purpose for which you
	are using Global Message. To change the presentation into something other than the orange box,
	simply edit the contents inside the template, under the UI Container.

]]


--[[

SOCIAL KIT


	Summary


TABLE OF CONTENTS
-----------------


WELCOME MESSAGES
----------------


INTERACTABLE FURNITURE
----------------------


CONSUMABLES
-----------

	Consumables are objects that players can buy in a shop, and use with an animation.

Creating a New Consumable:

	1. Open the "Definitions" folder, and then the "Consumables" folder
	2. In the folder, there are three example definitions of Consumables: "Snow Cone", "Coffee", and "Burger".
	3. In Project Content, in My Scripts, find "Consumable Definition" and drag it into the Consumables folder.
	4. Fill out the Properties section to match your consumable

**Hint**
		New consumables can be defined quickly by duplicating another Consumable Definition and changing its properties


Consumable Properties

	- id: Unique identifier for the consumable item. Does not have to match the displayName
	- displayName: This will be visible in all the shops that sell the item, and in the confirmation dialogue to buy it
	- description: What the item is. Shows up in the confirmation dialogue to buy it.
	- category: Groups items so that shops can offer everything that shares this category name
	- cost: how much of the currency resource players have to pay to get the item
	- equipment: the Equipment object that spawns with the item and controls counting the uses and playing the animations
	- model: what the item will actually look like. Create a template:
		docs.coregames.com/references/templates/
	- numberOfUses: how many times the player uses the object before it disappears
	- rpGained: how much RP the player can get from consuming the object IF RP GRANTING IS ENABLED. See the GRANTING RP section for more info.

Creating New Consumable Equipment

	There are two different equipment options included with the project, DrinkEquipment and FoodEquipment. You can create your own by duplicating one of these equipments


SHOPS
-----

	- 2 types of shops: single item shop, and category shop

Creating a New Shop:


CURRENCY
--------

GRANTING RP
-----------


]]

## Welcome to my GitHub Pages

### Current Project

Currently I am working on modifiying the 5e D&D Character Sheet script for use with a different game, Worlds Without Number. While I classify this as a modifying the script the goal is to restructure the logical loops within the script to better utilise system resources within TTS.

### Previous Project

My previous Project was the development of a solid, automated fully interactable 5th Edition Dungeons and Dragons Character Sheet script for use within the game Tabletop Simulator.
Below is the three most recent version update patchnotes related to my script. At the time of script submission I was confident in my scripts ability to function, and I still am. In play testing with friends I have found and hot-fixed several errors with the script as well had begun to optimize the script to allow for better resource management within the script. This was put on hold as our play group was also put on hold for my wife to focus her efforts on school.

```Recent Patchnotes
`--Version v1
--Edit By: RC3117
--Date: Oct. 14th, 2020
--Changed Base sheet graphic to allow for room to add Random Dice roll feature
--Created Random Dice roll Feature.

--Version v0.9.2
--Edit By: RC3117
--Date: Oct. 11th, 2020
--Following Bug Fixes were applied
	--Roll button was continuing to print player color.
	--Initiative Roll Button was printing corrupted strings.
	--Proficiency buttons were not being hidden at times.
	--Attack Roll Edit mode buttons were not correctly updating the UI.
	--Proficiency marks were not actively updating the UI.
	--Expertise Marks were not actively updating the UI.
	--jack of all trades mark was not actively updating the UI.
	--proficiency marks were printing UPDATEBEGINS still from testing.
	--Attack Type and Range were being hijaked for all attacks to show only 6.
--Following Changes were applied
	--Attack Broadcast Removed
	--Attack printToAll now says TYPE Damage attack!
	--Spell Slots and Totals color changed to default black.
	--Death Saves/Fails button color changed to darkred.
	--Skill Total color changed form lightblue to default black
	--Changed attack misc mods minimum to -10
	--Moved Attack Change stats to its own function to prevent prgram overload.
	--upped Spell Slot Maximum totals to 9.`
	
--Version v1
	--Edit By: RC3117
	--Date: Oct. 14th, 2020
	--Changed Base sheet graphic to allow for room to add Random Dice roll feature
	--Created Random Dice roll Feature.
```

For a more indepth look see my opensource code here [https://github.com/wolfesamk/wolfesamk.github.io/blob/master/swolfe%205e%20CS%20v1.lua]

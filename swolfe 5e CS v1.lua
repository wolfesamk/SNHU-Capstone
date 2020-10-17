#include Console/console++
-------------5eD&D Scripted Character Sheet----------------
--Dungeons and Dragons 5th Edition Generic Chracter Sheet--
-------------------Script by RC3117------------------------
----------------------Open Source--------------------------
---------------Created September 16th, 2020----------------
--Version v0.1.0
--Edit By: RC3117
--Deleted URL loading functions and related code
--Added Console/Console++ functionality

--Version v0.2.0
--Edit By: RC3117
--Date: Sept. 17th, 2020
--Modified Default database to represent 5e Needs
--Began Working on Symbolic Variables
--Rearranged UI to Match RezMar's 2018 Character Sheet, working on custom Character Sheet

--Version v0.3.0
--Edit By: RC3117
--Date: Sept. 21st, 2020
--Adjusted Current UI Elements to match new Character Sheet
--Continued Working on Symbolic Variables
--Began adding extra stats
--AC_BUFF button is clear for duration for ease of use.

--Version v0.3.1
--Edit By: RC3117
--Date: Sept. 22nd, 2020
--fixed character stat modifier generator to be rigid instead of fluid
--created character level and proficiency index items
--created proficiency generator via character level
--repositioned various UI eliments for ease of use.

--Version v0.4.0
--Edit By: RC3117
--Date: Sept. 23rd, 2020
--Created core of the skills and saves systems. Saves is finished. Skills working but lacking expertise addition and jack of all trades

--Version v0.4.1
--Edit By: RC3117
--Date: Sept. 24th, 2020
--Created Expertise Option for skills, adds 2x multiplier to proficiency
--created core of the spell slot tracker system

--Version v0.4.2
--Edit By: RC3117
--Date: Sept. 25th, 2020
--Created Jack of all trades option for bards and feats
--created roll buttons for saves and skills
--created darvision check mark

--Version v0.4.3
--Edit By: RC3117
--Date: Sept. 26th, 2020
--added spell modifiers options, hd current, coin in full
--laid out the UI locations for Class Resources, Exhaustion, Passive Perception, Inspiration, Initiative, AMMO1-4, POTION1-2, HD type, and death saves

--Version v0.4.4
--Edit By: RC3117
--Date: Sept. 28th, 2020
--Created Class Resources Totals and Current values, Exhaustion, Inspiration, Ammo1-4, Potion1-2, and Death Save full functionality.
--Cleaned up the code for commented out code no longer needed and extra print calls used during error testing.
--Laid out the UI locations for Carry Capacity, Lift, and Push/Pull limits.
--fixed  issue where spell casting ability and its related stats would cycle through no matter what ChangeStat related button was selected.
	--possibly found solution for various fix tags due to UI elements not updating correctly. See Death Saves Reset function for solution.
--alpha testing with test group 1 notes to follow
	--Carry weight desired, platinum color to white hard to see, roll selection buttons for skills hard to select and to close to career X marks, HP current to small
	--Will adress these concerns post finishing UI elements laid out this update.

--Version v0.5
--Edit By: RC3117
--Date: Sept. 29th, 2020
--Created Passive Perception generation and misc modifier, initiative and misc modifier, cycle button for HD type, carry capacity, current weight, push/pull/lift, creature size modifiers, and speed value along with encumbrance function.
--Only remaining features needing to be added are String Text input elements and character attack rolls.

--Version v0.6
--Edit By: RC3117
--Date: Oct. 4th, 2020
--Added all generic text fields for edit mode and created buttons for their strings to display during normal mode.
--Need to figure out how to inverse the scale for text input for the larger text input fields so that I can display the strings in a controlled and formatted manner.
	--limitations in tabletop API prevent formatting buttons at this time so the only way to present formatted user generated text is to display it in a text input field
	--that is flipped and roated so that the player cant edit the text. this creates a mirror effect, which is where the inverse comes into play.
--the only feature left after that is the attack roll sections which will be quite easy now that I have created the prerequisite functions.

--Version v0.7
--Edit By: RC3117
--Date: Oct. 5th, 2020
--finished misc input fields for tertiary character information. Figured out the inverse scale bit to make my text display better while preventing players from accidentally
	--typing into the inactive fields.
--adjusted base graphic to better fit character info
--adjusted character detail UI to match with graphic changes
--moved save and skill roll marks left of their associated save or skill, enlarged them as well.
--began mapping out the attack section on paper. will need to create 11 variables for each. The whole of this area of functions will utlize pieces from each of the created
	--sections.

--Version v0.7.1
--Edit By: RC3117
--Date: Oct. 6th, 2020
--Laid out the basic UI for attack stat information. Need to add the following for attacks still
	--Attack Bonus Generation
	--Damage Bonus Gnereation
	--Dice Count buttons
	--Dice Type Cycle Button
	--Bonus Type Cycle Button
	--Bonus Misc Buttons
	--Damage Misc Buttons
	--Weapon Damage Type Input Field
	--Name Input Field
	--Weight Input Field
	--Range Input Field
--Need to design attack button printToAll message as well.

--Version v0.7.2
--Edit By: RC3117
--Date: Oct. 6th, 2020
--Finished laying out the groundwork for the attack one options. Only need to create the button for the attack roll and combine all the relavant data. Once this is done I can then
	--proceed to duplicate the attacks 2-6

--Version v0.8
--Edit By: RC3117
--Date: Oct. 7th, 2020
--Completed modulating the attack roll button so that it works with all attacks to be added later. Had to create a static subTable tag in order to differentiate between the
	--attacks. Normally LUA 5.2 has a function called global.getlocal that grabs all variables local to this local code, and gives them to you in an array of name, value. with
	--name being variable name and value being its current local value, which should almost always be static. My intention was to have global.getlocal's array be searched for
	--a name matching a generated string, such as INDEX_ATTACK_X where x is a number generated by a for do loop, that way the prgram only has to loop once for every attack set.
	--currently it loops through everything within the attack_table, which is slowing down swtiching between onload, load, edit mode, and load from edit mode.

--Version v0.9
--Edit By: RC3117
--Date: Oct. 8th, 2020
--Completed the program as a whole. Everything works mostly as intended. The reason I am not calling it a v1.0 is because there are several items not working precicely as I
	--want combined with my desire to get some user input from my group on possible UI changes that need to be made. I have several sections marked with fix for my reference.
	--Will work on them next time.

--Version v0.9.1
--Edit By: RC3117
--Date: Oct. 8th, 2020
--All known bugs have been squashed, all functionality is tested and seemingly working. will need player feedback on UI and functions.

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
	--upped Spell Slot Maximum totals to 9.

--Version v1
--Edit By: RC3117
--Date: Oct. 14th, 2020
--Changed Base sheet graphic to allow for room to add Random Dice roll feature
--Created Random Dice roll Feature.

-- default database
-- 10;10;10;10;10;10;0;0;0;0;0;0;000000000000000000000000;nnnnnnnnnnnnnnnnnnnnnnnn;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;nnnnnnn;1;1;0;10;0;1;00;0;1;2;nnnnnnnnnnnnnnnnnn;n;n;00;00;00;00;00;00;00;00;00;nnnnnnnnnnnnnnnnnnnnnnnn;0;0;0;0;2;10;INT;1;0;0;Class Resource;0;0;Class Resource;0;10;0;0;0;0;0;0;0;0;0;0;0;0;3;0;nnnnnn;d6;M;30;30;NAME;RACE;CLASS;DEITY;PLAYER;BACKGROUND;ALIGNMENT;AGE;HEIGHT;WEIGHT;EYES;SKIN;HAIR;SPELL CLASS;0;0;0;0;0;0;FEATURES & TRAITS;ADDITIONAL EQUIPMENT;PERSONALITY TRAITS;IDEALS;BONDS;FLAWS;PROFICIENCIES;LANGUAGES;TOOLS;Attack One;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Two;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Three;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Four;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Five;0;7;STR;0;0;1;1;d4 + ;0;0;TYPE;0;Attack Six;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;1;0

function onCollisionEnter(table)
	check = table.collision_object.getVar('d')
	name = table.collision_object.getName()
	if check then
		printToAll(name .. ' creation matrix activated, summoning flesh golem for imprinting.', {0, 0, 1})
		database = table.collision_object
	end
end

function onPickedUp(player_color)
	--FlushSheet()
	if edit then
		EditMode()
	end
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch('([^' .. sep .. ']+)') do
		res[#res + 1] = v
	end
	return res
end

function tableLen(t)
	local length = 0
	for k, v in pairs(t) do
		length = length + 1
	end
	return length
end

-- Database
--Core Stats
local INDEX_STR = 1
	local INDEX_DEX = 2
	local INDEX_CON = 3
	local INDEX_INT = 4
	local INDEX_WIS = 5
	local INDEX_CHA = 6
--Core Modifiers
local MOD_INDEX_STR = 7
	local MOD_INDEX_DEX = 8
	local MOD_INDEX_CON = 9
	local MOD_INDEX_INT = 10
	local MOD_INDEX_WIS = 11
	local MOD_INDEX_CHA = 12
--Skills Mods
local INDEX_SKILLS = 13
local INDEX_CAREER_SKILLS = 14
-- Skills Totals
local TOTAL_SAVE_STRENGTH = 15
	local TOTAL_SAVE_DEXTERITY = 16
	local TOTAL_SAVE_CONSTITUTION = 17
	local TOTAL_SAVE_INTELLIGENCE = 18
	local TOTAL_SAVE_WISDOM = 19
	local TOTAL_SAVE_CHARISMA = 20
	local TOTAL_SKILL_ATHLETICS = 21
	local TOTAL_SKILL_ACROBATICS = 22
	local TOTAL_SKILL_SLIGHT_OF_HAND = 23
	local TOTAL_SKILL_STEALTH = 24
	local TOTAL_SKILL_ARCANA = 25
	local TOTAL_SKILL_HISTORY = 26
	local TOTAL_SKILL_INVESTIGATION = 27
	local TOTAL_SKILL_NATURE = 28
	local TOTAL_SKILL_RELIGION = 29
	local TOTAL_SKILL_ANIMAL_HANDLING = 30
	local TOTAL_SKILL_INSIGHT = 31
	local TOTAL_SKILL_MEDICINE = 32
	local TOTAL_SKILL_PERCEPTION = 33
	local TOTAL_SKILL_SURVIVAL = 34
	local TOTAL_SKILL_DECEPTION = 35
	local TOTAL_SKILL_INTIMIDATION = 36
	local TOTAL_SKILL_PERFORMANCE = 37
	local TOTAL_SKILL_PERSUASION = 38
--status effects
local INDEX_PROFICIENCY_MARKS = 39
--combat related status info
local INDEX_HP_THRESHOLD = 40
local INDEX_HP_CURRENT = 41
local INDEX_THP_CURRENT = 42
local INDEX_AC_THRESHOLD = 43
local INDEX_AC_BUFF = 44
--misc details
local INDEX_SPELL_ABILITY = 45
local INDEX_SPELL_MISC = 46
local INDEX_HIT_DICE = 47
--character level related stats
local INDEX_CHAR_LEVEL = 48
local INDEX_PROFICIENCY = 49
local INDEX_EXPERTISE = 50
local INDEX_DARKVISION = 51
local INDEX_JACKOFALL = 52
--spell slots
local INDEX_SPELLS_ONE = 53
	local INDEX_SPELLS_TWO = 54
	local INDEX_SPELLS_THREE = 55
	local INDEX_SPELLS_FOUR = 56
	local INDEX_SPELLS_FIVE = 57
	local INDEX_SPELLS_SIX = 58
	local INDEX_SPELLS_SEVEN = 59
	local INDEX_SPELLS_EIGHT = 60
	local INDEX_SPELLS_NINE = 61
--Save and Skill Rolling
local INDEX_ROLLING_LIST = 62
--coin
local INDEX_COIN_COP = 63
local INDEX_COIN_SIL = 64
local INDEX_COIN_GOL = 65
local INDEX_COIN_PLA = 66
--spell ability string
local INDEX_SPELL_MOD = 67
local INDEX_SPELL_DC = 68
local INDEX_SPELL_STRING = 69
--Hit Dice Type
local INDEX_HD_TYPE = 70
--class rescources
local INDEX_CLASS1_TOTAL = 71
local INDEX_CLASS1_ACTUAL = 72
local INDEX_CLASS1_NAME = 73
local INDEX_CLASS2_TOTAL = 74
local INDEX_CLASS2_ACTUAL = 75
local INDEX_CLASS2_NAME = 76
--exhaustion
local INDEX_EXHAUSTION = 77
--passive Perception, Inspiration, Initiative
local INDEX_PASSIVE_PERCEPTION = 78
local INDEX_PASSIVE_PERCEPTION_MISC = 79
local INDEX_INSPIRATION = 80
local INDEX_INITIATIVE_TOTAL = 81
local INDEX_INITIATIVE_MISC = 82
--ammo and potion indicators
local INDEX_AMMO1 = 83
local INDEX_AMMO2 = 84
local INDEX_AMMO3 = 85
local INDEX_AMMO4 = 86
local INDEX_POTION1 = 87
local INDEX_POTION2 = 88
--carry weight, maximum lift, and push/lift amounts
local INDEX_CARRY_LIMIT = 89
local INDEX_CARRY_CURRENT = 90
local INDEX_SIZE = 91
local INDEX_PUSH_PULL = 92
--deathsaves
local INDEX_DEATH_SAVES = 93
local INDEX_HD_TYPE_STRING = 94
--character size
local INDEX_CREATURE_SIZE = 95
--character speed value
local INDEX_SPEED = 96
local INDEX_SPEED_BASE = 97
--text
local INDEX_NAME = 98
local INDEX_RACE = 99
local INDEX_CLASS = 100
local INDEX_DEITY = 101
local INDEX_PLAYER = 102
local INDEX_BACKGROUND = 103
local INDEX_ALIGNMENT = 104
local INDEX_AGE = 105
local INDEX_HEIGHT = 106
local INDEX_WEIGHT = 107
local INDEX_EYES = 108
local INDEX_SKIN = 109
local INDEX_HAIR = 110
local INDEX_SPELL_CLASS = 111
--movement speeds
local INDEX_FLY = 112
local INDEX_SWIM = 113
local INDEX_LONG_JUMP = 114
local INDEX_HIGH_JUMP = 115
local INDEX_CRAWL = 116
local INDEX_CLIMB = 117
--Additional Large Input Strings
local INDEX_FEATURES_TRAITS =  118
local INDEX_ADDITIONAL_EQUIPMENT = 119
local INDEX_PERSONALITY_TRAITS = 120
local INDEX_IDEALS = 121
local INDEX_BONDS = 122
local INDEX_FLAWS = 123
local INDEX_PROFICIENCIES = 124
local INDEX_LANGUAGES = 125
local INDEX_TOOLS = 126
--Attacks
local INDEX_ATTACK_1_NAME = 127
local INDEX_ATTACK_1_BONUS = 128
local INDEX_ATTACK_1_BONUS_INT = 129
local INDEX_ATTACK_1_BONUS_TYPE = 130
local INDEX_ATTACK_1_BONUS_MISC = 131
local INDEX_ATTACK_1_RANGE = 132
local INDEX_ATTACK_1_DAMAGE_DICE_COUNT = 133
local INDEX_ATTACK_1_DAMAGE_DICE_INT = 134
local INDEX_ATTACK_1_DAMAGE_DICE_TYPE = 135
local INDEX_ATTACK_1_DAMAGE_MOD = 136
local INDEX_ATTACK_1_DAMAGE_MOD_MISC = 137
local INDEX_ATTACK_1_TYPE = 138
local INDEX_ATTACK_1_WEIGHT = 139
--;NAME;0;1;STR;0;0;1;1;d4;0;0;TYPE;0
local INDEX_ATTACK_2_NAME = 140
local INDEX_ATTACK_2_BONUS = 141
local INDEX_ATTACK_2_BONUS_INT = 142
local INDEX_ATTACK_2_BONUS_TYPE = 143
local INDEX_ATTACK_2_BONUS_MISC = 144
local INDEX_ATTACK_2_RANGE = 145
local INDEX_ATTACK_2_DAMAGE_DICE_COUNT = 146
local INDEX_ATTACK_2_DAMAGE_DICE_INT = 147
local INDEX_ATTACK_2_DAMAGE_DICE_TYPE = 148
local INDEX_ATTACK_2_DAMAGE_MOD = 149
local INDEX_ATTACK_2_DAMAGE_MOD_MISC = 150
local INDEX_ATTACK_2_TYPE = 151
local INDEX_ATTACK_2_WEIGHT = 152

local INDEX_ATTACK_3_NAME = 153
local INDEX_ATTACK_3_BONUS = 154
local INDEX_ATTACK_3_BONUS_INT = 155
local INDEX_ATTACK_3_BONUS_TYPE = 156
local INDEX_ATTACK_3_BONUS_MISC = 157
local INDEX_ATTACK_3_RANGE = 158
local INDEX_ATTACK_3_DAMAGE_DICE_COUNT = 159
local INDEX_ATTACK_3_DAMAGE_DICE_INT = 160
local INDEX_ATTACK_3_DAMAGE_DICE_TYPE = 161
local INDEX_ATTACK_3_DAMAGE_MOD = 162
local INDEX_ATTACK_3_DAMAGE_MOD_MISC = 163
local INDEX_ATTACK_3_TYPE = 164
local INDEX_ATTACK_3_WEIGHT = 165

local INDEX_ATTACK_4_NAME = 166
local INDEX_ATTACK_4_BONUS = 167
local INDEX_ATTACK_4_BONUS_INT = 168
local INDEX_ATTACK_4_BONUS_TYPE = 169
local INDEX_ATTACK_4_BONUS_MISC = 170
local INDEX_ATTACK_4_RANGE = 171
local INDEX_ATTACK_4_DAMAGE_DICE_COUNT = 172
local INDEX_ATTACK_4_DAMAGE_DICE_INT = 173
local INDEX_ATTACK_4_DAMAGE_DICE_TYPE = 174
local INDEX_ATTACK_4_DAMAGE_MOD = 175
local INDEX_ATTACK_4_DAMAGE_MOD_MISC = 176
local INDEX_ATTACK_4_TYPE = 177
local INDEX_ATTACK_4_WEIGHT = 178

local INDEX_ATTACK_5_NAME = 179
local INDEX_ATTACK_5_BONUS = 180
local INDEX_ATTACK_5_BONUS_INT = 181
local INDEX_ATTACK_5_BONUS_TYPE = 182
local INDEX_ATTACK_5_BONUS_MISC = 183
local INDEX_ATTACK_5_RANGE = 184
local INDEX_ATTACK_5_DAMAGE_DICE_COUNT = 185
local INDEX_ATTACK_5_DAMAGE_DICE_INT = 186
local INDEX_ATTACK_5_DAMAGE_DICE_TYPE = 187
local INDEX_ATTACK_5_DAMAGE_MOD = 188
local INDEX_ATTACK_5_DAMAGE_MOD_MISC = 189
local INDEX_ATTACK_5_TYPE = 190
local INDEX_ATTACK_5_WEIGHT = 191

local INDEX_ATTACK_6_NAME = 192
local INDEX_ATTACK_6_BONUS = 193
local INDEX_ATTACK_6_BONUS_INT = 194
local INDEX_ATTACK_6_BONUS_TYPE = 195
local INDEX_ATTACK_6_BONUS_MISC = 196
local INDEX_ATTACK_6_RANGE = 197
local INDEX_ATTACK_6_DAMAGE_DICE_COUNT = 198
local INDEX_ATTACK_6_DAMAGE_DICE_INT = 199
local INDEX_ATTACK_6_DAMAGE_DICE_TYPE = 200
local INDEX_ATTACK_6_DAMAGE_MOD = 201
local INDEX_ATTACK_6_DAMAGE_MOD_MISC = 202
local INDEX_ATTACK_6_TYPE = 203
local INDEX_ATTACK_6_WEIGHT = 204

local INDEX_RANDOM_ROLL_DICE_COUNT = 205
local INDEX_RANDOM_ROLL_MISC_MOD = 206

local function GetDatabase()
	if database == nil then
		printToAll('No Soul Stone Found to create your mind.', {0, 0, 1})
		return {}
	end
	return database.getDescription():split(';')
end

local function SaveDatabase(newTable)
	if database == nil then
		printToAll('No Soul Stone Found to store your soul.', {0, 0, 1})
		return
	end

	local newDatabase = ''
	for i = 1, #newTable do
		if i == 1 then
			newDatabase = newDatabase .. newTable[i]
		else
			newDatabase = newDatabase .. ';' .. newTable[i]
		end
	end
	database.setDescription(newDatabase)
end


-- Modifiers
local MOD_STR = 1
	local MOD_DEX = 2
	local MOD_CON = 3
	local MOD_INT = 4
	local MOD_WIS = 5
	local MOD_CHA = 6

-- Skills
local SAVE_STRENGTH = 1
	local SAVE_DEXTERITY = 2
	local SAVE_CONSTITUTION = 3
	local SAVE_INTELLIGENCE = 4
	local SAVE_WISDOM = 5
	local SAVE_CHARISMA = 6
	local SKILL_ATHLETICS = 7
	local SKILL_ACROBATICS = 8
	local SKILL_SLIGHT_OF_HAND = 9
	local SKILL_STEALTH = 10
	local SKILL_ARCANA = 11
	local SKILL_HISTORY = 12
	local SKILL_INVESTIGATION = 13
	local SKILL_NATURE = 14
	local SKILL_RELIGION = 15
	local SKILL_ANIMAL_HANDLING = 16
	local SKILL_INSIGHT = 17
	local SKILL_MEDICINE = 18
	local SKILL_PERCEPTION = 19
	local SKILL_SURVIVAL = 20
	local SKILL_DECEPTION = 21
	local SKILL_INTIMIDATION = 22
	local SKILL_PERFORMANCE = 23
	local SKILL_PERSUASION = 24

--spells
local SPELL_LIMIT = 1
local SPELL_SLOTS = 2

local SPELL_SLOTS_ONE = 1
	local SPELL_SLOTS_TWO = 2
	local SPELL_SLOTS_THREE = 3
	local SPELL_SLOTS_FOUR = 4
	local SPELL_SLOTS_FIVE = 5
	local SPELL_SLOTS_SIX = 6
	local SPELL_SLOTS_SEVEN = 7
	local SPELL_SLOTS_EIGHT = 8
	local SPELL_SLOTS_NINE = 9
	local SPELL_LIMIT_ONE = 10
	local SPELL_LIMIT_TWO = 11
	local SPELL_LIMIT_THREE = 12
	local SPELL_LIMIT_FOUR = 13
	local SPELL_LIMIT_FIVE = 14
	local SPELL_LIMIT_SIX = 15
	local SPELL_LIMIT_SEVEN = 16
	local SPELL_LIMIT_EIGHT = 17
	local SPELL_LIMIT_NINE = 18

--jack of all trades list index
local DARKVISION = 1
local JACK_TRADES = 2

-- Proficiency Marks
local PROFICIENCY_LIGHT = 1
local PROFICIENCY_MEDIUM = 2
local PROFICIENCY_HEAVY = 3
local PROFICIENCY_SHIELDS = 4
local PROFICIENCY_SIMPLE = 5
local PROFICIENCY_MARTIAL = 6
local PROFICIENCY_OTHER = 7

--death marks
local DEATH_MARK_1 = 1
local DEATH_MARK_2 = 2
local DEATH_MARK_3 = 3
local DEATH_MARK_4 = 4
local DEATH_MARK_5 = 5
local DEATH_MARK_6 = 6

--edit mode
sheet = self.guid
edit = false

--master database
name_object = {}
skill_object = {}

--Symbolic Variables
--Points +/-
local OnePlus = 1
local OneMinus = -1
--Min/Max
local BaseStatMax = 30
local BaseStatMin = -30
local BaseHPMAX = 500
local MinSpells = 0
local MaxSpells = 9
--UI BASELINES
local YHeight = 0.05
local CharStatX = -6.16
local CharStatZBase = -3.98
local CharStatZMod = 1.86
local CharStatText = 150
local CharMODX = -6.16
local CharMODZBase = -4.6
local CharMODZMod = 1.86
local CoinPurseZ = -4.15
local CoinPurseX = 0.78
local CoinPurseXMOD = 0.66
local ArmorZ = 6.51
local ArmorWeaponsX = -5.77
local ArmorWeaponsXMod = 0.35
local WeaponsZ = 6.88
--Spell UI
local SpellLimitX1 = 3.4
local SpellLimitX2 = 4.555
local SpellLimitX3 = 5.685
local SpellZ1Base = -5.3
local SpellZ2Base = -4.65
local SpellZ3Base = -4
local SpellSlotsXMod = 0.2
--global list start and stop
local SavesSkillsTotalStart = TOTAL_SAVE_STRENGTH
local SavesSkillsTotalStop = TOTAL_SKILL_PERSUASION
--global color pallet
local lightred = {1,0.8,0.79,1}
local red = {1,0,0,1}
local darkred = {0.56,0,0,1}
local green = {0,1,0,1}
local blue = {0,0,1,1}
local white = {1,1,1,1}
local clear = {1,1,1,0}
local black = {0,0,0,1}
local platinum = {0.9,0.9,0.9,1}
local gold = {0.83,0.68,0.22,1}
local silver = {0.66,0.66,0.66,1}
local copper = {0.6,0.4,0.08,1}
local lightblue = {0,0.71,0.8,1}
local lightgray = {0.80,0.79,0.75,1}


--name_table Globals
local ONE_ROW = 1
local LARGE_STRING = 42
local MEDIUM_STRING = 10
local SMALL_STRING = 8
local NO_LABEL = ""
local UI_SCALE = {0.8,0.8,0.8}
--validation
local IS_TEXT_ENTRY = 1
local IS_INT_ENTRY = 2
--text field widths
local PLAYER_WIDTH = 1000
local DETAILS_WIDTH = 400
local DETAILS_ALT_WIDTH = 150
local INTEGER_WIDTH = 100
local LARGER_STRING_WIDTH = 880
--ui font size
local STANDARD_FONT_SIZE = 150
local DETAILS_FONT_SIZE = 100
local LARGE_STRING_FONT_SIZE = 50
--ui text alignment
local AUTO_ALIGNED_TEXT = 1
local LEFT_ALIGNED_TEXT = 2
local CENTER_ALIGNED_TEXT = 3
local RIGHT_ALIGNED_TEXT = 4
local JUSTIFIED_ALIGNED_TEXT = 5
--UI misc character details
local DETAILS_UPPER_Z = -7.48
local DETAILS_LOWER_Z = -6.43
--UI Attacks
local ATTACK_UPPER_Z = -1.23
local ATTACK_LOWER_Z = -0.70
local ATTACK_MOD_Z = 0
local ATTACK_X_NAME_DMG_TYPE = -3.8
local ATTACK_X_BONUS_MISC = -4.375
local ATTACK_X_BONUS_INT_TYPE = -4.59
local ATTACK_X_RANGE = -2.73
local ATTACK_X_DMG_COUNT_INT = -4.1
local ATTACK_X_DMG_MOD_MISC = -3.55
local ATTACK_X_TYPE = -3.15
local ATTACK_X_WEIGHT = -2.6
--travel speeds UI
local TRAVEL_SPEED_X1 = -0.98
local TRAVEL_SPEED_X2 = -0.74
local TRAVEL_SPEED_Z1 = -4.2
local TRAVEL_SPEED_Z2 = -3.95
local TRAVEL_SPEED_Z3 = -3.7
local LARGER_STRING_X = -1.55

name_table = {
	[INDEX_NAME] = { name = 'Edit Name', interactable	 = false, readOnly = true, position = {-5.4, YHeight, -6.9},
	 label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = PLAYER_WIDTH, font_size = STANDARD_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0  },
	[INDEX_RACE] = { name = 'Edit Race', interactable	 = false, readOnly = true,  position = {-3.4, YHeight, DETAILS_LOWER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = JUSTIFIED_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH + 300, font_size = DETAILS_FONT_SIZE - 10,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_CLASS] = { name = 'Edit Class', interactable	 = false, readOnly = true,  position = {-3.46, YHeight, DETAILS_UPPER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_DEITY] = { name = 'Edit Deity', interactable	 = false, readOnly = true,  position = {-2.4, YHeight, DETAILS_LOWER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE - 20,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_PLAYER] = { name = 'Edit Player', interactable	 = false, readOnly = true,  position = {-1.15, YHeight, DETAILS_UPPER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_CLASS2_NAME] = { name = 'Class2 Name', interactable	 = false, readOnly = true, position = {-1.15, YHeight, -4.83},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_CLASS1_NAME] = { name = 'Class1 Name', interactable	 = false, readOnly = true, position = {-1.15, YHeight, -5.38},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_BACKGROUND] = { name = 'Background', interactable	 = false, readOnly = true, position = {-2.3, YHeight, DETAILS_UPPER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH + 600, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_ALIGNMENT] = { name = 'Alignment', interactable	 = false, readOnly = true, position = {-1.6, YHeight, DETAILS_LOWER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE - 20,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_AGE] = { name = 'age', interactable	 = false, readOnly = true, position = {-0.6, YHeight, DETAILS_UPPER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_ALT_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_HEIGHT] = { name = 'Height', interactable	 = false, readOnly = true, position = {-0.2, YHeight, DETAILS_UPPER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_ALT_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_WEIGHT] = { name = 'Weight', interactable	 = false, readOnly = true, position = {0.2, YHeight, DETAILS_UPPER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_ALT_WIDTH, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_EYES] = { name = 'Eyes', interactable	 = false, readOnly = true, position = {-0.5, YHeight, DETAILS_LOWER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_ALT_WIDTH +100, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_SKIN] = { name = 'Skin', interactable	 = false, readOnly = true, position = {-0.05, YHeight, DETAILS_LOWER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_ALT_WIDTH + 100, font_size = DETAILS_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_HAIR] = { name = 'Hair', interactable	 = false, readOnly = true, position = {0.4, YHeight, DETAILS_LOWER_Z},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_ALT_WIDTH + 100, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0 },
	[INDEX_SPELL_CLASS] = { name = 'Spell Class', interactable	 = false, readOnly = true, position = {5.3, YHeight, -6.9},
	 label = NO_LABEL, rows = ONE_ROW, alignment = RIGHT_ALIGNED_TEXT, scale = buttonScale, width = PLAYER_WIDTH, font_size = STANDARD_FONT_SIZE,
		color = lightgray, font_color = black, value = 0 },
	[INDEX_FLY] = { name = 'Fly', interactable	 = false, readOnly = true, position = {TRAVEL_SPEED_X1, YHeight, TRAVEL_SPEED_Z1},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = INTEGER_WIDTH, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0, validation = IS_INT_ENTRY },
	[INDEX_SWIM] = { name = 'Swim', interactable	 = false, readOnly = true, position = {TRAVEL_SPEED_X1, YHeight, TRAVEL_SPEED_Z2},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = INTEGER_WIDTH, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0, validation = IS_INT_ENTRY },
	[INDEX_LONG_JUMP] = { name = 'Long Jump', interactable	 = false, readOnly = true, position = {TRAVEL_SPEED_X1, YHeight, TRAVEL_SPEED_Z3},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = INTEGER_WIDTH, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0, validation = IS_INT_ENTRY },
	[INDEX_HIGH_JUMP] = { name = 'High Jump', interactable	 = false, readOnly = true, position = {TRAVEL_SPEED_X2, YHeight, TRAVEL_SPEED_Z1},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = INTEGER_WIDTH, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0, validation = IS_INT_ENTRY },
	[INDEX_CRAWL] = { name = 'Crawl', interactable	 = false, readOnly = true, position = {TRAVEL_SPEED_X2, YHeight, TRAVEL_SPEED_Z2},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = INTEGER_WIDTH, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0, validation = IS_INT_ENTRY },
	[INDEX_CLIMB] = { name = 'Climb', interactable	 = false, readOnly = true, position = {TRAVEL_SPEED_X2, YHeight, TRAVEL_SPEED_Z3},
	 label = NO_LABEL, rows = ONE_ROW, alignment = CENTER_ALIGNED_TEXT, scale = buttonScale, width = INTEGER_WIDTH, font_size = DETAILS_FONT_SIZE,
		color = lightgray, font_color = black, value = 0, validation = IS_INT_ENTRY },
		--Larger Strings
	[INDEX_FEATURES_TRAITS] = { name = 'Features and Traits', interactable	 = false, readOnly = true, position = {LARGER_STRING_X, YHeight, -1.75},
	 label = NO_LABEL, rows = LARGE_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_ADDITIONAL_EQUIPMENT] = { name = 'Additional Equipment', interactable	 = false, readOnly = true, position = {LARGER_STRING_X, YHeight, 2.3},
	 label = NO_LABEL, rows = LARGE_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_PERSONALITY_TRAITS] = { name = 'Personality Traits', interactable	 = false, readOnly = true, position = {LARGER_STRING_X, YHeight, 4.8},
	 label = NO_LABEL, rows = SMALL_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_IDEALS] = { name = 'Ideals', interactable	 = false, readOnly = true, position = {LARGER_STRING_X, YHeight, 5.8},
	 label = NO_LABEL, rows = SMALL_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_BONDS] = { name = 'Bonds', interactable	 = false, readOnly = true, position = {LARGER_STRING_X, YHeight, 6.8},
	 label = NO_LABEL, rows = SMALL_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_FLAWS] = { name = 'Flaws', interactable	 = false, readOnly = true, position = {LARGER_STRING_X, YHeight, 7.9},
	 label = NO_LABEL, rows = SMALL_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_PROFICIENCIES] = { name = 'Proficiencies', interactable	 = false, readOnly = true, position = {-3.35, YHeight, 6.8},
	 label = NO_LABEL, rows = MEDIUM_STRING-1, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH + 200, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_LANGUAGES] = { name = 'Languages', interactable	 = false, readOnly = true, position = {-3.35, YHeight, 7.9},
	 label = NO_LABEL, rows = MEDIUM_STRING-3, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH + 200, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 },
	[INDEX_TOOLS] = { name = 'Tools', interactable	 = false, readOnly = true, position = {-5.3, YHeight, 7.7},
	 label = NO_LABEL, rows = MEDIUM_STRING, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = LARGER_STRING_WIDTH + 200, font_size = LARGE_STRING_FONT_SIZE,
	  color = lightgray, font_color = black, value = 0 }
}

function onload()
	declareVars()
	CreateStuff()
	self.lock()
end

function declareVars()
	-- Stats
	stats = {
		--1
			[INDEX_HP_THRESHOLD] = { value = 0, name = 'Hit Points Threshold', position = {-3.5, YHeight, -3.5} },
		--2
			[INDEX_HP_CURRENT] = { value = 0, name = 'Hit Points Current', position = {-3.5, YHeight, -4.5} },
		--3
			[INDEX_THP_CURRENT] = { value = 0, name = 'Temp HP Current', position = {-2.775, YHeight, -2.8} },
		--4
			[INDEX_AC_THRESHOLD] = { value = 0, name = 'AC Value', position = {-4.22, YHeight, -4.6} },
		--5
			[INDEX_AC_BUFF] = { value = 0, name = 'AC Buff', position = {-4.22, YHeight, -4.6}, font_color = { r = 1, g = 1, b = 1, a = 0 } },
			--spell info
			[INDEX_SPELL_ABILITY] = { value = 0, name = 'Spell_Ability_Number', position = {3.245, YHeight, -7.24 }, font_size = 0 },
			[INDEX_SPELL_MOD] = { value = 0, name = 'Spell_MOD', position = {1.5, YHeight, -7.24 }, font_size = 300 },
			[INDEX_SPELL_DC] = { value = 0, name = 'Spell_DC', position = {2.35, YHeight, -7.24 }, font_size = 300 },
			[INDEX_SPELL_STRING] = { value = 0, name = 'Spell_String', currentAbility = 'INT', position = {3.245, YHeight, -7.24 }, font_size = 300 },
			[INDEX_SPELL_MISC] = { value = 0, name = 'Spell Misc', position = {-4, YHeight, 8}, font_size = 0 },

			[INDEX_HIT_DICE] = { value = 0, name = 'Available HD', position = {-2.85, YHeight, -4.5} },
		--6
			[INDEX_CHAR_LEVEL] = { value = 1, name = 'Character Level', position = {-3.9, YHeight, -7.5}, font_size = 125 },
		--7
			[INDEX_PROFICIENCY] = { value = 2, name = 'Proficiency', position = {-4.22, YHeight, -2.8} },
			[INDEX_HD_TYPE] = { value = 0, name = 'HD Type', position = {-2.6, YHeight, -4}, font_color = { 1,1,1,0 } },
			[INDEX_CLASS1_TOTAL] = { value = 0, name = 'Class1 Total', position = {-0.38, YHeight, -5.38} },
			[INDEX_CLASS1_ACTUAL] = { value = 0, name = 'Class1 Actual', position = {-0.63, YHeight, -5.38} },
			[INDEX_CLASS2_TOTAL] = { value = 0, name = 'Class2 Total', position = {-0.38, YHeight, -4.83} },
			[INDEX_CLASS2_ACTUAL] = { value = 0, name = 'Class2 Actual', position = {-0.63, YHeight, -4.83} },
			[INDEX_EXHAUSTION] = { value = 0, name = 'Exhaustion', position = {0.15, YHeight, -4.75}, font_color = red },
			[INDEX_PASSIVE_PERCEPTION] = { value = 0, name = 'Passive Perception', position = {-5.65, YHeight, 4.25} },
			[INDEX_PASSIVE_PERCEPTION_MISC] = { value = 0, name = 'Passive Perception Misc', position = {-5.65, YHeight, 4.25}, font_color = { 1,1,1,0 } },
			[INDEX_INSPIRATION] = { value = 0, name = 'Inspiration', position = {-5.65, YHeight, 5} },
			[INDEX_INITIATIVE_TOTAL] = { value = 0, name = 'Initiative', position = {-5.65, YHeight, 5.75} },
			[INDEX_INITIATIVE_MISC] = { value = 0, name = 'Initiative Misc', position = {-5.65, YHeight, 5.75}, font_color = { 1,1,1,0 } },
			[INDEX_AMMO1] = { value = 0, name = 'AMMO1', position = {0.565, YHeight, -1.19} },
			[INDEX_AMMO2] = { value = 0, name = 'AMMO2', position = {0.565, YHeight, 1.9} },
			[INDEX_AMMO3] = { value = 0, name = 'AMMO3', position = {0.565, YHeight, 4.9} },
			[INDEX_AMMO4] = { value = 0, name = 'AMMO4', position = {0.565, YHeight, 8} },
			[INDEX_POTION1] = { value = 0, name = 'POTION1', position = {0.61, YHeight, 3.1 } },
			[INDEX_POTION2] = { value = 0, name = 'POTION2', position = {0.61, YHeight, 6.15} },
			[INDEX_CARRY_LIMIT] = { value = 0, name = 'Maximum Weight', position = {-1.79, YHeight, -3.95}, font_size = 100 },
			[INDEX_CARRY_CURRENT] = { value = 0, name = 'Current Weight', position = {-1.79, YHeight, -4.2}, font_size = 100 },
			[INDEX_SIZE] = { value = 0, name = 'Size Value', currentAbility = 'M', position = {-3.2, YHeight, -6.5}, font_size = 50, font_color = clear },
			[INDEX_CREATURE_SIZE] = { value = 0, name = 'Creature Size', currentAbility = 'M', position = {0.55, YHeight, -7.5}, font_size = 50 },
			[INDEX_PUSH_PULL] = { value = 0, name = 'Push/Pull', position = {-1.79, YHeight, -3.7}, font_size = 95 },
			[INDEX_HD_TYPE_STRING] = { value = 0, name = 'HD Type String', currentAbility = 'd6', position = {-2.6, YHeight, -4}, font_size = 30 },
			[INDEX_SPEED] = { value = 0, name = 'Speed', position = {-1.05, YHeight, -6.5}, font_size = 200, font_color = black }
	}

	-- Characteristics
	characteristics = {
		[INDEX_STR] = { value = 0, name = 'Strength', shortName = 'STR', position = {CharStatX, YHeight, CharStatZBase} },
		[INDEX_DEX] = { value = 0, name = 'Dexterity', shortName = 'DEX', position = {CharStatX, YHeight, CharStatZBase + (1 * CharStatZMod)} },
		[INDEX_CON] = { value = 0, name = 'Constitution', shortName = 'CON', position = {CharStatX, YHeight, CharStatZBase + (2 * CharStatZMod)} },
		[INDEX_INT] = { value = 0, name = 'Intelligence', shortName = 'INT', position = {CharStatX, YHeight, CharStatZBase + (3 * CharStatZMod)} },
		[INDEX_WIS] = { value = 0, name = 'Wisdom', shortName = 'WIS', position = {CharStatX, YHeight, CharStatZBase + (4 * CharStatZMod)} },
		[INDEX_CHA] = { value = 0, name = 'Charisma', shortName = 'CHA', position = {CharStatX, YHeight, CharStatZBase + (5 * CharStatZMod)} },
	}

	-- Modifiers
	modifiers = {
		[MOD_INDEX_STR] = { value = 0, name = 'StrengthMOD', shortName = 'STRMOD', position = {CharMODX, YHeight, CharMODZBase} },
		[MOD_INDEX_DEX] = { value = 0, name = 'DexterityMOD', shortName = 'DEXMOD', position = {CharMODX, YHeight, CharMODZBase + (1 * CharMODZMod)} },
		[MOD_INDEX_CON] = { value = 0, name = 'ConstitutionMOD', shortName = 'CONMOD', position = {CharMODX, YHeight, CharMODZBase + (2 * CharMODZMod)} },
		[MOD_INDEX_INT] = { value = 0, name = 'IntelligenceMOD', shortName = 'INTMOD', position = {CharMODX, YHeight, CharMODZBase + (3 * CharMODZMod)} },
		[MOD_INDEX_WIS] = { value = 0, name = 'WisdomMOD', shortName = 'WISMOD', position = {CharMODX, YHeight, CharMODZBase + (4 * CharMODZMod)} },
		[MOD_INDEX_CHA] = { value = 0, name = 'CharismaMOD', shortName = 'CHAMOD', position = {CharMODX, YHeight, CharMODZBase + (5 * CharMODZMod)} }
	}

	-- Skills and Saves Mods
	skills = {
		[SAVE_STRENGTH] = { value = 0, name = 'StrengthSave', characteristic = MOD_INDEX_STR, career = false, roll = false, total = TOTAL_SAVE_STRENGTH, title = 'Strength Save' },
		[SAVE_DEXTERITY] = { value = 0, name = 'DexteritySave', characteristic = MOD_INDEX_DEX, career = false, roll = false, total = TOTAL_SAVE_DEXTERITY, title = 'Dexterity Save' },
		[SAVE_CONSTITUTION] = { value = 0, name = 'ConstitutionSave', characteristic = MOD_INDEX_CON, career = false, roll = false, total = TOTAL_SAVE_CONSTITUTION, title = 'Constitution Save' },
		[SAVE_INTELLIGENCE] = { value = 0, name = 'IntelligenceSave', characteristic = MOD_INDEX_INT, career = false, roll = false, total = TOTAL_SAVE_INTELLIGENCE, title = 'Intelligence Save' },
		[SAVE_WISDOM] = { value = 0, name = 'WisdomSave', characteristic = MOD_INDEX_WIS, career = false, roll = false, total = TOTAL_SAVE_WISDOM, title = 'Wisdom Save'  },
		[SAVE_CHARISMA] = { value = 0, name = 'CharismaSave', characteristic = MOD_INDEX_CHA, career = false, roll = false, total = TOTAL_SAVE_CHARISMA, title = 'Charisma Save' },
		[SKILL_ATHLETICS] = { value = 0, name = 'Athletics', characteristic = MOD_INDEX_STR, career = false, roll = false, total = TOTAL_SKILL_ATHLETICS, title = 'Athletics' },
		[SKILL_ACROBATICS] = { value = 0, name = 'Acrobatics', characteristic = MOD_INDEX_DEX, career = false, roll = false, total = TOTAL_SKILL_ACROBATICS, title = 'Acrobatics' },
		[SKILL_SLIGHT_OF_HAND] = { value = 0, name = 'SlightofHand', characteristic = MOD_INDEX_DEX, career = false, roll = false, total = TOTAL_SKILL_SLIGHT_OF_HAND, title = 'Slight of Hand' },
		[SKILL_STEALTH] = { value = 0, name = 'Stealth', characteristic = MOD_INDEX_DEX, career = false, roll = false, total = TOTAL_SKILL_STEALTH, title = 'Stealth' },
		[SKILL_ARCANA] = { value = 0, name = 'Arcana', characteristic = MOD_INDEX_INT, career = false, roll = false, total = TOTAL_SKILL_ARCANA, title = 'Arcana' },
		[SKILL_HISTORY] = { value = 0, name = 'History', characteristic = MOD_INDEX_INT, career = false, roll = false, total = TOTAL_SKILL_HISTORY, title = 'History' },
		[SKILL_INVESTIGATION] = { value = 0, name = 'Investigation', characteristic = MOD_INDEX_INT, career = false, roll = false, total = TOTAL_SKILL_INVESTIGATION, title = 'Investigation' },
		[SKILL_NATURE] = { value = 0, name = 'Nature', characteristic = MOD_INDEX_INT, career = false, roll = false, total = TOTAL_SKILL_NATURE, title = 'Nature' },
		[SKILL_RELIGION] = { value = 0, name = 'Religion', characteristic = MOD_INDEX_INT, career = false, roll = false, total = TOTAL_SKILL_RELIGION, title = 'Religion' },
		[SKILL_ANIMAL_HANDLING] = { value = 0, name = 'AnimalHandling', characteristic = MOD_INDEX_WIS, career = false, roll = false, total = TOTAL_SKILL_ANIMAL_HANDLING, title = 'Animal Handling' },
		[SKILL_INSIGHT] = { value = 0, name = 'Insight', characteristic = MOD_INDEX_WIS, career = false, roll = false, total = TOTAL_SKILL_INSIGHT, title = 'Insight' },
		[SKILL_MEDICINE] = { value = 0, name = 'Medicine', characteristic = MOD_INDEX_WIS, career = false, roll = false, total = TOTAL_SKILL_MEDICINE, title = 'Medicine' },
		[SKILL_PERCEPTION] = { value = 0, name = 'Perception', characteristic = MOD_INDEX_WIS, career = false, roll = false, total = TOTAL_SKILL_PERCEPTION, title = 'Perception' },
		[SKILL_SURVIVAL] = { value = 0, name = 'Survival', characteristic = MOD_INDEX_WIS, career = false, roll = false, total = TOTAL_SKILL_SURVIVAL, title = 'Survival' },
		[SKILL_DECEPTION] = { value = 0, name = 'Deception', characteristic = MOD_INDEX_CHA, career = false, roll = false, total = TOTAL_SKILL_DECEPTION, title = 'Deception' },
  	[SKILL_INTIMIDATION] = { value = 0, name = 'Intimidation', characteristic = MOD_INDEX_CHA, career = false, roll = false, total = TOTAL_SKILL_INTIMIDATION, title = 'Intimidation' },
  	[SKILL_PERFORMANCE] = { value = 0, name = 'Performance', characteristic = MOD_INDEX_CHA, career = false, roll = false, total = TOTAL_SKILL_PERFORMANCE, title = 'Performance' },
  	[SKILL_PERSUASION] = { value = 0, name = 'Persuasion', characteristic = MOD_INDEX_CHA, career = false, roll = false, total = TOTAL_SKILL_PERSUASION, title = 'Persuasion' }
	}

	-- Skills and Save Totals
	expertise = {
		[SKILL_ATHLETICS] = { value = 0, name = 'Athletics' },
		[SKILL_ACROBATICS] = { value = 0, name = 'Acrobatics' },
		[SKILL_SLIGHT_OF_HAND] = { value = 0, name = 'SlightofHand' },
		[SKILL_STEALTH] = { value = 0, name = 'Stealth' },
		[SKILL_ARCANA] = { value = 0, name = 'Arcana' },
		[SKILL_HISTORY] = { value = 0, name = 'History' },
		[SKILL_INVESTIGATION] = { value = 0, name = 'Investigation' },
		[SKILL_NATURE] = { value = 0, name = 'Nature' },
		[SKILL_RELIGION] = { value = 0, name = 'Religion' },
		[SKILL_ANIMAL_HANDLING] = { value = 0, name = 'AnimalHandling' },
		[SKILL_INSIGHT] = { value = 0, name = 'Insight' },
		[SKILL_MEDICINE] = { value = 0, name = 'Medicine' },
		[SKILL_PERCEPTION] = { value = 0, name = 'Perception' },
		[SKILL_SURVIVAL] = { value = 0, name = 'Survival' },
		[SKILL_DECEPTION] = { value = 0, name = 'Deception' },
		[SKILL_INTIMIDATION] = { value = 0, name = 'Intimidation' },
		[SKILL_PERFORMANCE] = { value = 0, name = 'Performance' },
		[SKILL_PERSUASION] = { value = 0, name = 'Persuasion' }
	}

	-- Spell slots
	spellSlots = {
		[SPELL_SLOTS_ONE]   = { value = 0,  name = 'Slots_One',   spellIndex = INDEX_SPELLS_ONE, position = {SpellLimitX1 + SpellSlotsXMod, YHeight, SpellZ1Base} },
		[SPELL_SLOTS_TWO]   = { value = 0,  name = 'Slots_Two',   spellIndex = INDEX_SPELLS_TWO, position = {SpellLimitX1 + SpellSlotsXMod, YHeight, SpellZ2Base} },
		[SPELL_SLOTS_THREE] = { value = 0,  name = 'Slots_Three', spellIndex = INDEX_SPELLS_THREE, position = {SpellLimitX1 + SpellSlotsXMod, YHeight, SpellZ3Base} },
		[SPELL_SLOTS_FOUR]  = { value = 0,  name = 'Slots_Four',  spellIndex = INDEX_SPELLS_FOUR, position = {SpellLimitX2 + SpellSlotsXMod, YHeight, SpellZ1Base} },
		[SPELL_SLOTS_FIVE]  = { value = 0,  name = 'Slots_Five',  spellIndex = INDEX_SPELLS_FIVE, position = {SpellLimitX2 + SpellSlotsXMod, YHeight, SpellZ2Base} },
		[SPELL_SLOTS_SIX]   = { value = 0,  name = 'Slots_Six',   spellIndex = INDEX_SPELLS_SIX, position = {SpellLimitX2 + SpellSlotsXMod, YHeight, SpellZ3Base} },
		[SPELL_SLOTS_SEVEN] = { value = 0,  name = 'Slots_Seven', spellIndex = INDEX_SPELLS_SEVEN, position = {SpellLimitX3 + SpellSlotsXMod, YHeight, SpellZ1Base} },
		[SPELL_SLOTS_EIGHT] = { value = 0,  name = 'Slots_Eight', spellIndex = INDEX_SPELLS_EIGHT, position = {SpellLimitX3 + SpellSlotsXMod, YHeight, SpellZ2Base} },
		[SPELL_SLOTS_NINE]  = { value = 0,  name = 'Slots_Nine',  spellIndex = INDEX_SPELLS_NINE, position = {SpellLimitX3 + SpellSlotsXMod, YHeight, SpellZ3Base} },
		[SPELL_LIMIT_ONE]   = { value = 0, name = 'Limit_One',   spellIndex = INDEX_SPELLS_ONE, position = {SpellLimitX1, YHeight, SpellZ1Base} },
		[SPELL_LIMIT_TWO]   = { value = 0, name = 'Limit_Two',   spellIndex = INDEX_SPELLS_TWO, position = {SpellLimitX1, YHeight, SpellZ2Base} },
		[SPELL_LIMIT_THREE] = { value = 0, name = 'Limit_Three', spellIndex = INDEX_SPELLS_THREE, position = {SpellLimitX1, YHeight, SpellZ3Base} },
		[SPELL_LIMIT_FOUR]  = { value = 0, name = 'Limit_Four',  spellIndex = INDEX_SPELLS_FOUR, position = {SpellLimitX2, YHeight, SpellZ1Base} },
		[SPELL_LIMIT_FIVE]  = { value = 0, name = 'Limit_Five',  spellIndex = INDEX_SPELLS_FIVE, position = {SpellLimitX2, YHeight, SpellZ2Base} },
		[SPELL_LIMIT_SIX]   = { value = 0, name = 'Limit_Six',   spellIndex = INDEX_SPELLS_SIX, position = {SpellLimitX2, YHeight, SpellZ3Base} },
		[SPELL_LIMIT_SEVEN] = { value = 0, name = 'Limit_Seven', spellIndex = INDEX_SPELLS_SEVEN, position = {SpellLimitX3, YHeight, SpellZ1Base} },
		[SPELL_LIMIT_EIGHT] = { value = 0, name = 'Limit_Eight', spellIndex = INDEX_SPELLS_EIGHT, position = {SpellLimitX3, YHeight, SpellZ2Base} },
		[SPELL_LIMIT_NINE]  = { value = 0, name = 'Limit_Nine',  spellIndex = INDEX_SPELLS_NINE, position = {SpellLimitX3, YHeight, SpellZ3Base} }
	}

	-- Status effects
	proficiencyMarks = {
		[PROFICIENCY_LIGHT] = { value = false, name = 'proficieny_Light', proficient = false, position = {ArmorWeaponsX, YHeight, ArmorZ} },
		[PROFICIENCY_MEDIUM] = { value = false, name = 'proficieny_Medium', proficient = false, position = {ArmorWeaponsX + ( 1 * ArmorWeaponsXMod), YHeight, ArmorZ} },
		[PROFICIENCY_HEAVY] = { value = false, name = 'proficieny_Heavy', proficient = false, position = {ArmorWeaponsX + ( 2.16 * ArmorWeaponsXMod), YHeight, ArmorZ} },
		[PROFICIENCY_SHIELDS] = { value = false, name = 'proficieny_Shields', proficient = false, position = {ArmorWeaponsX + ( 3.21 * ArmorWeaponsXMod), YHeight, ArmorZ} },
		[PROFICIENCY_SIMPLE] = { value = false, name = 'proficieny_Simple', proficient = false, position = {ArmorWeaponsX, YHeight, WeaponsZ} },
		[PROFICIENCY_MARTIAL] = { value = false, name = 'proficieny_Martial', proficient = false, position = {ArmorWeaponsX + ( 1 * ArmorWeaponsXMod), YHeight, WeaponsZ} },
		[PROFICIENCY_OTHER] = { value = false, name = 'proficieny_Other', proficient = false, position = {ArmorWeaponsX + ( 2.16 * ArmorWeaponsXMod), YHeight, WeaponsZ} }
	}

	bardJack = {
		[DARKVISION] = { value = 0, name = 'Dark', globalValue = DARKVISION, bard = false, position = {-2.182, YHeight, -5.4}, font_size = 75 },
		[JACK_TRADES] = { value = 0, name = 'Jack', globalValue = JACK_TRADES, bard = false, position = {-2.182, YHeight, -4.88}, font_size = 75 }
	}
	-- Status effects
	coinPurse = {
		[INDEX_COIN_COP] = { value = 0, name = 'copper', position = {CoinPurseX, YHeight, CoinPurseZ}, color = copper },
		[INDEX_COIN_SIL] = { value = 0, name = 'silver', position = {CoinPurseX + ( 1 * CoinPurseXMOD), YHeight, CoinPurseZ}, color = silver },
		[INDEX_COIN_GOL] = { value = 0, name = 'gold', position = {CoinPurseX + ( 2 * CoinPurseXMOD), YHeight, CoinPurseZ}, color = gold },
		[INDEX_COIN_PLA] = { value = 0, name = 'platinum', position = {CoinPurseX + ( 3 * CoinPurseXMOD), YHeight, CoinPurseZ}, color = platinum }
	}

	deathSaves = {
		[DEATH_MARK_1] = { value = 1, mark = false, index = 'n', name = 'DEATH_MARK_1', position = {-3.48, YHeight, -2.41} },
		[DEATH_MARK_2] = { value = 2, mark = false, index = 'n', name = 'DEATH_MARK_2', position = {-3.37, YHeight, -2.41} },
		[DEATH_MARK_3] = { value = 3, mark = false, index = 'n', name = 'DEATH_MARK_3', position = {-3.26, YHeight, -2.41} },
		[DEATH_MARK_4] = { value = 4, mark = false, index = 'n', name = 'DEATH_MARK_4', position = {-3.48, YHeight, -2.155} },
		[DEATH_MARK_5] = { value = 5, mark = false, index = 'n', name = 'DEATH_MARK_5', position = {-3.37, YHeight, -2.155} },
		[DEATH_MARK_6] = { value = 6, mark = false, index = 'n', name = 'DEATH_MARK_6', position = {-3.26, YHeight, -2.155} }
	}

	attack_table = {
		[INDEX_ATTACK_1_NAME] = { name = 'Attack One',
		 	position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_UPPER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.1', databaseIndex = INDEX_ATTACK_1_NAME },
		[INDEX_ATTACK_1_BONUS] = { name = 'Bonus',
		 	position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z},
			 	label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.2', databaseIndex = INDEX_ATTACK_1_BONUS, bonusINT = INDEX_ATTACK_1_BONUS_INT,
				 		misc = INDEX_ATTACK_1_BONUS_MISC },
		[INDEX_ATTACK_1_BONUS_INT] = { name = 'Attack One Bonus INT',
		 	position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 1, subTable = '1.3', databaseIndex = INDEX_ATTACK_1_BONUS_INT },
		[INDEX_ATTACK_1_BONUS_TYPE] = { name = 'STR',
		 	position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.4', databaseIndex = INDEX_ATTACK_1_BONUS_TYPE },
		[INDEX_ATTACK_1_BONUS_MISC] = { name = 'Attack One Bonus Misc',
		 	position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.5', databaseIndex = INDEX_ATTACK_1_BONUS_MISC },
		[INDEX_ATTACK_1_RANGE] = { name = 'Range',
		 	position = {ATTACK_X_RANGE, YHeight, ATTACK_UPPER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.6', databaseIndex = INDEX_ATTACK_1_RANGE },
		[INDEX_ATTACK_1_DAMAGE_DICE_COUNT] = { name = 'Attack One Damage Dice Count',
		 	position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z},
			 	label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
			 		color = lightgray, font_color = black, value = 1, subTable = '1.7', databaseIndex = INDEX_ATTACK_1_DAMAGE_DICE_COUNT },
		[INDEX_ATTACK_1_DAMAGE_DICE_INT] = { name = 'Attack One Damage Dice INT',
		 	position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z},
			 	label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
			 		color = lightgray, font_color = black, value = 1, subTable = '1.8', databaseIndex = INDEX_ATTACK_1_DAMAGE_DICE_INT },
		[INDEX_ATTACK_1_DAMAGE_DICE_TYPE] = { name = 'd4 + ',
		 	position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_LOWER_Z},
			 	label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
			 		color = lightgray, font_color = black, value = 0, subTable = '1.9', databaseIndex = INDEX_ATTACK_1_DAMAGE_DICE_TYPE },
		[INDEX_ATTACK_1_DAMAGE_MOD] = { name = 'Attack One Damage Mod',
		 	position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.10', databaseIndex = INDEX_ATTACK_1_DAMAGE_MOD, bonusINT = INDEX_ATTACK_1_BONUS_INT,
				 		misc = INDEX_ATTACK_1_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_1_DAMAGE_MOD_MISC] = { name = 'Attack One Damage Mod Misc',
		 	position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.11', databaseIndex = INDEX_ATTACK_1_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_1_TYPE] = { name = 'Type',
		 	position = {ATTACK_X_TYPE, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.12', databaseIndex = INDEX_ATTACK_1_TYPE },
		[INDEX_ATTACK_1_WEIGHT] = { name = 'Attack One Weight',
			position = {ATTACK_X_WEIGHT, YHeight, ATTACK_LOWER_Z},
		 		label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
		  		color = lightgray, font_color = black, value = 0, subTable = '1.13', databaseIndex = INDEX_ATTACK_1_WEIGHT },
					---------------------------------------------------------------------
		[INDEX_ATTACK_2_NAME] = { name = 'Attack Two',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_UPPER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.1', databaseIndex = INDEX_ATTACK_2_NAME },
		[INDEX_ATTACK_2_BONUS] = { name = 'Bonus',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.2', databaseIndex = INDEX_ATTACK_2_BONUS, bonusINT = INDEX_ATTACK_2_BONUS_INT,
						misc = INDEX_ATTACK_2_BONUS_MISC },
		[INDEX_ATTACK_2_BONUS_INT] = { name = 'Attack Two Bonus INT',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 1, subTable = '2.3', databaseIndex = INDEX_ATTACK_2_BONUS_INT },
		[INDEX_ATTACK_2_BONUS_TYPE] = { name = 'STR',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.4', databaseIndex = INDEX_ATTACK_2_BONUS_TYPE },
		[INDEX_ATTACK_2_BONUS_MISC] = { name = 'Attack Two Bonus Misc',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.5', databaseIndex = INDEX_ATTACK_2_BONUS_MISC },
		[INDEX_ATTACK_2_RANGE] = { name = 'Range',
			position = {ATTACK_X_RANGE, YHeight, ATTACK_UPPER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.6', databaseIndex = INDEX_ATTACK_2_RANGE },
		[INDEX_ATTACK_2_DAMAGE_DICE_COUNT] = { name = 'Attack Two Damage Dice Count',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '2.7', databaseIndex = INDEX_ATTACK_2_DAMAGE_DICE_COUNT },
		[INDEX_ATTACK_2_DAMAGE_DICE_INT] = { name = 'Attack Two Damage Dice INT',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '2.8', databaseIndex = INDEX_ATTACK_2_DAMAGE_DICE_INT },
		[INDEX_ATTACK_2_DAMAGE_DICE_TYPE] = { name = 'd4 + ',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 0, subTable = '2.9', databaseIndex = INDEX_ATTACK_2_DAMAGE_DICE_TYPE },
		[INDEX_ATTACK_2_DAMAGE_MOD] = { name = 'Attack Two Damage Mod',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.10', databaseIndex = INDEX_ATTACK_2_DAMAGE_MOD, bonusINT = INDEX_ATTACK_2_BONUS_INT,
						misc = INDEX_ATTACK_2_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_2_DAMAGE_MOD_MISC] = { name = 'Attack Two Damage Mod Misc',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.11', databaseIndex = INDEX_ATTACK_2_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_2_TYPE] = { name = 'Type',
			position = {ATTACK_X_TYPE, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.12', databaseIndex = INDEX_ATTACK_2_TYPE },
		[INDEX_ATTACK_2_WEIGHT] = { name = 'Attack Two Weight',
			position = {ATTACK_X_WEIGHT, YHeight, ATTACK_LOWER_Z  + (1 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '2.13', databaseIndex = INDEX_ATTACK_2_WEIGHT },
					----------------------------------------------
		[INDEX_ATTACK_3_NAME] = { name = 'Attack Three',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_UPPER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.1', databaseIndex = INDEX_ATTACK_3_NAME },
		[INDEX_ATTACK_3_BONUS] = { name = 'Bonus',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.2', databaseIndex = INDEX_ATTACK_3_BONUS, bonusINT = INDEX_ATTACK_3_BONUS_INT,
						misc = INDEX_ATTACK_3_BONUS_MISC },
		[INDEX_ATTACK_3_BONUS_INT] = { name = 'Attack Three Bonus INT',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 1, subTable = '3.3', databaseIndex = INDEX_ATTACK_3_BONUS_INT },
		[INDEX_ATTACK_3_BONUS_TYPE] = { name = 'STR',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.4', databaseIndex = INDEX_ATTACK_3_BONUS_TYPE },
		[INDEX_ATTACK_3_BONUS_MISC] = { name = 'Attack Three Bonus Misc',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.5', databaseIndex = INDEX_ATTACK_3_BONUS_MISC },
		[INDEX_ATTACK_3_RANGE] = { name = 'Range',
			position = {ATTACK_X_RANGE, YHeight, ATTACK_UPPER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.6', databaseIndex = INDEX_ATTACK_3_RANGE },
		[INDEX_ATTACK_3_DAMAGE_DICE_COUNT] = { name = 'Attack Three Damage Dice Count',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '3.7', databaseIndex = INDEX_ATTACK_3_DAMAGE_DICE_COUNT },
		[INDEX_ATTACK_3_DAMAGE_DICE_INT] = { name = 'Attack Three Damage Dice INT',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '3.8', databaseIndex = INDEX_ATTACK_3_DAMAGE_DICE_INT },
		[INDEX_ATTACK_3_DAMAGE_DICE_TYPE] = { name = 'd4 + ',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 0, subTable = '3.9', databaseIndex = INDEX_ATTACK_3_DAMAGE_DICE_TYPE },
		[INDEX_ATTACK_3_DAMAGE_MOD] = { name = 'Attack Three Damage Mod',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.10', databaseIndex = INDEX_ATTACK_3_DAMAGE_MOD, bonusINT = INDEX_ATTACK_3_BONUS_INT,
						misc = INDEX_ATTACK_3_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_3_DAMAGE_MOD_MISC] = { name = 'Attack Three Damage Mod Misc',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.11', databaseIndex = INDEX_ATTACK_3_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_3_TYPE] = { name = 'Type',
			position = {ATTACK_X_TYPE, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.12', databaseIndex = INDEX_ATTACK_3_TYPE },
		[INDEX_ATTACK_3_WEIGHT] = { name = 'Attack Three Weight',
			position = {ATTACK_X_WEIGHT, YHeight, ATTACK_LOWER_Z  + (2 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '3.13', databaseIndex = INDEX_ATTACK_3_WEIGHT },
					-----------------------------------------------
		[INDEX_ATTACK_4_NAME] = { name = 'Attack Four',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_UPPER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.1', databaseIndex = INDEX_ATTACK_4_NAME },
		[INDEX_ATTACK_4_BONUS] = { name = 'Bonus',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.2', databaseIndex = INDEX_ATTACK_4_BONUS, bonusINT = INDEX_ATTACK_4_BONUS_INT,
						misc = INDEX_ATTACK_4_BONUS_MISC },
		[INDEX_ATTACK_4_BONUS_INT] = { name = 'Attack Four Bonus INT',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 1, subTable = '4.3', databaseIndex = INDEX_ATTACK_4_BONUS_INT },
		[INDEX_ATTACK_4_BONUS_TYPE] = { name = 'STR',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.4', databaseIndex = INDEX_ATTACK_4_BONUS_TYPE },
		[INDEX_ATTACK_4_BONUS_MISC] = { name = 'Attack Four Bonus Misc',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.5', databaseIndex = INDEX_ATTACK_4_BONUS_MISC },
		[INDEX_ATTACK_4_RANGE] = { name = 'Range',
			position = {ATTACK_X_RANGE, YHeight, ATTACK_UPPER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.6', databaseIndex = INDEX_ATTACK_4_RANGE },
		[INDEX_ATTACK_4_DAMAGE_DICE_COUNT] = { name = 'Attack Four Damage Dice Count',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '4.7', databaseIndex = INDEX_ATTACK_4_DAMAGE_DICE_COUNT },
		[INDEX_ATTACK_4_DAMAGE_DICE_INT] = { name = 'Attack Four Damage Dice INT',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '4.8', databaseIndex = INDEX_ATTACK_4_DAMAGE_DICE_INT },
		[INDEX_ATTACK_4_DAMAGE_DICE_TYPE] = { name = 'd4 + ',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 0, subTable = '4.9', databaseIndex = INDEX_ATTACK_4_DAMAGE_DICE_TYPE },
		[INDEX_ATTACK_4_DAMAGE_MOD] = { name = 'Attack Four Damage Mod',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.10', databaseIndex = INDEX_ATTACK_4_DAMAGE_MOD, bonusINT = INDEX_ATTACK_4_BONUS_INT,
						misc = INDEX_ATTACK_4_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_4_DAMAGE_MOD_MISC] = { name = 'Attack Four Damage Mod Misc',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.11', databaseIndex = INDEX_ATTACK_4_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_4_TYPE] = { name = 'Type',
			position = {ATTACK_X_TYPE, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.12', databaseIndex = INDEX_ATTACK_4_TYPE },
		[INDEX_ATTACK_4_WEIGHT] = { name = 'Attack Four Weight',
			position = {ATTACK_X_WEIGHT, YHeight, ATTACK_LOWER_Z  + (3 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '4.13', databaseIndex = INDEX_ATTACK_4_WEIGHT },
					------------------------------------------
		[INDEX_ATTACK_5_NAME] = { name = 'Attack Five',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_UPPER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.1', databaseIndex = INDEX_ATTACK_5_NAME },
		[INDEX_ATTACK_5_BONUS] = { name = 'Bonus',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.2', databaseIndex = INDEX_ATTACK_5_BONUS, bonusINT = INDEX_ATTACK_5_BONUS_INT,
						misc = INDEX_ATTACK_5_BONUS_MISC },
		[INDEX_ATTACK_5_BONUS_INT] = { name = 'Attack Five Bonus INT',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 1, subTable = '5.3', databaseIndex = INDEX_ATTACK_5_BONUS_INT },
		[INDEX_ATTACK_5_BONUS_TYPE] = { name = 'STR',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.4', databaseIndex = INDEX_ATTACK_5_BONUS_TYPE },
		[INDEX_ATTACK_5_BONUS_MISC] = { name = 'Attack Five Bonus Misc',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.5', databaseIndex = INDEX_ATTACK_5_BONUS_MISC },
		[INDEX_ATTACK_5_RANGE] = { name = 'Range',
			position = {ATTACK_X_RANGE, YHeight, ATTACK_UPPER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.6', databaseIndex = INDEX_ATTACK_5_RANGE },
		[INDEX_ATTACK_5_DAMAGE_DICE_COUNT] = { name = 'Attack Five Damage Dice Count',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '5.7', databaseIndex = INDEX_ATTACK_5_DAMAGE_DICE_COUNT },
		[INDEX_ATTACK_5_DAMAGE_DICE_INT] = { name = 'Attack Five Damage Dice INT',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '5.8', databaseIndex = INDEX_ATTACK_5_DAMAGE_DICE_INT },
		[INDEX_ATTACK_5_DAMAGE_DICE_TYPE] = { name = 'd4 + ',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 0, subTable = '5.9', databaseIndex = INDEX_ATTACK_5_DAMAGE_DICE_TYPE },
		[INDEX_ATTACK_5_DAMAGE_MOD] = { name = 'Attack Five Damage Mod',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.10', databaseIndex = INDEX_ATTACK_5_DAMAGE_MOD, bonusINT = INDEX_ATTACK_5_BONUS_INT,
						misc = INDEX_ATTACK_5_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_5_DAMAGE_MOD_MISC] = { name = 'Attack Five Damage Mod Misc',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.11', databaseIndex = INDEX_ATTACK_5_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_5_TYPE] = { name = 'Type',
			position = {ATTACK_X_TYPE, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.12', databaseIndex = INDEX_ATTACK_5_TYPE },
		[INDEX_ATTACK_5_WEIGHT] = { name = 'Attack Five Weight',
			position = {ATTACK_X_WEIGHT, YHeight, ATTACK_LOWER_Z  + (4 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '5.13', databaseIndex = INDEX_ATTACK_5_WEIGHT },
					-------------------------
		[INDEX_ATTACK_6_NAME] = { name = 'Attack Six',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_UPPER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.1', databaseIndex = INDEX_ATTACK_6_NAME },
		[INDEX_ATTACK_6_BONUS] = { name = 'Bonus',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.2', databaseIndex = INDEX_ATTACK_6_BONUS, bonusINT = INDEX_ATTACK_6_BONUS_INT,
						misc = INDEX_ATTACK_6_BONUS_MISC },
		[INDEX_ATTACK_6_BONUS_INT] = { name = 'Attack Six Bonus INT',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 1, subTable = '6.3', databaseIndex = INDEX_ATTACK_6_BONUS_INT },
		[INDEX_ATTACK_6_BONUS_TYPE] = { name = 'STR',
			position = {ATTACK_X_BONUS_INT_TYPE, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.4', databaseIndex = INDEX_ATTACK_6_BONUS_TYPE },
		[INDEX_ATTACK_6_BONUS_MISC] = { name = 'Attack Six Bonus Misc',
			position = {ATTACK_X_BONUS_MISC, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.5', databaseIndex = INDEX_ATTACK_6_BONUS_MISC },
		[INDEX_ATTACK_6_RANGE] = { name = 'Range',
			position = {ATTACK_X_RANGE, YHeight, ATTACK_UPPER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.6', databaseIndex = INDEX_ATTACK_6_RANGE },
		[INDEX_ATTACK_6_DAMAGE_DICE_COUNT] = { name = 'Attack Six Damage Dice Count',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '6.7', databaseIndex = INDEX_ATTACK_6_DAMAGE_DICE_COUNT },
		[INDEX_ATTACK_6_DAMAGE_DICE_INT] = { name = 'Attack Six Damage Dice INT',
			position = {ATTACK_X_DMG_COUNT_INT, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 1, subTable = '6.8', databaseIndex = INDEX_ATTACK_6_DAMAGE_DICE_INT },
		[INDEX_ATTACK_6_DAMAGE_DICE_TYPE] = { name = 'd4 + ',
			position = {ATTACK_X_NAME_DMG_TYPE, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
					color = lightgray, font_color = black, value = 0, subTable = '6.9', databaseIndex = INDEX_ATTACK_6_DAMAGE_DICE_TYPE },
		[INDEX_ATTACK_6_DAMAGE_MOD] = { name = 'Attack Six Damage Mod',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.10', databaseIndex = INDEX_ATTACK_6_DAMAGE_MOD, bonusINT = INDEX_ATTACK_6_BONUS_INT,
						misc = INDEX_ATTACK_6_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_6_DAMAGE_MOD_MISC] = { name = 'Attack Six Damage Mod Misc',
			position = {ATTACK_X_DMG_MOD_MISC, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.11', databaseIndex = INDEX_ATTACK_6_DAMAGE_MOD_MISC },
		[INDEX_ATTACK_6_TYPE] = { name = 'Type',
			position = {ATTACK_X_TYPE, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.12', databaseIndex = INDEX_ATTACK_6_TYPE },
		[INDEX_ATTACK_6_WEIGHT] = { name = 'Attack Six Weight',
			position = {ATTACK_X_WEIGHT, YHeight, ATTACK_LOWER_Z  + (5 * 1.23)},
				label = NO_LABEL, rows = ONE_ROW, alignment = LEFT_ALIGNED_TEXT, scale = buttonScale, width = DETAILS_WIDTH, font_size = DETAILS_FONT_SIZE,
				color = lightgray, font_color = black, value = 0, subTable = '6.13', databaseIndex = INDEX_ATTACK_6_WEIGHT },
	}

	random_rolls = {
		[INDEX_RANDOM_ROLL_DICE_COUNT] = { value = 1, name = 'RandomDiceCount', position = {1.65, YHeight, -5.5}, font_size = 200, width = 0, height = 0, color = silver, font_color = copper },
		[INDEX_RANDOM_ROLL_MISC_MOD] = { value = 0, name = 'RandomDiceMod', position = {1.95, YHeight, -5.5}, font_size = 200, width = 0, height = 0, color = silver, font_color = copper },
	}
end

function CreateStuff()
	self.createButton({button = {}, click_function = 'ResetSheetCheck', label = 'New Sheet', function_owner = self, position = {-6, YHeight, -8.35}, width = 500, height = 225, font_size = 100})
	self.createButton({button = {}, click_function = 'EditMode', label = 'Edit', function_owner = self, position = {-6.25, YHeight, -7.9}, width = 250, height = 225, font_size = 100})
	self.createButton({button = {}, click_function = 'LoadAll', label = 'Load', function_owner = self, position = {-5.75, YHeight, -7.9}, width = 250, height = 225, font_size = 100})
	self.createButton({button = {}, click_function = 'FlushSheet', label = 'Flush', function_owner = self, position = {-5.25, YHeight, -8.35}, width = 250, height = 225, font_size = 100})

	CreateNameFields()

	-- Stats
	for k, v in pairs(stats) do
		if k == INDEX_SPELL_STRING then
			self.createButton({button = {}, click_function = v.name, label = tostring(v.currentAbility), function_owner = self, position = v.position, width = 0, height = 0, font_size = 200, font_color = v.font_color})
		elseif k == INDEX_HD_TYPE_STRING then
			self.createButton({button = {}, click_function = v.name, label = tostring(v.currentAbility), function_owner = self, position = v.position, width = 0, height = 0, font_size = 100, font_color = v.font_color})
		elseif k == INDEX_CREATURE_SIZE then
			self.createButton({button = {}, click_function = v.name, label = tostring(v.currentAbility), function_owner = self, position = v.position, width = 0, height = 0, font_size = 100, font_color = v.font_color})
		elseif k == INDEX_SPEED then
			self.createButton({button = {}, click_function = v.name, label = tostring(v.value), function_owner = self, position = v.position, width = 0, height = 0, font_size = 200, font_color = black})
		else
			self.createButton({button = {}, click_function = v.name, label = tostring(v.value), function_owner = self, position = v.position, width = 0, height = 0, font_size = v.font_size or 200, font_color = v.font_color})
		end
	end

	-- Characteristics
	for k, v in pairs(characteristics) do
		self.createButton({button = {}, click_function = v.name, label = tostring(v.value), function_owner = self, position = v.position, width = 0, height = 0, font_size = CharStatText})
	end

	-- Modifiers
	for k, v in pairs(modifiers) do
		self.createButton({button = {}, click_function = v.name, label = tostring(v.value), function_owner = self, position = v.position, width = 0, height = 0, font_size = CharStatText})
	end

	--spells
	for k, v in pairs(spellSlots) do
		self.createButton({button = {}, click_function = v.name, label = tostring(v.value), function_ownder = self, position = v.position, width = 0, height = 0, font_size = 100})
	end

	-- Jack of all Trades and Darkvision
	for k, v in pairs(bardJack) do
		self.createButton({button = {}, click_function = v.name .. '_button', label = ' ', function_owner = self, position = v.position, width = 25, height = 50, font_size = 99})
	end

	--coin purse
	for k, v in pairs(coinPurse) do
		self.createButton({button = {}, click_function = v.name, label = tostring(v.value), function_owner = self, position = v.position, width = 0, height = 0, font_size = 150, font_color = v.color })
	end

	-- Other
	CreateStatEditButtons()
	CreateSaveSkillCareerMarks()
	CreateRollCheckBoxes()
	CreateExpertiseButtons()
	CreateProficiencyMarks()
	createRollButtons()
	CreateAttackDetailsPlay()
end

function CreateNameFields()
	local UI_SCALE_FLIP = {0,0,0}
	UI_SCALE_FLIP[1] = UI_SCALE[1] * -1
	UI_SCALE_FLIP[2] = UI_SCALE[2]
	UI_SCALE_FLIP[3] = UI_SCALE[3]

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	for k, v in pairs(name_table) do
		--Sets up reference function
		local funcName = "textbox" .. k
		local func = function(_,_,val,sel) click_textbox(k,val,sel) end
		self.setVar(funcName, func)

		self.createInput({
				input_function = funcName,
				function_owner = self,
				label          = databaseTable[k],
				alignment      = v.alignment,
				position       = v.position,
				rotation 			 = {x=180, y=180, z=0},
				scale          = UI_SCALE_FLIP,
				width          = v.width,
				height         = (v.font_size*v.rows)+24,
				font_size      = v.font_size * 0.8,
				color          = lightgray,
				font_color     = black,
				readOnly			 = false,
				interactable	 = true,
		})
	end
end

function CreateStatEditButtons()
	local hpCurrent = stats[INDEX_HP_CURRENT]
	self.createButton({button = {}, click_function = 'hp_up', label = '+', function_owner = self, position = { hpCurrent.position[1] + 0.2, hpCurrent.position[2], hpCurrent.position[3] + -0.5 }, width = 150, height = 200, font_size = 151})
	self.createButton({button = {}, click_function = 'hp_down', label = '-', function_owner = self, position = { hpCurrent.position[1] + -0.2, hpCurrent.position[2], hpCurrent.position[3] + -0.5 }, width = 150, height = 200, font_size = 151})

	local thpCurrent = stats[INDEX_THP_CURRENT]
	self.createButton({button = {}, click_function = 'thp_up', label = '+', function_owner = self, position = { thpCurrent.position[1] + 0.2, thpCurrent.position[2], thpCurrent.position[3] + -0.5 }, width = 150, height = 200, font_size = 151})
	self.createButton({button = {}, click_function = 'thp_down', label = '-', function_owner = self, position = { thpCurrent.position[1] + -0.2, thpCurrent.position[2], thpCurrent.position[3] + -0.5 }, width = 150, height = 200, font_size = 151})

	--HD
	local availableHD = stats[INDEX_HIT_DICE]
	self.createButton({button = {}, click_function = 'availableHD_up', label = '+', function_owner = self, position = { availableHD.position[1] + -0.2, availableHD.position[2], availableHD.position[3] - 0.15 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'availableHD_down', label = '-', function_owner = self, position = { availableHD.position[1] + -0.2, availableHD.position[2], availableHD.position[3] + 0.15 }, width = 75, height = 75, font_size = 90})

	--Class Resources Current Ammounts
	local availableClass1 = stats[INDEX_CLASS1_ACTUAL]
	self.createButton({button = {}, click_function = 'availableClass1_up', label = '+', function_owner = self, position = { availableClass1.position[1] + -0.08, availableClass1.position[2], availableClass1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'availableClass1_down', label = '-', function_owner = self, position = { availableClass1.position[1] + 0.08, availableClass1.position[2], availableClass1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local availableClass2 = stats[INDEX_CLASS2_ACTUAL]
	self.createButton({button = {}, click_function = 'availableClass2_up', label = '+', function_owner = self, position = { availableClass2.position[1] + -0.08, availableClass2.position[2], availableClass2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'availableClass2_down', label = '-', function_owner = self, position = { availableClass2.position[1] + 0.08, availableClass2.position[2], availableClass2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local exhaustion = stats[INDEX_EXHAUSTION]
	self.createButton({button = {}, click_function = 'exhaustion_up', label = '+', function_owner = self, position = { exhaustion.position[1] + -0.08, exhaustion.position[2], exhaustion.position[3] + -0.3 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'exhaustion_down', label = '-', function_owner = self, position = { exhaustion.position[1] + 0.08, exhaustion.position[2], exhaustion.position[3] + -0.3 }, width = 75, height = 75, font_size = 90})

	local inspiration = stats[INDEX_INSPIRATION]
	self.createButton({button = {}, click_function = 'inspiration_up', label = '+', function_owner = self, position = { inspiration.position[1] + -0.08, inspiration.position[2], inspiration.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'inspiration_down', label = '-', function_owner = self, position = { inspiration.position[1] + 0.08, inspiration.position[2], inspiration.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local ammo1 = stats[INDEX_AMMO1]
	self.createButton({button = {}, click_function = 'ammo1_up', label = '+', function_owner = self, position = { ammo1.position[1] + -0.08, ammo1.position[2], ammo1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'ammo1_down', label = '-', function_owner = self, position = { ammo1.position[1] + 0.08, ammo1.position[2], ammo1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local ammo2 = stats[INDEX_AMMO2]
	self.createButton({button = {}, click_function = 'ammo2_up', label = '+', function_owner = self, position = { ammo2.position[1] + -0.08, ammo2.position[2], ammo2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'ammo2_down', label = '-', function_owner = self, position = { ammo2.position[1] + 0.08, ammo2.position[2], ammo2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local ammo3 = stats[INDEX_AMMO3]
	self.createButton({button = {}, click_function = 'ammo3_up', label = '+', function_owner = self, position = { ammo3.position[1] + -0.08, ammo3.position[2], ammo3.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'ammo3_down', label = '-', function_owner = self, position = { ammo3.position[1] + 0.08, ammo3.position[2], ammo3.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local ammo4 = stats[INDEX_AMMO4]
	self.createButton({button = {}, click_function = 'ammo4_up', label = '+', function_owner = self, position = { ammo4.position[1] + -0.08, ammo4.position[2], ammo4.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'ammo4_down', label = '-', function_owner = self, position = { ammo4.position[1] + 0.08, ammo4.position[2], ammo4.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local potion1 = stats[INDEX_POTION1]
	self.createButton({button = {}, click_function = 'potion1_up', label = '+', function_owner = self, position = { potion1.position[1] + -0.08, potion1.position[2], potion1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'potion1_down', label = '-', function_owner = self, position = { potion1.position[1] + 0.08, potion1.position[2], potion1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local potion2 = stats[INDEX_POTION2]
	self.createButton({button = {}, click_function = 'potion2_up', label = '+', function_owner = self, position = { potion2.position[1] + -0.08, potion2.position[2], potion2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'potion2_down', label = '-', function_owner = self, position = { potion2.position[1] + 0.08, potion2.position[2], potion2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})


	CreateSpellSlotsButtons()
	--local buffAC = stats[INDEX_AC_BUFF]
	--self.createButton({button = {}, click_function = 'buff_AC_up', label = '+', function_owner = self, position = { buffAC.position[1] + 0.2, buffAC.position[2], buffAC.position[3] + -0.5 }, width = 150, height = 200, font_size = 151})
	--self.createButton({button = {}, click_function = 'buff_AC_down', label = '-', function_owner = self, position = { buffAC.position[1] + -0.2, buffAC.position[2], buffAC.position[3] + -0.5 }, width = 150, height = 200, font_size = 151})
end

function CreateSpellSlotsButtons()
	for k, v in pairs(spellSlots) do
		if k >= 1 and k <=9 then
			local spellSlot = spellSlots[k]
			self.createButton({button = {}, click_function = 'Spell_' .. v.name .. '_up', label = '+', function_owner = self, position = { spellSlot.position[1] + 0.2, spellSlot.position[2], spellSlot.position[3] + -0.15 }, width = 100, height = 100, font_size = 100})
			self.createButton({button = {}, click_function = 'Spell_' .. v.name .. '_down', label = '-', function_owner = self, position = { spellSlot.position[1] + 0.2, spellSlot.position[2], spellSlot.position[3] + 0.09 }, width = 100, height = 100, font_size = 100})
		end
	end
end

function CreateSpellLimitButtons()
	for k, v in pairs(spellSlots) do
		if k >= 10 and k <=18 then
			local spellLimit = spellSlots[k]
			self.createButton({button = {}, click_function = 'Spell_' .. v.name .. '_up', label = '+', function_owner = self, position = { spellLimit.position[1] + -0.2, spellLimit.position[2], spellLimit.position[3] + -0.15 }, width = 100, height = 100, font_size = 100})
			self.createButton({button = {}, click_function = 'Spell_' .. v.name .. '_down', label = '-', function_owner = self, position = { spellLimit.position[1] + -0.2, spellLimit.position[2], spellLimit.position[3] + 0.09 }, width = 100, height = 100, font_size = 100})
		end
	end
end

function CreateCareerProficiencyButtons()
	for k, v in pairs(skills) do
		local position = { 0, YHeight, 0 }

		local CareerMarkX = -5.118
		local CareerMarkXMod = -0.012
		local CareerSaveMarkYMod = 0.2425
		local CareerSkillMarkYMod = 0.2715
		--Save Career Check Marks
		if k >= SAVE_STRENGTH and k <= SAVE_CHARISMA then
			position[1] = CareerMarkX
			position[3] = -5.18 + (CareerSaveMarkYMod * (k - SAVE_STRENGTH))
		end
		--Strength Skill Career Check Marks
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = -3 + (CareerSkillMarkYMod * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skill Career Check Marks
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = -2.32 + (CareerSkillMarkYMod * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skill Career Check Marks
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = -1.11 + (CareerSkillMarkYMod * (k - SKILL_ARCANA))
		end
		--Wisdom Skill Career Check Marks
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = 0.665 + (CareerSkillMarkYMod * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisma Skill Career Check Marks
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = 2.47 + (CareerSkillMarkYMod * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = 'career_' .. v.name, label = ' ', function_owner = self, position = position, width = 50, height = 50, font_size = 75})
	end
end

function CreateJackBonusEditButton()
	for k, v in pairs(bardJack) do
		self.createButton({button = {}, click_function = v.name .. '_button', label = ' ', function_owner = self, position = position, width = 20, height = 50, font_size = 100})
	end
end

function CreateSaveSkillCareerMarks()
	for k, v in pairs(skills) do
		local position = { 0, YHeight, 0 }

		local CareerMarkX = -5.118
		local CareerMarkXMod = -0.012
		local CareerSaveMarkYMod = 0.2425
		local CareerSkillMarkYMod = 0.2715
		--Save Career Check Marks
		if k >= SAVE_STRENGTH and k <= SAVE_CHARISMA then
			position[1] = CareerMarkX
			position[3] = -5.18 + (CareerSaveMarkYMod * (k - SAVE_STRENGTH))
		end
		--Strength Skill Career Check Marks
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = -3 + (CareerSkillMarkYMod * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skill Career Check Marks
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = -2.32 + (CareerSkillMarkYMod * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skill Career Check Marks
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = -1.11 + (CareerSkillMarkYMod * (k - SKILL_ARCANA))
		end
		--Wisdom Skill Career Check Marks
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = 0.665 + (CareerSkillMarkYMod * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisma Skill Career Check Marks
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = CareerMarkX + CareerMarkXMod
			position[3] = 2.47 + (CareerSkillMarkYMod * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = 'career_' .. v.name, label = ' ', function_owner = self, position = position, width = 20, height = 50, font_size = 100})
	end
end

function CreateAttackDetailsPlay()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	--attacks
	for i = 1, 6 do
		local subTableName = i .. '.1'
		local subTableBonusINT = i .. '.3'
		local subTableBonusType = i .. '.4'
		local subTableBonusMisc = i .. '.5'
		local subTableDiceINT = i .. '.8'
		local subTableDiceType = i .. '.9'
		local subTableDMGModMisc = i .. '.11'
		local subTableType = i .. '.12'

		for k, v in pairs(attack_table) do
			if v.subTable == subTableName or v.subTable == subTableType or v.subTable == subTableDiceType then
				self.createButton({button = {}, click_function = v.name .. v.subTable, label = databaseTable[k], function_owner = self, position = v.position, width = 0, height = 0, font_size = 90, font_color = black })
			elseif v.subTable == subTableBonusINT or v.subTable == subTableDiceINT or v.subTable == subTableBonusMisc or v.subTable == subTableDMGModMisc then
				self.createButton({button = {}, click_function = v.name .. v.subTable, label = databaseTable[k], function_owner = self, position = v.position, width = 0, height = 0, font_size = 90, font_color = clear })
			elseif v.subTable == subTableBonusType then
				self.createButton({button = {}, click_function = v.name .. v.subTable, label = databaseTable[k], function_owner = self, position = v.position, width = 0, height = 0, font_size = 90, font_color = clear })
			elseif v.subTable > tostring(i) and v.subTable < tostring(i + 0.99) then
				self.createButton({button = {}, click_function = v.name .. v.subTable, label = databaseTable[k], function_owner = self, position = v.position, width = 0, height = 0, font_size = 90, font_color = black })
			end
		end
	end
end

function RotatePositionAround(position, center, rotation, scale)
	local tx = position.x * scale.x
	local tz = position.z * scale.z

	local radians = math.rad(180 - rotation.y)
	local radiansSin = math.sin(radians)
	local radiansCos = math.cos(radians)

	position.x = (tx * radiansCos) - (tz * radiansSin) + center.x
	position.y = position.y + center.y
	position.z = (tx * radiansSin) + (tz * radiansCos) + center.z

	return position
end

function EditMode()
	if database == nil then
		printToAll('Soul Stone not found. Please set your Soul Stone within the creation spell.', {1, 0, 0})
		return
	end

	edit = not edit
	if edit then
		LoadAll()
		CreateEditButtons()

		self.setVar('check', true)

		local buttons = self.getButtons()
		for k, v in pairs(buttons) do
			if v.label == 'Edit' then
				self.editButton({ index = v.index, label = 'Save', position = v.position })
			end
		end
	else
		self.clearButtons()

		CreateStuff()
		LoadAll()

		if type(name_object) == 'table' then
			for k, v in pairs(name_object) do
				v.destruct()
			end
		end

		name_object = {}
	end
end

function LoadAll()
	if database == nil then
		return
	end

	FlushSheet()
  LoadCharacteristics()
	LoadMods()
	GeneratePerception()
	GenerateInitiative()
	GenerateCarryCappacity()
	GenerateAttackMods()
	UpdateSpellStats()
  LoadNames()
  LoadStats()
	LoadCoinPurse()
	LoadSpellLimit()
	LoadSpellSlots()
  LoadCareer()
	LoadJack(INDEX_JACKOFALL, JACK_TRADES)
	LoadJack(INDEX_DARKVISION, DARKVISION)
	LoadSaveSkills()
	LoadExpertise()
	LoadProficiencyMarks()
	LoadRolls()
	LoadAttackDetails()
	RefreshBonuses()

end

function LoadAllEdit()
	GeneratePerception()
	GenerateCarryCappacity()
	GenerateInitiative()
	LoadStats()
	LoadSpellLimit()
	LoadSpellSlots()
	LoadSaveSkills()
	RefreshBonuses()
end

function CreateEditButtons()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local sheetPosition = self.getPosition()
	local sheetRotation = self.getRotation()
	local sheetScale = self.getScale()

	--creating text boxes
	CreateAllTextEditBoxs()

	--making attack buttons clear
	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == 'AttackButton1' or buttonValue.click_function == 'AttackButton2' or buttonValue.click_function == 'AttackButton3' or buttonValue.click_function == 'AttackButton4' or buttonValue.click_function == 'AttackButton5' or buttonValue.click_function == 'AttackButton6' then
			self.editButton({ index = buttonValue.index, label = '❖', position = buttonValue.position, width = 0, height = 0, font_color = clear, color = clear })
		else
		end
	end

	local ACValue = stats[INDEX_AC_THRESHOLD]
	self.createButton({button = {}, click_function = 'AC_up', label = '+', function_owner = self, position = { ACValue.position[1] + 0.2, ACValue.position[2], ACValue.position[3] + -0.2 }, width = 150, height = 200, font_size = 150})
	self.createButton({button = {}, click_function = 'AC_down', label = '-', function_owner = self, position = { ACValue.position[1] - 0.2, ACValue.position[2], ACValue.position[3] + -0.2 }, width = 150, height = 200, font_size = 150})

	local HPThreshold = stats[INDEX_HP_THRESHOLD]
	self.createButton({button = {}, click_function = 'hp_threshold_up', label = '+', function_owner = self, position = { HPThreshold.position[1] + 0.2, HPThreshold.position[2], HPThreshold.position[3] + 0.2 }, width = 150, height = 200, font_size = 150})
	self.createButton({button = {}, click_function = 'hp_threshold_down', label = '-', function_owner = self, position = { HPThreshold.position[1] + -0.2, HPThreshold.position[2], HPThreshold.position[3] + 0.2 }, width = 150, height = 200, font_size = 150})

	local jackBardTrade = bardJack[JACK_TRADES]
	self.createButton({button = {}, click_function = 'Jack_button', label = ' ', function_owner = self, position = jackBardTrade.position, width = 20, height = 50, font_size = 100})

	local jackDarkvision = bardJack[DARKVISION]
	self.createButton({button = {}, click_function = 'Dark_button', label = ' ', function_owner = self, position = jackDarkvision.position, width = 20, height = 50, font_size = 100})

	local totalClass1 = stats[INDEX_CLASS1_TOTAL]
	self.createButton({button = {}, click_function = 'totalClass1_up', label = '+', function_owner = self, position = { totalClass1.position[1] + -0.08, totalClass1.position[2], totalClass1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'totalClass1_down', label = '-', function_owner = self, position = { totalClass1.position[1] + 0.08, totalClass1.position[2], totalClass1.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local totalClass2 = stats[INDEX_CLASS2_TOTAL]
	self.createButton({button = {}, click_function = 'totalClass2_up', label = '+', function_owner = self, position = { totalClass2.position[1] + -0.08, totalClass2.position[2], totalClass2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'totalClass2_down', label = '-', function_owner = self, position = { totalClass2.position[1] + 0.08, totalClass2.position[2], totalClass2.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local passivePerceptionMisc = stats[INDEX_PASSIVE_PERCEPTION_MISC]
	self.createButton({button = {}, click_function = 'passive_perception_misc_up', label = '+', function_owner = self, position = { passivePerceptionMisc.position[1] + -0.08, passivePerceptionMisc.position[2], passivePerceptionMisc.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'passive_perception_misc_down', label = '-', function_owner = self, position = { passivePerceptionMisc.position[1] + 0.08, passivePerceptionMisc.position[2], passivePerceptionMisc.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local initiativeMisc = stats[INDEX_INITIATIVE_MISC]
	self.createButton({button = {}, click_function = 'initiative_misc_up', label = '+', function_owner = self, position = { initiativeMisc.position[1] + -0.08, initiativeMisc.position[2], initiativeMisc.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'initiative_misc_down', label = '-', function_owner = self, position = { initiativeMisc.position[1] + 0.08, initiativeMisc.position[2], initiativeMisc.position[3] + -0.25 }, width = 75, height = 75, font_size = 90})

	local carryWeight = stats[INDEX_CARRY_LIMIT]
	self.createButton({button = {}, click_function = 'carryLimit_up', label = '+', function_owner = self, position = { carryWeight.position[1] + -0.08, carryWeight.position[2], carryWeight.position[3] + -0.45 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'carryLimit_down', label = '-', function_owner = self, position = { carryWeight.position[1] + 0.08, carryWeight.position[2], carryWeight.position[3] + -0.45 }, width = 75, height = 75, font_size = 90})

	local playerSpeed = stats[INDEX_SPEED]
	self.createButton({button = {}, click_function = 'speed_up', label = '+', function_owner = self, position = { playerSpeed.position[1] + -0.08, playerSpeed.position[2], playerSpeed.position[3] + -0.45 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'speed_down', label = '-', function_owner = self, position = { playerSpeed.position[1] + 0.08, playerSpeed.position[2], playerSpeed.position[3] + -0.45 }, width = 75, height = 75, font_size = 90})


	--Edit mode UI globals
	local CharXUp = -6.4
	local CharXDown = -5.9
	local CharZBase = CharStatZBase
	local CharZMod = 1.86
	local CharText = 100
	local CharWidth = 75
	local CHarHeight = 75
	local SaveSkillsX = -4.85
	local SaveSkillsMOD = 0.26
	local SaveSkillsY1 = -5.18
	local SaveSkillsY2 = -3
	local SaveSkillsY3 = -2.32
	local SaveSkillsY4 = -1.11
	local SaveSkillsY5 = 0.665
	local SaveSkillsY6 = 2.47
	local SaveSkillsYMOD = 0.14
	local CoinXUp = -0.15
	local CoinXDown = 0.15
	local CoinZ1 = -0.3
	local CoinZ2 = -0.5
	local CoinZ3 = -0.7

	-- Characteristic up/down
	self.createButton({click_function='char_str_up', label='+', function_owner=self, position={CharXUp, YHeight, CharZBase + (0 * CharZMod)}, rotation={0,180,0}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_dex_up', label='+', function_owner=self, position={CharXUp, YHeight, CharZBase + (1 * CharZMod)}, rotation={0,180,0}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_con_up', label='+', function_owner=self, position={CharXUp, YHeight, CharZBase + (2 * CharZMod)}, rotation={0,180,0}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_int_up', label='+', function_owner=self, position={CharXUp, YHeight, CharZBase + (3 * CharZMod)}, rotation={0,180,0}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_wis_up', label='+', function_owner=self, position={CharXUp, YHeight, CharZBase + (4 * CharZMod)}, rotation={0,180,0}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_cha_up', label='+', function_owner=self, position={CharXUp, YHeight, CharZBase + (5 * CharZMod)}, rotation={0,180,0}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_str_down', label='-', function_owner=self, position={CharXDown, YHeight, CharZBase + (0 * CharZMod)}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_dex_down', label='-', function_owner=self, position={CharXDown, YHeight, CharZBase + (1 * CharZMod)}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_con_down', label='-', function_owner=self, position={CharXDown, YHeight, CharZBase + (2 * CharZMod)}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_int_down', label='-', function_owner=self, position={CharXDown, YHeight, CharZBase + (3 * CharZMod)}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_wis_down', label='-', function_owner=self, position={CharXDown, YHeight, CharZBase + (4 * CharZMod)}, width=CharWidth, height=CHarHeight, font_size=CharText})
	self.createButton({click_function='char_cha_down', label='-', function_owner=self, position={CharXDown, YHeight, CharZBase + (5 * CharZMod)}, width=CharWidth, height=CHarHeight, font_size=CharText})

	--Coin
	for k, v in pairs(coinPurse) do
		local coinPurses = coinPurse[k]
		self.createButton({button = {}, click_function = v.name .. '_up1', label = '+1', function_owner = self, position = { coinPurses.position[1] + CoinXUp, coinPurses.position[2], coinPurses.position[3] + CoinZ1 }, width = 100, height = 75, font_size = 45, color = coinPurses.color })
		self.createButton({button = {}, click_function = v.name .. '_down1', label = '-1', function_owner = self, position = { coinPurses.position[1] + CoinXDown, coinPurses.position[2], coinPurses.position[3] + CoinZ1 }, width = 100, height = 75, font_size = 45, color = coinPurses.color })
		self.createButton({button = {}, click_function = v.name .. '_up10', label = '+10', function_owner = self, position = { coinPurses.position[1] + CoinXUp, coinPurses.position[2], coinPurses.position[3] + CoinZ2 }, width = 100, height = 75, font_size = 45, color = coinPurses.color })
		self.createButton({button = {}, click_function = v.name .. '_down10', label = '-10', function_owner = self, position = { coinPurses.position[1] + CoinXDown, coinPurses.position[2], coinPurses.position[3] + CoinZ2 }, width = 100, height = 75, font_size = 45, color = coinPurses.color })
		self.createButton({button = {}, click_function = v.name .. '_up100', label = '+100', function_owner = self, position = { coinPurses.position[1] + CoinXUp, coinPurses.position[2], coinPurses.position[3] + CoinZ3 }, width = 100, height = 75, font_size = 45, color = coinPurses.color })
		self.createButton({button = {}, click_function = v.name .. '_down100', label = '-100', function_owner = self, position = { coinPurses.position[1] + CoinXDown, coinPurses.position[2], coinPurses.position[3] + CoinZ3 }, width = 100, height = 75, font_size = 45, color = coinPurses.color })
	end

	--character Level
	local characterLevel = stats[INDEX_CHAR_LEVEL]
	self.createButton({button = {}, click_function = 'characterLevel_up', label = '+', function_owner = self, position = { characterLevel.position[1] + 0.1, characterLevel.position[2], characterLevel.position[3] + 0.2 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'characterLevel_down', label = '-', function_owner = self, position = { characterLevel.position[1] + -0.1, characterLevel.position[2], characterLevel.position[3] + 0.2 }, width = 75, height = 75, font_size = 90})

	--Spell Casting Ability
	local spellAbility = stats[INDEX_SPELL_ABILITY]
	self.createButton({button = {}, click_function = 'cycleSpellAbility', label = 'Change\nStat', function_owner = self, position = { spellAbility.position[1], spellAbility.position[2], spellAbility.position[3] + -0.4}, width = 200, height = 125, font_size = 40, color = lightblue})
	--Misc Modififers for Spells
	local miscMod = stats[INDEX_SPELL_MOD]
	self.createButton({button = {}, click_function = 'miscMod_up', label = '+', function_owner = self, position = { miscMod.position[1] + -0.1, miscMod.position[2], miscMod.position[3] + -0.4 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'miscMod_down', label = '-', function_owner = self, position = { miscMod.position[1] + 0.1, miscMod.position[2], miscMod.position[3] + -0.4 }, width = 75, height = 75, font_size = 90})
	local miscDC = stats[INDEX_SPELL_DC]
	self.createButton({button = {}, click_function = 'miscDC_up', label = '+', function_owner = self, position = { miscDC.position[1] + -0.1, miscDC.position[2], miscDC.position[3] + -0.4 }, width = 75, height = 75, font_size = 90})
	self.createButton({button = {}, click_function = 'miscDC_down', label = '-', function_owner = self, position = { miscDC.position[1] + 0.1, miscDC.position[2], miscDC.position[3] + -0.4 }, width = 75, height = 75, font_size = 90})

	--Cycling through HD Type
	local typeHD = stats[INDEX_HD_TYPE]
	self.createButton({button = {}, click_function = 'cycleHDType', label = 'Change\nHD Type', function_owner = self, position = { typeHD.position[1], typeHD.position[2], typeHD.position[3] + -0.4}, width = 200, height = 125, font_size = 40, color = lightblue})

	local creatureSize = stats[INDEX_CREATURE_SIZE]
	self.createButton({button = {}, click_function = 'cycleCreatureSize', label = 'Change\nSize', function_owner = self, position = { creatureSize.position[1], creatureSize.position[2], creatureSize.position[3] + -0.4}, width = 200, height = 125, font_size = 40, color = lightblue})

	--Attack Edit Buttons
	local attack1Misc = attack_table[INDEX_ATTACK_1_BONUS_MISC]
	self.createButton({button = {}, click_function = 'attack1Misc_up', label = '+', function_owner = self, position = { attack1Misc.position[1] + -0.075, attack1Misc.position[2], attack1Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'attack1Misc_down', label = '-', function_owner = self, position = { attack1Misc.position[1] + 0.075, attack1Misc.position[2], attack1Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage1Dice = attack_table[INDEX_ATTACK_1_DAMAGE_DICE_COUNT]
	self.createButton({button = {}, click_function = 'damage1Dice_up', label = '+', function_owner = self, position = { damage1Dice.position[1] + -0.075, damage1Dice.position[2], damage1Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage1Dice_down', label = '-', function_owner = self, position = { damage1Dice.position[1] + 0.075, damage1Dice.position[2], damage1Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage1Misc = attack_table[INDEX_ATTACK_1_DAMAGE_MOD_MISC]
	self.createButton({button = {}, click_function = 'damage1Misc_up', label = '+', function_owner = self, position = { damage1Misc.position[1] + -0.075, damage1Misc.position[2], damage1Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage1Misc_down', label = '-', function_owner = self, position = { damage1Misc.position[1] + 0.075, damage1Misc.position[2], damage1Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local bonus1Type = attack_table[INDEX_ATTACK_1_BONUS_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack1BonusType', label = 'Change\nStat', function_owner = self, position = { bonus1Type.position[1], bonus1Type.position[2], bonus1Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})
	local dice1Type = attack_table[INDEX_ATTACK_1_DAMAGE_DICE_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack1DiceType', label = 'Change\nDice', function_owner = self, position = { dice1Type.position[1], dice1Type.position[2], dice1Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})

	local attack2Misc = attack_table[INDEX_ATTACK_2_BONUS_MISC]
	self.createButton({button = {}, click_function = 'attack2Misc_up', label = '+', function_owner = self, position = { attack2Misc.position[1] + -0.075, attack2Misc.position[2], attack2Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'attack2Misc_down', label = '-', function_owner = self, position = { attack2Misc.position[1] + 0.075, attack2Misc.position[2], attack2Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage2Dice = attack_table[INDEX_ATTACK_2_DAMAGE_DICE_COUNT]
	self.createButton({button = {}, click_function = 'damage2Dice_up', label = '+', function_owner = self, position = { damage2Dice.position[1] + -0.075, damage2Dice.position[2], damage2Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage2Dice_down', label = '-', function_owner = self, position = { damage2Dice.position[1] + 0.075, damage2Dice.position[2], damage2Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage2Misc = attack_table[INDEX_ATTACK_2_DAMAGE_MOD_MISC]
	self.createButton({button = {}, click_function = 'damage2Misc_up', label = '+', function_owner = self, position = { damage2Misc.position[1] + -0.075, damage2Misc.position[2], damage2Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage2Misc_down', label = '-', function_owner = self, position = { damage2Misc.position[1] + 0.075, damage2Misc.position[2], damage2Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local bonus2Type = attack_table[INDEX_ATTACK_2_BONUS_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack2BonusType', label = 'Change\nStat', function_owner = self, position = { bonus2Type.position[1], bonus2Type.position[2], bonus2Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})
	local dice2Type = attack_table[INDEX_ATTACK_2_DAMAGE_DICE_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack2DiceType', label = 'Change\nDice', function_owner = self, position = { dice2Type.position[1], dice2Type.position[2], dice2Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})

	local attack3Misc = attack_table[INDEX_ATTACK_3_BONUS_MISC]
	self.createButton({button = {}, click_function = 'attack3Misc_up', label = '+', function_owner = self, position = { attack3Misc.position[1] + -0.075, attack3Misc.position[2], attack3Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'attack3Misc_down', label = '-', function_owner = self, position = { attack3Misc.position[1] + 0.075, attack3Misc.position[2], attack3Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage3Dice = attack_table[INDEX_ATTACK_3_DAMAGE_DICE_COUNT]
	self.createButton({button = {}, click_function = 'damage3Dice_up', label = '+', function_owner = self, position = { damage3Dice.position[1] + -0.075, damage3Dice.position[2], damage3Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage3Dice_down', label = '-', function_owner = self, position = { damage3Dice.position[1] + 0.075, damage3Dice.position[2], damage3Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage3Misc = attack_table[INDEX_ATTACK_3_DAMAGE_MOD_MISC]
	self.createButton({button = {}, click_function = 'damage3Misc_up', label = '+', function_owner = self, position = { damage3Misc.position[1] + -0.075, damage3Misc.position[2], damage3Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage3Misc_down', label = '-', function_owner = self, position = { damage3Misc.position[1] + 0.075, damage3Misc.position[2], damage3Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local bonus3Type = attack_table[INDEX_ATTACK_3_BONUS_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack3BonusType', label = 'Change\nStat', function_owner = self, position = { bonus3Type.position[1], bonus3Type.position[2], bonus3Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})
	local dice3Type = attack_table[INDEX_ATTACK_3_DAMAGE_DICE_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack3DiceType', label = 'Change\nDice', function_owner = self, position = { dice3Type.position[1], dice3Type.position[2], dice3Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})

	local attack4Misc = attack_table[INDEX_ATTACK_4_BONUS_MISC]
	self.createButton({button = {}, click_function = 'attack4Misc_up', label = '+', function_owner = self, position = { attack4Misc.position[1] + -0.075, attack4Misc.position[2], attack4Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'attack4Misc_down', label = '-', function_owner = self, position = { attack4Misc.position[1] + 0.075, attack4Misc.position[2], attack4Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage4Dice = attack_table[INDEX_ATTACK_4_DAMAGE_DICE_COUNT]
	self.createButton({button = {}, click_function = 'damage4Dice_up', label = '+', function_owner = self, position = { damage4Dice.position[1] + -0.075, damage4Dice.position[2], damage4Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage4Dice_down', label = '-', function_owner = self, position = { damage4Dice.position[1] + 0.075, damage4Dice.position[2], damage4Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage4Misc = attack_table[INDEX_ATTACK_4_DAMAGE_MOD_MISC]
	self.createButton({button = {}, click_function = 'damage4Misc_up', label = '+', function_owner = self, position = { damage4Misc.position[1] + -0.075, damage4Misc.position[2], damage4Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage4Misc_down', label = '-', function_owner = self, position = { damage4Misc.position[1] + 0.075, damage4Misc.position[2], damage4Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local bonus4Type = attack_table[INDEX_ATTACK_4_BONUS_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack4BonusType', label = 'Change\nStat', function_owner = self, position = { bonus4Type.position[1], bonus4Type.position[2], bonus4Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})
	local dice4Type = attack_table[INDEX_ATTACK_4_DAMAGE_DICE_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack4DiceType', label = 'Change\nDice', function_owner = self, position = { dice4Type.position[1], dice4Type.position[2], dice4Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})

	local attack5Misc = attack_table[INDEX_ATTACK_5_BONUS_MISC]
	self.createButton({button = {}, click_function = 'attack5Misc_up', label = '+', function_owner = self, position = { attack5Misc.position[1] + -0.075, attack5Misc.position[2], attack5Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'attack5Misc_down', label = '-', function_owner = self, position = { attack5Misc.position[1] + 0.075, attack5Misc.position[2], attack5Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage5Dice = attack_table[INDEX_ATTACK_5_DAMAGE_DICE_COUNT]
	self.createButton({button = {}, click_function = 'damage5Dice_up', label = '+', function_owner = self, position = { damage5Dice.position[1] + -0.075, damage5Dice.position[2], damage5Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage5Dice_down', label = '-', function_owner = self, position = { damage5Dice.position[1] + 0.075, damage5Dice.position[2], damage5Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage5Misc = attack_table[INDEX_ATTACK_5_DAMAGE_MOD_MISC]
	self.createButton({button = {}, click_function = 'damage5Misc_up', label = '+', function_owner = self, position = { damage5Misc.position[1] + -0.075, damage5Misc.position[2], damage5Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage5Misc_down', label = '-', function_owner = self, position = { damage5Misc.position[1] + 0.075, damage5Misc.position[2], damage5Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local bonus5Type = attack_table[INDEX_ATTACK_5_BONUS_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack5BonusType', label = 'Change\nStat', function_owner = self, position = { bonus5Type.position[1], bonus5Type.position[2], bonus5Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})
	local dice5Type = attack_table[INDEX_ATTACK_5_DAMAGE_DICE_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack5DiceType', label = 'Change\nDice', function_owner = self, position = { dice5Type.position[1], dice5Type.position[2], dice5Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})

	local attack6Misc = attack_table[INDEX_ATTACK_6_BONUS_MISC]
	self.createButton({button = {}, click_function = 'attack6Misc_up', label = '+', function_owner = self, position = { attack6Misc.position[1] + -0.075, attack6Misc.position[2], attack6Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'attack6Misc_down', label = '-', function_owner = self, position = { attack6Misc.position[1] + 0.075, attack6Misc.position[2], attack6Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage6Dice = attack_table[INDEX_ATTACK_6_DAMAGE_DICE_COUNT]
	self.createButton({button = {}, click_function = 'damage6Dice_up', label = '+', function_owner = self, position = { damage6Dice.position[1] + -0.075, damage6Dice.position[2], damage6Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage6Dice_down', label = '-', function_owner = self, position = { damage6Dice.position[1] + 0.075, damage6Dice.position[2], damage6Dice.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local damage6Misc = attack_table[INDEX_ATTACK_6_DAMAGE_MOD_MISC]
	self.createButton({button = {}, click_function = 'damage6Misc_up', label = '+', function_owner = self, position = { damage6Misc.position[1] + -0.075, damage6Misc.position[2], damage6Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	self.createButton({button = {}, click_function = 'damage6Misc_down', label = '-', function_owner = self, position = { damage6Misc.position[1] + 0.075, damage6Misc.position[2], damage6Misc.position[3] + 0.4}, width = 75, height = 75, font_size = 90 })
	local bonus6Type = attack_table[INDEX_ATTACK_6_BONUS_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack6BonusType', label = 'Change\nStat', function_owner = self, position = { bonus6Type.position[1], bonus6Type.position[2], bonus6Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})
	local dice6Type = attack_table[INDEX_ATTACK_6_DAMAGE_DICE_TYPE]
	self.createButton({button = {}, click_function = 'cycleAttack6DiceType', label = 'Change\nDice', function_owner = self, position = { dice6Type.position[1], dice6Type.position[2], dice6Type.position[3] + 0.4}, width = 150, height = 125, font_size = 40, color = lightblue})


	-- Rank up
	for k, v in pairs(skills) do
		local position = { 0, YHeight, 0 }
		--Saves
		if k >= SAVE_STRENGTH and k <= SAVE_CHARISMA then
			position[1] = SaveSkillsX
			position[3] = SaveSkillsY1 + (SaveSkillsMOD * (k - SAVE_STRENGTH))
		end
		--Strength Skills
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = SaveSkillsX
			position[3] = SaveSkillsY2 + (SaveSkillsMOD * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skills
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = SaveSkillsX
			position[3] = SaveSkillsY3 + (SaveSkillsMOD * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skills
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = SaveSkillsX
			position[3] = SaveSkillsY4 + (SaveSkillsMOD * (k - SKILL_ARCANA))
		end
		--Wisdom Skills
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = SaveSkillsX
			position[3] = SaveSkillsY5 + (SaveSkillsMOD * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisma Skills
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = SaveSkillsX
			position[3] = SaveSkillsY6 + (SaveSkillsMOD * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = 'rankup_' .. v.name, label = '+', function_owner = self, position = position, width=CharWidth, height=CHarHeight, font_size=CharText})
	end

	-- Rank down
	for k, v in pairs(skills) do
		local position = { 0, YHeight, 0 }
		--Saving Throws
		if k >= SAVE_STRENGTH and k <= SAVE_CHARISMA then
			position[1] = SaveSkillsX + SaveSkillsYMOD
			position[3] = SaveSkillsY1 + (SaveSkillsMOD * (k - SAVE_STRENGTH))
		end
		--Strength Skills
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = SaveSkillsX + SaveSkillsYMOD
			position[3] = SaveSkillsY2 + (SaveSkillsMOD * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skills
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = SaveSkillsX + SaveSkillsYMOD
			position[3] = SaveSkillsY3 + (SaveSkillsMOD * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skills
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = SaveSkillsX + SaveSkillsYMOD
			position[3] = SaveSkillsY4+ (SaveSkillsMOD * (k - SKILL_ARCANA))
		end
		--Wisdom Skills
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = SaveSkillsX + SaveSkillsYMOD
			position[3] = SaveSkillsY5+ (SaveSkillsMOD * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisam Skills
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = SaveSkillsX + SaveSkillsYMOD
			position[3] = SaveSkillsY6+ (SaveSkillsMOD * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = 'rankdown_' .. v.name, label = '-', function_owner = self, position = position, width=CharWidth, height=CHarHeight, font_size=CharText})
	end

	CreateCareerProficiencyButtons()
	--LoadStats()
	CreateAttackDetailEdit()
	CreateExpertiseButtons()
	CreateProficiencyMarks()
	CreateSpellLimitButtons()
	--RefreshBonuses()
end

--creating text input fields MKII
function CreateAllTextEditBoxs()
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	for k, v in pairs(name_table) do
		--Sets up reference function
		local funcName = "textbox" .. k
		local func = function(_,_,val,sel) click_textbox(k,val,sel) end
		self.setVar(funcName, func)

		local inputs = self.getInputs()
		for k, v in pairs(name_table) do
			for _, inputValue in pairs(inputs) do
				if inputValue.input_function == "textbox" .. k then
					self.editInput({
						index 				 = inputValue.index,
						label 				 = NO_LABEL,
						rotation 			 = {x=0, y=0, z=0},
						scale          = UI_SCALE
					})
					break
				end
			end
		end
	end
end

function click_textbox(k, value, selected)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

  if selected == false then
		if value == '' then
			return
		end

		databaseTable[k] = tostring(value)
    SaveDatabase(databaseTable)
  end
end

function click_none() end

-- Stat editing
function hp_up() ChangeStat(INDEX_HP_CURRENT, stats[INDEX_HP_THRESHOLD].value, 1) end
function hp_down() ChangeStat(INDEX_HP_CURRENT, BaseHPMAX, -1) end
function thp_up() ChangeStat(INDEX_THP_CURRENT, BaseHPMAX, 1) end
function thp_down() ChangeStat(INDEX_THP_CURRENT, BaseHPMAX, -1) end
function AC_up() ChangeStat(INDEX_AC_THRESHOLD, BaseHPMAX, 1) end
function AC_down() ChangeStat(INDEX_AC_THRESHOLD, BaseHPMAX, -1) end
function buff_AC_up() ChangeStat(INDEX_AC_BUFF, BaseHPMAX, 1) end
function buff_AC_down() ChangeStat(INDEX_AC_BUFF, BaseHPMAX, -1) end
function hp_threshold_up() ChangeStat(INDEX_HP_THRESHOLD, BaseHPMAX, 1) end
function hp_threshold_down() ChangeStat(INDEX_HP_THRESHOLD, BaseHPMAX, -1) end
function availableHD_up() ChangeStat(INDEX_HIT_DICE, stats[INDEX_CHAR_LEVEL].value, 1) end
function availableHD_down() ChangeStat(INDEX_HIT_DICE, BaseHPMAX, -1) end
--class Resources
function totalClass1_up() ChangeStat(INDEX_CLASS1_TOTAL, BaseHPMAX, 1) end
function totalClass1_down() ChangeStat(INDEX_CLASS1_TOTAL, BaseHPMAX, -1) end
function totalClass2_up() ChangeStat(INDEX_CLASS2_TOTAL, BaseHPMAX, 1) end
function totalClass2_down() ChangeStat(INDEX_CLASS2_TOTAL, BaseHPMAX, -1) end
function availableClass1_up() ChangeStat(INDEX_CLASS1_ACTUAL, stats[INDEX_CLASS1_TOTAL].value, 1) end
function availableClass1_down() ChangeStat(INDEX_CLASS1_ACTUAL, BaseHPMAX, -1) end
function availableClass2_up() ChangeStat(INDEX_CLASS2_ACTUAL, stats[INDEX_CLASS2_TOTAL].value, 1) end
function availableClass2_down() ChangeStat(INDEX_CLASS2_ACTUAL, BaseHPMAX, -1) end
--character level
function characterLevel_up() ChangeStat(INDEX_CHAR_LEVEL, 20, 1) end
function characterLevel_down() ChangeStat(INDEX_CHAR_LEVEL, 1, -1) end
--exhaustion
function exhaustion_up() ChangeStat(INDEX_EXHAUSTION, BaseHPMAX, 1) end
function exhaustion_down() ChangeStat(INDEX_EXHAUSTION, BaseHPMAX, -1) end
--exhaustion
function inspiration_up() ChangeStat(INDEX_INSPIRATION, BaseHPMAX, 1) end
function inspiration_down() ChangeStat(INDEX_INSPIRATION, BaseHPMAX, -1) end
--passive Perception misc
function passive_perception_misc_up() ChangeStat(INDEX_PASSIVE_PERCEPTION_MISC, BaseHPMAX, 1) end
function passive_perception_misc_down() ChangeStat(INDEX_PASSIVE_PERCEPTION_MISC, BaseHPMAX, -1) end
--initiative Misc
function initiative_misc_up() ChangeStat(INDEX_INITIATIVE_MISC, BaseHPMAX, 1) end
function initiative_misc_down() ChangeStat(INDEX_INITIATIVE_MISC, BaseHPMAX, -1) end
--ammo and potions
function ammo1_up() ChangeStat(INDEX_AMMO1, BaseHPMAX, 1) end
function ammo1_down() ChangeStat(INDEX_AMMO1, BaseHPMAX, -1) end
function ammo2_up() ChangeStat(INDEX_AMMO2, BaseHPMAX, 1) end
function ammo2_down() ChangeStat(INDEX_AMMO2, BaseHPMAX, -1) end
function ammo3_up() ChangeStat(INDEX_AMMO3, BaseHPMAX, 1) end
function ammo3_down() ChangeStat(INDEX_AMMO3, BaseHPMAX, -1) end
function ammo4_up() ChangeStat(INDEX_AMMO4, BaseHPMAX, 1) end
function ammo4_down() ChangeStat(INDEX_AMMO4, BaseHPMAX, -1) end
function potion1_up() ChangeStat(INDEX_POTION1, BaseHPMAX, 1) end
function potion1_down() ChangeStat(INDEX_POTION1, BaseHPMAX, -1) end
function potion2_up() ChangeStat(INDEX_POTION2, BaseHPMAX, 1) end
function potion2_down() ChangeStat(INDEX_POTION2, BaseHPMAX, -1) end
--coin purse up and down
--copper
function copper_up1() ChangeStat(INDEX_COIN_COP, 1000000000000, 1) end
function copper_down1() ChangeStat(INDEX_COIN_COP, 1000000000000, -1) end
function copper_up10() ChangeStat(INDEX_COIN_COP, 1000000000000, 10) end
function copper_down10() ChangeStat(INDEX_COIN_COP, 1000000000000, -10) end
function copper_up100() ChangeStat(INDEX_COIN_COP, 1000000000000, 100) end
function copper_down100() ChangeStat(INDEX_COIN_COP, 1000000000000, -100) end
--silver
function silver_up1() ChangeStat(INDEX_COIN_SIL, 1000000000000, 1) end
function silver_down1() ChangeStat(INDEX_COIN_SIL, 1000000000000, -1) end
function silver_up10() ChangeStat(INDEX_COIN_SIL, 1000000000000, 10) end
function silver_down10() ChangeStat(INDEX_COIN_SIL, 1000000000000, -10) end
function silver_up100() ChangeStat(INDEX_COIN_SIL, 1000000000000, 100) end
function silver_down100() ChangeStat(INDEX_COIN_SIL, 1000000000000, -100) end
--gold
function gold_up1() ChangeStat(INDEX_COIN_GOL, 1000000000000, 1) end
function gold_down1() ChangeStat(INDEX_COIN_GOL, 1000000000000, -1) end
function gold_up10() ChangeStat(INDEX_COIN_GOL, 1000000000000, 10) end
function gold_down10() ChangeStat(INDEX_COIN_GOL, 1000000000000, -10) end
function gold_up100() ChangeStat(INDEX_COIN_GOL, 1000000000000, 100) end
function gold_down100() ChangeStat(INDEX_COIN_GOL, 1000000000000, -100) end
--platinum
function platinum_up1() ChangeStat(INDEX_COIN_PLA, 1000000000000, 1) end
function platinum_down1() ChangeStat(INDEX_COIN_PLA, 1000000000000, -1) end
function platinum_up10() ChangeStat(INDEX_COIN_PLA, 1000000000000, 10) end
function platinum_down10() ChangeStat(INDEX_COIN_PLA, 1000000000000, -10) end
function platinum_up100() ChangeStat(INDEX_COIN_PLA, 1000000000000, 100) end
function platinum_down100() ChangeStat(INDEX_COIN_PLA, 1000000000000, -100) end
--carryWeight
function carryLimit_up() ChangeStat(INDEX_CARRY_CURRENT, stats[INDEX_CARRY_LIMIT].value, 1) end
function carryLimit_down() ChangeStat(INDEX_CARRY_CURRENT, BaseHPMAX, -1) end
--player speed
function speed_up() ChangeSpeed(INDEX_SPEED_BASE, BaseHPMAX, 1) end
function speed_down() ChangeSpeed(INDEX_SPEED_BASE, BaseHPMAX, -1) end

function BaseLineSpeed()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	databaseTable[INDEX_SPEED_BASE] = databaseTable[INDEX_SPEED]


	SaveDatabase(databaseTable)
end

function ChangeSpeed(speedIndex, limit, inc)
	if inc == 0 then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local speedChange = databaseTable[speedIndex] + inc

	databaseTable[speedIndex] = speedChange
	databaseTable[INDEX_SPEED] = speedChange
	SaveDatabase(databaseTable)
	UpdateSpeed(stats[INDEX_SPEED].font_color)
end

function UpdateSpeed(speedColor)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local speedChange = 0
	local speedBase = tonumber(databaseTable[INDEX_SPEED_BASE])
	local speedValue = tonumber(databaseTable[INDEX_SPEED])
	local weightValue = tonumber(databaseTable[INDEX_CARRY_CURRENT])

	local encumbered = 5 * databaseTable[INDEX_STR]
	local heavilyEncumbered = 10 * databaseTable[INDEX_STR]

	if weightValue < encumbered then
		speedColor = black
		speedChange = speedBase
	elseif weightValue >= encumbered and weightValue < heavilyEncumbered then
		speedColor = lightred
		speedChange = speedBase - 10
	elseif weightValue >= heavilyEncumbered and weightValue < tonumber(databaseTable[INDEX_CARRY_LIMIT]) then
		speedColor = red
		speedChange = speedBase - 20
	elseif weightValue >= tonumber(databaseTable[INDEX_CARRY_LIMIT]) then
		speedColor = darkred
		speedChange = 0
	end

	local buttons = self.getButtons()
	for k, v in pairs(stats) do
		if k == INDEX_SPEED then
			for _, buttonValue in pairs(buttons) do
				if buttonValue.click_function == 'Speed' then
					self.editButton({ index = buttonValue.index, label = speedChange, position = buttonValue.position, width = 0, height = 0, font_color = speedColor, font_size = 200 })
					break
				end
			end
		end
	end

	databaseTable[INDEX_SPEED] = speedChange
	SaveDatabase(databaseTable)
	return speedColor
end

function ChangeStat(statIndex, valueLimit, inc)
	if inc == 0 then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local statStatic = tonumber(databaseTable[statIndex])

	local statValue = tonumber(databaseTable[statIndex]) + inc
	if statIndex == INDEX_CHAR_LEVEL then
		if statValue > 20 then
		 statValue = 20
		 printToAll('Level can\'t be higher than 20!', {1, 0, 0})
	 	elseif statValue <= 1 then
		 statValue = 1
		 printToAll('Level can\'t be below 1!', {1, 0, 0})
	 	end
	elseif statValue > valueLimit then
		statValue = valueLimit
		printToAll('Stat can\'t be higher than MAX!', {1, 0, 0})
	elseif statValue < 0 then
		statValue = 0
		printToAll('Stat\'s can\'t go below 0!', {1, 0, 0})
	end


	--keeps current HP at Max HP for maxium
	if statIndex == INDEX_HP_THRESHOLD and statValue < stats[INDEX_HP_CURRENT].value then
		databaseTable[INDEX_HP_CURRENT] = databaseTable[INDEX_HP_THRESHOLD]
	end
	--keeps class resources at or below maxium
	if statIndex == INDEX_CLASS1_TOTAL and statValue < stats[INDEX_CLASS1_ACTUAL].value then
		databaseTable[INDEX_CLASS1_ACTUAL] = databaseTable[INDEX_CLASS1_TOTAL]
	end
	if statIndex == INDEX_CLASS2_TOTAL and statValue < stats[INDEX_CLASS2_ACTUAL].value then
		databaseTable[INDEX_CLASS2_ACTUAL] = databaseTable[INDEX_CLASS2_TOTAL]
	end
	--loads death save marks
	if statIndex == INDEX_HP_CURRENT and statValue == 0 then
		stats[INDEX_HP_CURRENT].font_color = red
		CreateDeathSaveMarks()
	elseif statIndex == INDEX_HP_CURRENT and statValue == 1 and statStatic == 0 then
		stats[INDEX_HP_CURRENT].font_color = black
		databaseTable[INDEX_DEATH_SAVES] = ResetDeathSaveMark()
	end

	databaseTable[statIndex] = tostring(statValue)
	SaveDatabase(databaseTable)

	GeneratePerception()
	GenerateCarryCappacity()
	GenerateProficiency()
	RefreshBonuses()
	CreateSaveSkillTotals()
	UpdateSpeed(stats[INDEX_SPEED].font_color)
	LoadStats()
	LoadCoinPurse()
end

function LoadStats()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local buttons = self.getButtons()
	for k, v in pairs(stats) do
		v.value = tonumber(databaseTable[k])
	end

	for k, v in pairs(stats) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name then
				if k == INDEX_SPELL_STRING then
					self.editButton({ index = buttonValue.index, label = databaseTable[INDEX_SPELL_STRING], position = buttonValue.position, font_color = v.font_color })
				elseif k == INDEX_HD_TYPE_STRING then
					self.editButton({ index = buttonValue.index, label = databaseTable[INDEX_HD_TYPE_STRING], position = buttonValue.position, font_color = v.font_color })
				elseif k == INDEX_CREATURE_SIZE then
					self.editButton({ index = buttonValue.index, label = databaseTable[INDEX_CREATURE_SIZE], position = buttonValue.position, font_color = v.font_color })
				elseif k == INDEX_SPEED then
					self.editButton({ index = buttonValue.index, label = databaseTable[INDEX_SPEED], position = buttonValue.position, font_color = UpdateSpeed(v.font_color) })
				else
					self.editButton({ index = buttonValue.index, label = v.value, position = buttonValue.position, font_color = v.font_color })
					break
				end
			end
		end
	end
end

--coins
function LoadCoinPurse()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local buttons = self.getButtons()
	for k, v in pairs(coinPurse) do
		v.value = tonumber(databaseTable[k])
	end

	for k, v in pairs(coinPurse) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name then
				self.editButton({ index = buttonValue.index, label = v.value, position = buttonValue.position, font_color = v.font_color })
				break
			end
		end
	end
end

--death save realted functions
function CreateDeathSaveMarks()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	if tonumber(databaseTable[INDEX_HP_CURRENT])  <= 0 then
		return
	end

	for k, v in pairs(deathSaves) do
		self.createButton({button = {}, click_function = v.name .. '_button', label = ' ', function_owner = self, position = v.position, width = 25, height = 50, font_size = 99, color = darkred})
	end
end

function DEATH_MARK_1_button() ChangeDeathSaveMark(DEATH_MARK_1) end
function DEATH_MARK_2_button() ChangeDeathSaveMark(DEATH_MARK_2) end
function DEATH_MARK_3_button() ChangeDeathSaveMark(DEATH_MARK_3) end
function DEATH_MARK_4_button() ChangeDeathSaveMark(DEATH_MARK_4) end
function DEATH_MARK_5_button() ChangeDeathSaveMark(DEATH_MARK_5) end
function DEATH_MARK_6_button() ChangeDeathSaveMark(DEATH_MARK_6) end

function ChangeDeathSaveMark(deathMark)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end


	if tonumber(databaseTable[INDEX_HP_CURRENT]) > 0 then
		return
	end
	local markTable = databaseTable[INDEX_DEATH_SAVES]
	local markValue = markTable:sub(deathMark, deathMark)

	if markValue == 'n' then
		markValue = 'y'
	else
		markValue = 'n'
	end

	local specificMark = deathSaves[deathMark]
	specificMark.mark = markValue == 'y'

	--list table for index value of the death saves is equal to markTable, which is substituding existing index 1 through death mark being changed concatenated wtih markValue concatenated with the remainder of existing string
	databaseTable[INDEX_DEATH_SAVES] = markTable:sub(1, deathMark - 1) .. markValue .. markTable:sub(deathMark + 1)
	SaveDatabase(databaseTable)

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == specificMark.name .. '_button' then
			self.editButton({ index = buttonValue.index, label = specificMark.mark and '\u{2617}' or ' ', position = buttonValue.position, width = 0, height = 0, font_size = 40 })
			break
		end
	end
end

function ResetDeathSaveMark()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	databaseTable[INDEX_DEATH_SAVES] = 'nnnnnn'
	databaseTable[INDEX_HP_CURRENT] = 1
	SaveDatabase(databaseTable)
	local buttons = self.getButtons()
	for k, v in pairs(deathSaves) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name .. '_button' then
				self.editButton({ index = buttonValue.index, label = ' ', position = buttonValue.position, width = 0, height = 0, font_size = 40 })
				break
			end
		end
	end
	return databaseTable[INDEX_DEATH_SAVES]
end

--generating Passive Perception
function GeneratePerception()
		local databaseTable = GetDatabase()
		if #databaseTable == 0 then
			return
		end

		local passivePerception = 10 + databaseTable[MOD_INDEX_WIS] + databaseTable[INDEX_PASSIVE_PERCEPTION_MISC]
		databaseTable[INDEX_PASSIVE_PERCEPTION] = passivePerception
		SaveDatabase(databaseTable)
end

--generating Initiative
function GenerateInitiative()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local jackBonusValue = databaseTable[INDEX_JACKOFALL]
	local bonus = 0
	if jackBonusValue ~= 'y' then
			bonus = 0
	else
		local prof = databaseTable[INDEX_PROFICIENCY]
		local jackBonus = math.floor(prof/2)
		bonus = jackBonus
	end

	local initiativeStat = databaseTable[MOD_INDEX_DEX] + databaseTable[INDEX_INITIATIVE_MISC] + bonus
	databaseTable[INDEX_INITIATIVE_TOTAL] = initiativeStat
	SaveDatabase(databaseTable)
end

--spell Casting Ability Change
function cycleSpellAbility() ChangeSpellAbility(INDEX_SPELL_ABILITY) end
function miscMod_up() ChangeSpellMisc(INDEX_SPELL_MISC, 1, 2, 1) end
function miscMod_down() ChangeSpellMisc(INDEX_SPELL_MISC, 1, 2, -1) end
function miscDC_up() ChangeSpellMisc(INDEX_SPELL_MISC, 2, 1, 1) end
function miscDC_down() ChangeSpellMisc(INDEX_SPELL_MISC, 2, 1, -1) end

function ChangeSpellAbility(currentAbilityIndex)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local currentAbilityValue = databaseTable[currentAbilityIndex]
	local spellMOD = databaseTable[INDEX_SPELL_MOD]
	local spellDC = databaseTable[INDEX_SPELL_DC]
	local spellString = databaseTable[INDEX_SPELL_STRING]
	local spellMiscIndex = databaseTable[INDEX_SPELL_MISC]
	local spellMiscMod = tonumber(string.sub(spellMiscIndex, 1, 1))
	local spellMiscDC = tonumber(string.sub(spellMiscIndex, 2, 2))
	local changedAbilityValue = currentAbilityValue + 1

	if changedAbilityValue > 3 then
		changedAbilityValue = 1
	end

	if changedAbilityValue == 1 then
		spellMOD = databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_INT] + spellMiscMod
		spellDC = 8 + databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_INT] + spellMiscDC
		spellString = 'INT'
	elseif changedAbilityValue == 2 then
		spellMOD = databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_WIS] + spellMiscMod
		spellDC = 8 + databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_WIS] + spellMiscDC
		spellString = 'WIS'
	elseif changedAbilityValue == 3 then
		spellMOD = databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_CHA] + spellMiscMod
		spellDC = 8 + databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_CHA] + spellMiscDC
		spellString = 'CHA'
	end

	databaseTable[INDEX_SPELL_ABILITY] = changedAbilityValue
	databaseTable[INDEX_SPELL_MOD] = spellMOD
	databaseTable[INDEX_SPELL_DC] = spellDC
	databaseTable[INDEX_SPELL_STRING] = spellString

	SaveDatabase(databaseTable)
	UpdateSpellStats()
	LoadStats()
end

function ChangeSpellMisc(spellIndex, changeIndex, staticIndex, inc)
	if inc == 0 then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local statList = tostring(databaseTable[spellIndex])
	if changeIndex == 1 then
		local changeValue = string.sub(statList, changeIndex, changeIndex) + inc
		staticValue = string.sub(statList, staticIndex, staticIndex)
		if changeValue > 9 then
			changeValue = 9
			printToAll('Spell Attack Misc Modifiers can\'t be higher than 9!', {1, 0, 0})
		elseif changeValue < 0 then
			changeValue = 0
			printToAll('Spell Attack Misc Modifiers can\'t be lower than 0!', {1, 0, 0})
		end
		statList = changeValue .. staticValue
	elseif changeIndex == 2 then
		local changeValue = string.sub(statList, changeIndex, changeIndex) + inc
		staticValue = string.sub(statList, staticIndex, staticIndex)
		if changeValue > 9 then
			changeValue = 9
			printToAll('Spell DC Misc Modifiers can\'t be higher than 9!', {1, 0, 0})
		elseif changeValue < 0 then
			changeValue = 0
			printToAll('Spell DC Misc Modifiers can\'t be lower than 0!', {1, 0, 0})
		end
		statList = staticValue .. changeValue
	end

	databaseTable[spellIndex] = statList

	SaveDatabase(databaseTable)
	UpdateSpellStats()
	LoadStats()
end

function UpdateSpellStats()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local spellAttackMod = 0
	local spellDCMod = 0
	local spellModsList = databaseTable[INDEX_SPELL_MISC]
	local spellAttackModMisc = string.sub(spellModsList, 1, 1)
	local spellDCModMisc = string.sub(spellModsList, 2, 2)
	local currentAbilityValue = tonumber(databaseTable[INDEX_SPELL_ABILITY])

	if currentAbilityValue == 1 then
		spellAttackMod = databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_INT] + spellAttackModMisc
		spellDCMod = 8 + databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_INT] + spellDCModMisc
		spellString = 'INT'
	elseif currentAbilityValue == 2 then
		spellAttackMod = databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_WIS] + spellAttackModMisc
		spellDCMod = 8 + databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_WIS] + spellDCModMisc
		spellString = 'WIS'
	elseif currentAbilityValue == 3 then
		spellAttackMod = databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_CHA] + spellAttackModMisc
		spellDCMod = 8 + databaseTable[INDEX_PROFICIENCY] + databaseTable[MOD_INDEX_CHA] + spellDCModMisc
		spellString = 'CHA'
	end

	databaseTable[INDEX_SPELL_STRING] = spellString
	databaseTable[INDEX_SPELL_MOD] = spellAttackMod
	databaseTable[INDEX_SPELL_DC] = spellDCMod
	SaveDatabase(databaseTable)
end


--load and change spellSlots
--spells ++
function Spell_Slots_One_up() ChangeSpellSlots(INDEX_SPELLS_ONE, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_One_down() ChangeSpellSlots(INDEX_SPELLS_ONE, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Two_up() ChangeSpellSlots(INDEX_SPELLS_TWO, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Two_down() ChangeSpellSlots(INDEX_SPELLS_TWO, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Three_up() ChangeSpellSlots(INDEX_SPELLS_THREE, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Three_down() ChangeSpellSlots(INDEX_SPELLS_THREE, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Four_up() ChangeSpellSlots(INDEX_SPELLS_FOUR, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Four_down() ChangeSpellSlots(INDEX_SPELLS_FOUR, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Five_up() ChangeSpellSlots(INDEX_SPELLS_FIVE, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Five_down() ChangeSpellSlots(INDEX_SPELLS_FIVE, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Six_up() ChangeSpellSlots(INDEX_SPELLS_SIX, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Six_down() ChangeSpellSlots(INDEX_SPELLS_SIX, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Seven_up() ChangeSpellSlots(INDEX_SPELLS_SEVEN, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Seven_down() ChangeSpellSlots(INDEX_SPELLS_SEVEN, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Eight_up() ChangeSpellSlots(INDEX_SPELLS_EIGHT, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Eight_down() ChangeSpellSlots(INDEX_SPELLS_EIGHT, SPELL_SLOTS, SPELL_LIMIT, -1) end
function Spell_Slots_Nine_up() ChangeSpellSlots(INDEX_SPELLS_NINE, SPELL_SLOTS, SPELL_LIMIT, 1) end
function Spell_Slots_Nine_down() ChangeSpellSlots(INDEX_SPELLS_NINE, SPELL_SLOTS, SPELL_LIMIT, -1) end

function ChangeSpellSlots(spellIndex, changeIndex, staticIndex, inc)
	if inc == 0 then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local statList = tostring(databaseTable[spellIndex])
	local changeValue = string.sub(statList, changeIndex, changeIndex) + inc

	staticValue = string.sub(statList, staticIndex, staticIndex)
	spellLimitValue = tonumber(staticValue)

	if changeValue > spellLimitValue then
		changeValue = spellLimitValue
		printToAll('Spell Slots can\'t be higher than Limit!', {1, 0, 0})
	elseif changeValue < MinSpells then
		changeValue = MinSpells
		printToAll('Spell Slots can\'t be lower than 0!', {1, 0, 0})
	end

	statList = staticValue .. changeValue
	databaseTable[spellIndex] = statList
	SaveDatabase(databaseTable)
	LoadSpellSlots()
end

function LoadSpellSlots()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local buttons = self.getButtons()
	for k, v in pairs(spellSlots) do
		if k >= 1 and k <=9 then
			local y = 0
			y = v.spellIndex
			local spellList = databaseTable[y]
			spellValue = string.sub(spellList, SPELL_SLOTS, SPELL_SLOTS)
			v.value = spellValue
		end
	end

	for k, v in pairs(spellSlots) do
		if k >= 1 and k <=9 then
			for _, buttonValue in pairs(buttons) do
				if buttonValue.click_function == v.name then
					self.editButton({ index = buttonValue.index, label = v.value, position = buttonValue.position, font_color =  black })
					break
				end
			end
		end
	end
end

--spells --
function Spell_Limit_One_up() ChangeSpellLimit(INDEX_SPELLS_ONE, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_One_down() ChangeSpellLimit(INDEX_SPELLS_ONE, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Two_up() ChangeSpellLimit(INDEX_SPELLS_TWO, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Two_down() ChangeSpellLimit(INDEX_SPELLS_TWO, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Three_up() ChangeSpellLimit(INDEX_SPELLS_THREE, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Three_down() ChangeSpellLimit(INDEX_SPELLS_THREE, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Four_up() ChangeSpellLimit(INDEX_SPELLS_FOUR, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Four_down() ChangeSpellLimit(INDEX_SPELLS_FOUR, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Five_up() ChangeSpellLimit(INDEX_SPELLS_FIVE, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Five_down() ChangeSpellLimit(INDEX_SPELLS_FIVE, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Six_up() ChangeSpellLimit(INDEX_SPELLS_SIX, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Six_down() ChangeSpellLimit(INDEX_SPELLS_SIX, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Seven_up() ChangeSpellLimit(INDEX_SPELLS_SEVEN, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Seven_down() ChangeSpellLimit(INDEX_SPELLS_SEVEN, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Eight_up() ChangeSpellLimit(INDEX_SPELLS_EIGHT, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Eight_down() ChangeSpellLimit(INDEX_SPELLS_EIGHT, SPELL_LIMIT, SPELL_SLOTS, -1) end
function Spell_Limit_Nine_up() ChangeSpellLimit(INDEX_SPELLS_NINE, SPELL_LIMIT, SPELL_SLOTS, 1) end
function Spell_Limit_Nine_down() ChangeSpellLimit(INDEX_SPELLS_NINE, SPELL_LIMIT, SPELL_SLOTS, -1) end

function ChangeSpellLimit(spellIndex, changeIndex, staticIndex, inc)
	if inc == 0 then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local statList = tostring(databaseTable[spellIndex])
	local changeValue = string.sub(statList, changeIndex, changeIndex) + inc

	staticValue = string.sub(statList, staticIndex, staticIndex)
	spellLimitValue = tonumber(staticValue)

	if changeValue > MaxSpells then
		changeValue = MaxSpells
		printToAll('Spell Limit can\'t be higher than Max Spells!', {1, 0, 0})
	elseif changeValue < MinSpells then
		changeValue = MinSpells
		printToAll('Spell Limit can\'t be lower than Minimum Spells!', {1, 0, 0})

	end

	if spellLimitValue >= changeValue then
		staticValue = changeValue
	end

	statList = changeValue .. staticValue
	databaseTable[spellIndex] = statList
	SaveDatabase(databaseTable)
	LoadSpellLimit()
	LoadSpellSlots()

end

function LoadSpellLimit()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local buttons = self.getButtons()
	for k, v in pairs(spellSlots) do
		if k >= 10 and k <=18 then
			local y = 0
			y = v.spellIndex
			local spellList = databaseTable[y]
			spellValue = string.sub(spellList, SPELL_LIMIT, SPELL_LIMIT)
			v.value = spellValue
		end
	end

	for k, v in pairs(spellSlots) do
		if k >= 10 and k <=18 then
			for _, buttonValue in pairs(buttons) do
				if buttonValue.click_function == v.name then
					self.editButton({ index = buttonValue.index, label = v.value, position = buttonValue.position, font_color =  black })
					break
				end
			end
		end
	end
end
--takes button edits for character level and elseif switch statements it to produce correct Proficiency Bonus
function GenerateProficiency()
	local profBonus = 2
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local charLevel = tonumber(databaseTable[INDEX_CHAR_LEVEL])
		if charLevel >= 1 and charLevel <= 4 then
			profBonus = 2
		elseif charLevel >= 5 and charLevel <= 8 then
			profBonus = 3
		elseif charLevel >= 9 and charLevel <= 12 then
			profBonus = 4
		elseif charLevel >= 13 and charLevel <= 16 then
			profBonus = 5
		elseif charLevel >= 17 and charLevel <= 20 then
			profBonus = 6
		end

	databaseTable[INDEX_PROFICIENCY] = profBonus
	SaveDatabase(databaseTable)
end

-- Name editing
function LoadNames()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local length = tableLen(name_object)
	if length ~= 0 then
		for k, v in pairs(name_object) do
			local objectDescription = v.getDescription()
			if objectDescription:find(';') then
				printToAll('Name, species, career and specialization may not contain ;.', {0, 0, 1})
				return
			end

			databaseTable[k] = objectDescription
		end

		SaveDatabase(databaseTable)
	end

	local buttons = self.getButtons()
	for k, v in pairs(buttons) do
		if v.click_function == 'name' then
			self.editButton({ index = v.index, label = databaseTable[INDEX_NAME], position = v.position })
		elseif v.click_function == 'species' then
			self.editButton({ index = v.index, label = databaseTable[INDEX_RACE], position = v.position })
		elseif v.click_function == 'career' then
			self.editButton({ index = v.index, label = databaseTable[INDEX_CLASS], position = v.position })
		elseif v.click_function == 'spec' then
			self.editButton({ index = v.index, label = databaseTable[INDEX_DEITY], position = v.position })
		elseif v.click_function == 'player' then
			self.editButton({ index = v.index, label = databaseTable[INDEX_PLAYER], position = v.position })
		end
	end
end

--Adjust Hit Dice Type
function cycleHDType() ChangeHD(INDEX_HD_TYPE) end

function ChangeHD(currentHDType)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local currentHDValue = databaseTable[currentHDType]
	local changedHDValue = currentHDValue + 1

	if changedHDValue > 4 then
		changedHDValue = 1
	end

	if changedHDValue == 1 then
		typeHDString = 'd6'
	elseif changedHDValue == 2 then
		typeHDString = 'd8'
	elseif changedHDValue == 3 then
		typeHDString = 'd10'
	elseif changedHDValue == 4 then
		typeHDString = 'd12'
	end

	databaseTable[INDEX_HD_TYPE] = changedHDValue
	databaseTable[INDEX_HD_TYPE_STRING] = typeHDString

	SaveDatabase(databaseTable)
	LoadStats()
end

--CHARACTERISTIC EDITING FUNCTIONS
function char_str_up() ChangeCharacteristic(INDEX_STR, 1) end
function char_str_down() ChangeCharacteristic(INDEX_STR, -1) end
function char_dex_up() ChangeCharacteristic(INDEX_DEX, 1) end
function char_dex_down() ChangeCharacteristic(INDEX_DEX, -1) end
function char_con_up() ChangeCharacteristic(INDEX_CON, 1) end
function char_con_down() ChangeCharacteristic(INDEX_CON, -1) end
function char_int_up() ChangeCharacteristic(INDEX_INT, 1) end
function char_int_down() ChangeCharacteristic(INDEX_INT, -1) end
function char_wis_up() ChangeCharacteristic(INDEX_WIS, 1) end
function char_wis_down() ChangeCharacteristic(INDEX_WIS, -1) end
function char_cha_up() ChangeCharacteristic(INDEX_CHA, 1) end
function char_cha_down() ChangeCharacteristic(INDEX_CHA, -1) end

function ChangeCharacteristic(characteristic, inc)
	if inc == 0 then
		return
	end
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local charValue = tonumber(databaseTable[characteristic]) + inc
	if charValue > BaseStatMax then
		charValue = BaseStatMax
		printToAll('A characteristic cannot be higher than 30.', {1, 0, 0})
	elseif charValue < 1 then
		charValue = 1
		printToAll('A characteristic cannot be lower than 1.', {1, 0, 0})
	end

	databaseTable[characteristic] = tostring(charValue)
	SaveDatabase(databaseTable)

	GenerateInitiative()
	LoadCharacteristics()
	LoadMods()
	RefreshBonuses()
end

function LoadCharacteristics()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end


	local buttons = self.getButtons()
	for k, v in pairs(characteristics) do
		v.value = tonumber(databaseTable[k])
	end
	for k, v in pairs(characteristics) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name then
				self.editButton({ index = buttonValue.index, label = v.value, position = buttonValue.position })
				break
			end
		end
		local modBonus = generateMods(databaseTable[k])
		local modIndex = k + 6
		databaseTable[modIndex] = tostring(modBonus)
		SaveDatabase(databaseTable)
	end
end

--Modifiers
function generateMods(characteristic)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local modBonus = 0
	charStatMod = tonumber(characteristic)

	if charStatMod >= 0 and charStatMod <= 1 then
		modBonus = -5
	elseif charStatMod >= 2 and charStatMod <= 3 then
		modBonus = -4
	elseif charStatMod >= 4 and charStatMod <= 5 then
		modBonus = -3
	elseif charStatMod >= 6 and charStatMod <= 7 then
		modBonus = -2
	elseif charStatMod >= 8 and charStatMod <= 9 then
		modBonus = -1
	elseif charStatMod >= 10 and charStatMod <= 11 then
		modBonus = 0
	elseif charStatMod >= 12 and charStatMod <= 13 then
		modBonus = 1
	elseif charStatMod >= 14 and charStatMod <= 15 then
		modBonus = 2
	elseif charStatMod >= 16 and charStatMod <= 17 then
		modBonus = 3
	elseif charStatMod >= 18 and charStatMod <= 19 then
		modBonus = 4
	elseif charStatMod >= 20 and charStatMod <= 21 then
		modBonus = 5
	elseif charStatMod >= 22 and charStatMod <= 23 then
		modBonus = 6
	elseif charStatMod >= 24 and charStatMod <= 25 then
		modBonus = 7
	elseif charStatMod >= 26 and charStatMod <= 27 then
		modBonus = 8
	elseif charStatMod >= 28 and charStatMod <= 29 then
		modBonus = 9
	elseif charStatMod >= 30 then
		modBonus = 10
	end
	return modBonus
end

function LoadMods()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local buttons = self.getButtons()
	for k, v in pairs(modifiers) do
		v.value = tonumber(databaseTable[k])
	end
	for k, v in pairs(modifiers) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name then
				self.editButton({ index = buttonValue.index, label = v.value, position = buttonValue.position })
				break
			end
		end
	end
end

-- Rank editing up
function rankup_StrengthSave() UpdateRankUp(SAVE_STRENGTH) end
function rankup_DexteritySave() UpdateRankUp(SAVE_DEXTERITY) end
function rankup_ConstitutionSave() UpdateRankUp(SAVE_CONSTITUTION) end
function rankup_IntelligenceSave() UpdateRankUp(SAVE_INTELLIGENCE) end
function rankup_WisdomSave() UpdateRankUp(SAVE_WISDOM) end
function rankup_CharismaSave() UpdateRankUp(SAVE_CHARISMA) end
function rankup_Acrobatics() UpdateRankUp(SKILL_ACROBATICS) end
function rankup_AnimalHandling() UpdateRankUp(SKILL_ANIMAL_HANDLING) end
function rankup_Arcana() UpdateRankUp(SKILL_ARCANA) end
function rankup_Athletics() UpdateRankUp(SKILL_ATHLETICS) end
function rankup_Deception() UpdateRankUp(SKILL_DECEPTION) end
function rankup_History() UpdateRankUp(SKILL_HISTORY) end
function rankup_Insight() UpdateRankUp(SKILL_INSIGHT) end
function rankup_Intimidation() UpdateRankUp(SKILL_INTIMIDATION) end
function rankup_Investigation() UpdateRankUp(SKILL_INVESTIGATION) end
function rankup_Medicine() UpdateRankUp(SKILL_MEDICINE) end
function rankup_Nature() UpdateRankUp(SKILL_NATURE) end
function rankup_Perception() UpdateRankUp(SKILL_PERCEPTION) end
function rankup_Performance() UpdateRankUp(SKILL_PERFORMANCE) end
function rankup_Persuasion() UpdateRankUp(SKILL_PERSUASION) end
function rankup_Religion() UpdateRankUp(SKILL_RELIGION) end
function rankup_SlightofHand() UpdateRankUp(SKILL_SLIGHT_OF_HAND)end
function rankup_Stealth() UpdateRankUp(SKILL_STEALTH) end
function rankup_Survival() UpdateRankUp(SKILL_SURVIVAL) end

function UpdateRankUp(skillIndex)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	--CreateSaveSkillTotals()

	local values = databaseTable[INDEX_SKILLS]
	local skillRank = tonumber(values:sub(skillIndex, skillIndex)) + 1

	if skillRank > 20 then
		skillRank = 20
		printToAll('A skill bonus cannot be higher than 20.', {1, 0, 0})
	end

	if skillRank < 0 then
		skillRank = 0
		printToAll('A skill bonus cannot be lower than 1.', {1, 0, 0})
	end

	databaseTable[INDEX_SKILLS] = values:sub(1, skillIndex - 1) .. tostring(skillRank) .. values:sub(skillIndex + 1)
	SaveDatabase(databaseTable)

	CreateSaveSkillTotals()
	databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
	local buttons = self.getButtons()
	for k, v in pairs(skills) do
		v.value = tonumber(databaseTable[k + SavesSkillsTotalStart - 1])
	end
	for k, v in pairs(skills) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name .. '_total' then
				self.editButton({ index = buttonValue.index, label = tostring(v.value), position = buttonValue.position })
				break
			end
		end
	end

	RefreshBonuses()
end

-- Rank editing down
function rankdown_StrengthSave() UpdateRankDown(SAVE_STRENGTH) end
function rankdown_DexteritySave() UpdateRankDown(SAVE_DEXTERITY) end
function rankdown_ConstitutionSave() UpdateRankDown(SAVE_CONSTITUTION) end
function rankdown_IntelligenceSave() UpdateRankDown(SAVE_INTELLIGENCE) end
function rankdown_WisdomSave() UpdateRankDown(SAVE_WISDOM) end
function rankdown_CharismaSave() UpdateRankDown(SAVE_CHARISMA) end
function rankdown_Acrobatics() UpdateRankDown(SKILL_ACROBATICS) end
function rankdown_AnimalHandling() UpdateRankDown(SKILL_ANIMAL_HANDLING) end
function rankdown_Arcana() UpdateRankDown(SKILL_ARCANA) end
function rankdown_Athletics() UpdateRankDown(SKILL_ATHLETICS) end
function rankdown_Deception() UpdateRankDown(SKILL_DECEPTION) end
function rankdown_History() UpdateRankDown(SKILL_HISTORY) end
function rankdown_Insight() UpdateRankDown(SKILL_INSIGHT) end
function rankdown_Intimidation() UpdateRankDown(SKILL_INTIMIDATION) end
function rankdown_Investigation() UpdateRankDown(SKILL_INVESTIGATION) end
function rankdown_Medicine() UpdateRankDown(SKILL_MEDICINE) end
function rankdown_Nature() UpdateRankDown(SKILL_NATURE) end
function rankdown_Perception() UpdateRankDown(SKILL_PERCEPTION) end
function rankdown_Performance() UpdateRankDown(SKILL_PERFORMANCE) end
function rankdown_Persuasion() UpdateRankDown(SKILL_PERSUASION) end
function rankdown_Religion() UpdateRankDown(SKILL_RELIGION) end
function rankdown_SlightofHand() UpdateRankDown(SKILL_SLIGHT_OF_HAND)end
function rankdown_Stealth() UpdateRankDown(SKILL_STEALTH) end
function rankdown_Survival() UpdateRankDown(SKILL_SURVIVAL) end

function UpdateRankDown(skillIndex)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	CreateSaveSkillTotals()

	local values = databaseTable[INDEX_SKILLS]
	local skillRank = tonumber(values:sub(skillIndex, skillIndex)) - 1

	if skillRank > 20 then
		skillRank = 20
		printToAll('A skill bonus cannot be higher than 20.', {1, 0, 0})
	end

	if skillRank < 0 then
		skillRank = 0
		printToAll('A skill bonus cannot be lower than 0.', {1, 0, 0})
	end

	databaseTable[INDEX_SKILLS] = values:sub(1, skillIndex - 1) .. tostring(skillRank) .. values:sub(skillIndex + 1)
	SaveDatabase(databaseTable)

	CreateSaveSkillTotals()
	databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
	local buttons = self.getButtons()
	for k, v in pairs(skills) do
		v.value = tonumber(databaseTable[k + SavesSkillsTotalStart - 1])
	end
	for k, v in pairs(skills) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name .. '_total' then
				self.editButton({ index = buttonValue.index, label = tostring(v.value), position = buttonValue.position })
				break
			end
		end
	end

	RefreshBonuses()
end

--loading save and skill totals
function LoadSaveSkills()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	CreateSaveSkillTotals()

	for k, v in pairs(skills) do
		local position = { 0, YHeight, 0 }
		local TotalMarkX = -4.97
		local TotalMarkXMod = 0.002
		local TotalSaveMarkYMod = 0.2425
		local TotalSkillMarkYMod = 0.2715

		--Save total
		if k >= SAVE_STRENGTH and k <= SAVE_CHARISMA then
			position[1] = TotalMarkX
			position[3] = -5.18 + (TotalSaveMarkYMod * (k - SAVE_STRENGTH))
		end
		--Strength Skill total
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = TotalMarkX + TotalMarkXMod
			position[3] = -3 + (TotalSkillMarkYMod * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skill  total
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = TotalMarkX + TotalMarkXMod
			position[3] = -2.32 + (TotalSkillMarkYMod * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skill  total
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = TotalMarkX + TotalMarkXMod
			position[3] = -1.11 + (TotalSkillMarkYMod * (k - SKILL_ARCANA))
		end
		--Wisdom Skill  total
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = TotalMarkX + TotalMarkXMod
			position[3] = 0.665 + (TotalSkillMarkYMod * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisma Skill  total
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = TotalMarkX + TotalMarkXMod
			position[3] = 2.47 + (TotalSkillMarkYMod * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = v.name .. '_total', label = tostring(v.value), function_owner = self, position = position, width = 0, height = 0, font_size = 60, font_color = black})
	end
end

function CreateSaveSkillTotals()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	for k, v in pairs(skills) do
		y = k
		k = y + SavesSkillsTotalStart - 1
		local values = databaseTable[k]
		local skillsList = databaseTable[INDEX_SKILLS]
		local skillValue = string.sub(skillsList, y, y)
		local careerList = databaseTable[INDEX_CAREER_SKILLS]
		local careerValue = string.sub(careerList, y, y)
		local careerBonus = CareerBonus(careerValue, y)
		local attributeModIndex = CallAttributeBonus(y)
		local attributeMod = databaseTable[attributeModIndex]
		local Total = skillValue + careerBonus + attributeMod
		databaseTable[k] = Total
	end
	SaveDatabase(databaseTable)
end

--calls attribute bonus from databaseTable
function CallAttributeBonus(y)
	local attreibuteMod = 0
	--Strength Stats
	if y == 1 or y == 7 then
		attributeMod = MOD_INDEX_STR
		return attributeMod
	--Dexterity Stats
	elseif y == 2 or y >= 8 and y <= 10 then
		attributeMod = MOD_INDEX_DEX
		return attributeMod
	--Constitution Stats
	elseif y == 3 then
		attributeMod = MOD_INDEX_CON
		return attributeMod
	--Intelligence Stats
	elseif y == 4 or y >= 11 and y <= 15 then
		attributeMod = MOD_INDEX_INT
		return attributeMod
	--Wisdom Stats
	elseif y == 5 or y >= 16 and y <= 20 then
		attributeMod = MOD_INDEX_WIS
		return attributeMod
	--Charisma Stats
	elseif y == 6 or y >= 21 and y <= 24 then
		attributeMod = MOD_INDEX_CHA
		return attributeMod
	end
end

function RefreshBonuses()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
	CreateSaveSkillTotals()

	local buttons = self.getButtons()
	for k, v in pairs(skills) do
		v.value = tonumber(databaseTable[k + SavesSkillsTotalStart - 1])
	end
	for k, v in pairs(skills) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name .. '_total' then
				self.editButton({ index = buttonValue.index, label = tostring(v.value), position = buttonValue.position })
				break
			end
		end
	end
end

-- Career editing
function career_StrengthSave() UpdateCareerButton(SAVE_STRENGTH) end
function career_DexteritySave() UpdateCareerButton(SAVE_DEXTERITY) end
function career_ConstitutionSave() UpdateCareerButton(SAVE_CONSTITUTION) end
function career_IntelligenceSave() UpdateCareerButton(SAVE_INTELLIGENCE) end
function career_WisdomSave() UpdateCareerButton(SAVE_WISDOM) end
function career_CharismaSave() UpdateCareerButton(SAVE_CHARISMA) end
function career_Acrobatics() UpdateCareerButton(SKILL_ACROBATICS) end
function career_AnimalHandling() UpdateCareerButton(SKILL_ANIMAL_HANDLING) end
function career_Arcana() UpdateCareerButton(SKILL_ARCANA) end
function career_Athletics() UpdateCareerButton(SKILL_ATHLETICS) end
function career_Deception() UpdateCareerButton(SKILL_DECEPTION) end
function career_History() UpdateCareerButton(SKILL_HISTORY) end
function career_Insight() UpdateCareerButton(SKILL_INSIGHT) end
function career_Intimidation() UpdateCareerButton(SKILL_INTIMIDATION) end
function career_Investigation() UpdateCareerButton(SKILL_INVESTIGATION) end
function career_Medicine() UpdateCareerButton(SKILL_MEDICINE) end
function career_Nature() UpdateCareerButton(SKILL_NATURE) end
function career_Perception() UpdateCareerButton(SKILL_PERCEPTION) end
function career_Performance() UpdateCareerButton(SKILL_PERFORMANCE) end
function career_Persuasion() UpdateCareerButton(SKILL_PERSUASION) end
function career_Religion() UpdateCareerButton(SKILL_RELIGION) end
function career_SlightofHand() UpdateCareerButton(SKILL_SLIGHT_OF_HAND)end
function career_Stealth() UpdateCareerButton(SKILL_STEALTH) end
function career_Survival() UpdateCareerButton(SKILL_SURVIVAL) end

function UpdateCareerButton(skillIndex)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_CAREER_SKILLS]
	local careerValue = values:sub(skillIndex, skillIndex)

	if careerValue == 'n' then
		careerValue = 'y'
	else
		careerValue = 'n'
	end

	local skill = skills[skillIndex]
	skill.career = careerValue == 'y'

	databaseTable[INDEX_CAREER_SKILLS] = values:sub(1, skillIndex - 1) .. careerValue .. values:sub(skillIndex + 1)
	SaveDatabase(databaseTable)

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == 'career_' .. skill.name then
			self.editButton({ index = buttonValue.index, label = skill.career and '✘' or ' ', position = buttonValue.position })
			break
		end
	end
	RefreshBonuses()
	RefreshBonuses()
end

function LoadCareer()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_CAREER_SKILLS]
	local buttons = self.getButtons()
	for k, v in pairs(skills) do
		v.career = values:sub(k, k) == 'y'
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == 'career_' .. v.name then
				self.editButton({ index = buttonValue.index, label = v.career and '✘' or ' ', position = {buttonValue.position[1], buttonValue.position[2], buttonValue.position[3]}, width = 0, height = 0, font_size = 80 })
				break
			end
		end
	end
end

--calls career bonus from databaseTable
function CareerBonus(careerValue, y)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
	local expertiseSub = y - 6
	local expertiseList = databaseTable[INDEX_EXPERTISE]
	local expertiseValue = string.sub(expertiseList, y, y)
	local expertiseBonus = 1
	local jackBonusValue = databaseTable[INDEX_JACKOFALL]
	if expertiseValue ~= "y" then
		expertiseBonus = 1
	else
		expertiseBonus = 2
	end
	local trueCareer = tostring(careerValue)
	local jackBonusValue = databaseTable[INDEX_JACKOFALL]
	local bonus = 0
	if trueCareer ~= "y" then
		if jackBonusValue ~= 'y' then
			bonus = 0
		else
			local prof = databaseTable[INDEX_PROFICIENCY]
			local jackBonus = math.floor(prof/2)
			bonus = jackBonus
		end
		return bonus
	else
		bonus = expertiseBonus * databaseTable[INDEX_PROFICIENCY]
		return bonus
	end
end

--the following functions create and manage the expertise button marks
function CreateExpertiseButtons()
	for k, v in pairs(expertise) do
		local position = { 0, YHeight, 0 }
		local ExpertMarkX = -5.05
		local ExpertSkillMarkYMod = 0.2715
		--Strength Skill total
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = ExpertMarkX
			position[3] = -3 + (ExpertSkillMarkYMod * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skill  total
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = ExpertMarkX
			position[3] = -2.32 + (ExpertSkillMarkYMod * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skill  total
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = ExpertMarkX
			position[3] = -1.11 + (ExpertSkillMarkYMod * (k - SKILL_ARCANA))
		end
		--Wisdom Skill  total
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = ExpertMarkX
			position[3] = 0.665 + (ExpertSkillMarkYMod * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisma Skill  total
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = ExpertMarkX
			position[3] = 2.47 + (ExpertSkillMarkYMod * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = 'expertise_' .. v.name, label = ' ', function_owner = self, position = position, width = 20, height = 50, font_size = 100})
	end
end

function expertise_Acrobatics() UpdateExpertiseButton(SKILL_ACROBATICS) end
function expertise_AnimalHandling() UpdateExpertiseButton(SKILL_ANIMAL_HANDLING) end
function expertise_Arcana() UpdateExpertiseButton(SKILL_ARCANA) end
function expertise_Athletics() UpdateExpertiseButton(SKILL_ATHLETICS) end
function expertise_Deception() UpdateExpertiseButton(SKILL_DECEPTION) end
function expertise_History() UpdateExpertiseButton(SKILL_HISTORY) end
function expertise_Insight() UpdateExpertiseButton(SKILL_INSIGHT) end
function expertise_Intimidation() UpdateExpertiseButton(SKILL_INTIMIDATION) end
function expertise_Investigation() UpdateExpertiseButton(SKILL_INVESTIGATION) end
function expertise_Medicine() UpdateExpertiseButton(SKILL_MEDICINE) end
function expertise_Nature() UpdateExpertiseButton(SKILL_NATURE) end
function expertise_Perception() UpdateExpertiseButton(SKILL_PERCEPTION) end
function expertise_Performance() UpdateExpertiseButton(SKILL_PERFORMANCE) end
function expertise_Persuasion() UpdateExpertiseButton(SKILL_PERSUASION) end
function expertise_Religion() UpdateExpertiseButton(SKILL_RELIGION) end
function expertise_SlightofHand() UpdateExpertiseButton(SKILL_SLIGHT_OF_HAND)end
function expertise_Stealth() UpdateExpertiseButton(SKILL_STEALTH) end
function expertise_Survival() UpdateExpertiseButton(SKILL_SURVIVAL) end

function UpdateExpertiseButton(expertiseIndex)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_EXPERTISE]
	local careerValue = values:sub(expertiseIndex, expertiseIndex)

	if careerValue == 'n' then
		careerValue = 'y'
	else
		careerValue = 'n'
	end

	local expertise = expertise[expertiseIndex]
	expertise.career = careerValue == 'y'

	databaseTable[INDEX_EXPERTISE] = values:sub(1, expertiseIndex - 1) .. careerValue .. values:sub(expertiseIndex + 1)
	SaveDatabase(databaseTable)

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == 'expertise_' .. expertise.name then
			self.editButton({ index = buttonValue.index, label = expertise.career and '►' or ' ', position = buttonValue.position, font_size = 40 })
			break
		end
	end
	RefreshBonuses()
	RefreshBonuses()
end

function LoadExpertise()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_EXPERTISE]
	local buttons = self.getButtons()
	for k, v in pairs(skills) do
		v.career = values:sub(k, k) == 'y'
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == 'expertise_' .. v.name then
				self.editButton({ index = buttonValue.index, label = v.career and '►' or ' ', position = {buttonValue.position[1], buttonValue.position[2], buttonValue.position[3]}, width = 0, height = 0, font_size = 40 })
				break
			end
		end
	end
end

--Jack of All Trades
function Jack_button() UpdateJackButton(INDEX_JACKOFALL, JACK_TRADES) end
function Dark_button() UpdateJackButton(INDEX_DARKVISION, DARKVISION) end

function UpdateJackButton(jackIndex, bardJackIndex)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
	local jackValue = databaseTable[jackIndex]


	if jackValue == 'n' then
		jackValue = 'y'
	else
		jackValue = 'n'
	end

	local class = bardJack[bardJackIndex]
	class.bard = jackValue == 'y'

	databaseTable[jackIndex] = jackValue
	SaveDatabase(databaseTable)

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == class.name .. '_button' then
			self.editButton({ index = buttonValue.index, label = class.bard and '✘' or ' ', position = buttonValue.position })
			break
		end
	end
	RefreshBonuses()
	RefreshBonuses()
end

function LoadJack(jackIndex, bardJackIndex)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[jackIndex]
	local v = bardJack[bardJackIndex]
	local buttons = self.getButtons()
	v.bard = values == 'y'
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name .. '_button' then
				self.editButton({ index = buttonValue.index, label = v.bard and '✘' or ' ', position = {buttonValue.position[1], buttonValue.position[2], buttonValue.position[3]}, width = 0, height = 0, font_size = 80 })
				break
			end
		end
end

-- Proficiency Marks
function CreateProficiencyMarks()
	for k, v in pairs(proficiencyMarks) do
				self.createButton({button = {}, click_function = v.name, label = ' ', function_owner = self, position = v.position, width = 20, height = 50, font_size = 100 })
	end
end

function proficieny_Light() UpdateProficienyButton(PROFICIENCY_LIGHT) end
function proficieny_Medium() UpdateProficienyButton(PROFICIENCY_MEDIUM) end
function proficieny_Heavy() UpdateProficienyButton(PROFICIENCY_HEAVY) end
function proficieny_Shields() UpdateProficienyButton(PROFICIENCY_SHIELDS) end
function proficieny_Simple() UpdateProficienyButton(PROFICIENCY_SIMPLE) end
function proficieny_Martial() UpdateProficienyButton(PROFICIENCY_MARTIAL) end
function proficieny_Other() UpdateProficienyButton(PROFICIENCY_OTHER) end

function UpdateProficienyButton(statusIndex)
	if not edit then
		return
	end

	printToAll("UPDATE PROFICIENCY BUTTON", red)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_PROFICIENCY_MARKS]
	local statusValue = values:sub(statusIndex, statusIndex)

	if statusValue == 'n' then
		statusValue = 'y'
	else
		statusValue = 'n'
	end

	local status = proficiencyMarks[statusIndex]
	status.proficient = statusValue == 'y'

	databaseTable[INDEX_PROFICIENCY_MARKS] = values:sub(1, statusIndex - 1) .. statusValue .. values:sub(statusIndex + 1)
	SaveDatabase(databaseTable)

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == status.name then
			self.editButton({ index = buttonValue.index, label = status.proficient and '✘' or ' ', position = {buttonValue.position[1], buttonValue.position[2], buttonValue.position[3]}, font_size = 100 })
			break
		end
	end
end

function LoadProficiencyMarks()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_PROFICIENCY_MARKS]
	local buttons = self.getButtons()
	for k, v in pairs(proficiencyMarks) do
		v.proficient = values:sub(k, k) == 'y'
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name then
				self.editButton({ index = buttonValue.index, label = v.proficient and '✘' or ' ', position = {buttonValue.position[1], buttonValue.position[2], buttonValue.position[3]}, width = 0, height = 0, font_size = 100 })
				break
			end
		end
	end
end

--Carry Capacity
function cycleCreatureSize() ChangeCreatureSize() end

function GenerateCarryCappacity()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local creatureSize = databaseTable[INDEX_CREATURE_SIZE]
	local carryWeight = 0
	local pushDragLift = 0
	if creatureSize == 'T' then
		carryWeight = (databaseTable[INDEX_STR] * 15) / 2
		pushDragLift = databaseTable[INDEX_STR] * 15
		databaseTable[INDEX_CARRY_LIMIT] = carryWeight
		databaseTable[INDEX_PUSH_PULL] = pushDragLift
	elseif creatureSize == 'S' or creatureSize == 'M' then
		carryWeight = databaseTable[INDEX_STR] * 15
		pushDragLift = databaseTable[INDEX_STR] * 15 * 2
		databaseTable[INDEX_CARRY_LIMIT] = carryWeight
		databaseTable[INDEX_PUSH_PULL] = pushDragLift
	elseif creatureSize == 'L' then
		carryWeight = (databaseTable[INDEX_STR] * 15) * 2
		pushDragLift = databaseTable[INDEX_STR] * 15 * 4
		databaseTable[INDEX_CARRY_LIMIT] = carryWeight
		databaseTable[INDEX_PUSH_PULL] = pushDragLift
	end
	SaveDatabase(databaseTable)
end

function ChangeCreatureSize()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local newCreatureSize = databaseTable[INDEX_SIZE] + 1

	if newCreatureSize > 4 then
		newCreatureSize = 1
	end

	databaseTable[INDEX_SIZE] = newCreatureSize

	if newCreatureSize == 1 then
		printToAll("Size Tiny", silver)
		databaseTable[INDEX_CREATURE_SIZE] = 'T'
	elseif newCreatureSize == 2 then
		printToAll("Size Small", silver)
		databaseTable[INDEX_CREATURE_SIZE] = 'S'
	elseif newCreatureSize == 3 then
		printToAll("Size Medium", silver)
		databaseTable[INDEX_CREATURE_SIZE] = 'M'
	elseif newCreatureSize == 4 then
		printToAll("Size Large", silver)
		databaseTable[INDEX_CREATURE_SIZE] = 'L'
	end

	SaveDatabase(databaseTable)
	LoadStats()
end

--Dice Rolling Arithmetics
function roll_StrengthSave() UpdateRollButton(SAVE_STRENGTH) end
function roll_DexteritySave() UpdateRollButton(SAVE_DEXTERITY) end
function roll_ConstitutionSave() UpdateRollButton(SAVE_CONSTITUTION) end
function roll_IntelligenceSave() UpdateRollButton(SAVE_INTELLIGENCE) end
function roll_WisdomSave() UpdateRollButton(SAVE_WISDOM) end
function roll_CharismaSave() UpdateRollButton(SAVE_CHARISMA) end
function roll_Acrobatics() UpdateRollButton(SKILL_ACROBATICS) end
function roll_AnimalHandling() UpdateRollButton(SKILL_ANIMAL_HANDLING) end
function roll_Arcana() UpdateRollButton(SKILL_ARCANA) end
function roll_Athletics() UpdateRollButton(SKILL_ATHLETICS) end
function roll_Deception() UpdateRollButton(SKILL_DECEPTION) end
function roll_History() UpdateRollButton(SKILL_HISTORY) end
function roll_Insight() UpdateRollButton(SKILL_INSIGHT) end
function roll_Intimidation() UpdateRollButton(SKILL_INTIMIDATION) end
function roll_Investigation() UpdateRollButton(SKILL_INVESTIGATION) end
function roll_Medicine() UpdateRollButton(SKILL_MEDICINE) end
function roll_Nature() UpdateRollButton(SKILL_NATURE) end
function roll_Perception() UpdateRollButton(SKILL_PERCEPTION) end
function roll_Performance() UpdateRollButton(SKILL_PERFORMANCE) end
function roll_Persuasion() UpdateRollButton(SKILL_PERSUASION) end
function roll_Religion() UpdateRollButton(SKILL_RELIGION) end
function roll_SlightofHand() UpdateRollButton(SKILL_SLIGHT_OF_HAND)end
function roll_Stealth() UpdateRollButton(SKILL_STEALTH) end
function roll_Survival() UpdateRollButton(SKILL_SURVIVAL) end

function CreateRollCheckBoxes()
	for k, v in pairs(skills) do
		local position = { 0, YHeight, 0 }

		local RollMarkX = -5.74
		local RollMarkXMod = -0.012
		local RollSaveMarkYMod = 0.2425
		local RollSkillMarkYMod = 0.2715
		--Save Roll Check Marks
		if k >= SAVE_STRENGTH and k <= SAVE_CHARISMA then
			position[1] = RollMarkX
			position[3] = -5.18 + (RollSaveMarkYMod * (k - SAVE_STRENGTH))
		end
		--Strength Skill Roll Check Marks
		if k >= SKILL_ATHLETICS and k <= SKILL_ATHLETICS then
			position[1] = RollMarkX + RollMarkXMod
			position[3] = -3 + (RollSkillMarkYMod * (k - SKILL_ATHLETICS))
		end
		--Dexterity Skill Roll Check Marks
		if k >= SKILL_ACROBATICS and k <= SKILL_STEALTH then
			position[1] = RollMarkX + RollMarkXMod
			position[3] = -2.32 + (RollSkillMarkYMod * (k - SKILL_ACROBATICS))
		end
		--Intelligence Skill Roll Check Marks
		if k >= SKILL_ARCANA and k <= SKILL_RELIGION then
			position[1] = RollMarkX + RollMarkXMod
			position[3] = -1.11 + (RollSkillMarkYMod * (k - SKILL_ARCANA))
		end
		--Wisdom Skill Roll Check Marks
		if k >= SKILL_ANIMAL_HANDLING and k <= SKILL_SURVIVAL then
			position[1] = RollMarkX + RollMarkXMod
			position[3] = 0.665 + (RollSkillMarkYMod * (k - SKILL_ANIMAL_HANDLING))
		end
		--Charisma Skill Roll Check Marks
		if k >= SKILL_DECEPTION and k <= SKILL_PERSUASION then
			position[1] = RollMarkX + RollMarkXMod
			position[3] = 2.47 + (RollSkillMarkYMod * (k - SKILL_DECEPTION))
		end
		self.createButton({button = {}, click_function = 'roll_' .. v.name, label = ' ', function_owner = self, position = position, width = 50, height = 100, font_size = 75})
	end
end

function UpdateRollButton(statIndex)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_ROLLING_LIST]
	local rollValue = values:sub(statIndex, statIndex)

	if rollValue == 'n' then
		rollValue = 'y'
	else
		rollValue = 'n'
	end

	local roll = skills[statIndex]
	roll.roll = rollValue == 'y'
	databaseTable[INDEX_ROLLING_LIST] = values:sub(1, statIndex - 1) .. rollValue .. values:sub(statIndex + 1)
	values = databaseTable[INDEX_ROLLING_LIST]
	SaveDatabase(databaseTable)

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == 'roll_' .. roll.name then
			self.editButton({ index = buttonValue.index, label = roll.roll and '✘' or ' ', position = buttonValue.position, font_size = 80 })
			break
		end
	end
end

function LoadRolls()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local values = databaseTable[INDEX_ROLLING_LIST]
	local buttons = self.getButtons()
	for k, v in pairs(skills) do
		v.career = values:sub(k, k) == 'y'
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == 'roll_' .. v.name then
				self.editButton({ index = buttonValue.index, label = v.roll and '✘' or ' ', position = {buttonValue.position[1], buttonValue.position[2], buttonValue.position[3]}, width = 50, height = 100, font_size = 40 })
				break
			end
		end
	end
end

--Rolling Buttons and Related Functions

function rollCheckSaveThrow(color, obj)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
  displayCol = getColor(obj)
  playerName = Player[obj].steam_name
  updateRandomSeed()
  d20 = math.random(20)
  d20two = math.random(20)

		if skills[1].roll == true then
			printToAll("╔═════════════════════════════", displayCol)
			printToAll("║ " .. playerName .. "'s Saving Throw:", displayCol)
			printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[1].total] ..  " )", displayCol)
			printToAll("║  Total: ( " .. (d20 + databaseTable[skills[1].total]) .. " | " ..  (d20two + databaseTable[skills[1].total]) .. " ) for a " .. skills[1].title .. " roll!", displayCol)
			printToAll("╚═════════════════════════════", displayCol)
		elseif skills[2].roll == true then
			printToAll("╔═════════════════════════════", displayCol)
			printToAll("║" .. playerName .. "'s Saving Throw:", displayCol)
			printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[2].total] ..  " )", displayCol)
			printToAll("║  Total: ( " .. (d20 + databaseTable[skills[2].total]) .. " | " ..  (d20two + databaseTable[skills[2].total]) .. " ) for a " .. skills[2].title .. " roll!", displayCol)
			printToAll("╚═════════════════════════════", displayCol)
		elseif skills[3].roll == true then
			printToAll("╔═════════════════════════════", displayCol)
			printToAll("║" .. playerName .. "'s Saving Throw:", displayCol)
			printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[3].total] ..  " )", displayCol)
			printToAll("║  Total: ( " .. (d20 + databaseTable[skills[3].total]) .. " | " ..  (d20two + databaseTable[skills[3].total]) .. " ) for a " .. skills[3].title .. " roll!", displayCol)
			printToAll("╚═════════════════════════════", displayCol)
		elseif skills[4].roll == true then
			printToAll("╔═════════════════════════════", displayCol)
			printToAll("║" .. playerName .. "'s Saving Throw:", displayCol)
			printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[4].total] ..  " )", displayCol)
			printToAll("║  Total: ( " .. (d20 + databaseTable[skills[4].total]) .. " | " ..  (d20two + databaseTable[skills[4].total]) .. " ) for a " .. skills[4].title .. " roll!", displayCol)
			printToAll("╚═════════════════════════════", displayCol)
		elseif skills[5].roll == true then
			printToAll("╔═════════════════════════════", displayCol)
			printToAll("║" .. playerName .. "'s Saving Throw:", displayCol)
			printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[5].total] ..  " )", displayCol)
			printToAll("║  Total: ( " .. (d20 + databaseTable[skills[5].total]) .. " | " ..  (d20two + databaseTable[skills[5].total]) .. " ) for a " .. skills[5].title .. " roll!", displayCol)
			printToAll("╚═════════════════════════════", displayCol)
		elseif skills[6].roll == true then
			printToAll("╔═════════════════════════════", displayCol)
			printToAll("║" .. playerName .. "'s Saving Throw:", displayCol)
			printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[6].total] ..  " )", displayCol)
			printToAll("║  Total: ( " .. (d20 + databaseTable[skills[6].total]) .. " | " ..  (d20two + databaseTable[skills[6].total]) .. " ) for a " .. skills[6].title .. " roll!", displayCol)
			printToAll("╚═════════════════════════════", displayCol)
		else
				broadcastToColor("There is no Saving Throw selected.", obj, displayCol)
		end
end

function rollCheckSkill(color, obj)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
  displayCol = getColor(obj)
  playerName = Player[obj].steam_name
  updateRandomSeed()
  d20 = math.random(20)
  d20two = math.random(20)

	if skills[7].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: ( " .. databaseTable[skills[7].total] .. " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[7].total]) .. " | " ..  (d20two + databaseTable[skills[7].total]) .. " ) for a " .. skills[7].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[8].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: ( " .. databaseTable[skills[8].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[8].total]) .. " | " ..  (d20two + databaseTable[skills[8].total]) .. " ) for a " .. skills[8].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[9].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: ( " .. databaseTable[skills[9].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[9].total]) .. " | " ..  (d20two + databaseTable[skills[9].total]) .. " ) for a " .. skills[9].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[10].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: ( " .. databaseTable[skills[10].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[10].total]) .. " | " ..  (d20two + databaseTable[skills[10].total]) .. " ) for a " .. skills[10].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[11].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: ( " .. databaseTable[skills[11].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[11].total]) .. " | " ..  (d20two + databaseTable[skills[11].total]) .. " ) for a " .. skills[11].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[12].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[12].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[12].total]) .. " | " ..  (d20two + databaseTable[skills[12].total]) .. " ) for a " .. skills[12].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[13].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[13].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[13].total]) .. " | " ..  (d20two + databaseTable[skills[13].total]) .. " ) for a " .. skills[13].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[14].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[14].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[14].total]) .. " | " ..  (d20two + databaseTable[skills[14].total]) .. " ) for a " .. skills[14].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[15].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[15].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[15].total]) .. " | " ..  (d20two + databaseTable[skills[15].total]) .. " ) for a " .. skills[15].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[16].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[16].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[16].total]) .. " | " ..  (d20two + databaseTable[skills[16].total]) .. " ) for a " .. skills[16].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[17].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[17].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[17].total]) .. " | " ..  (d20two + databaseTable[skills[17].total]) .. " ) for a " .. skills[17].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[18].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[18].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[18].total]) .. " | " ..  (d20two + databaseTable[skills[18].total]) .. " ) for a " .. skills[18].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[19].roll == true then
		printToAll("╔══════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[19].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[19].total]) .. " | " ..  (d20two + databaseTable[skills[19].total]) .. " ) for a " .. skills[19].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[20].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[20].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[20].total]) .. " | " ..  (d20two + databaseTable[skills[20].total]) .. " ) for a " .. skills[20].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[21].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[21].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[21].total]) .. " | " ..  (d20two + databaseTable[skills[21].total]) .. " ) for a " .. skills[21].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[22].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[22].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[22].total]) .. " | " ..  (d20two + databaseTable[skills[22].total]) .. " ) for a " .. skills[22].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[23].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[23].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[23].total]) .. " | " ..  (d20two + databaseTable[skills[23].total]) .. " ) for a " .. skills[23].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	elseif skills[24].roll == true then
		printToAll("╔═════════════════════════════", displayCol)
		printToAll("║ " .. playerName .. "'s Skill Check:", displayCol)
		printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[skills[24].total] ..  " )", displayCol)
		printToAll("║ Total: ( " .. (d20 + databaseTable[skills[24].total]) .. " | " ..  (d20two + databaseTable[skills[24].total]) .. " ) for a " .. skills[24].title .. " roll!", displayCol)
		printToAll("╚═════════════════════════════", displayCol)
	else
    broadcastToColor("There is no Skill Check selected.", obj, displayCol)
  end
end

function rollInitiative(color, obj)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
  displayCol = getColor(obj)
  playerName = Player[obj].steam_name
  updateRandomSeed()
  d20 = math.random(20)
  d20two = math.random(20)

	printToAll("╔═════════════════════════════", displayCol)
	printToAll("║ " .. playerName .. "'s Initiative Roll:", displayCol)
	printToAll("║ Original rolls: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: (" .. databaseTable[INDEX_INITIATIVE_TOTAL] .. ")", displayCol)
	printToAll("║ Total  ( " .. (d20 + databaseTable[INDEX_INITIATIVE_TOTAL]) .. " | " ..  (d20two + databaseTable[INDEX_INITIATIVE_TOTAL]) .. " ) for an " .. stats[INDEX_INITIATIVE_TOTAL].name .. " roll!", displayCol)
	printToAll("╚═════════════════════════════", displayCol)
end

function rollAttack(color, obj, attackNameIndex, attackBonusIndex, diceCountIndex, diceTypeIndex, dmgModIndex, dmgTypeIndex)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local attackName = databaseTable[attackNameIndex]
	local attackBonus = databaseTable[attackBonusIndex]
	local diceCount = databaseTable[diceCountIndex]
	local diceType = databaseTable[diceTypeIndex]
	local dmgMod = databaseTable[dmgModIndex]
	local dmgType = databaseTable[dmgTypeIndex]

	displayCol = getColor(obj)
	playerName = Player[obj].steam_name
	updateRandomSeed()

	local diceDamage = 0
	local dmgTotal = 0

	if diceType == 'd4 +' then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(4)
		end
		dmgTotal = diceDamage + dmgMod
	elseif diceType == 'd6 +' then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(6)
		end
		dmgTotal = diceDamage + dmgMod
	elseif diceType == 'd8 +' then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(8)
		end
		dmgTotal = diceDamage + dmgMod
	elseif diceType == 'd10 +' then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(10)
		end
		dmgTotal = diceDamage + dmgMod
	elseif diceType == 'd12 +' then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(12)
		end
		dmgTotal = diceDamage + dmgMod
	end

	local d20 = math.random(20)
	local d20two = math.random(20)
	local d20Total = d20 + attackBonus
	local d20twoTotal = d20two + attackBonus

	printToAll("╔════════════════════════════════", displayCol)
	printToAll("║ " .. playerName .. "'s Attack with " .. attackName, displayCol)
	printToAll("║ Attack Roll: ( " .. (d20) .. " | " .. (d20two) .. " ) + Modifier: ( " .. attackBonus .. " )", displayCol)
	printToAll("║ Damage Roll: ( " .. diceDamage .. " ) + Modifier: ( " .. dmgMod .. " )", displayCol)
	printToAll("║ Total: ( " .. d20Total .. " | " ..  d20twoTotal .. " ) for a ( " .. dmgTotal .. " ) " .. dmgType .. " damage attack!", displayCol)
	printToAll("╚════════════════════════════════", displayCol)
end

function rollRandomDiceRoll(color, obj, diceCountIndex, diceModIndex, diceType)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local diceCount = databaseTable[diceCountIndex]
	local diceMod = databaseTable[diceModIndex]

	displayCol = getColor(obj)
	playerName = Player[obj].steam_name
	updateRandomSeed()

	local diceDamage = 0
	local dmgTotal = 0
	local rollName = ''

	if diceType == 4 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(4)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd4'
	elseif diceType == 6 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(6)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd6'
	elseif diceType == 8 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(8)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd8'
	elseif diceType == 10 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(10)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd10'
	elseif diceType == 12 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(12)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd12'
	elseif diceType == 20 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(20)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd20'
	elseif diceType == 100 then
		for i = 1, diceCount do
				diceDamage = diceDamage + math.random(100)
		end
		dmgTotal = diceDamage + diceMod
		rollName = 'd100'
	end

	printToAll("╔════════════════════════════════", displayCol)
	printToAll("║ " .. playerName .. "'s Random " .. diceCount .. rollName .. "+" .. diceMod .. " Roll", displayCol)
	printToAll("║ Base Roll: ( " .. diceDamage .. " ) + Modifier: ( " .. diceMod .. " )", displayCol)
	printToAll("║ Total: ( " .. dmgTotal .. " )", displayCol)
	printToAll("╚════════════════════════════════", displayCol)
end

function updateRandomSeed()
    local chance = math.random(1,10)
    if chance == 1 then
        math.randomseed(os.time())
    end
end

function getColor(obj)
    if obj == "Brown" then
        return  {0.443, 0.231, 0.09}
    elseif obj == "White" then
        return  {1, 1, 1}
    elseif obj == "Red" then
        return  {0.856, 0.1, 0.094}
    elseif obj == "Yellow" then
        return  {0.905, 0.898, 0.172}
    elseif obj == "Green" then
        return  {0.192, 0.701, 0.168}
    elseif obj == "Teal" then
        return  {0.129, 0.694, 0.607}
    elseif obj == "Blue" then
        return  {0.118, 0.53, 1}
    elseif obj == "Purple" then
        return  {0.627, 0.125, 0.941}
    elseif obj == "Pink" then
        return  {0.96, 0.439, 0.807}
    elseif obj == "Grey" then
        return  {0.5, 0.5, 0.5}
    elseif obj == "Orange" then
        return  {0.956, 0.392, 0.113}
    elseif obj == "Black" then
        return {1, 1, 1}
    end
end

function createRollButtons()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	-- Roll Saving Throws
  self.createButton({ label = "" .. string.char(8635) .. ' Roll ' .. string.char(8634) .. "", click_function = "rollCheckSaveThrow", function_owner = self, position = {-5.3, YHeight, -5.725}, height = 150, width = 450, font_size = 100 })
	-- Roll Skill Throws
  self.createButton({ label = "" .. string.char(8635) .. ' Roll ' .. string.char(8634) .. "", click_function = "rollCheckSkill", function_owner = self, position = {-5.3, YHeight, -3.655}, height = 150, width = 450, font_size = 100 })
	-- Roll Skill Throws
	self.createButton({ label = "" .. string.char(8635) .. ' Roll ' .. string.char(8634) .. "", click_function = "rollInitiative", function_owner = self, position = {-5.3, YHeight, 6.1}, height = 150, width = 450, font_size = 100 })
	-- Attack Buttons
	self.createButton({button = {}, click_function = 'AttackButton1', label = '❖', function_owner = self, position = {-4.7, YHeight, -0.95}, width = 100, height = 200, font_size = 150, color = white, font_color = darkred})
	self.createButton({button = {}, click_function = 'AttackButton2', label = '❖', function_owner = self, position = {-4.7, YHeight, -0.95 + (1 * 1.22)}, width = 100, height = 200, font_size = 150, color = white, font_color = darkred})
	self.createButton({button = {}, click_function = 'AttackButton3', label = '❖', function_owner = self, position = {-4.7, YHeight, -0.95 + (2 * 1.22)}, width = 100, height = 200, font_size = 150, color = white, font_color = darkred})
	self.createButton({button = {}, click_function = 'AttackButton4', label = '❖', function_owner = self, position = {-4.7, YHeight, -0.95 + (3 * 1.22)}, width = 100, height = 200, font_size = 150, color = white, font_color = darkred})
	self.createButton({button = {}, click_function = 'AttackButton5', label = '❖', function_owner = self, position = {-4.7, YHeight, -0.95 + (4 * 1.22)}, width = 100, height = 200, font_size = 150, color = white, font_color = darkred})
	self.createButton({button = {}, click_function = 'AttackButton6', label = '❖', function_owner = self, position = {-4.7, YHeight, -0.95 + (5 * 1.22)}, width = 100, height = 200, font_size = 150, color = white, font_color = darkred})

	self.createButton({button = {}, click_function = 'RandomD4', label = 'D4', function_owner = self, position = {0.9, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})
	self.createButton({button = {}, click_function = 'RandomD6', label = 'D6', function_owner = self, position = {1.2, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})
	self.createButton({button = {}, click_function = 'RandomD8', label = 'D8', function_owner = self, position = {1.5, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})
	self.createButton({button = {}, click_function = 'RandomD10', label = 'D10', function_owner = self, position = {1.8, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})
	self.createButton({button = {}, click_function = 'RandomD12', label = 'D12', function_owner = self, position = {2.1, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})
	self.createButton({button = {}, click_function = 'RandomD20', label = 'D20', function_owner = self, position = {2.4, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})
	self.createButton({button = {}, click_function = 'RandomD100', label = 'D100', function_owner = self, position = {2.7, YHeight, -5.26}, width = 125, height = 200, font_size = 65, color = silver, font_color = copper})

	for k, v in pairs(random_rolls) do
		self.createButton({button = {}, click_function = v.name, label = databaseTable[k], function_owner = self, position = v.position, width = 0, height = 0, font_size = 200, color = silver, font_color = copper})
		self.createButton({button = {}, click_function = v.name .. '_up', label = '+', function_owner = self, position = {v.position[1] + -0.05, v.position[2], v.position[3] + -0.3}, width = 50, height = 100, font_size = 65, color = white, font_color = black})
		self.createButton({button = {}, click_function = v.name .. '_down', label = '-', function_owner = self, position = {v.position[1] + 0.05, v.position[2], v.position[3] + -0.3}, width = 50, height = 100, font_size = 65, color = white, font_color = black})
	end
end

--Random Dice roll functions
function RandomDiceCount_up() ChangeRandomDiceMisc(INDEX_RANDOM_ROLL_DICE_COUNT, 1) end
function RandomDiceCount_down() ChangeRandomDiceMisc(INDEX_RANDOM_ROLL_DICE_COUNT, -1) end
function RandomDiceMod_up() ChangeRandomDiceMisc(INDEX_RANDOM_ROLL_MISC_MOD, 1) end
function RandomDiceMod_down() ChangeRandomDiceMisc(INDEX_RANDOM_ROLL_MISC_MOD, -1) end

function RandomD4(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 4) end
function RandomD6(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 6) end
function RandomD8(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 8) end
function RandomD10(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 10) end
function RandomD12(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 12) end
function RandomD20(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 20) end
function RandomD100(color, obj) rollRandomDiceRoll(color, obj, INDEX_RANDOM_ROLL_DICE_COUNT, INDEX_RANDOM_ROLL_MISC_MOD, 100) end

function ChangeRandomDiceMisc(index, inc)
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end
	printToAll("Start of Change Function", green)
	databaseTable[index] = databaseTable[index] + inc

	if index == 205 then
		if databaseTable[index] < 1 then
			databaseTable[index] = 1
			printToAll("Random Dice Count cannot be lower than 1!", copper)
		end
	end

	local buttons = self.getButtons()
	for k, v in pairs(random_rolls) do
			v.value = tonumber(databaseTable[k])
	end
	for k, v in pairs(random_rolls) do
		for _, buttonValue in pairs(buttons) do
			if buttonValue.click_function == v.name then
				self.editButton({ index = buttonValue.index, label = databaseTable[k], position = buttonValue.position })
				break
			end
		end
	end

	SaveDatabase(databaseTable)
end

--All attack roll related functions
--generate Attack Modifiers
function GenerateAttackMods()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end


	for i = 1, 6 do
		local subTableName = i .. '.1'
		local subTableBonus = i .. '.2'
		local subTableDMGMod = i .. '.10'
		for k, v in pairs(attack_table) do
			if v.subTable > tostring(i) and v.subTable < tostring(i + 0.99) then
				if v.subTable == subTableName then
				elseif v.subTable == subTableBonus then
					databaseTable[v.databaseIndex] = tonumber(databaseTable[tonumber(databaseTable[v.bonusINT])]) + databaseTable[INDEX_PROFICIENCY] + databaseTable[v.misc]
				elseif v.subTable == subTableDMGMod then
					databaseTable[v.databaseIndex] = tonumber(databaseTable[tonumber(databaseTable[v.bonusINT])]) + databaseTable[v.misc]
					break
				else
				end
			end
		end
	end
	SaveDatabase(databaseTable)
end
--load attack details
function LoadAttackDetails()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	for i = 1, 6 do
		local subTableName = i .. '.1'
		local subTableBonusType = i .. '.4'
		local subTableRange = i .. '.6'
		local subTableDiceType = i .. '.9'
		local subTableType = i .. '.12'
		local subTableWeight = i .. '.13'

		local buttons = self.getButtons()
		for k, v in pairs(attack_table) do
			if v.subTable == subTableName or v.subTable == subTableType or v.subTable == subTableDiceType or v.subTable == subTableBonusType or v.subTable == subTableRange  or v.subTable == subTableWeight  then
				break
			else
				v.value = tonumber(databaseTable[k])
			end
		end
		for k, v in pairs(attack_table) do
			if v.subTable >= subTableName and v.subTable <= subTableDiceType then
				for _, buttonValue in pairs(buttons) do
					if buttonValue.click_function == v.name .. v.subTable then
						if v.subTable == subTableName or v.subTable == subTableType or v.subTable == subTableDiceType or v.subTable == subTableBonusType or v.subTable == subTableRange  or v.subTable == subTableWeight then
							if v.subTable >= subTableName and v.subTable <= subTableDiceType then
								self.editButton({ index = buttonValue.index, label = databaseTable[v.databaseIndex], position = buttonValue.position })
								break
							end
						end
					else
						if buttonValue.click_function == v.name .. v.subTable then
							self.editButton({ index = buttonValue.index, label = databaseTable[k], position = buttonValue.position })
							break
						end
					end
				end
			elseif v.subTable < subTableName and v.subTable >subTableDiceType then
				break
			end
		end
	end
end

--create attack edit buttons
function CreateAttackDetailEdit()
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local buttons = self.getButtons()

	for i = 1, 6 do
		local subTableName = i .. '.1'
		local subTableBonusType = i .. '.4'
		local subTableRange = i .. '.6'
		local subTableDiceType = i .. '.9'
		local subTableType = i .. '.12'
		local subTableWeight = i .. '.13'

		for k, v in pairs(attack_table) do
			if v.subTable == subTableName or v.subTable == subTableType or v.subTable == subTableDiceType or v.subTable == subTableBonusType or v.subTable == subTableRange  or v.subTable == subTableWeight then
				break
			else
				v.value = tonumber(databaseTable[k])
			end
		end

		for k, v in pairs(attack_table) do
			for _, buttonValue in pairs(buttons) do
				if v.subTable == subTableName or v.subTable == subTableRange or v.subTable == subTableType or v.subTable == subTableWeight then
					if buttonValue.click_function == v.name .. v.subTable then
						self.editButton({ index = buttonValue.index, label = databaseTable[k], position = buttonValue.position, font_color = clear })
					end
				elseif v.subTable ~= subTableBonusType then
					break
				else
					if buttonValue.click_function == v.name .. v.subTable then
						self.editButton({ index = buttonValue.index, label = databaseTable[k], position = buttonValue.position, font_color = lightblue })
						break
					end
				end
			end
			SaveDatabase(databaseTable)
		end

		for k, v in pairs(attack_table) do
			if v.subTable == subTableName or v.subTable == subTableRange or v.subTable == subTableType or v.subTable == subTableWeight then
				--Sets up reference function
				local funcName = "textbox" .. k
				local func = function(_,_,val,sel) click_textbox(k,val,sel) end
				self.setVar(funcName, func)

				local inputs = self.getInputs()
				self.createInput({
						input_function = funcName,
						function_owner = self,
						label          = NO_LABEL,
						alignment      = v.alignment,
						position       = v.position,
						rotation 			 = {x=0, y=0, z=0},
						scale          = UI_SCALE,
						width          = v.width,
						height         = (v.font_size*v.rows)+24,
						font_size      = v.font_size * 0.8,
						color          = lightgray,
						font_color     = black,
						readOnly			 = false,
						interactable	 = true,
					})
			end
		end
	end
end
--attack edit functions
function attack1Misc_up() ChangeStatAttack(INDEX_ATTACK_1_BONUS_MISC, BaseHPMAX, 1) end
function attack1Misc_down() ChangeStatAttack(INDEX_ATTACK_1_BONUS_MISC, BaseHPMAX, -1) end
function damage1Dice_up() ChangeStatAttack(INDEX_ATTACK_1_DAMAGE_DICE_COUNT, BaseHPMAX, 1) end
function damage1Dice_down() ChangeStatAttack(INDEX_ATTACK_1_DAMAGE_DICE_COUNT, BaseHPMAX, -1) end
function damage1Misc_up() ChangeStatAttack(INDEX_ATTACK_1_DAMAGE_MOD_MISC, BaseHPMAX, 1) end
function damage1Misc_down() ChangeStatAttack(INDEX_ATTACK_1_DAMAGE_MOD_MISC, BaseHPMAX, -1) end
function cycleAttack1BonusType() CycleAttackBonusType(INDEX_ATTACK_1_BONUS_INT) end
function cycleAttack1DiceType() CycleDamageDiceType(INDEX_ATTACK_1_DAMAGE_DICE_INT) end

function attack2Misc_up() ChangeStatAttack(INDEX_ATTACK_2_BONUS_MISC, BaseHPMAX, 1) end
function attack2Misc_down() ChangeStatAttack(INDEX_ATTACK_2_BONUS_MISC, BaseHPMAX, -1) end
function damage2Dice_up() ChangeStatAttack(INDEX_ATTACK_2_DAMAGE_DICE_COUNT, BaseHPMAX, 1) end
function damage2Dice_down() ChangeStatAttack(INDEX_ATTACK_2_DAMAGE_DICE_COUNT, BaseHPMAX, -1) end
function damage2Misc_up() ChangeStatAttack(INDEX_ATTACK_2_DAMAGE_MOD_MISC, BaseHPMAX, 1) end
function damage2Misc_down() ChangeStatAttack(INDEX_ATTACK_2_DAMAGE_MOD_MISC, BaseHPMAX, -1) end
function cycleAttack2BonusType() CycleAttackBonusType(INDEX_ATTACK_2_BONUS_INT) end
function cycleAttack2DiceType() CycleDamageDiceType(INDEX_ATTACK_2_DAMAGE_DICE_INT) end

function attack3Misc_up() ChangeStatAttack(INDEX_ATTACK_3_BONUS_MISC, BaseHPMAX, 1) end
function attack3Misc_down() ChangeStatAttack(INDEX_ATTACK_3_BONUS_MISC, BaseHPMAX, -1) end
function damage3Dice_up() ChangeStatAttack(INDEX_ATTACK_3_DAMAGE_DICE_COUNT, BaseHPMAX, 1) end
function damage3Dice_down() ChangeStatAttack(INDEX_ATTACK_3_DAMAGE_DICE_COUNT, BaseHPMAX, -1) end
function damage3Misc_up() ChangeStatAttack(INDEX_ATTACK_3_DAMAGE_MOD_MISC, BaseHPMAX, 1) end
function damage3Misc_down() ChangeStatAttack(INDEX_ATTACK_3_DAMAGE_MOD_MISC, BaseHPMAX, -1) end
function cycleAttack3BonusType() CycleAttackBonusType(INDEX_ATTACK_3_BONUS_INT) end
function cycleAttack3DiceType() CycleDamageDiceType(INDEX_ATTACK_3_DAMAGE_DICE_INT) end

function attack4Misc_up() ChangeStatAttack(INDEX_ATTACK_4_BONUS_MISC, BaseHPMAX, 1) end
function attack4Misc_down() ChangeStatAttack(INDEX_ATTACK_4_BONUS_MISC, BaseHPMAX, -1) end
function damage4Dice_up() ChangeStatAttack(INDEX_ATTACK_4_DAMAGE_DICE_COUNT, BaseHPMAX, 1) end
function damage4Dice_down() ChangeStatAttack(INDEX_ATTACK_4_DAMAGE_DICE_COUNT, BaseHPMAX, -1) end
function damage4Misc_up() ChangeStatAttack(INDEX_ATTACK_4_DAMAGE_MOD_MISC, BaseHPMAX, 1) end
function damage4Misc_down() ChangeStatAttack(INDEX_ATTACK_4_DAMAGE_MOD_MISC, BaseHPMAX, -1) end
function cycleAttack4BonusType() CycleAttackBonusType(INDEX_ATTACK_4_BONUS_INT) end
function cycleAttack4DiceType() CycleDamageDiceType(INDEX_ATTACK_4_DAMAGE_DICE_INT) end

function attack5Misc_up() ChangeStatAttack(INDEX_ATTACK_5_BONUS_MISC, BaseHPMAX, 1) end
function attack5Misc_down() ChangeStatAttack(INDEX_ATTACK_5_BONUS_MISC, BaseHPMAX, -1) end
function damage5Dice_up() ChangeStatAttack(INDEX_ATTACK_5_DAMAGE_DICE_COUNT, BaseHPMAX, 1) end
function damage5Dice_down() ChangeStatAttack(INDEX_ATTACK_5_DAMAGE_DICE_COUNT, BaseHPMAX, -1) end
function damage5Misc_up() ChangeStatAttack(INDEX_ATTACK_5_DAMAGE_MOD_MISC, BaseHPMAX, 1) end
function damage5Misc_down() ChangeStatAttack(INDEX_ATTACK_5_DAMAGE_MOD_MISC, BaseHPMAX, -1) end
function cycleAttack5BonusType() CycleAttackBonusType(INDEX_ATTACK_5_BONUS_INT) end
function cycleAttack5DiceType() CycleDamageDiceType(INDEX_ATTACK_5_DAMAGE_DICE_INT) end

function attack6Misc_up() ChangeStatAttack(INDEX_ATTACK_6_BONUS_MISC, BaseHPMAX, 1) end
function attack6Misc_down() ChangeStatAttack(INDEX_ATTACK_6_BONUS_MISC, BaseHPMAX, -1) end
function damage6Dice_up() ChangeStatAttack(INDEX_ATTACK_6_DAMAGE_DICE_COUNT, BaseHPMAX, 1) end
function damage6Dice_down() ChangeStatAttack(INDEX_ATTACK_6_DAMAGE_DICE_COUNT, BaseHPMAX, -1) end
function damage6Misc_up() ChangeStatAttack(INDEX_ATTACK_6_DAMAGE_MOD_MISC, BaseHPMAX, 1) end
function damage6Misc_down() ChangeStatAttack(INDEX_ATTACK_6_DAMAGE_MOD_MISC, BaseHPMAX, -1) end
function cycleAttack6BonusType() CycleAttackBonusType(INDEX_ATTACK_6_BONUS_INT) end
function cycleAttack6DiceType() CycleDamageDiceType(INDEX_ATTACK_6_DAMAGE_DICE_INT) end

function ChangeStatAttack(statIndex, valueLimit, inc)
	if inc == 0 then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local statStatic = tonumber(databaseTable[statIndex])

	local statValue = tonumber(databaseTable[statIndex]) + inc

	if statValue > valueLimit then
		statValue = valueLimit
		printToAll('Attack Modifiers can\'t be higher than MAX!', {1, 0, 0})
	elseif statValue < -10 then
		statValue = -10
		printToAll('Attack Modifiers can\'t go below -10!', {1, 0, 0})
	end

	databaseTable[statIndex] = tostring(statValue)
	SaveDatabase(databaseTable)

	RefreshAttackDetailButtons()
	RefreshAttackDetailButtons()
	LoadAttackDetails()
end

function CycleAttackBonusType(currentBonusINT)
	if not edit then
		return
	end

	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local bonusString = 'false'
	local currentBonusValue = databaseTable[currentBonusINT]
	local changedBonusINT = currentBonusValue + 1

	if changedBonusINT > 12 then
		changedBonusINT = 7
	end

	if changedBonusINT == 7 then
		bonusString = 'STR'
	elseif changedBonusINT == 8 then
		bonusString = 'DEX'
	elseif changedBonusINT == 9 then
		bonusString = 'CON'
	elseif changedBonusINT == 10 then
		bonusString = 'INT'
	elseif changedBonusINT == 11 then
		bonusString = 'WIS'
	elseif changedBonusINT == 12 then
		bonusString = 'CHA'
	end

	databaseTable[currentBonusINT] = changedBonusINT
	databaseTable[currentBonusINT + 1] = bonusString
	SaveDatabase(databaseTable)

	LoadAttackDetails()
end

function CycleDamageDiceType(currentDiceINT)
	if not edit then
		return
	end
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	local diceString = 'false'
	local currentDiceValue = databaseTable[currentDiceINT]
	local changedDiceINT = currentDiceValue + 1

	if changedDiceINT > 5 then
		changedDiceINT = 1
	end

	if changedDiceINT == 1 then
		diceString = 'd4 +'
	elseif changedDiceINT == 2 then
		diceString = 'd6 +'
	elseif changedDiceINT == 3 then
		diceString = 'd8 +'
	elseif changedDiceINT == 4 then
		diceString = 'd10 +'
	elseif changedDiceINT == 5 then
		diceString = 'd12 +'
	end

	databaseTable[currentDiceINT] = changedDiceINT
	databaseTable[currentDiceINT + 1] = diceString
	SaveDatabase(databaseTable)
	LoadAttackDetails()
end

function RefreshAttackDetailButtons()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	GenerateAttackMods()
	local buttons = self.getButtons()

	for i = 1, 6 do
		local subTableBonus = i .. '.2'
		local subTableDiceCount = i .. '.7'
		local subTableDMDMod = i .. '.10'

		for k, v in pairs(attack_table) do
				v.value = tonumber(databaseTable[k])
		end

		for k, v in pairs(attack_table) do
			if v.subTable >= tostring(i + 0.1) and v.subTable <= tostring(i + 0.99) then
				for _, buttonValue in pairs(buttons) do
					if buttonValue.click_function == v.name .. v.subTable then
						if v.subTable == subTableBonus or v.subTable == subTableDiceCount or v.subTable == subTableDMDMod then
							if v.subTable >= tostring(i + 0.1) and v.subTable <= tostring(i + 0.99) then
								self.editButton({ index = buttonValue.index, label = databaseTable[k], position = buttonValue.position })
								break
							end
						end
					else
						if buttonValue.click_function == v.name .. v.subTable then
							self.editButton({ index = buttonValue.index, label = databaseTable[k], position = buttonValue.position })
							break
						end
					end
				end
			elseif v.subTable < tostring(i + 0.1) and v.subTable > tostring(i + 0.99) then
				break
			end
		end
	end
end


--attack button functions
function AttackButton1(color, obj)
	rollAttack(color, obj, INDEX_ATTACK_1_NAME, INDEX_ATTACK_1_BONUS, INDEX_ATTACK_1_DAMAGE_DICE_COUNT, INDEX_ATTACK_1_DAMAGE_DICE_TYPE, INDEX_ATTACK_1_DAMAGE_MOD, INDEX_ATTACK_1_TYPE)
end

function AttackButton2(color, obj)
	rollAttack(color, obj, INDEX_ATTACK_2_NAME, INDEX_ATTACK_2_BONUS, INDEX_ATTACK_2_DAMAGE_DICE_COUNT, INDEX_ATTACK_2_DAMAGE_DICE_TYPE, INDEX_ATTACK_2_DAMAGE_MOD, INDEX_ATTACK_2_TYPE)
end

function AttackButton3(color, obj)
	rollAttack(color, obj, INDEX_ATTACK_3_NAME, INDEX_ATTACK_3_BONUS, INDEX_ATTACK_3_DAMAGE_DICE_COUNT, INDEX_ATTACK_3_DAMAGE_DICE_TYPE, INDEX_ATTACK_3_DAMAGE_MOD, INDEX_ATTACK_3_TYPE)
end

function AttackButton4(color, obj)
	rollAttack(color, obj, INDEX_ATTACK_4_NAME, INDEX_ATTACK_4_BONUS, INDEX_ATTACK_4_DAMAGE_DICE_COUNT, INDEX_ATTACK_4_DAMAGE_DICE_TYPE, INDEX_ATTACK_4_DAMAGE_MOD, INDEX_ATTACK_4_TYPE)
end

function AttackButton5(color, obj)
	rollAttack(color, obj, INDEX_ATTACK_5_NAME, INDEX_ATTACK_5_BONUS, INDEX_ATTACK_5_DAMAGE_DICE_COUNT, INDEX_ATTACK_5_DAMAGE_DICE_TYPE, INDEX_ATTACK_5_DAMAGE_MOD, INDEX_ATTACK_5_TYPE)
end

function AttackButton6(color, obj)
	rollAttack(color, obj, INDEX_ATTACK_6_NAME, INDEX_ATTACK_6_BONUS, INDEX_ATTACK_6_DAMAGE_DICE_COUNT, INDEX_ATTACK_6_DAMAGE_DICE_TYPE, INDEX_ATTACK_6_DAMAGE_MOD, INDEX_ATTACK_6_TYPE)
end

-- Reset Sheet Functions
function ResetSheetCheck()
	local databaseTable = GetDatabase()
	if #databaseTable == 0 then
		return
	end

	if edit then
		return
	end

	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == 'ResetSheetCheck' then
			self.editButton({ index = buttonValue.index, click_function = 'sure', label = 'Are you sure?', position = buttonValue.position })
		elseif buttonValue.click_function == 'EditMode' then
			self.editButton({ index = buttonValue.index, click_function = 'ResetSheet', label = 'Yes', position = buttonValue.position })
		elseif buttonValue.click_function == 'LoadAll' then
			self.editButton({ index = buttonValue.index, click_function = 'KeepSheet', label = 'No', position = buttonValue.position })
		end
	end
end

function ResetSheet()
	local databaseTable = GetDatabase()
	if #databaseTable > 0 then
		database.setDescription('10;10;10;10;10;10;0;0;0;0;0;0;000000000000000000000000;nnnnnnnnnnnnnnnnnnnnnnnn;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;nnnnnnn;1;1;0;10;0;1;00;0;1;2;nnnnnnnnnnnnnnnnnn;n;n;00;00;00;00;00;00;00;00;00;nnnnnnnnnnnnnnnnnnnnnnnn;0;0;0;0;2;10;INT;1;0;0;Class Resource;0;0;Class Resource;0;10;0;0;0;0;0;0;0;0;0;0;0;0;3;0;nnnnnn;d6;M;30;30;NAME;RACE;CLASS;DEITY;PLAYER;BACKGROUND;ALIGNMENT;AGE;HEIGHT;WEIGHT;EYES;SKIN;HAIR;SPELL CLASS;0;0;0;0;0;0;FEATURES & TRAITS;ADDITIONAL EQUIPMENT;PERSONALITY TRAITS;IDEALS;BONDS;FLAWS;PROFICIENCIES;LANGUAGES;TOOLS;Attack One;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Two;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Three;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Four;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;Attack Five;0;7;STR;0;0;1;1;d4 + ;0;0;TYPE;0;Attack Six;0;7;STR;0;0;1;1;d4 +;0;0;TYPE;0;1;0')
		edit = false
	end


	self.clearButtons()
	FlushSheet()

	onload()
end

function KeepSheet()
	local buttons = self.getButtons()
	for _, buttonValue in pairs(buttons) do
		if buttonValue.click_function == 'sure' then
			self.editButton({ index = buttonValue.index, click_function = 'ResetSheetCheck', label = 'New Sheet', position = buttonValue.position })
		elseif buttonValue.click_function == 'ResetSheet' then
			self.editButton({ index = buttonValue.index, click_function = 'EditMode', label = 'Edit', position = buttonValue.position })
		elseif buttonValue.click_function == 'KeepSheet' then
			self.editButton({ index = buttonValue.index, click_function = 'LoadAll', label = 'Load', position = buttonValue.position })
		end
	end
end

function FlushSheet()
	if type(skill_object) == 'table' then
		for k, v in pairs(skill_object) do
			v.destruct()
		end
	end

	if type(name_object) == 'table' then
		for k, v in pairs(name_object) do
			v.destruct()
		end
	end
	skill_object = {}
	name_object = {}
	self.clearButtons()
	self.clearInputs()
	onload()
end
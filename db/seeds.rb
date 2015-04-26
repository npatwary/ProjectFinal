# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#do not use system_user for logging. for lookup table management only

user1 = User.create(user_name:"testuser1",email:"testuser1@gmail.com",password:"pwd123",password_confirmation:"pwd123")
user2 = User.create(user_name:"testuser2",email:"testuser2@gmail.com",password:"pwd234",password_confirmation:"pwd234")
user3 = User.create(user_name:"testuser3",email:"testuser3@gmail.com",password:"pwd234",password_confirmation:"pwd234")
game1 = Game.create(name:"testgame1",game_password:"axxxxxx",dungeon_master:user1,map:"testuser1newgame.jpg")

game2 = Game.create(name:"testgame2",game_password:"axxxxxx",dungeon_master:user2)
game3 = Game.create(name:"testgame3",game_password:"axxxxxx",dungeon_master:user3)

GameInvitation.create(game_password:"axxxxxxx",game:game1,dungeon_master:user1,user_player:user2)
GameInvitation.create(game_password:"axxxxxxx",game:game1,dungeon_master:user1,user_player:user3)

GameInvitation.create(game_password:"axxxxxxx",game:game2,dungeon_master:user2,user_player:user1)
GameInvitation.create(game_password:"axxxxxxx",game:game3,dungeon_master:user3,user_player:user1)


#player_characters playinging in game1 in which user1 is dungeon master
player1 = PlayerCharacter.create(name:"The Great Giant", creator:user3,game:game1)
player2 = PlayerCharacter.create(name:"Salamander - The Dragon Slayer", creator:user2,game:game1)

## Full Character sheet ##
# Setup PlayerCharacter
player3 = PlayerCharacter.create(name:"BigChree", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55", creator:user1,game:game3)
# Setup related objects to PlayerCharacter
ability_names = ['Strength', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma']
skill_names = ['Acrobatics', 'Animal Handling', 'Arcana', 'Athletics', 'Deception', 'History', 'Insight', 'Intimidation', 'Investigation', 'Medicine', 'Nature', 'Perception', 'Performance', 'Religion', 'Sleight of Hand', 'Stealth', 'Survival']
skill_abilities = ['Dex', 'Wis', 'Int','Str', 'Cha', 'Int', 'Wis', 'Cha', 'Int', 'Wis', 'Int', 'Wis', 'Cha', 'Cha', 'Int', 'Dex', 'Dex', 'Wis']
ability_names.each do |name| player3.ability_scores.create(name: name) end
ability_names.each do |name| player3.saving_throws.create(name: name) end
Hash[skill_names.zip(skill_abilities)].each do |n, a| player3.skills.create(name: n, ability: a) end
player3.attack_weapons.create(name: 'Squirt Gun', attackBonus: 5, damage: 99, typeDnD: 'wet', cost:100, unit:'gp' )
player3.armor_and_shields.create(name: 'Blademail', disadvantage: 'Stealth', cost: 100, unit:'gp')
player3.create_wealth
player3.allies_and_organizations.create(name: 'Zeus', description: 'God of Mt. Olympus')
## Full Character and related objects ##

PlayerCharacter.create(isUsed:"false", name:"The Great Giant", creator:user1)
PlayerCharacter.create(isUsed:"false", name:"Salamander - The Dragon Slayer", creator:user1)


Game.create(name:"testgamepc",game_password:"apcxxxx",dungeon_master:user1, 
	player_characters: PlayerCharacter.create([{isUsed:"false", name:"Monk", creator:user3}, {isUsed:"false", name:"Mice", creator:user2}]) )

#Wealth
Wealth.create(gold:50,silver:50,electrum:50,platinum:50,copper:50,player_character:player1)



#player_characters belonging to user1 playinging in game2 and game3
player4 = PlayerCharacter.create(name:"Luffy - The Rubberman", creator:user1,game:game2)
PlayerCharacter.create(name:"Zoro - The fighter", creator:user1,game:game3)


#Wealth
Wealth.create(gold:500, copper:1000, silver: 500, electrum: 100,platinum: 10, player_character:player2)
Wealth.create(gold:5000, copper:1000, silver: 500, electrum: 400,  platinum: 100, player_character:player3)




# Look up table for skills used for class selection
SkillsTableForClass.create([{name: "Acrobatics"}, {name: "Animal Handling"},{name: "Arcana"},{name: "Athletics"},
	{name: "Deception"}, {name: "History"},{name: "Insight"},{name: "Intimidation"},{name: "Investigation"},{name: "Medicine"},
	{name: "Nature"},{name: "Perception"},{name: "Performance"},{name: "Religion"},{name: "Sleight of Hand"},
	{name: "Stealth"},{name: "Survival"}]);

# Lookup Table for saving throughs used for class selection
SavingThroughsTableForClass.create([{name:"Strength"},{name:"Dexterity"},{name:"Constitution"},
	        {name:"Intelligence"},{name:"Wisdom"},{name:"Charisma"}]);

# Lookup Table for class features

# Class 1: barbarian
PlayerCharacterClass.create(name:"Barbarian", hitDice:"1d12",currentHitPoint:12, maximumHitPoint:12, armorProficiency: "Light Armor, medium Armor, shield",
	weaponProficiency: "Simple Weapons, martial weapons", toolsProfiency: "None",savingThroughs: [1,3], proficientSkills: [2,4,8,11,12,17],
	numberOfAllowedSkills:2,
	equipment: ["(a) a greataxe or (b) any martial melle weapon",  
		"(a) two hand axes or (b) any simple weapon", 
		"An explorer pack and four Javenile"]);

# Class 2: bard
PlayerCharacterClass.create(name:"Bard", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "Light Armor",
	weaponProficiency: "Simple Weapons, hand crossbows, longswords, rapier, shortswords", toolsProfiency: "Any Three musical instruments",
	savingThroughs: [2,6], proficientSkills: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],numberOfAllowedSkills:3,
	equipment: ["(a) a rapier, (b) a longsword, or (c) any simple weapon",  
			        "(a) a diplomats pack, (b) or an entertainers pack", 
			        "(a) lute or (b) any othre musical instruments)",
					"Leather armor and a dagger"],
	spellcastAbility: 6,spellSaveDC: 8,spellAttackBonus: 0);

# Class 3: Cleric
PlayerCharacterClass.create(name:"Cleric", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "Light Armor, medium armor, shield",
	weaponProficiency: "All simple weapons", toolsProfiency: "None",
	savingThroughs: [5,6], proficientSkills: [6,7,10,12,14], numberOfAllowedSkills:2,
	equipment: ["(a) a mace, or (b) a warhammer (if proficient)",  
			        "(a) scale mail, (b) lather armor, or (c) chain mail (if proficient)", 
			        "(a) a light crossbow and 20 bolts, or (b) any simple weapon",
					"(a) a priest pack or (b) an explorer pack"],
	spellcastAbility: 5,spellSaveDC: 8,spellAttackBonus: 0);


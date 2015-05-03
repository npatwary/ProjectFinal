
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
game4 = Game.create(name:"testgame4",game_password:"axxxxxx",dungeon_master:user1)

GameInvitation.create(game_password:"axxxxxxx",game:game4,dungeon_master:user1,user_player:user2)
GameInvitation.create(game_password:"axxxxxxx",game:game4,dungeon_master:user1,user_player:user3)

GameInvitation.create(game_password:"axxxxxxx",game:game2,dungeon_master:user2,user_player:user1)
GameInvitation.create(game_password:"axxxxxxx",game:game3,dungeon_master:user3,user_player:user2)


#player_characters playinging in game1 in which user1 is dungeon master
player1 = PlayerCharacter.create(name:"The Great Giant", classDnD:"Giant", level:3, background:"background", race:"asian",creator:user3,game:game1,isUsed:"true")
player2 = PlayerCharacter.create(name:"Salamander - The Dragon Slayer",classDnD:"Wizard", level:1, background:"background", race:"asian", creator:user2,game:game1,isUsed:"true")

## Full Character sheet ##
# Setup PlayerCharacter
player3 = PlayerCharacter.create(name:"BigChree", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55", creator:user1,game:game3,isUsed:"true")
player4 = PlayerCharacter.create(name:"Saleha01", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55", creator:user2,game:game1,isUsed:"true")
player5 = PlayerCharacter.create(name:"Saleha02", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55", creator:user2,game:game2,isUsed:"true")
player6 = PlayerCharacter.create(name:"Saleha03", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55", creator:user2,game:game3,isUsed:"true")
# Setup related objects to PlayerCharacter
ability_names = ['Strength', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma']
skill_names = ['Acrobatics', 'Animal Handling', 'Arcana', 'Athletics', 'Deception', 'History', 'Insight', 'Intimidation', 'Investigation', 'Medicine', 'Nature', 'Perception', 'Performance', 'Religion', 'Sleight of Hand', 'Stealth', 'Survival']
skill_abilities = ['Dex', 'Wis', 'Int','Str', 'Cha', 'Int', 'Wis', 'Cha', 'Int', 'Wis', 'Int', 'Wis', 'Cha', 'Cha', 'Int', 'Dex', 'Dex', 'Wis']

ability_names.each do |name| player3.ability_scores.create(name: name) end
ability_names.each do |name| player3.saving_throws.create(name: name) end
Hash[skill_names.zip(skill_abilities)].each do |n, a| player3.skills.create(name: n, ability: a) end
player3.attack_weapons.create(name: 'Squirt Gun', attackBonus: 5, damage: 99, typeDnD: 'wet', cost:100, unit:'gp' )
player3.armor_and_shields.create(name: 'Blademail', disadvantage: 'Stealth', cost: 100, unit:'gp')
player3.create_wealth(gold:50,silver:50,electrum:50,platinum:50,copper:50)
player3.allies_and_organizations.create(name: 'Zeus', description: 'God of Mt. Olympus')
## Full Character and related objects ##



ability_names.each do |name| player4.ability_scores.create(name: name) end
ability_names.each do |name| player4.saving_throws.create(name: name) end
Hash[skill_names.zip(skill_abilities)].each do |n, a| player4.skills.create(name: n, ability: a) end
player4.attack_weapons.create(name: 'Squirt Gun', attackBonus: 5, damage: 99, typeDnD: 'wet', cost:100, unit:'gp' )
player4.armor_and_shields.create(name: 'Blademail', disadvantage: 'Stealth', cost: 100, unit:'gp')
player4.create_wealth(gold:50,silver:50,electrum:50,platinum:50,copper:50)
player4.allies_and_organizations.create(name: 'Zeus', description: 'God of Mt. Olympus')

ability_names.each do |name| player5.ability_scores.create(name: name) end
ability_names.each do |name| player5.saving_throws.create(name: name) end
Hash[skill_names.zip(skill_abilities)].each do |n, a| player5.skills.create(name: n, ability: a) end
player5.attack_weapons.create(name: 'Squirt Gun', attackBonus: 5, damage: 99, typeDnD: 'wet', cost:100, unit:'gp' )
player5.armor_and_shields.create(name: 'Blademail', disadvantage: 'Stealth', cost: 100, unit:'gp')
player5.create_wealth(gold:50,silver:50,electrum:50,platinum:50,copper:50)
player5.allies_and_organizations.create(name: 'Zeus', description: 'God of Mt. Olympus')

ability_names.each do |name| player6.ability_scores.create(name: name) end
ability_names.each do |name| player6.saving_throws.create(name: name) end
Hash[skill_names.zip(skill_abilities)].each do |n, a| player6.skills.create(name: n, ability: a) end
player6.attack_weapons.create(name: 'Squirt Gun', attackBonus: 5, damage: 99, typeDnD: 'wet', cost:100, unit:'gp' )
player6.armor_and_shields.create(name: 'Blademail', disadvantage: 'Stealth', cost: 100, unit:'gp')
player6.create_wealth(gold:50,silver:50,electrum:50,platinum:50,copper:50)
player6.allies_and_organizations.create(name: 'Zeus', description: 'God of Mt. Olympus')



PlayerCharacter.create(isUsed:"false", name:"The Great Rock", classDnD:"Fighter", level:1, background:"background", race:"asian",creator:user1)
PlayerCharacter.create(isUsed:"false", name:"Gray - The Ice Maker",classDnD:"Wizard", level:1, background:"background", race:"asian", creator:user1)


Game.create(name:"testgamepc",game_password:"apcxxxx",dungeon_master:user1, 
	player_characters: PlayerCharacter.create([{isUsed:"true", name:"Monk",classDnD:"Monk", level:1, background:"background", race:"asian", creator:user3}, {isUsed:"true", name:"Mice",classDnD:"Paladin", level:1, background:"background", race:"dwarf", creator:user2}]) )

#Wealth
Wealth.create(gold:50,silver:50,electrum:50,platinum:50,copper:50,player_character:player1)




#player_characters belonging to user1 playinging in game2 and game3
player4 = PlayerCharacter.create(name:"Luffy - The Rubberman",classDnD:"Fighter", level:1, background:"background", race:"asian", creator:user3,game:game2,isUsed:"true")
PlayerCharacter.create(name:"Zoro - The fighter", classDnD:"Fighter", level:1, background:"background", race:"asian",creator:user2,isUsed:"false")


#Wealth
Wealth.create(gold:500, copper:1000, silver: 500, electrum: 100,platinum: 10, player_character:player2)
#Wealth.create(gold:5000, copper:1000, silver: 500, electrum: 400,  platinum: 100, player_character:player3)

Cantrip.create(name:"Light", player_character:player3)
Spell.create(name:"Animal Friendship", player_character:player3)

#look up table for race selection
Race.create(name:"Mountain Dwarf",strength:2,dexterity:0,constitution:2,intelligence:0,wisdom:0,charisma:0,base_speed:25,max_age:350,alignment:"lawful",language:"Languages: common, dwarvish",tools:"Tool Proficiency: with arisan tools of your choice -- smith, brewer or mason \n Stonecunning:always proficient with double the proficiency bonus on history checks related to stonework",features:"Dwarven Combat Training:battleaxe,handaxe, throwing hammer and warhammer \n MountainDwarven Armor Training:light or medium armour \n can move 25 feet even in heavy armor \n Darkvision: see 60 feet black-and-white in pitch-dark \n Dwarven resilience: Advantage on saving throws against poison, resistance against poison damage \n Dwarven Toughness: hit point maximum increases by 1 every time you level up")
Race.create(name:"Human",strength:1,dexterity:1,constitution:1,intelligence:1,wisdom:1,charisma:1,base_speed:30,max_age:100,language:"Languages: common, dwarvish")
Race.create(name:"Elf",strength:0,dexterity:2,constitution:0,intelligence:0,wisdom:0,charisma:0,base_speed:30,max_age:750,alignment:"freedom loving",language:"Languages: common,elvish",features:"Darkvision:  can see 60 feet in black-and-white in dim light or darkness \n Keen Senses:perception skill FeyAncestry: advantage against being charmed, magic can not put you to sleep \n Trance: do not sleep, meditate deeply for 4 hours remaining unconscious")


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

# Class 3: Cleric
PlayerCharacterClass.create(name:"Cleric", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "Light Armor, medium armor, shield",
	weaponProficiency: "All simple weapons", toolsProfiency: "None",
	savingThroughs: [5,6], proficientSkills: [6,7,10,12,14], numberOfAllowedSkills:2,
	equipment: ["(a) a mace, or (b) a warhammer (if proficient)",  
			        "(a) scale mail, (b) lather armor, or (c) chain mail (if proficient)", 
			        "(a) a light crossbow and 20 bolts, or (b) any simple weapon",
					"(a) a priest pack or (b) an explorer pack"],
	spellcastAbility: 5,spellSaveDC: 8,spellAttackBonus: 0);

# Class 4: Druid
PlayerCharacterClass.create(name:"Druid", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "Light Armor, medium armor, shield (will not wear armot or use shield made of metal)",
	weaponProficiency: "Clubs, daggers, darts, javelins, maces,
quarterstaffs, scimitars, sickles, slings, spears", toolsProfiency: "Herbalism kit",
	savingThroughs: [4,5], proficientSkills: [2,3,7,10,11,12,15,18], numberOfAllowedSkills:2,
	equipment: ["(a) a w ooden shield or (b) any simple weapon",  
			        "(a) a scimitar or (b) any simple melee weapon", 
			        "Leather armor, an explorer’s pack, and a druidic focus"],
	spellcastAbility: 5,spellSaveDC: 8,spellAttackBonus: 0);

# Class 5: Fighter
PlayerCharacterClass.create(name:"Fighter", hitDice:"1d10",currentHitPoint:10, maximumHitPoint:10, armorProficiency: "All armor, shield",
	weaponProficiency: "Simple weapons, martial weapons", toolsProfiency: "None",
	savingThroughs: [1,3], proficientSkills: [1,2,4,6,7,8,12,18], numberOfAllowedSkills:2,
	equipment: ["(a) chain mail or (b) leather, longbow, and 20 arrows",  
			        "(a) a martial weapon and a shield or (b) two martial weapons", 
			        "(a) a light c rossbow and 20 bolts or (b) two handaxes",
					"(a) a dungeoneer’s pack or (b) an explorer’s pack"],
	spellcastAbility: 4,spellSaveDC: 8,spellAttackBonus: 0);

# Class 6: Monk
PlayerCharacterClass.create(name:"Monk", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "None",
	weaponProficiency: "Simple weapons, shortswords", toolsProfiency: "Choose one type o f artisan’s tools or one musical instrument",
	savingThroughs: [1,2], proficientSkills: [1,4,6,7,15,17], numberOfAllowedSkills:2,
	equipment: ["(a) a shortsword or (b) any simple weapon",  
			        "(a) a dungeoneer’s pack or (b) an explorer’s pack", 
			        "10 darts"]);

# Class 7: Paladin
PlayerCharacterClass.create(name:"Paladin", hitDice:"1d10",currentHitPoint:10, maximumHitPoint:10, armorProficiency: "All armor, shield",
	weaponProficiency: "Simple weapons, martial weapons", toolsProfiency: "None",
	savingThroughs: [5,6], proficientSkills: [4,7,8,14,15], numberOfAllowedSkills:2,
	equipment: ["(a) a martial weapon and a shield or (b) two martial weapons",  
			        "(a) five javelins or (b) any simple melee weapon", 
			        "(a) a priest’s pack or (b) an explorer’s pack",
					"Chain mail and a holy symbol"],
	spellcastAbility: 6,spellSaveDC: 8,spellAttackBonus: 0);

# Class 8: Ranger
PlayerCharacterClass.create(name:"Ranger", hitDice:"1d10",currentHitPoint:10, maximumHitPoint:10, armorProficiency: "Light Armor, medium armor, shield",
	weaponProficiency: "Simple weapons, martial weapons", toolsProfiency: "None",
	savingThroughs: [1,2], proficientSkills: [2,4,7,9,11,13,17,18], numberOfAllowedSkills:3,
	equipment: ["(a) scale mail or (b) leather armor",  
			        "(a) two shortswords or (b) two simple melee w eapons", 
			        "(a) a dungeoneer’s pack or (b) an explorer’s pack",
					"A longbow and a quiver o f 20 arrows"],
	spellcastAbility: 5,spellSaveDC: 8,spellAttackBonus: 0);

# Class 9: Rogue
PlayerCharacterClass.create(name:"Rogue", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "Light Armor",
	weaponProficiency: "Simple weapons, hand crossbows, longswords, rapiers, shortswords", toolsProfiency: "Thieves’ tools",
	savingThroughs: [2,4], proficientSkills: [1,4,5,7,8,9,12,13,14,16,17], numberOfAllowedSkills:4,
	equipment: ["(a) a rapier or (b) a shortsword",  
			        "(a) a shortbow and quiver of 20 arrows or (b) a shortsword", 
			        "(a) a burglar’s pack, (b) a dungeoneer’s pack, or (c) an explorer’s pack",
					"Leather armor, two daggers, and thieves’ tools"],
	spellcastAbility: 4,spellSaveDC: 8,spellAttackBonus: 0);

# Class 10: Sorcerer
PlayerCharacterClass.create(name:"Sorcerer", hitDice:"1d6",currentHitPoint:6, maximumHitPoint:6, armorProficiency: "None",
	weaponProficiency: "Daggers, darts, slings, quarterstaffs, light crossbows", toolsProfiency: "None",
	savingThroughs: [3,6], proficientSkills: [3,5,7,8,14,15], numberOfAllowedSkills:2,
	equipment: ["(a) a light c rossbow and 20 bolts or (b) any simple weapon",  
			        "(a) a component pouch or (b) an arcane focus", 
			        "(a) a dungeoneer’s pack or (b) an explorer’s pack",
					"Two daggers"],
	spellcastAbility: 6,spellSaveDC: 8,spellAttackBonus: 0);

# Class 11: Warlock
PlayerCharacterClass.create(name:"Warlock", hitDice:"1d8",currentHitPoint:8, maximumHitPoint:8, armorProficiency: "Light Armor",
	weaponProficiency: "All simple weapons", toolsProfiency: "None",
	savingThroughs: [5,6], proficientSkills: [3,5,6,8,9,11,15], numberOfAllowedSkills:2,
	equipment: ["(a) a light c rossbow and 20 bolts or (b) any simple weapon",  
			        "(a) a component pouch or (b) an arcane focus", 
			        "(a) a scholar’s pack or (b) a dungeoneer’s pack",
					"Leather armor, any simple w eapon, and two daggers"],
	spellcastAbility: 6,spellSaveDC: 8,spellAttackBonus: 0);

# Class 12: Wizard
PlayerCharacterClass.create(name:"Wizard", hitDice:"1d6",currentHitPoint:6, maximumHitPoint:6, armorProficiency: "None",
	weaponProficiency: "Daggers, darts, slings, quarterstaffs, light crossbows", toolsProfiency: "None",
	savingThroughs: [4,6], proficientSkills: [3,6,7,9,10,15], numberOfAllowedSkills:2,
	equipment: ["(a) a quarterstaff or (b) a dagger",  
			        "(a) a component pouch or (b) an arcane focus", 
			        "(a) a scholar’s pack or (b) an explorer’s pack",
					"A spellbook"],
	spellcastAbility: 4,spellSaveDC: 8,spellAttackBonus: 0);


HideAttributesTable.create(pc_id:1,ability_reveal: true);
HideAttributesTable.create(pc_id:2,ability_reveal: true);
HideAttributesTable.create(pc_id:3,ability_reveal: false);
HideAttributesTable.create(pc_id:4,ability_reveal: true);
HideAttributesTable.create(pc_id:5,ability_reveal: true);
HideAttributesTable.create(pc_id:6,ability_reveal: true);
HideAttributesTable.create(pc_id:7,ability_reveal: true);
HideAttributesTable.create(pc_id:8,ability_reveal: true);  


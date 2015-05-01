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


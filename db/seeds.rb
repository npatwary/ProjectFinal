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


player3 = PlayerCharacter.create(name:"BigChree", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55", creator:user1,game:game3)




PlayerCharacter.create(isUsed:"false", name:"The Great Giant", creator:user1)
PlayerCharacter.create(isUsed:"false", name:"Salamander - The Dragon Slayer", creator:user1)


Game.create(name:"testgamepc",game_password:"apcxxxx",dungeon_master:user1, 
	player_characters: PlayerCharacter.create([{isUsed:"false", name:"Monk", creator:user1}, {isUsed:"false", name:"Mice", creator:user2}]) )

player = PlayerCharacter.create(name:"BigChree", classDnD:"Wizard", level:3, background:"background", race:"asian", alignment:"straight", experiencePoints:99, inspiration:"yes", proficiencyBonus:2, armorClass:5, initiative:3, speed:35, currentHitPoints:50, maxHitPoints:100, temporaryHitPoints:50, totalHitDice:"1D5", hitDice:"10D7", deathSaveSuccesses:1, deathSaveFailures:1, personalityTraits:"Loud", ideals:"simplicity", bonds:"and stocks", flaws:"always right", attacksDescription:"Spells", passiveWisdom:"charisma", otherProficienciesAndLanguages:"english", maxEquipmentCarryCapacity:250, currentEquipmentCarryCapacity:150, featuresAndTraits:"really upbeat", age:22, height:"5 feet", weight:"150", eyes:"blue", skin:"light", hair:"dark", characterAppearance:"rough", characterBackstory:"A lone wolf", additionalFeaturesAndTraits:"knows how to cook", treasure:"1,000,000 gp", spellCastingAbility:"Wisdom", spellSaveDC:"yup", spellAttackBonus:"55")


#Wealth
Wealth.create(gold:50,silver:50,electrum:50,platinum:50,copper:50,player_character:player1)



#player_characters belonging to user1 playinging in game2 and game3
player4 = PlayerCharacter.create(name:"Luffy - The Rubberman", creator:user1,game:game2)
PlayerCharacter.create(name:"Zoro - The fighter", creator:user1,game:game3)


#Wealth
Wealth.create(gold:2000, copper:1000, silver: 500, electrum: 400, platinum: 200, player_character:player1)
Wealth.create(gold:500, copper:1000, silver: 500, electrum: 100, player_character:player2)
Wealth.create(gold:5000, copper:1000, silver: 500, electrum: 400,  platinum: 0, player_character:player3)


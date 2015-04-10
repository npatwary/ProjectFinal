# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(user_name:"testuser1",email:"testuser1@gmail.com",password:"pwd1",password_confirmation:"pwd1")
user2 = User.create(user_name:"testuser2",email:"testuser2@gmail.com",password:"pwd2",password_confirmation:"pwd2")
user3 = User.create(user_name:"testuser3",email:"testuser3@gmail.com",password:"pwd2",password_confirmation:"pwd2")
game1 = Game.create(name:"testgame1",game_password:"axxxxxx",dungeon_master:user1,map:"testuser1newgame.jpg")
game2 = Game.create(name:"testgame2",game_password:"axxxxxx",dungeon_master:user2)
game3 = Game.create(name:"testgame3",game_password:"axxxxxx",dungeon_master:user3)

GameInvitation.create(game_password:"axxxxxxx",game:game1,dungeon_master:user1,user_player:user2)
GameInvitation.create(game_password:"axxxxxxx",game:game1,dungeon_master:user1,user_player:user3)

GameInvitation.create(game_password:"axxxxxxx",game:game2,dungeon_master:user2,user_player:user1)
GameInvitation.create(game_password:"axxxxxxx",game:game3,dungeon_master:user3,user_player:user1)



PlayerCharacter.create(isUsed:"false", name:"The Great Giant", creator:user1)
PlayerCharacter.create(isUsed:"false", name:"Salamander - The Dragon Slayer", creator:user1)


Game.create(name:"testgamepc",game_password:"apcxxxx",dungeon_master:user1, 
	player_characters: PlayerCharacter.create([{isUsed:"false", name:"Monk", creator:user1}, {isUsed:"false", name:"Mice", creator:user2}]) )


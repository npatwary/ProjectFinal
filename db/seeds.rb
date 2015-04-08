# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(user_name:"testuser1",email:"testuser1@gmail.com",password:"pwd123",password_confirmation:"pwd123")
user2 = User.create(user_name:"testuser2",email:"testuser2@gmail.com",password:"pwd234",password_confirmation:"pwd234")
user3 = User.create(user_name:"testuser3",email:"testuser3@gmail.com",password:"pwd234",password_confirmation:"pwd234")
game1 = Game.create(name:"testgame1",game_password:"axxxxxx",dungeon_master:user1,map:"testuser1newgame.jpg",player_characters: 
	PlayerCharacter.create(name:"The Great Giant", creator:user1))

game2 = Game.create(name:"testgame2",game_password:"axxxxxx",dungeon_master:user2)
game3 = Game.create(name:"testgame3",game_password:"axxxxxx",dungeon_master:user3)

GameInvitation.create(game_password:"axxxxxxx",game:game2,dungeon_master:user2,user_player:user1)
GameInvitation.create(game_password:"axxxxxxx",game:game3,dungeon_master:user3,user_player:user1)

PlayerCharacter.create(name:"The Great Giant", creator:user1)
PlayerCharacter.create(name:"Salamander - The Dragon Slayer", creator:user1)

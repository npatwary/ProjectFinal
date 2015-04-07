# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  user_name             :string
#  email                 :string
#  password              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_confirmation :string
#

class User < ActiveRecord::Base


	#validates :user_name, presence: true, uniqueness: true
	#validates :email, presence: true, uniqueness: true

	validates :user_name, presence: true
	validates :email, presence: true

	validates :password, presence: true,confirmation: true
	validates :password_confirmation, presence: true

	has_many :games_created,
			class_name: "Game",
			foreign_key: "user_id"

	has_many :game_invitations_sent,
			class_name: "GameInvitation",
			foreign_key: "dungeon_master_id"

	has_many :game_invitations_received,
			class_name: "GameInvitation",
			foreign_key: "user_player_id"

	has_many :player_characters,
			class_name: "PlayerCharacter",
			foreign_key: "creator_id"	

	#def games_playing
	#	games_playing = []
	#	player_characters.each do |PlayerCharacter|
	#		games_playing.push(player_character.game) unless player_character.game.nil?
	#	end
	#	return games_playing
	#end	
end

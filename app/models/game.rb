# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  name          :string
#  map           :string
#  game_history  :text
#  game_password :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Game < ActiveRecord::Base
	validates:name, presence:true,uniqueness:true
	validates:game_password,presence:true

	belongs_to :dungeon_master,
				class_name: "User",
				foreign_key: "user_id"

	has_many :game_invitations,
			class_name: "GameInvitation",
			foreign_key: "game_id"


    has_many :player_characters

end

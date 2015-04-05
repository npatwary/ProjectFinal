# == Schema Information
#
# Table name: game_invitations
#
#  id                :integer          not null, primary key
#  game_password     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  game_id           :integer
#  dungeon_master_id :integer
#  user_player_id    :integer
#

class GameInvitation < ActiveRecord::Base
	validates:game_password, presence:true

	belongs_to :dungeon_master,
				class_name: "User",
				foreign_key: "dungeon_master_id"

	belongs_to :user_player,
				class_name: "User",
				foreign_key: "user_player_id"

	belongs_to :game,
				class_name: "Game",
				foreign_key: "game_id"
end

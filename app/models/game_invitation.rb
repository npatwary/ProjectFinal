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
	validate :user_cannot_be_both_dungeon_master_and_player_in_the_same_game, :no_valid_user_provided,:no_invalid_users_can_be_specified

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

	#non-persistent model attribute to keep track of list of user_names provided in view
	attr_accessor :user_names, :invalid_user_names, :all_users_invalid

	def user_cannot_be_both_dungeon_master_and_player_in_the_same_game
    if user_player != nil and dungeon_master == user_player
      errors.add(:user_player, " #{user_player.user_name} can not be both dungeon_master and player in same game")
    end

    def no_invalid_users_can_be_specified
    	unless invalid_user_names.nil?
    		invalid_users = ''
    		invalid_user_names.each do |invalid_user_name|
    			if invalid_users.length == 0
    				invalid_users = invalid_user_name
    			else
    				invalid_users = "#{invalid_users};#{invalid_user_name}"
    			end
    		end
    		errors.add(:user_player, "(s) contains some invalid users #{invalid_users}")
    	end
    end

    def no_valid_user_provided
    	if user_player.nil? and all_users_invalid
    		errors.add(:user_player, "(s) specified are all invalid")
    	end
    end

  end
end

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


require 'test_helper'

class GameInvitationTest < ActiveSupport::TestCase
  def setup
		@game_invitation = GameInvitation.new(game_password:"xyslkd11k")
	end

	test "should be valid " do 
 		assert @game_invitation.valid?
 	end

 	test " game password should be present" do
 		@game_invitation.game_password = "  "
 		assert_not @game_invitation.valid?
 	end


 	test "user_cannot_be_both_dungeon_master_and_player_in_the_same_game" do
 		user = User.new(user_name: "tbaniya", email: "abc@memphis.edu", password:"same12",password_confirmation:"same12")
 		@game_invitation.user_player = user
 		@game_invitation.dungeon_master = user
 		assert_not @game_invitation.valid?
 	end

 	test 'no_invalid_users_can_be_specified' do
 		@game_invitation.invalid_user_names = ["invalidUser1","invalidUser2"]
 		assert_not @game_invitation.valid?
 	end

 	test 'no_valid_user_provided' do
 		@game_invitation.user_player = nil
 		@game_invitation.all_users_invalid = true
 		assert_not @game_invitation.valid?
 	end
end

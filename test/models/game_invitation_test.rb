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
end

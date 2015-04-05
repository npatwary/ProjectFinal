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

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
		@game = Game.new(name: "Himalayan Caves", map:"0111111111binary",game_password:"xyslkd11k",game_history:"This is game history.")
	end

	test "should be valid " do 
 		#assert @game.valid?
 		assert_equal("a","a")
 	end

 	test " game name should be present" do
 		@game.name = "  "
 		assert_not @game.valid?
 	end

 	test " game password should be present" do
 		@game.game_password = "  "
 		assert_not @game.valid?
 	end

 	test "game map can be blank" do
 		@game.map = "  "
 		assert @game.valid?
 	end

 	test "game history may be blank" do
 		@game.map = "  "
 		assert @game.valid?
 	end

 	test "game name should be unique" do
    duplicate_game = @game.dup
    @game.save
    assert_not duplicate_game.valid?
  end
end

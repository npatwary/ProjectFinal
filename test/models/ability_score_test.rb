# == Schema Information
#
# Table name: ability_scores
#
#  id                 :integer          not null, primary key
#  name               :string
#  score              :integer
#  modifier           :integer
#  playercharacter_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class AbilityScoreTest < ActiveSupport::TestCase
  	def setup
		@ability_score = ability_scores(:one)
	end
	test "ability score is valid" do 
		assert @ability_score.valid?
	end

	test "ability score must be presence" do
		@ability_score.score = " "
		assert_not @ability_score.valid?
	end

	test "ability modifier must be presence" do
		@ability_score.modifier = " "
		assert_not @ability_score.valid?
	end


	test "ability score must be in between 1 and 30" do
		@ability_score.score = 0
		assert_not @ability_score.valid?
	end

	test "ability modifier must be in between -5 and 10" do
		@ability_score.modifier = -6
		assert_not @ability_score.valid?
	end
	
end

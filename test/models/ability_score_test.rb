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
end

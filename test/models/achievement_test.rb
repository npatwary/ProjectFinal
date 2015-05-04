# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AchievementTest < ActiveSupport::TestCase

 def setup
 	@achievement = achievements(:one)
 end

 test "assign achievement is valid" do 
	assert @achievement.valid?
end

test " description should be present" do
 		@achievement.description = "  "
 		assert_not @achievement.valid?
 	end

end

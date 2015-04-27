# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer          default("1")
#  ability            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  	def setup
		@skill = skills(:one)
	end
	test "skill is valid" do 
		assert @skill.valid?
	end
end

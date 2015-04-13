# == Schema Information
#
# Table name: armor_and_shields
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  disadvantage       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ArmorAndShieldTest < ActiveSupport::TestCase
  	def setup
		@armor_and_shield = armor_and_shields(:one)
	end
	test "armor and shields is valid" do 
		assert @armor_and_shield.valid?
	end
end

# == Schema Information
#
# Table name: equipment
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  description        :string
#  cost               :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
 
 def setup
		@equipment = equipment(:one)
	end

	test "equipment is valid" do 
		assert @equipment.valid?
	
	end
end



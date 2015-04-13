# == Schema Information
#
# Table name: saving_throws
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer          default("0")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class SavingThrowTest < ActiveSupport::TestCase
	def setup
		@saving_throw = saving_throws(:one)
	end
	test "saving throw valid" do 
		assert @saving_throw.valid?
	end
end

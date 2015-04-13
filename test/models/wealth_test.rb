# == Schema Information
#
# Table name: wealths
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  copper             :integer
#  silver             :integer
#  electrum           :integer
#  gold               :integer
#  platinum           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class WealthTest < ActiveSupport::TestCase
  	def setup
		@wealth = wealths(:one)
	end
	test "wealth valid" do 
		assert @wealth.valid?
	end
end

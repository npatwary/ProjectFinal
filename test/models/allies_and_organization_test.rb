# == Schema Information
#
# Table name: allies_and_organizations
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  description        :string
#  symbolDnD          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


require 'test_helper'

class AlliesAndOrganizationTest < ActiveSupport::TestCase
  	def setup
		@allies_and_organization = allies_and_organizations(:one)
	end
	test "allies and organizations is valid" do 
		assert @allies_and_organization.valid?
	end
end

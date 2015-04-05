# == Schema Information
#
# Table name: allies_and_organizations
#
#  id                 :integer          not null, primary key
#  PlayerCharacter_id :integer
#  name               :string
#  description        :string
#  symbolDnD          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class AlliesAndOrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

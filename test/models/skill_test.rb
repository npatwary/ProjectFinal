# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  PlayerCharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer
#  ability            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

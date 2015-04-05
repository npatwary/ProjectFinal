# == Schema Information
#
# Table name: saving_throws
#
#  id                 :integer          not null, primary key
#  PlayerCharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class SavingThrowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

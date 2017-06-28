# == Schema Information
#
# Table name: spells
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  player_character_id :integer
#




require 'test_helper'

class SpellTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: attack_weapons
#
#  id                 :integer          not null, primary key
#  PlayerCharacter_id :integer
#  name               :string
#  attackBonus        :integer
#  damage             :string
#  type               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class AttackWeaponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

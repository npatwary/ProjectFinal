# == Schema Information
#
# Table name: attack_weapons
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  attackBonus        :integer
#  damage             :string
#  typeDnD            :string
#  cost               :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


require 'test_helper'

class AttackWeaponTest < ActiveSupport::TestCase
  	def setup
		@attack_weapon = attack_weapons(:one)
	end
	test "attack weapon is valid" do 
		assert @attack_weapon.valid?
	end
end

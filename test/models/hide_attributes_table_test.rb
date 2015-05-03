# == Schema Information
#
# Table name: hide_attributes_tables
#
#  id                           :integer          not null, primary key
#  pc_id                        :integer
#  ability_reveal               :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  skill_reveal                 :boolean
#  savingthrow_reveal           :boolean
#  personality_reveal           :boolean
#  attribute_reveal             :boolean
#  characterbonus_reveal        :boolean
#  wealth_reveal                :boolean
#  physicalfeature_reveal       :boolean
#  carry_reveal                 :boolean
#  spellcast_reveal             :boolean
#  attackweapon_reveal          :boolean
#  spell_reveal                 :boolean
#  armorshield_reveal           :boolean
#  attackdescription_reveal     :boolean
#  equipment_reveal             :boolean
#  characterdescription_reveal  :boolean
#  alliesandorganisation_reveal :boolean
#  additionalfeature_reveal     :boolean
#  treasure_reveal              :boolean
#

require 'test_helper'

class HideAttributesTableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: player_characters
#
#  id                             :integer          not null, primary key
#  isUsed                         :boolean
#  name                           :string
#  classDnD                       :string
#  level                          :integer
#  background                     :string
#  race                           :string
#  alignment                      :string
#  experiencePoints               :integer
#  inspiration                    :string
#  proficiencyBonus               :integer
#  armorClass                     :integer
#  initiative                     :integer
#  speed                          :integer
#  currentHitPoints               :integer
#  maxHitPoints                   :integer
#  temporaryHitPoints             :integer
#  totalHitDice                   :string
#  hitDice                        :string
#  deathSaveSuccesses             :integer
#  deathSaveFailures              :integer
#  personalityTraits              :string
#  ideals                         :string
#  bonds                          :string
#  flaws                          :string
#  attacksDescription             :string
#  passiveWisdom                  :string
#  otherProficienciesAndLanguages :string
#  maxEquipmentCarryCapacity      :integer
#  currentEquipmentCarryCapacity  :integer
#  featuresAndTraits              :string
#  age                            :integer
#  height                         :string
#  weight                         :string
#  eyes                           :string
#  skin                           :string
#  hair                           :string
#  characterAppearance            :string
#  characterBackstory             :string
#  additionalFeaturesAndTraits    :string
#  treasure                       :string
#  spellCastingAbility            :string
#  spellSaveDC                    :string
#  spellAttackBonus               :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  creator_id                     :integer
#  game_id                        :integer
#

require 'test_helper'

class PlayerCharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

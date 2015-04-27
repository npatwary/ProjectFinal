# == Schema Information
#
# Table name: player_characters
#
#  id                             :integer          not null, primary key
#  isUsed                         :boolean
#  name                           :string
#  classDnD                       :string
#  level                          :integer          default("1")
#  background                     :string
#  race                           :string
#  alignment                      :string
#  experiencePoints               :integer          default("0")
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
 	def setup
		@player_character = player_characters(:one)
	end
	test "player_character should be valid " do 
 		assert @player_character.valid?
 	end

 	test "name can't be blank" do 
		@player_character.name = " "
		assert_not @player_character.valid?
	end

 	test "classDnD can't be blank" do 
		@player_character.classDnD = " "
		assert_not @player_character.valid?
	end

	test "level can't be blank" do 
		@player_character.level = " "
		assert_not @player_character.valid?
	end

	test "race can't be blank" do 
		@player_character.race = " "
		assert_not @player_character.valid?
	end

	test "background can't be blank" do 
		@player_character.background = " "
		assert_not @player_character.valid?
	end	

	test "level should be in between 1 and 20" do
		@player_character.level= "a"
		assert_not @player_character.valid?
	end
 	
end

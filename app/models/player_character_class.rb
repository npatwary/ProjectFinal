# == Schema Information
#
# Table name: player_character_classes
#
#  id                    :integer          not null, primary key
#  name                  :string
#  hitDice               :string
#  currentHitPoint       :integer
#  maximumHitPoint       :string
#  armorProficiency      :text
#  weaponProficiency     :text
#  toolsProfiency        :text
#  savingThroughs        :text             default("--- []\n")
#  proficientSkills      :text             default("--- []\n")
#  equipment             :text             default("--- []\n")
#  numberOfAllowedSkills :integer
#  spellcastAbility      :integer
#  spellSaveDC           :integer
#  spellAttackBonus      :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#



class PlayerCharacterClass < ActiveRecord::Base
	serialize :savingThroughs, Array
	serialize :proficientSkills, Array
	serialize :equipment, Array
end

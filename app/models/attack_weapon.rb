# == Schema Information
#
# Table name: attack_weapons
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  attackBonus        :integer
#  damage             :string
#  type               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class AttackWeapon < ActiveRecord::Base
  belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"
end

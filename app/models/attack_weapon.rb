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
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class AttackWeapon < ActiveRecord::Base
  belongs_to :PlayerCharacter, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"
end

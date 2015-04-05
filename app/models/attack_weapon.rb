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

class AttackWeapon < ActiveRecord::Base
  belongs_to :PlayerCharacter
end

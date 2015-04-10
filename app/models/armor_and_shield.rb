# == Schema Information
#
# Table name: armor_and_shields
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  disadvantage       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ArmorAndShield < ActiveRecord::Base
  belongs_to :PlayerCharacter, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"
end

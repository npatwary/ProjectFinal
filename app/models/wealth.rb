# == Schema Information
#
# Table name: wealths
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  copper             :integer          default("0")
#  silver             :integer          default("0")
#  electrum           :integer          default("0")
#  gold               :integer          default("0")
#  platinum           :integer          default("0")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Wealth < ActiveRecord::Base
    
  belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"

end

# == Schema Information
#
# Table name: spells
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  player_character_id :integer
#




class Spell < ActiveRecord::Base
	belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "player_character_id"
end

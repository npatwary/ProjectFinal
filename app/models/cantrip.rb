# == Schema Information
#
# Table name: cantrips
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  playercharacter_id :integer
#



class Cantrip < ActiveRecord::Base
	belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"
end

# == Schema Information
#
# Table name: achievements
#
#  id                  :integer          not null, primary key
#  description         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  player_character_id :integer
#  game_id             :integer
#

class Achievement < ActiveRecord::Base

	validates :description, presence: true
	belongs_to :game
	belongs_to :player_character
end

# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  user_name   :string
#  game_name   :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Achievement < ActiveRecord::Base

	validates :description, presence: true
end

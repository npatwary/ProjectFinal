# == Schema Information
#
# Table name: ability_scores
#
#  id                 :integer          not null, primary key
#  name               :string
#  score              :integer          default("1")
#  modifier           :integer          default("1")
#  playercharacter_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class AbilityScore < ActiveRecord::Base
  belongs_to :playercharacter, inverse_of: :abilityscores, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"

  validates :score,presence: true, numericality: 
		{ only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 30}
  validates :modifier,presence: true, numericality: 
		{ only_integer: true, greater_than_or_equal_to: -5,less_than_or_equal_to: 10}
  
end

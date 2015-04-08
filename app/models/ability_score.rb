# == Schema Information
#
# Table name: ability_scores
#
#  id                 :integer          not null, primary key
#  name               :string
#  score              :integer
#  modifier           :integer
#  playercharacter_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class AbilityScore < ActiveRecord::Base
  belongs_to :playercharacter, inverse_of: :abilityscores, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"
end

# == Schema Information
#
# Table name: ability_scores
#
#  id                 :integer          not null, primary key
#  PlayerCharacter_id :integer
#  name               :string
#  score              :integer
#  modifier           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class AbilityScore < ActiveRecord::Base
  belongs_to :PlayerCharacter
end

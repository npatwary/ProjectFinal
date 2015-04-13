# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer          default("0")
#  ability            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Skill < ActiveRecord::Base
  belongs_to :PlayerCharacter, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"
end

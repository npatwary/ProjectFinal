# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  PlayerCharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer
#  ability            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Skill < ActiveRecord::Base
  belongs_to :PlayerCharacter
end

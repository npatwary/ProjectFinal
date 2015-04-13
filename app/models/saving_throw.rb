# == Schema Information
#
# Table name: saving_throws
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer          default("0")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class SavingThrow < ActiveRecord::Base
  belongs_to :PlayerCharacter, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"
end

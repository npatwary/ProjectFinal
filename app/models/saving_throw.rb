# == Schema Information
#
# Table name: saving_throws
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  proficient         :boolean
#  modifier           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class SavingThrow < ActiveRecord::Base
  belongs_to :PlayerCharacter
end

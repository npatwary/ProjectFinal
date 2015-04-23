# == Schema Information
#
# Table name: allies_and_organizations
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  description        :string
#  symbolDnD          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


class AlliesAndOrganization < ActiveRecord::Base
  belongs_to :PlayerCharacter, foreign_key: "playercharacter_id", class_name:"PlayerCharacter"
end

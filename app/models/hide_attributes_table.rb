# == Schema Information
#
# Table name: hide_attributes_tables
#
#  id             :integer          not null, primary key
#  pc_id          :integer
#  ability_reveal :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


class HideAttributesTable < ActiveRecord::Base
end

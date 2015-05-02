# == Schema Information
#
# Table name: races
#
#  id           :integer          not null, primary key
#  name         :string
#  strength     :integer
#  dexterity    :integer
#  constitution :integer
#  intelligence :integer
#  wisdom       :integer
#  charisma     :integer
#  base_speed   :integer
#  max_age      :integer
#  alignment    :string
#  language     :string
#  tools        :string
#  features     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#



class Race < ActiveRecord::Base
end



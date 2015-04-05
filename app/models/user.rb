# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base


	validates :user_name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	validates :password, presence: true


end

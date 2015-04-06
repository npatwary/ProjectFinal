# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  user_name             :string
#  email                 :string
#  password              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_confirmation :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	def setup
		@user = User.new(user_name: "tbaniya", email: "abc@memphis.edu", password:"xyslkd11k")
	end

	test "should be valid " do 
 		assert @user.valid?
 	end
 
 	test " user_name should be present" do
 		@user.user_name = "  "
 		assert_not @user.valid?
 	end
 	test "email should be present" do
 		@user.email = " "
 		assert_not @user.valid?
 	end
 	test "password should be present" do
 		@user.password = " "
 		assert_not @user.valid?
 	end
end

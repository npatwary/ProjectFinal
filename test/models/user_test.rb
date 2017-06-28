# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#





require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	def setup
		@user = User.new(user_name: "tbaniya", email: "abc@memphis.edu", password:"same12",password_confirmation:"same12")
	end

	test "should be valid " do 
 		assert @user.valid?
 	end
 
 	test " user_name should be present" do
 		@user.user_name = "  "
 		assert_not @user.valid?
 	end

 	test " user name should be minimum of six character" do
 		@user.user_name = "pp11"
 		assert_not @user.valid?
 	end

 	test "user name should be unique" do
 		dup_user = @user.dup
 		dup_user.user_name = @user.user_name
 		@user.save
 		assert_not dup_user.valid?
 	end

 	test "email should be present" do
 		@user.email = " "
 		assert_not @user.valid?
 	end

 	test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

 	test "password should be present" do
 		@user.password = " "
 		assert_not @user.valid?
 	end

 	test "password should be minimum of length" do
 		@user.password = @user.password_confirmation = "ttttt"
 		assert_not @user.valid?
 	end

end

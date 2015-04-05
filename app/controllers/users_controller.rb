class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end


	def create
		@user = User.new(params.require(:user).permit(:user_name, :email, :password))

  		if @user.save
  			redirect_to users_url
  		else
  			redirect_to new_user_url
  		end
	end

end

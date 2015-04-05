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
  			flash[:notice] = "User Successfully created"
  			redirect_to users_url
  		else
  			flash.now[:alert] = " Errors in form "
  			@user.errors.full_messages.each do |message|
  				flash.now[:alert] += " "
  				flash.now[:alert] += message
  			end
  			render 'new'
  		end
	end

end

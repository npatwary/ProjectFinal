class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end


	def create
		@user = User.new(params.require(:user).permit(:user_name,:email,:password,:password_confirmation))
  		if @user.save
  			log_in @user
  			flash[:success] = "Welcome to Dungeons and Dragons !"
  			redirect_to user_path(@user)
  		else
  			flash.now[:alert] = " Errors in form "
  			@user.errors.full_messages.each do |message|
  				flash.now[:alert] += " "
  				flash.now[:alert] += message
  			end
  			render 'new'
  		end
	end
	
	def index
		@users = User.all
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_url
    	end
  	end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end

class UsersController < ApplicationController

  before_action :logged_in_user, only: [:show,:index]
  before_action :correct_user,   only: [:show]
  before_action :already_logged_in,   only: [:new]
  
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
  			#flash[:success] = "Welcome to Dungeons and Dragons !"
  			redirect_to user_path(@user)
  		else
  			render 'new'
  		end
	end
	
	def index
		@users = User.all
	end


  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

    # Leave Game Method 
	def delete
		@userIDToLeaveGame = params[:user_id];
		@game_to_remove    = Game.find(params[:game_id])
        
        puts @game_to_remove.id
        
        #PlayerCharacter.where("creator_id = ? AND game_id=?", params[:user_id],params[:game_id] ).update(game_id: "nul")
	
        @pc_to_remove      = PlayerCharacter.where("creator_id = ? AND game_id=?", params[:user_id],params[:game_id] )
		
		puts @pc_to_remove
		# @pc_to_remove.update(game_id: '100')
		
		@game_to_remove.player_characters.delete(@pc_to_remove)


		redirect_to user_path(@userIDToLeaveGame);
	end

	def already_logged_in
    	if logged_in?
      		redirect_to user_path(current_user)
      	end
    end

end

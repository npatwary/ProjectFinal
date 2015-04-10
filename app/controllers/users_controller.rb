class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])	
		
	end


	def create
		@user = User.new(params.require(:user).permit(:user_name, :email, :password,:password_confirmation))

  		if @user.save
  			flash[:notice] = "User Successfully created"
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


end

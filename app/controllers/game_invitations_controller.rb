class GameInvitationsController < ApplicationController
	def new
		@game_invitation = GameInvitation.new
		game = Game.find(params[:game_id])
		@game_invitation.game = game
	end

	def create
		#@game_invitation = GameInvitation.new(params.require(:game_invitation).permit(:game_password))
		game = Game.find(params[:game_invitation][:game])

		#somebody tampered with hidden game_id
		if game.nil?
			flash[:alert] = "Game Invitation form tampered!"
			return redirect_to user_path(current_user)
		end 


		user_player = params[:game_invitation][:user_player]
		game_password = params[:game_invitation][:game_password]

		user_names = user_player.split(";")
		valid_users = []
		user_names.each do |user_name|
			user_name = user_name.strip
			if user_name.length > 0
				user = User.find_by user_name: user_name
				if user != nil
					if game.dungeon_master == user
						flash[:alert] = "a user can not be both dungeon_master and player in same game"
						return redirect_to new_game_invitation_path(game)
					end
					#may want to keep track of valid users
					valid_users.push(user_name)
					game_invitation = GameInvitation.new
					game_invitation.game = game
					game_invitation.game_password = game_password
					game_invitation.user_player = user
					game_invitation.dungeon_master = game.dungeon_master
					game_invitation.save
				end
			end
		end
		if valid_users.length == 0
			flash[:alert] =  "no valid users provided!"
			return redirect_to new_game_invitation_path(game) 
		end
		users = valid_users.join(',')
		flash[:notice] = users + " invited to the game!"
		redirect_to game_path(game)
	end
end

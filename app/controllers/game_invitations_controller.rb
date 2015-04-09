class GameInvitationsController < ApplicationController
	def new
		@game_invitation = GameInvitation.new
		game = Game.find(params[:game_id])
		@game_invitation.game = game
	end

	def index
		@game_invitations_sent = current_user.game_invitations_sent
		@game_invitations_received = current_user.game_invitations_received
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
		#game_password = params[:game_invitation][:game_password]
		game_password = game.game_password

		user_names = user_player.strip.split(";")
		valid_gameinvitations = []
		valid_users = []
		invalid_user_names = []
		provided_user_count = 0
		user_names.each do |user_name|
			user_name = user_name.strip
			if user_name.length > 0
				provided_user_count = provided_user_count + 1
				user = User.find_by user_name: user_name
				if user != nil
					#if game.dungeon_master == user
						#flash[:alert] = "a user can not be both dungeon_master and player in same game"
						#return redirect_to new_game_invitation_path(game)
					#end
					#may want to keep track of valid users
					valid_users.push(user_name)
					@game_invitation = GameInvitation.new
					@game_invitation.game = game
					@game_invitation.game_password = game_password
					@game_invitation.user_player = user
					@game_invitation.dungeon_master = game.dungeon_master
					@game_invitation.user_names = user_names
					if @game_invitation.valid?
						valid_gameinvitations.push(@game_invitation) 
					else
						render 'new' #unless @game_invitation.save
						return
					end
				else
					invalid_user_names.push(user_name)
				end
			end
		end

		if valid_users.length == 0
			#flash[:alert] =  "no valid users provided!"
			@game_invitation = GameInvitation.new
			@game_invitation.game = game
			@game_invitation.game_password = game_password
			@game_invitation.dungeon_master = game.dungeon_master
			@game_invitation.user_names = user_names
			@game_invitation.all_users_invalid = true
			render 'new' unless @game_invitation.valid?
			return
		end

		#check number of valid users = number os users specified
		if valid_users.length == provided_user_count
			#now save each of valid game-invitations
			valid_gameinvitations.each do |game_invitation|
				@game_invitation = game_invitation
				unless @game_invitation.save
					render 'new' 
					return
				end
			end
		else
			@game_invitation = GameInvitation.new
			@game_invitation.game = game
			@game_invitation.game_password = game_password
			@game_invitation.all_users_invalid = false
			@game_invitation.invalid_user_names =invalid_user_names
			@game_invitation.user_names = user_names
			render 'new' unless @game_invitation.valid?
			return
		end

		
		users = valid_users.join(',')
		flash[:notice] = users + " invited to the game!"
		redirect_to game_path(game)
	end
end

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

		render 'new' if game.nil?

		unless dungeon_master?(game.dungeon_master)
			render 'new'
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

		render 'new' if valid_users.length == 0
		redirect_to game_path(game)
	end
end

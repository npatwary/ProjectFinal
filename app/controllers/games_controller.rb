class GamesController < ApplicationController
	def new
		@game = Game.new
		#need to get current_user from session
	end

	def create
		@game = Game.new(params.require(:game).permit(:name,:map,:game_history,:game_password))
		@game.dungeon_master = current_user
		if @game.save
			redirect_to game_path(@game)
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	def edit
	end
end

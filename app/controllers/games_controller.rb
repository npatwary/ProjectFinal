class GamesController < ApplicationController
	def new
		@game = Game.new
		#need to get current_user from session
	end

	def create
		@game = Game.new(params.require(:game).permit(:name,:game_history,:game_password))
		uploaded_io =  params[:game][:map]
		unless uploaded_io.nil?
			sanitized_filename = sanitize_filename(uploaded_io.original_filename)
		  	sanitized_filename = current_user.user_name + sanitized_filename
			upload(sanitized_filename,uploaded_io)
			@game.map = sanitized_filename
		end
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

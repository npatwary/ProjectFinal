class GamesController < ApplicationController

	before_action :logged_in_user, only: [:show,:index,:update,:edit,:new,:create]
  	before_action :is_dungeon_master_user,   only: [:edit,:update]

	def index
		@user_owned_games = current_user.games_created
		
		# add @games_playing also
		@games_playing = current_user.games_playing
	end
	
	def new
		@game = Game.new
		#need to get current_user from session
	end

	def create
		@game = Game.new(params.require(:game).permit(:name,:game_history,:game_password))
		uploaded_io =  params[:game][:map]
		unless uploaded_io.nil?
			sanitized_filename = sanitize_filename(uploaded_io.original_filename)
		  	sanitized_filename = "#{current_user.user_name}_#{@game.name}_#{sanitized_filename}"
			upload(sanitized_filename,uploaded_io)
			@game.map = sanitized_filename
		end
		@game.dungeon_master = current_user
		
		if @game.save
			flash[:success] =  "Game successfully created!"
			redirect_to game_path(@game)
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])	
	end

	def edit
		@game = Game.find(params[:id])
	end

	 def update
  		@game = Game.find(params[:id])
  		if @game.update(params.require(:game).permit(:name, :map, :game_history, :game_password))
  			redirect_to games_url(@game)
  		else
  			redirect_to games_url
  		end
  	end

  	private
    # Confirms if the user is dungeon user.
	 def is_dungeon_master_user
	    game = Game.find_by id: params[:id]
	    if game.nil? or !dungeon_master?(game.dungeon_master)
	    	redirect_to(root_url) 
	    end
	 end

	
end

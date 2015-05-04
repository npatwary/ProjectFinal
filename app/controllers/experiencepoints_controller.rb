class ExperiencepointsController < ApplicationController

  def new
  	@player = PlayerCharacter.new
  end
  
  def index
    @game = Game.find(params[:game_id])
  end


  def update
    selected_player_ids = params[:player_ids]
    is_Success = true
    selected_player_ids.each do |player_id|
      player = PlayerCharacter.find(player_id)
      player.experiencePoints = player.experiencePoints + params['experiencepoints'+player_id].to_i
      is_Success = false unless player.save
    end	
    if is_Success
        flash[:success] =  "Experience points successfully updated!"
        redirect_to game_path(params[:game_id])
      else
        flash[:alert] = "Experience points not updated!"
        render 'index'
      end
  end

end

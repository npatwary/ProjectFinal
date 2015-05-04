
class AchievementsController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def index
    @game = Game.find(params[:game_id])
  end

  def create
  	selected_player_ids = params[:player_ids]
    is_Success = true
    selected_player_ids.each do |player_id|
      player = PlayerCharacter.find(player_id)
      @achievement = Achievement.new(description: params['description'+player_id])
      @achievement.game = player.game
      @achievement.player_character = player
      is_Success = false unless @achievement.save
    end 
    if is_Success
        flash[:success] =  "Achievements Assigned Successfully!"
        redirect_to game_path(params[:game_id])
      else
        flash[:alert] = "Sorry Error on Assiging Achievements"
        render 'index'
      end
  end
  
end

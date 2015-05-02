class AchievementsController < ApplicationController
  def new
  	@achievement = Achievement.new
  end

  def index
  	@achievements = Achievement.all
  end

  def create
  	@achievement = Achievement.new(params.require(:achievement).permit(:user_name, :game_name, :description))
  	if @achievement.save
  		redirect_to achievements_path
  	else
  		render 'new'
  	end
  end
  
end

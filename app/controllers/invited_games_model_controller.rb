class InvitedGamesModelController < ApplicationController
  def index
  	# Grab all games
  	@invitedGames = InvitedGamesModel.all;
  end

  def add
  	# add a new entry to the database
  	@invitedGame = InvitedGamesModel.new;
  end

  def
      @invitedGame = InvitedGamesModel.new(params.require(:invitedGame).permit(:name, :dungeonMaster, :passKey))
          if @invitedGame.save
          redirect_to invitedGame_url(@invitedGame)
      else
          redirect_to invitedGame_url
      end
  end

  def destroy
    @invitedGame = InvitedGamesModel.find(params[:id])
    @invitedGame.destroy
    redirect_to invitedGame_url
  end
  	
end



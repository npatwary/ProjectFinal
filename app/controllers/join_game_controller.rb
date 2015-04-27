class JoinGameController < ApplicationController
  def new
  	@game_id = params[:game_id];
  	@invitation_id = params[:game_inv_id];
  	@accepted_game = Game.find(@game_id);
    @accepted_invited = GameInvitation.find(@invitation_id);
  	#@game = Game.new;
  	@game_invitations_received = current_user.game_invitations_received
  	@player_characters = PlayerCharacter.all;
  	@user_player_characters  = current_user.player_characters.where("isUsed=? or isUsed is null",false);
  	# @user_player_characters  = current_user.player_characters.where("isUsed = false", params[:game_id]);
  end
  
  
  def user_input
  	#@inputPasswordcheck           = params[:inputPassword]; 
  	if params[:commit] == "Join"
          @user_password = params[:passkey];
          @invitation_id = params[:inv_id];
          @player_character_id = params[:pc_id];
          @accepted_invitation = GameInvitation.find(params[:inv_id]);

          if @player_character_id!=nil
                if @user_password == @accepted_invitation.game_password 
                    # deleting the invited game
                    GameInvitation.destroy(params[:inv_id]);
                    # updating the game with the new player character
                    @game_id = params[:game_id]
                    @accepted_game = Game.find(@game_id);
                    @invitation_id = params[:inv_id];
                    @accepted_game = Game.find(@game_id); # Game to update
                    @used_player_charater = PlayerCharacter.find(params[:pc_id]); 
                    @accepted_game.player_characters << @used_player_charater;              
                    @used_player_charater.update(isUsed: "true");
                      
                    redirect_to game_invitations_path
                else
                  flash[:alert] = "Enter correct password!"
                end
          else
            flash[:alert] = "Please choose a valid player character."
          end
    elsif params[:commit] == "Cancel"
      # canceling game
          redirect_to game_invitations_path
 
    end
  end
  
  

end


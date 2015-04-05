class AddGameRefToGameInvitation < ActiveRecord::Migration
  def change
    add_reference :game_invitations, :game, index: true
    add_foreign_key :game_invitations, :games
  end
end

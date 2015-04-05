class AddUserRefToGameInvitation < ActiveRecord::Migration
  def change
    add_reference :game_invitations, :dungeon_master, index: true
    add_foreign_key :game_invitations, :users
    add_reference :game_invitations, :user_player, index: true
    add_foreign_key :game_invitations, :users
  end
end

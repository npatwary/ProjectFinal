class CreateGameInvitations < ActiveRecord::Migration
  def change
    create_table :game_invitations do |t|
      t.string :game_password

      t.timestamps null: false
    end
  end
end

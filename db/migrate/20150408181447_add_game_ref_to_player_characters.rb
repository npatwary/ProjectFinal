class AddGameRefToPlayerCharacters < ActiveRecord::Migration
  def change
    add_reference :player_characters, :game, index: true
    add_foreign_key :player_characters, :games
  end
end

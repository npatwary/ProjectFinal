class AddUserRefToPlayerCharacter < ActiveRecord::Migration
  def change
    add_reference :player_characters, :creator, index: true
    add_foreign_key :player_characters, :users
  end
end

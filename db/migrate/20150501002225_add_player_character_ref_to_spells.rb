class AddPlayerCharacterRefToSpells < ActiveRecord::Migration
  def change
    add_reference :spells, :player_character, index: true
    add_foreign_key :spells, :player_characters
  end
end

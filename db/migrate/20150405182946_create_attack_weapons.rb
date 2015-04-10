class CreateAttackWeapons < ActiveRecord::Migration
  def change
    create_table :attack_weapons do |t|
      t.references :playercharacter, index: true
      t.string :name
      t.integer :attackBonus
      t.string :damage
      t.string :typeDnD

      t.timestamps null: false
    end
    add_foreign_key :attack_weapons, :player_characters
  end
end

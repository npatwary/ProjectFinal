class CreateArmorAndShields < ActiveRecord::Migration
  def change
    create_table :armor_and_shields do |t|
      t.references :playercharacter, index: true
      t.string :name
      t.string :disadvantage
      t.integer :cost
      t.string :unit
      t.timestamps null: false
    end
    add_foreign_key :armor_and_shields, :player_characters
  end
end

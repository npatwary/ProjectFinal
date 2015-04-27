class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.references :playercharacter, index: true
      t.string :name
      t.string :description
      t.integer :cost
      t.string :unit

      t.timestamps null: false
    end
    add_foreign_key :equipments, :player_characters
  end
end


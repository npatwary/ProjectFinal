class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :playercharacter, index: true
      t.string :name
      t.boolean :proficient
      t.integer :modifier, :default => 1
      t.string :ability

      t.timestamps null: false
    end
    add_foreign_key :skills, :player_characters
  end
end

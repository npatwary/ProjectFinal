class CreateSavingThrows < ActiveRecord::Migration
  def change
    create_table :saving_throws do |t|
      t.references :playercharacter, index: true
      t.string :name
      t.boolean :proficient
      t.integer :modifier, :default => 0

      t.timestamps null: false
    end
    add_foreign_key :saving_throws, :player_characters
  end
end

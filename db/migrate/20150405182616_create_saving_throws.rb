class CreateSavingThrows < ActiveRecord::Migration
  def change
    create_table :saving_throws do |t|
      t.references :PlayerCharacter, index: true
      t.string :name
      t.boolean :proficient
      t.integer :modifier

      t.timestamps null: false
    end
    add_foreign_key :saving_throws, :PlayerCharacters
  end
end

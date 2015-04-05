class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :PlayerCharacter, index: true
      t.string :name
      t.boolean :proficient
      t.integer :modifier
      t.string :ability

      t.timestamps null: false
    end
    add_foreign_key :skills, :PlayerCharacters
  end
end

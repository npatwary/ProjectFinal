class CreateArmorAndShields < ActiveRecord::Migration
  def change
    create_table :armor_and_shields do |t|
      t.references :PlayerCharacter, index: true
      t.string :name
      t.string :disadvantage

      t.timestamps null: false
    end
    add_foreign_key :armor_and_shields, :PlayerCharacters
  end
end

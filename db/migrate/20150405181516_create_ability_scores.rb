class CreateAbilityScores < ActiveRecord::Migration
  def change
    create_table :ability_scores do |t|
      t.references :PlayerCharacter, index: true
      t.string :name
      t.integer :score
      t.integer :modifier

      t.timestamps null: false
    end
    add_foreign_key :ability_scores, :PlayerCharacters
  end
end

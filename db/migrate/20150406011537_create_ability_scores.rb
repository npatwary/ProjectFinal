class CreateAbilityScores < ActiveRecord::Migration
  def change
    create_table :ability_scores do |t|
      t.string :name
      t.integer :score
      t.integer :modifier
      t.references :playercharacter, index: true

      t.timestamps null: false
    end
    add_foreign_key :ability_scores, :player_characters
  end
end

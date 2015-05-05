
class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :description
      t.timestamps null: false
    end
    add_reference :achievements, :player_character, index: true
    add_foreign_key :achievements, :player_characters
    add_reference :achievements, :game, index: true
    add_foreign_key :achievements, :games
  end
end

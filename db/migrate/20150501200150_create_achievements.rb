class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :user_name
      t.string :game_name
      t.string :description

      t.timestamps null: false
    end
  end
end

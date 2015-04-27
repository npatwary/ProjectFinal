class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.binary :map
      t.text :game_history
      t.string :game_password

      t.timestamps null: false
    end
    add_index :games, :name, unique: true
  end
end

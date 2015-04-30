class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :base_speed
      t.integer :max_age
      t.string :alignment
      t.string :language
      t.string :tools
      t.string :features

      t.timestamps null: false
    end
  end
end

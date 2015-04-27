class CreateCantrips < ActiveRecord::Migration
  def change
    create_table :cantrips do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

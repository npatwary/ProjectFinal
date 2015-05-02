class CreateHideAttributesTables < ActiveRecord::Migration
  def change
    create_table :hide_attributes_tables do |t|
      t.integer :pc_id
      t.boolean :ability_reveal

      t.timestamps null: false
    end
  end
end

class AddTreasureRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :treasure_reveal, :boolean
  end
end

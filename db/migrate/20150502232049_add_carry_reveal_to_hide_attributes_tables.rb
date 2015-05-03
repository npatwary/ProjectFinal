class AddCarryRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :carry_reveal, :boolean
  end
end

class AddEquipmentRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :equipment_reveal, :boolean
  end
end

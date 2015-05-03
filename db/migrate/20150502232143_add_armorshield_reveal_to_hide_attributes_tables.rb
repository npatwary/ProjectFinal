class AddArmorshieldRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :armorshield_reveal, :boolean
  end
end

class AddWealthRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :wealth_reveal, :boolean
  end
end

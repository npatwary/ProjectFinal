class AddAttributeRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :attribute_reveal, :boolean
  end
end

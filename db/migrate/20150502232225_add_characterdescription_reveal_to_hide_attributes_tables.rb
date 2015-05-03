class AddCharacterdescriptionRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :characterdescription_reveal, :boolean
  end
end

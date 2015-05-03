class AddPersonalityRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :personality_reveal, :boolean
  end
end
